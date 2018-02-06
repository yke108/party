<?php
namespace Common\Service;
use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;
use Common\Basic\IdCardCheck;
use Common\Basic\Tool;

class UserService{
	/**
	 * 获取用户的资料
	 * @param unknown $user_id
	 * @return unknown
	 */
	public function getUserInfo($user_id){
		$info = $this->userInfoDao()->getRecord($user_id);
		return $this->outputForInfo($info);
	}

    /**
     * 自动登录，未注册用户自动注册
     */
	public function loginOrRegisterIfNotExist($branch_id, $openid, $unionid = ''){
		if(empty($openid)){
			throw new CsException('OpenId为空', 1003);
		}
		$userInfoDao = $this->userInfoDao();
		$where = [
			'openid'=>$openid,
		];
		$info = $userInfoDao->where($where)->getField('user_id, branch_id, user_type'); 
        $user_id = 0;
        if($info && $info['branch_id'] == $branch_id) {
            $user_id = $info['user_id'];
        }
		if (empty($user_id)){
			$user_id = date('ymdHis').rand(10,99);
			$data = [
				'user_id'=>$user_id,
				'openid'=>$openid,
				'branch_id'=>$branch_id,
				'reg_time'=>NOW_TIME,
			];
			if ($unionid) {
				$data['unionid'] = $unionid;
			}
			$userInfoDao = $this->userInfoDao();
			$userInfoDao->startTrans();
			if ($userInfoDao->add($data) < 1){
			    $userInfoDao->rollback();
				throw new CsException('操作失败', 1339);
			}
			$data = [
			    'user_id'=>$user_id,
			    'branch_id'=>$branch_id,
			];
			if ($this->userPointDao()->add($data) < 1){
			    $userInfoDao->rollback();
			    throw new CsException('操作失败', 1339);
			}
			$userInfoDao->commit();
		}
		return $user_id;
	}

    /**
     * 使用openid登录
     */
    public function loginByOpenid($branch_id, $openid) {
		if(empty($openid)){
			throw new CsException('OpenId为空', 1003);
		}
		$userInfoDao = $this->userInfoDao();
		$where = [
			'openid'=>$openid,
		];
		$info = $userInfoDao->where($where)->field('user_id, branch_id, status, group_id')->find(); 
        if(empty($info)) {
            return 0; 
        } elseif ($info['branch_id'] != $branch_id){
            $data = [
                'openid'=>'',
            ];
            $userInfoDao->where($where)->save($data);
            return 0;
        } elseif ($info['status'] != Status::YES) {
            throw new CsException('账户异常，请联系管理员处理', 34);
        } elseif ($info['group_id'] < 1) {
            throw new CsException('尚未关联组织', 34);
        }
        return $info['user_id'];
    }

    public function clearOpenid($user_id) {
        if($user_id < 1) return;
        $data = [
            'user_id'=>$user_id,
            'openid'=>'',
        ];
        return $this->userInfoDao()->save($data);
    }

    /**
     * 账号密码登录
     * 账号可以是手机号、身份证号码
     */
    public function loginByPassword($branch_id, $openid, $username, $password) {
		if(empty($openid)){
			throw new CsException('OpenId为空', 1003);
		}
		$userInfoDao = $this->userInfoDao();
		$where = [
			'openid'=>$openid,
		];
		$info = $userInfoDao->where($where)->field('user_id, branch_id')->find(); 
        if($info){
            $data = [
                'openid'=>$openid,
            ];
            $userInfoDao->where($where)->save($data);
        }
        $where = [
            'branch_id'=>$branch_id,
        ];
        $len = strlen($username);
        if ($len == 11) {
            $where['mobile'] = $username;
        } elseif ($len == 15 || $len == 18) {
            $where['id_no'] = $username;
        } else {
            throw new CsException('手机号或身份证号不正确', 1331);
        }
        $info = $userInfoDao->where($where)->find();
        if(empty($info)) {
            throw new CsException('账户不存在', 3007);
        } elseif ($info['status'] != Status::YES) {
            throw new CsException('账户异常，请联系管理员处理', 3008);
        } elseif ($info['group_id'] < 1) {
            throw new CsException('尚未关联组织', 3009);
        } elseif ($info['password'] != $userInfoDao->password($password, $info['salt'])) {
            throw new CsException('密码不正确', 3009);
        }
        $data = [
            'user_id'=>$info['user_id'],
            'openid'=>$openid,
        ];
        if($userInfoDao->save($data) === false) {
            throw new CsException('登录失败', 33);
        }
        return $info['user_id'];
    }


	/**
	 * 修改个人信息
	 * @param unknown $params
	 * @throws CsException
	 */
	public function modify($params){
		$map = [
			'user_id'=>$params['user_id'],
		];
		$data = [];
		$fields = ['real_name', 'user_img', 'nick_name', 'sex', 'birthday', 'join_day', 'district', 'signature'];
		foreach ($fields as $vo){
			isset($params[$vo]) && $data[$vo] = $params[$vo];
		}
		if (isset($data['sex']) && !in_array($data['sex'], ['1', '2'])){
			throw new CsException('请设置正确的性别', 1003);
		}
		if (count($data) < 1){
			throw new CsException('未修改任何数据', 1004);
		}
		if ($this->userInfoDao()->where($map)->save($data) === false){
			throw new CsException('修改失败', 1005);
		}
	}

