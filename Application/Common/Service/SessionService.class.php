<?php
namespace Common\Service;
use Common\Basic\CsException;

class SessionService{
	public function userCheck($params){
		$map = array(
			'sesskey'=>$params['sesskey'],
		);
		$sess = $this->userSessionDao()->findRecord($map);
		if(empty($sess) || $sess['expiry'] <= NOW_TIME || $sess['user_id'] != $params['user_id']){
			throw new CsException('登录超时', 32);
		}
	}
	
	public function tokenCheck($token){
		$sess = $this->userSessionDao()->getRecord($token);
		if(empty($sess) || $sess['expiry'] <= NOW_TIME){
			throw new CsException('登录超时', 32);
		}
		return $sess;
	}
	
	public function createUserSession($user_id, $branch_id,$region_code){
		$sessionDao = $this->userSessionDao();
		$sessionDao->clearExpiryRecords($user_id);
		$sess = str_replace('.', md5($user_id), uniqid(rand(10000,99999),true));
		$data = array(
			'sesskey'=>$sess,
			'user_id'=>$user_id,
			'branch_id'=>$branch_id,
            'region_code'=>$region_code,
		);
		if ($sessionDao->addRecord($data) === false){
			throw new CsException('登录失败', 10010);
		}
		return $sess;
	}
	
	public function adminCheck($params){
		$map = array(
			'sesskey'=>$params['sesskey'],
		);
		$sess = $this->adminSessionDao()->findRecord($map);
		if(empty($sess) || $sess['expiry'] <= NOW_TIME || $sess['admin_id'] != $params['admin_id']){
			throw new CsException('登录超时', 32);
		}
	}
	
	public function adminTokenCheck($token){
		$map = array(
			'sesskey'=>$token,
		);
		$sess = $this->adminSessionDao()->findRecord($map);
//		print_r($this->adminSessionDao()->_sql());
//		exit;
		if(empty($sess) || $sess['expiry'] <= NOW_TIME){
			throw new CsException('登录超时', 32);
		}
		return $sess;
	}
	
	public function createAdminSession($admin){
		$sessionDao = $this->adminSessionDao();
		$sessionDao->clearExpiryRecords($admin['admin_id']);
		$sess = str_replace('.',rand(10000,99999), uniqid(rand(10000,99999),true));
		$data = array(
			'sesskey'=>$sess,
			'admin_id'=>$admin['admin_id'],
			'branch_id'=>$admin['branch_id'],
			'action_list'=>strtolower(','. implode(',', $admin['action_list']).','),
            'is_admin'=>$admin['is_admin'],
            'region_code'=>$admin['region_code'],
		);
		if ($sessionDao->addRecord($data) === false){
			throw new CsException('登录失败', 10010);
		}
		return $sess;
	}
	
	private function userSessionDao(){
		return D('Common/User/UserSession');
	}
	
	private function adminSessionDao(){
		return D('Common/Admin/AdminSession');
	}
}

