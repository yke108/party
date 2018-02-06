<?php
namespace Home\Controller;
use Common\Basic\Status;
use Common\Basic\CsException;

class QuestionController extends FController {
	protected function apiSetCheck(){
		$this->loginck = Status::NO;
	}

	private $user_id;
	private $_string;
	public function  _initialize() {
		parent::_initialize();
		$this->user_id = I('post.user_id', 0, 'intval');
		$this->questionService()->updateOverExam($this->user_id);
	}
	
	//评测列表
	public function question_listAction(){
		$post = I('post.');
		$param = [
			'page' => intval($post['page']),
			'pagesize' => intval($post['pagesize']),
			'status' => 1,
			'_string' => get_string(),
			'cat_id' => intval($post['cat_id']),
		];
        $result = $this->questionService()->getList($param);
        $list = [];
        foreach ($result['list'] as $key => $value) {
        	$list[] = [
        		'Id'       =>$value['id'],
        		'Title'       =>$value['title'],
				'Image'       =>[$value['image']],
				'ReadNum'     =>$value['read_num'],
				'CollectNum'  =>$value['collect_num'],
				'ForwardNum'  =>$value['forward_num'],
        	];
        }
		$data = [
			'List'=> $list,
			'Count'=> $result['count'],
		];
		$this->jsonReturn($data);
	}
	
	//评测试题列表
	public function question_infoAction(){
		$id = I('post.id', 0, 'intval');
		$questionService = $this->questionService();
		$info = $questionService->getInfo($id);
		if (empty($info)) {
			throw new CsException('没有数据', 400);
		}
		$examInfo = $questionService->getExamInfo(['user_id'=> $this->user_id, 'content_id'=> $id, 'status'=> 0]);
		$count = $questionService->getItemCount($id);
		$data = [
			'Id'=> $info['id'],
			'Title'=> $info['title'],
			'Count'=> $count,
			'LimitTime'=> $info['limit_time'],
			'StartContinue'=> empty($examInfo) ? 1 : 2,
		];
		$this->jsonReturn($data);
	}

	//评测试题列表
	public function rows_listAction(){
		$id = I('post.id', 0, 'intval');
		$questionService = $this->questionService();
		$info = $questionService->getInfo($id);
		if (empty($info)) {
			throw new CsException('没有数据', 400);
		}
		$examInfo = $questionService->getExamInfo(['user_id'=> $this->user_id, 'content_id'=> $id, 'status'=> 0]);
		// 获取任务ID
		$option_id = 0;
		$temp_id = Service('Tools')->getOptionByContentId($id, Status::CollectTypeQuestion);
		if (!empty($temp_id)) {
			$ret = $questionService->getExamInfo(['user_id'=> $this->user_id, 'content_id'=> $id, 'status'=> 1, 'option_id'=> $temp_id]);
			if (empty($ret)) {
				$option_id = $temp_id;
			}
		}
		if (empty($examInfo)) {
			$questionService->addExam([
				'user_id'=> $this->user_id,
				'title'=> $info['title'],
				'image'=> $info['image'],
	    		'content_id'=> $id,
	    		'limit_time'=> $info['limit_time'],
	    		'option_id'=> $option_id,
			]);
			$left_time = $info['limit_time'];
			$read_id = 0;
		} else {
			$questionService->updateExam([
				'exam_id'=> $examInfo['exam_id'],
	    		'option_id'=> $option_id,
			]);
			$left_time = $examInfo['limit_time'] - (NOW_TIME - $examInfo['start_time']);
			$read_id = $questionService->getLastExamLogId($examInfo['exam_id']);
		}

		$rows_list = $questionService->getItemList($id);
		//添加阅读记录
		$questionService->increaseReadNum([
			'id'=>$id,
			'user_id'=>$this->user_id,
		]);
		$data = [
			'LeftTime'=> $left_time,
			'RowsList'=> $rows_list,
			'ReadId'=> $read_id,
		];
		$this->jsonReturn($data);
	}

	//答题
	public function answerAction() {
		$id = I('post.id', 0, 'intval');
		$answer = I('post.answer', '', 'trim');
		if ($id < 1) {
			throw new CsException('参数错误', 400);
		}
		$questionService = $this->questionService();
		$info = $questionService->getDetailInfo($id);
		if (empty($info)) {
			throw new CsException('题目不存在', 400);
		}
		$questionInfo = $questionService->getInfo($info['question_id']);
		if (empty($questionInfo)) {
			throw new CsException('评测不存在', 400);
		}
		$examInfo = $questionService->getExamInfo(['user_id'=> $this->user_id, 'content_id'=> $info['question_id'], 'status'=> 0]);
		if (empty($examInfo)) {
			throw new CsException('考试时间已结束', 400);
		}
		$logInfo = $questionService->getExamLogInfo(['exam_id'=> $examInfo['exam_id'], 'rows_id'=> $id]);
		if (!empty($logInfo)) {
			throw new CsException('同一题目请勿重复作答', 400);
		}
		$is_right = $answer == $info['result'] ? 1 : 0;
		$questionService->addExamLog([
			'exam_id'=> $examInfo['exam_id'],
			'rows_id'=> $id,
			'answer'=> $answer,
			'is_right'=> $is_right,
			'score'=> $info['score'],
		]);
		$data = [
			'IsRight' => $is_right,
		];
		$this->jsonReturn($data);
	}

	//提交答卷
	public function submit_examAction() {
		$id = I('post.id', 0, 'intval');
		$questionService = $this->questionService();
		$info = $questionService->getInfo($id);
		if (empty($info)) {
			throw new CsException('没有数据', 400);
		}
		$questionService->submitExam(['id'=> $id, 'user_id'=> $this->user_id]);
		$examInfo = $questionService->getExamInfo(['user_id'=> $this->user_id, 'content_id'=> $id]);
		$data = [
			'ExamId'=> $examInfo['exam_id'],
			'TotalScore'=> $examInfo['total_score'],
			'Score'=> $examInfo['score'],
			'RightCount'=> $examInfo['right_count'],
			'WrongCount'=> $examInfo['wrong_count'],
			'AnswerTime'=> $examInfo['answer_time'],
		];
		$this->jsonReturn($data);
	}

	//评测历史/正在评测
	public function exam_listAction() {
		$post = I('post.');
		$post['status'] = isset($post['status']) && in_array($post['status'], [0,1]) ? (int)$post['status'] : 0;
		$ret = $this->questionService()->getExamList($post);
		$data = [
			'List' => $ret['list'],
			'Count' => $ret['count'],
		];
		$this->jsonReturn($data);
	}

	//评测历史详情
	public function exam_detailAction() {
		$exam_id = I('post.exam_id');
		$questionService = $this->questionService();
		$examInfo = $questionService->getExamInfo(['exam_id'=> $exam_id, 'status'=> 1]);
		if (empty($examInfo)) {
			throw new CsException('没有数据', 400);
		}
		$rows_list = $questionService->getItemList($examInfo['content_id']);
		foreach ($rows_list as $key => $value) {
			$logInfo = $questionService->getExamLogInfo(['exam_id'=> $exam_id, 'rows_id'=> $value['id']]);
			$rows_list[$key]['answer'] = !empty($logInfo) ? $logInfo['answer'] : '';
			$rows_list[$key]['is_right'] = !empty($logInfo) && $logInfo['answer'] == $value['result'] ? 1 : 0;
		}
		$data = [
			'Info' => $examInfo,
			'List' => $rows_list,
		];
		$this->jsonReturn($data);
	}
	
	private function questionService() {
		return D('Question', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}

}