    public function create($params) {
        if(empty($params['real_name'])) {
            throw new CsException('真实姓名不能为空', 1344);
        }
        if (empty($params['mobile'])) {
            throw new CsException('手机号不能为空', 1234);
        }
        if (!Tool::is_phone($params['mobile'])) {
            throw new CsException('手机号码不正确', 1225);
        }
        if ($params['id_no']) {
            $idcardCheck = new IdCardCheck();
            if($idcardCheck->check($params['id_no']) != true) {
                throw new CsException('身份证号不正确', 1324);
            }
        }
        //检查党组织ID
        $branch_id = intval($params['branch_id']);
        if($branch_id < 1) {
            throw new CsException('系统错误', 11);
        }
        $branch = $this->branchDao()->find($branch_id);
        if(empty($branch)) {
            throw new CsException('未知错误', 1200);
        }
        //检查党支部ID
        $group_id = intval($params['group_id']);
        $district = 0;
        $groupDao = $this->groupDao();
        $groupDao->startTrans();
        if($group_id > 0) {
            $group = $groupDao->lock(true)->find($group_id);
            if(empty($group)) {
                $groupDao->rollback();
                throw new CsException('不存在该党支部', 3334);
            } elseif ($group['status'] != Status::YES || $group['is_delete'] == Status::YES) {
                $groupDao->rollback();
                throw new CsException('支部状态异常', 4333);
            }
            $district = $group['region_code'];
        }
        $pwd = substr($params['mobile'], -6);
        $userInfoDao = $this->userInfoDao();
        $old_user_id = 0;
        if($params['id_no']) {
            $where = [
                'branch_id'=>$branch['branch_id'],
                'id_no'=>$params['id_no'],
            ];
            $tmp = $userInfoDao->where($where)->field('user_id, group_id')->find();
            if ($tmp['group_id'] > 0) {
                throw new CsException('身份证已关联其他组织', 3330);
            }
            $old_user_id = $tmp['user_id'];
        }
        $where = [
            'branch_id'=>$branch['branch_id'],
            'mobile'=>$params['mobile'],
        ];
        $tmp = $userInfoDao->where($where)->field('user_id, group_id')->find();
        $m_user_id = $tmp['user_id'];
        if($m_user_id > 0) {
            if($old_user_id > 0 && $old_user_id != $m_user_id) {
                throw new CsException('手机号码已被占用', 3003);
            } elseif ($tmp['group_id'] > 0) {
                throw new CsException('手机号已关联其他组织', 3433);
            } else {
                $old_user_id = $m_user_id;
            }
        }
        if($old_user_id > 0) {
            $data = [
                'user_id'=>$old_user_id,
                'real_name'=>trim($params['real_name']),
                'mobile'=>$params['mobile'],
                'id_no'=>$params['id_no'],
                'group_id'=>$group_id,
            ];
            if($userInfoDao->save($data) < 1) {
                throw new CsException('添加失败', 1004);
            }
        } else {
            $user_id = date('ymdHis').rand(1000, 9999);
            $data = [
                'user_id'=>$user_id,
                'branch_id'=>$branch['branch_id'],
                'real_name'=>trim($params['real_name']),
                'mobile'=>$params['mobile'],
                'id_no'=>$params['id_no'],
                'password'=>$userInfoDao->passwd($pwd),
                'reg_time'=>NOW_TIME,
                'group_id'=>$group_id,
                'district'=>$district,
            ];
            if ($this->userInfoDao()->add($data) < 1){
                $groupDao->rollback();
                throw new CsException('添加失败', 1003);
            }
            //积分记录表增加一条记录
            $data = [
                'user_id'=>$user_id,
                'branch_id'=>$branch['branch_id'],
            ];
            if ($this->userPointDao()->add($data) < 1){
                $groupDao->rollback();
                throw new CsException('操作失败', 1339);
            }
        }
        //修改支部相关信息
        if($group_id > 0) {
            $data = [
                'group_id'=>$group_id,
                'member_num'=>['exp', 'member_num+1'],
            ];
            if ($groupDao->save($data) < 1) {
                $groupDao->rollback();
                throw new CsException('添加失败', 3233);
            }
            if ($this->groupMemberDao()->madd($group_id, $user_id) < 1) {
                $groupDao->rollback();
                throw new CsException('添加失败！', 3223);
            }
        }
        $groupDao->commit();
    }
	
