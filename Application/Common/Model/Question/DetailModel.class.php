<?php
namespace Common\Model\Question;
use Think\Model\RelationModel;

class DetailModel extends RelationModel {
    protected $tableName = 'question_detail';

	protected $_validate = array(     
		array('question_id','checkQuestionId','评测不存在',0,'callback'),
		array('title','require','题目不能为空'),
		array('type',array(1,2),'类型值的范围不正确！',0,'in'), 
		array('result','require','正确答案不能为空'),
		array('score','checkScore','分数必须大于0',0,'callback'),
	);

	protected function checkQuestionId($question_id) {
		if (!M('Question')->where(['id'=> $question_id])->count()) {
			return false;
		} else {
			return true;
		}
	}

	protected function checkScore($score) {
		if ($score <= 0) {
			return false;
		} else {
			return true;
		}
	}
}