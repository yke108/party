<?php
namespace Common\Model\Photo;

//use Think\Model\RelationModel;
use Common\Model\CommonModel;
use Common\Basic\Status;

class PhotoWhModel extends CommonModel {
	// tableName属性来改变默认的规则
    protected $tableName = 'album';
    protected $pk = 'id';
    
    protected $_validate = array(
    		array('branch_id','require','支部ID不能为空',1),
    		array('title','require','标题不能为空',1),
    		array('cat_id','require','分类不能为空',1),
    		array('detail','require','详情不能为空',1),
    );
    
    protected $_auto = array (
    		array('add_time','time',1,'function'), // 对add_time字段在更新的时候写入当前时间戳
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