	/**
	 * 获取用户列表
	 * @param unknown $params
	 * @throws CsException
	 */
	public function getPagerList($params){
		$params['page'] < 1 && $params['page'] = 1;
		$params['pagesize'] < 1 && $params['pagesize'] = 20;
		
		$map = $params['map'] ? $params['map'] : array();
		if (isset($params['branch_id'])) {
			$map['branch_id'] = $params['branch_id'];
		}
        if (isset($params['group_id']) && $params['group_id'] > 0) {
            $map['group_id'] = $params['group_id'];
        }
		if ($params['keyword']) {
			$map['real_name|mobile'] = array('like', '%'.trim($params['keyword']).'%');
		}
		if ($params['status']) {
			$map['status'] = $params['status'];
		}
        if ($params['user_type']) {
            $map['user_type'] = $params['user_type'];
        }
		
		$count = $this->userInfoDao()->searchRecordsCount($map);
		$list = array();
		if($count > 0){
			empty($params['orderby']) && $params['orderby'] = 'reg_time desc';
			$list = $this->userInfoDao()->searchRecords($map, $params['orderby'], $params['page'], $params['pagesize']);
            foreach($list as $vo) {
                $group_ids[$vo['group_id']] = $vo['group_id'];
            }
            $groups = $this->groupDao()->getRecords($group_ids);
            foreach($list as $ko => $vo) {
                $list[$ko]['sex'] = Status::$sexList[$vo['sex']];
                $list[$ko]['group_name'] = $groups[$vo['group_id']]['group_name'];
            }
		}
		
		return array(
				'list'=>$this->outputForList($list),
				'count'=>$count,
				'page'=>$params['page'],
				'pagesize'=>$params['pagesize'],
		);
	}
	
	/**
	 * 状态开关
	 * @param unknown $params
	 * @throws CsException
	 */
	public function switchStatus($params){
		if (empty($params['user_id']) || empty($params['branch_id'])) {
			throw new CsException('参数错误', CodeConst::ParamsError);
		}
		$map = array(
			'user_id'=>$params['user_id'],
		);
		if (isset($params['branch_id'])) {
			$map['branch_id'] = $params['branch_id'];
		}
		$user_info = $this->userInfoDao()->findRecord($map);
		if (empty($user_info)) {
			throw new CsException('用户不存在', CodeConst::DataNotExist);
		}
		$data = array(
            'user_id'=>$user_info['user_id'],
            'status'=>($user_info['status'] == Status::YES) ? Status::NO : Status::YES,
            'openid'=>'',
		);
		if ($this->userInfoDao()->saveRecord($data) === false) {
			throw new CsException('系统错误', CodeConst::SystemError);
		}
		return array(
				'status'=>$data['status'],
		);
	}
	
	/**
	 * 删除用户
	 * @param unknown $params
	 * @throws CsException
	 */
	public function delete($params){
		$map = array(
				'user_id'=>$params['user_id'],
				'branch_id'=>$params['branch_id'],
		);
		$user_info = $this->userInfoDao()->findRecord($map);
		if (empty($user_info)) {
			throw new CsException('用户不存在', CodeConst::DataNotExist);
		}
		$data = array(
				'user_id'=>$params['user_id'],
				'is_delete'=>Status::YES,
		);
		if ($this->adminDao()->saveRecord($data) === false) {
			throw new CsException('删除失败');
		}
	}
	
	private function outputForList($list) {
		if (!empty($list)) {
			//支部
			$branchs = $this->branchDao()->searchFieldRecords();
			foreach ($list as $k => $v) {
				$list[$k]['user_img_url'] = getUserImg($v['user_img']);
				$list[$k]['sex_name'] = Status::$sexList[$v['sex']];
				$list[$k]['reg_time_format'] = date('Y-m-d H:i:s', $v['reg_time']);
				$list[$k]['status_label'] = Status::$catStatusList[$v['status']];
				$list[$k]['branch_name'] = $branchs[$v['branch_id']]['branch_name'];
				//总排行
				$map = array(
						'points'=>array('egt', $v['points']),
						'status'=>Status::YES,
				);
				$list[$k]['total_ranking'] = $this->userInfoDao()->searchRecordsCount($map);
				//支部排行
				$map = array(
						'points'=>array('egt', $v['points']),
						'status'=>Status::YES,
						'branch_id'=>$v['branch_id'],
				);
				$list[$k]['branch_ranking'] = $this->userInfoDao()->searchRecordsCount($map);
			}
		}
		return $list;
	}
	
	private function outputForInfo($info) {
		if (!empty($info)) {
			$info['user_img_url'] = picurl($info['user_img']);
			$info['sex_name'] = Status::$sexList[$info['sex']];
			$info['reg_time_format'] = date('Y-m-d H:i:s', $info['reg_time']);
			$info['status_label'] = Status::$catStatusList[$info['status']];
			//所属支部
			$branch_info = $this->branchDao()->getRecord($info['branch_id']);
			$info['branch_name'] = $branch_info['branch_name'];
		}
		return $info;
	}

    public function clearGroupId($user_id) {
        $data = [
            'user_id'=>$user_id,
            'group_id'=>0,
        ];
        if($this->userInfoDao()->save($data) === false) {
            throw new CsException('操作失败', 3904);
        }
    }
	
	private function userInfoDao(){
		return D('Common/User/UserInfo');
	}
	
	private function userPointDao(){
	    return D('UserPoint');
	}
	
	private function branchDao(){
		return D('Common/Branch/Branch');
	}
	
    private function groupDao() {
		return D('Common/Group/group');
	}
    
    private function groupMemberDao() {
		return D('Common/Group/Member');
	}
}


