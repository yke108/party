<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;
use Common\Basic\UserConst;

class GroupService{

    //支部组列表
    public function getPagerList($params){

        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;

        //判断它是否已经是五级联动了 如果是则不允许新增
        $isnew = (strlen($params['region_code']) < 10) ? Status::YES: Status::None;

        $map = $params['map'] ? $params['map'] : array();
        $map['is_delete'] = Status::None;

        //支部ID
        if ($params['branch_id'])  $map['branch_id'] = $params['branch_id'];
        //查询内容
        if ($params['keyword'])  $map['group_name'] = array('like', '%'.trim($params['keyword']).'%');
        //状态
        if ($params['status']) $map['status'] = $params['status'];
        //查询数量
        $count = $this->listDao()->searchRecordsCount($map);
        $list = array();
        if($count > 0){
            //排序
            $orderby = empty($params['orderby']) ? 'branch_id DESC' : $params['orderby'];
            //查询列表
            $list = $this->listDao()->searchRecords($map, $orderby, $params['page'], $params['pagesize']);
        }
        //判断获取的列表至少大于1条内容
        if(count($list) > 0)
        {
            $list = $this->setDetail($list);

        }else{
            $list = [];
        }

        return array(
            'list'=>$list,
            'count'=>$count,
            'page'=>$params['page'],
            'pagesize'=>$params['pagesize'],
            'isnew'=>$isnew,
        );
    }

    //(支部)处理特别数据
    private function setDetail($list)
    {
        foreach($list as $k=>$v){
            $list[$k]['status_label'] = Status::$catStatusList[$v['status']];
        }
        return $list;
    }


    //新增或修改数据
    public function createOrModify($params){
        if(!isset($params['branch_id']) || $params['branch_id'] == 0) throw new CsException('暂无支部ID，请重新登录',400);
        //接收到的参数
        $data =[
                'group_id'         =>trim($params['group_id']),
                'group_name'      => trim($params['group_name']),
                'status'          => trim($params['status']) ?: 1,
                'branch_id'        => trim($params['branch_id']),
                'region_code'      =>trim($params['code']),
                'create_day' => trim($params['create_day']),
                'manifesto' => trim($params['manifesto']),
                'add_time'          => time(),
        ];

        if (!$this->listDao()->create($data)){
            throw new CsException($this->listDao()->getError(), CodeConst::ParamsError);
        }

        if ($params['group_id'] > 0){
            $result = $this->listDao()->save();
            if ($result === false){
                throw new CsException('修改失败', CodeConst::SystemError);
            }
            $id = $params['group_id'];
        } else {
            $id = $this->listDao()->add();
            if ($id < 1){
                throw new CsException('添加失败', CodeConst::SystemError);
            }
            return $id;
        }
    }

    public function getInfo($group_id){
        $group_id = intval($group_id);
        if($group_id < 1) return [];
        return $this->listDao()->find($group_id);
    }

    public function leaveGroup($user_id, $group_id) {
        $this->listDao()->startTrans();
        $data = [
            'user_id'=>$user_id,
            'group_id'=>0,
        ];
        if($this->userInfoDao()->save($data) === false) {
            $this->listDao->rollback();
            throw new CsException('操作失败', 1003);
        }
        $data = [
            'group_id'=>$group_id,
            'member_num'=>['exp', 'member_num-1'],
        ];
        if($this->listDao()->save($data) === false) {
            $this->listDao()->rollback();
            throw new CsException('操作失败',3293);
        }
        if($this->groupMemberDao()->mleave($group_id, $user_id) === false) {
            $this->listDao()->rollback();
            throw new CsException('操作失败！',3332);
        }
        $groupDao->commit();
    }

    public function deleteFromGroup($user_id, $group_id) {
        $groupDao = $this->listDao();
        $groupDao->startTrans();
        $data = [
            'user_id'=>$user_id,
            'group_id'=>0,
        ];
        if($this->userInfoDao()->save($data) === false) {
            $groupDao->rollback();
            throw new CsException('操作失败', 1003);
        }
        $data = [
            'group_id'=>$group_id,
            'member_num'=>['exp', 'member_num-1'],
        ];
        if($groupDao->save($data) === false) {
            $groupDao->rollback();
            throw new CsException('操作失败',3293);
        }
        if($this->groupMemberDao()->mleave($group_id, $user_id) === false) {
            $groupDao->rollback();
            throw new CsException('操作失败！',3332);
        }
        $groupDao->commit();
    }

    /**
     * 设置支部书记
     */
    public function setSecretary($group_id, $member_id) {
        if($group_id < 1 || $member_id < 1) {
            throw new CsException('系统错误', 11);
        }
        $groupDao = $this->listDao();
        $group = $groupDao->find($group_id);
        if(empty($group)) {
            throw new CsException('支部不存在',2332);
        }
        $userInfoDao = $this->userInfoDao();
        $userInfoDao->startTrans();
        $user = $userInfoDao->lock(true)->find($member_id);
        if(empty($user)) {
            $userInfoDao->rollback();
            throw new CsException('用户不存在', 3233);
        }
        $data = [
            'user_id'=>$user['user_id'],
            'user_type'=>UserConst::UserTypeSecretary,
        ];
        if($userInfoDao->save($data) < 1) {
            $userInfoDao->rollback();
            throw new CsException('操作失败', 3232);
        }
        $where = [
            'group_id'=>$group['group_id'],
            'user_type'=>UserConst::UserTypeSecretary,
            'user_id'=>['neq', $user['user_id']],
        ];
        $data = [
            'user_type'=>UserConst::UserTypeNormal,
        ];
        if($userInfoDao->where($where)->save($data) === false) {
            $userInfoDao->rollback();
            throw new CsException('操作失败', 3223);
        }
        $userInfoDao->commit();
    }


	private function listDao() {
		return D('Common/Group/group');
	}
	
	private function groupMemberDao() {
		return D('Common/Group/Member');
	}
	
	private function categoryDao() {
		return D('Common/Category/Category');
	}
	
	private function categoryWhDao() {
		return D('Common/Category/CategoryWh');
	}
	
	private function logReadDao() {
		return D('Common/User/LogRead');
	}
	
	private function specialDao() {
		return D('Common/Article/Special');
	}

	private function SpecialWhDao() {
		return D('Common/Article/SpecialWh');
	}

    private function userInfoDao() {
        return D('Common/User/UserInfo');
    }
}
