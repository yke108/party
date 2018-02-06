<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class AdminService{
	public function getInfo($admin_id){
		if ($admin_id < 1) return false;
		$info = $this->adminDao()->getRecord($admin_id);
		return $this->outputForInfo($info);
	}
	
	public function findInfo($map){
		$info = $this->adminDao()->findRecord($map);
		return $this->outputForInfo($info);
	}
	
	public function createOrModify($params){
		//接收到的参数
		$data = array(
				'branch_id'=>$params['branch_id'],
				'admin_name'=>trim($params['admin_name']),
				'mobile'=>trim($params['mobile']),
				'password'=>trim($params['password']),
				'repassword'=>trim($params['repassword']),
				'avatar'=>trim($params['avatar']),
				'role_ids'=>$params['role_ids'],
				'remark'=>$params['remark'],
				'status'=>$params['status'],
		);
		if ($params['admin_id']) {
			$data['admin_id'] = $params['admin_id'];
		}
		if (!$this->adminDao()->create($data)){
			 throw new CsException($this->adminDao()->getError(), CodeConst::ParamsError);
		}
		unset($data['repassword']);
		if ($params['admin_id'] > 0){
			$result = $this->adminDao()->saveRecord($data);
			if ($result === false){
				throw new CsException('修改失败');
			}
			$admin_id = $params['admin_id'];
		} else {
			$admin_id = $this->adminDao()->addRecord($data);
			if ($admin_id < 1){
				throw new CsException('添加失败');
			}
		}
	}
	
	public function delete($params){
		$map = array(
				'admin_id'=>$params['admin_id'],
				'branch_id'=>$params['branch_id'],
		);
		$admin_info = $this->adminDao()->findRecord($map);
		if (empty($admin_info)) {
			throw new CsException('管理员不存在', CodeConst::DataNotExist);
		}
		$data = array(
				'admin_id'=>$admin_info['admin_id'],
				'is_delete'=>Status::YES,
		);
		if ($this->adminDao()->saveRecord($data) === false) {
			throw new CsException('删除失败');
		}
	}
	
	public function getPagerList($params){
		$params['page'] < 1 && $params['page'] = 1;
		$params['pagesize'] < 1 && $params['pagesize'] = 20;
		
		$map = $params['map'] ? $params['map'] : array();
		if (isset($params['branch_id'])) {
			$map['branch_id'] = $params['branch_id'];
		}
		if ($params['keyword']) {
			$map['admin_name'] = array('like', '%'.trim($params['keyword']).'%');
		}
		if ($params['status']) {
			$map['status'] = $params['status'];
		}
		
		$count = $this->adminDao()->searchRecordsCount($map);
		$list = array();
		if($count > 0){
			$list = $this->adminDao()->searchRecords($map, $params['orderby'], $params['page'], $params['pagesize']);
		}
		
		return array(
				'list'=>$this->outputForList($list),
				'count'=>$count,
				'page'=>$params['page'],
				'pagesize'=>$params['pagesize'],
		);
	}
	
	public function getRoleList($map, $orderby){
		$list = $this->adminRoleDao()->searchAllRecords($map, $orderby);
		return $list;
	}
	
	public function getAllList($map, $orderby){
		$list = $this->adminDao()->searchAllRecords($map, $orderby);
		return $this->outputForList($list);
	}
	
	private function outputForList($list) {
		if (!empty($list)) {
			//角色
			$role_list = $this->adminRoleDao()->searchFieldRecords();
			foreach ($list as $k => $v) {
				$list[$k]['last_login_format'] = $v['last_login'] ? date('Y-m-d H:i:s', $v['last_login']) : '';
				$list[$k]['add_time_format'] = date('Y-m-d H:i:s', $v['add_time']);
				$list[$k]['status_label'] = Status::$catStatusList[$v['status']];
				$list[$k]['avatar_url'] = picurl($v['avatar']);
				$roles = [];
				if ($v['role_ids']) {
					$role_ids = explode(',', $v['role_ids']);
					foreach ($role_ids as $v) {
						$roles[] = $role_list[$v]['role_name'];
					}
				}
				$list[$k]['roles'] = trim(implode(',', $roles), ',');
			}
		}
		return $list;
	}
	
	private function outputForInfo($info) {
		if (!empty($info)) {
			$info['add_time_format'] = date('Y-m-d H:i:s', $info['add_time']);
			$info['status_label'] = Status::$catStatusList[$info['status']];
		}
		return $info;
	}
	
	public function login($params){
		$adminDao = $this->adminDao();
		if($params['mobile'] == '') throw new CsException('账户名为空',400);
		if($params['password'] == '') throw new CsException('密码为空',400);
		//判断用户名密码
//		$map['username'] = $params['mobile'];
//		$admin = $adminDao->findRecord($map);
//		if(empty($admin)) {
			$map = ['username'=> $params['mobile']];
			$admin = $adminDao->findRecord($map);
//		}
		if (empty($admin)) {
			throw new CsException('管理员不存在');
		}
		//判断管理员状态
		if($admin['status'] != Status::YES) throw new CsException('登录异常，请联系管理员解决。');
		//判断登录错误次数
		$error_count_max = 5;
		if($admin['error_count'] >= $error_count_max) throw new CsException('密码错误超过'.$error_count_max.'次, 请先修改密码。');
		if ($adminDao->password($params['password'], $admin['salt']) != $admin['password']){
			$adminDao->errorCountIncrease($admin['admin_id']);
			$error_count = $admin['error_count'] + 1;
			throw new CsException('密码错误（'.$error_count.'次）。');
		}
		//管理员权限
		$result = $adminDao->logined($admin['admin_id'], $params['password']);
		if ($result === false) throw new CsException('登录失败', CodeConst::LoginFail);
		if ($admin['is_admin'] == Status::YES){
            if($admin['branch_id'] > 0) {
                $admin['role_name'] = '小程序负责人';
                $acttype = 3;
            } else {
                $admin['role_name'] = '超级管理员';
                $acttype = 2;
            }
            $map = [
                'parent_id'=>['gt', 0],
                'type'=>['in', [1,$acttype]],
            ];
            $actl = $this->systemActionDao()->where($map)->getField('action_id, action_code');
			$admin['action_list'] = $actl;
		} else {
			$admin['role_name'] = '管理员';
			$action_list = [];
			$role_ids = explode(',', $admin['role_ids']);
			if ($role_ids){
				$map = [
					'role_id'=>['in', $role_ids],
				];
				$role_list = $this->adminRoleDao()->field('action_list')->select();
				foreach ($role_list as $vo){
					$action_list = array_merge($action_list, explode(',', $vo['action_list']));
				}
				$action_list = array_unique($action_list);
			}
			if (empty($action_list)){
				throw new CsException('没有管理权限');
			}
			$admin['action_list'] = $action_list;
		}
		//登录日志
		$data = array(
				'admin_id'=>$admin['admin_id'],
				'admin_name'=>$admin['admin_name'],
				'log_info'=>'管理员登录',
		);
		$result = $this->adminLogDao()->addRecord($data);
		
		return $admin;
	}

	// 操作日志列表
	public function getActionLog($param) {
		$param['page'] < 1 && $param['page'] = 1;
		$param['pagesize'] < 1 && $param['pagesize'] = 10;
		$where = [];
		if (isset($param['branch_id']) && !empty($param['branch_id'])) {
			$where['branch_id'] = $param['branch_id'];
		}
		if (isset($param['action_type']) && !empty($param['action_type'])) {
			$where['action_type'] = $param['action_type'];
		}
		if (isset($param['keyword']) && !empty($param['keyword'])) {
			$where['admin_name|app_name'] = ['like', "%{$param['keyword']}%"];
		}
		$field = isset($param['field']) ? $param['field'] : '*';
		$count = $this->adminActionLogDao()->where($where)->count();
		$list = $this->adminActionLogDao()->where($where)->page($param['page'], $param['pagesize'])->field($field)->order('log_id desc')->select();
		return array(
			'list' => $list ? $list : [],
			'count' => $count ? $count : 0,
		);
	}
	
	private function adminDao() {
		return D('Common/Admin/Admin');
	}
	
	private function adminLogDao() {
		return D('Common/Admin/AdminLog');
	}

	private function adminActionLogDao() {
		return D('Common/Admin/AdminActionLog');
	}
	
	private function adminRoleDao() {
		return D('Common/Admin/Role');
	}

    private function systemActionDao() {
        return D('Common/System/Action');
    }
}


