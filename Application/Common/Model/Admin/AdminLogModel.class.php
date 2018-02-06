<?php
namespace Common\Model\Admin;

use Think\Model\RelationModel;
use Common\Basic\Status;

class AdminLogModel extends RelationModel {
	// tableName属性来改变默认的规则
    protected $tableName = 'admin_log';
    protected $pk = 'log_id';
    
    protected $_validate = array(
    		array('admin_id','require','管理员ID不能为空',1),
    		array('admin_name','require','管理员名称不能为空',1),
    );
    
    protected $_auto = array (
    		array('log_time','time',1,'function'), // 对add_time字段在更新的时候写入当前时间戳
    );
    
	public function getRecord($cat_id){
		$map = array(
				'cat_id'=>$cat_id,
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
	
	public function saveRecord($map, $data){
		return $this->where($map)->save($data);
	}
	
	public function delRecord($cat_id){
		$map = array('cat_id'=>$cat_id);
		$data = array('is_delete'=>Status::YES);
		return $this->where($map)->save($data);
	}
	
	public function delRecords($cat_ids){
		$map = array('cat_id'=>array('in',$cat_ids));
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
    
    public function searchAllRecords($map, $orderby){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->order($orderby)->select();
    }
    
    public function searchFieldRecords($map, $orderby){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->order($orderby)->getField('cat_id, cat_name, desc, icon');
    }
}