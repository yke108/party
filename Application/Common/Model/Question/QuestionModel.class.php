<?php
namespace Common\Model\Question;
use Think\Model\RelationModel;
use Common\Basic\Status;

class QuestionModel extends RelationModel {
    protected $tableName = 'question';

	protected $_validate = array(     
		array('title','require','标题不能为空'),
		array('image','require','图片不能为空'),
		array('desc','require','简介不能为空'),
	);

    public function findRecord($map){
        $map['is_delete'] = Status::None;
        return $this->where($map)->find();
    }
}