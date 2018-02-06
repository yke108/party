<?php
namespace Common\Model\Branch;

//use Common\Model\CommonModel;
use Think\Model\RelationModel;
use Common\Basic\Status;

class BranchModel extends RelationModel {
    protected $tableName = 'branch';
    
    public function getRecord($branch_id){
    	if ($branch_id < 1) return array();
    	$map = array(
    			'branch_id'=>$branch_id,
    			'is_delete'=>Status::None,
    	);
    	return $this->where($map)->find();
    }

    public function getRecords($ids){
		if (empty($ids)) return array();
		if (!is_array($ids)) $ids = array($ids);
		$map = array(
				'branch_id'=>array('in', $ids),
				'is_delete'=>Status::None,
		);
		return $this->where($map)->getField('branch_id,app_id,app_name,branch_name,user,phone,address');
	}
	
	public function searchFieldRecords($map, $field = 'branch_id,app_id,app_name,branch_name,user,phone,address'){
		$map['is_delete'] = Status::None;
		return $this->where($map)->getField($field);
	}

    public function getbranch_list($map){
        $map['is_delete'] = Status::None;
        return $this->where($map)->getField('branch_id',true);
    }
}