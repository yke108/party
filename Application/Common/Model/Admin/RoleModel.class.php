<?php
namespace Common\Model\Admin;
use Common\Model\CommonModel;

class RoleModel extends CommonModel {
    protected $tableName = 'admin_role';

	public function getRecord($id){
		if ($id < 1) return array();
   		return $this->find($id);
	}

	public function findRecord($map){
		return $this->where($map)->find();
	}
	
	public function addRecord($data){
		return $this->add($data);
	}
	
	public function saveRecord($data){
		return $this->save($data);
	}
	
	public function getRecords($role_ids){
		$map = array(
				'id'=>['in', $role_ids],
		);
		return $this->where($map)->select();
	}
	
	public function searchAllRecords($map, $orderby){
		return $this->where($map)->order($orderby)->select();
	}
	
	public function searchFieldRecords($map, $field = 'role_id, role_name, action_list, role_describe'){
		return $this->where($map)->getField($field);
	}
}