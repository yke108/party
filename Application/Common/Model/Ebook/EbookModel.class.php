<?php
namespace Common\Model\Ebook;
use Think\Model\RelationModel;
use Common\Basic\Status;

class EbookModel extends RelationModel {
    protected $tableName = 'ebook';

	protected $_validate = array(     
		array('title','require','标题不能为空'),
		array('image','require','图片不能为空'),
		array('desc','require','简介不能为空'),
		array('deep',array(1,2,3),'级数值的范围不正确！',0,'in'),
	);

    public function findRecord($map){
        $map['is_delete'] = Status::None;
        return $this->where($map)->find();
    }
}