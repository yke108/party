<?php
namespace Common\Model\User;
use Think\Model;

class UserSessionModel extends Model{
	public function getRecord($id){
		if (empty($id)) return [];
   		return $this->find($id);
	}
	
	public function findRecord($map){
		return $this->where($map)->find();
	}
	
	public function addRecord($data){
		$data['expiry'] = NOW_TIME + 604800;
		return $this->add($data);
	}
	
	public function clearExpiryRecords($user_id = 0){
		$map = array(
			'expiry'=>array('lt', NOW_TIME),
			'_logic'=>'OR',
		);
		$user_id && $map['user_id'] = $user_id;
		return $this->where($map)->delete();
	}
}