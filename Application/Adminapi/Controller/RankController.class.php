<?php
namespace Adminapi\Controller;

class RankController extends FController {
	private $service;
	public function _initialize(){
		parent::_initialize();
		$this->service = Service('Point');
	}
	// 总榜单
	public function mainAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		$List = $this->service->getRanking($branch_id, 1);
		$data = [
			'List'=> $List,
			'Display'=> 1,
		];
		$this->jsonReturn($data);
	}

	// 分项榜单
	public function itemAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		$StudyList = $this->service->getRanking($branch_id, 3);
		$MienList = $this->service->getRanking($branch_id,4);
		$ExamList = $this->service->getRanking($branch_id,5);
		$data = [
			'StudyList'=> $StudyList,
			'MienList'=> $MienList,
			'ExamList'=> $ExamList,
			'Display'=> 1,
		];
		$this->jsonReturn($data);
	}
}