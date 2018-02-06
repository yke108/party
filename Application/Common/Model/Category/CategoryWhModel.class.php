<?php
namespace Common\Model\Category;

// use Think\Model\RelationModel;
use Common\Model\CommonModel;
use Common\Basic\Status;

class CategoryWhModel extends CommonModel {
    protected $tableName = 'category';
    protected $pk = 'cat_id';
    
    protected $_validate = array(
    		array('cat_name','require','分类名称不能为空',1),
    		array('cat_name','','分类名称已存在',0,'unique',3),
    );
    
    protected $_auto = array (
    		array('add_time','time',1,'function'), // 对add_time字段在更新的时候写入当前时间戳
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
    
    public function searchFieldRecords($map, $field = 'cat_id, cat_name, desc, icon, sort, status, add_time'){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->getField($field);
    }
}