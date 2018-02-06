<?php
namespace Common\Model\Category;

use Think\Model\RelationModel;
use Common\Basic\Status;

class CategoryModel extends RelationModel {
	// tableName属性来改变默认的规则
    protected $tableName = 'category';
    protected $pk = 'cat_id';
    
    protected $_validate = array(
    		array('branch_id','require','支部ID不能为空',1),
    		array('cat_name','require','分类名称不能为空',1),
    		array('cat_name, is_delete','','分类名称已存在',0,'unique',3),
    		array('cat_type','require','分类类型不能为空',1),
    		array('cat_type',array(Status::CatTypeLxyz, Status::CatTypeDjzt,Status::CatTypeVideo,Status::CatTypeAudio,Status::CatTypeEbook,Status::CatTypeRead,Status::CatTypeQuestion,Status::CatTypeAlbum),'类型值的范围不正确',2,'in'),
    		array('status',array(Status::YES, Status::NO),'状态值的范围不正确',2,'in'),
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
	
	public function addRecord($data){
		return $this->add($data);
	}
	
	public function saveRecord($data){
		return $this->save($data);
	}
	
	public function delRecord($cat_id){
		$data = array(
				'cat_id'=>$cat_id,
				'is_delete'=>Status::YES,
		);
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
    
    public function searchAllRecords($map, $orderby = 'sort DESC, cat_id DESC'){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->order($orderby)->select();
    }
    
    public function searchFieldRecords($map, $field = 'cat_id, ref_id, cat_name, desc, icon'){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->getField($field);
    }
}