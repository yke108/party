<?php
namespace Common\Model\Point;
use Think\Model\RelationModel;

class PointRuleModel extends RelationModel {
    protected $tableName = 'point_rule';

	public function getRecord($id){
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
	
	public function saveMapRecord($data,$map){
		return $this->where($map)->save($data);
	}

	public function searchRecords($map, $orderBy = 'rule_cat asc, rule_id asc'){
        return $this->where($map)->order($orderBy)->select();
    }
	
	public function searchRecordsCount($map){
		return $this->where($map)->count();
    }
    
	public function deleteRecord($map){
		return $this->where($map)->delete();
	}
}