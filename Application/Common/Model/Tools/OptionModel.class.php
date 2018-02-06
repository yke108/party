<?php
namespace Common\Model\Tools;

use Think\Model\RelationModel;
use Common\Basic\Status;

class OptionModel extends RelationModel {
	// tableName属性来改变默认的规则
    protected $tableName = 'option';
    protected $pk = 'id';
    
    protected $_validate = array(
    		array('branch_id','require','支部ID不能为空',1),
    		array('study_time','require','截止时间不能为空',1),
    		array('type','require','分类不能为空',1),
            array('content_id','require','内容ID不能为空',1),
    );

    protected $_auto = [
        ['add_time','time',1,"function"],
    ];

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
	
	public function searchRecords($map, $orderby, $start, $limit){
		$map['is_delete'] = Status::None;
        return $this->where($map)->order($orderby)->page($start, $limit)->select();
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