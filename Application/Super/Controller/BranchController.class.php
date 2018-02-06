<?php
namespace Super\Controller;

class BranchController extends FController {
	private $service;
	public function _initialize(){
		parent::_initialize();
		$this->service = Service('Crontab');
	}

	// 定时同步
	public function indexAction(){
		$post = $_POST;
		$this->service->addBranch($post);
		$this->jsonReturn('success');
	}
}