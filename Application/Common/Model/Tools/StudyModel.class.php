<?php
namespace Common\Model\Tools;

use Think\Model\RelationModel;
use Common\Basic\Status;

class StudyModel extends RelationModel {
	// tableName属性来改变默认的规则
    protected $tableName = 'user_study';
    protected $pk = 'id';

    protected $_validate = array(
    		array('type','require','类型不能为空',1,'',1),
    		array('content_id','require','内容ID不能为空',1,'',1),
    );

	public function getRecord($id){
		$map = array(
				'id'=>$id,
				'is_delete'=>Status::None,
		);
   		return $this->where($map)->find();
	}

	public function findRecord($map){
		$map['is_delete'] = Status::None;
		return $this->where($map)->find();
	}
	
	public function addRecord($data){
		return $this->add($data);
	}
	
	public function saveRecord($data){
		return $this->save($data);
	}
	
	public function delRecord($id){
		$data = array(
				'id'=>$id,
				'is_delete'=>Status::YES,
		);
		return $this->save($data);
	}
	
	public function delRecords($ids){
		$map = array('id'=>array('in',$ids));
		$data = array('is_delete'=>Status::YES);
		return $this->where($map)->save($data);
	}
	
	public function searchRecords($map, $orderby, $start, $limit,$field='detail'){
		$map['is_delete'] = Status::None;
        return $this->where($map)->order($orderby)->page($start, $limit)->field($field,true)->select();
    }
	
	public function searchRecordsCount($map){
		$map['is_delete'] = Status::None;
		return $this->where($map)->count();
    }
    
    public function searchAllRecords($map, $orderby = 'sort DESC, id DESC'){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->order($orderby)->select();
    }
    
    public function searchFieldRecords($map, $field = 'id, ref_id, title, desc, detail'){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->getField($field,true);
    }
}