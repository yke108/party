<?php
namespace Adminapi\Controller;
use Common\Basic\Point;

class PointController extends FController {
	private $service;
	public function _initialize(){
		parent::_initialize();
		$this->service = Service('Point');
	}

	//规则列表
	public function ruleAction(){
		$this->jsonReturn(['Display'=>1]);
	}

	//规则列表
	public function ruleListAction(){
		$branch_id = I('post.branch_id');
		$list = $this->service->getList($branch_id);
		$temp = 0;
		foreach ($list as $key => $value) {
			if ($value['rule_cat'] == $temp) {
				$list[$key]['cat_name'] = '';
			}
			$temp = $value['rule_cat'];
		}
		$this->jsonReturn(['List'=> $list]);
	}

	//编辑规则
	public function editRuleAction(){
		$post = I('post.');
		try {
			$this->service->editRule($post);
		} catch (\Exception $e) {
			$this->jsonReturn([
				'Message'=>$e->getMessage(),
				'Error'=>$e->getCode(),
			]);
		}
		$this->jsonReturn("编辑成功");
	}

	//积分流水
	public function logAction(){
		$this->jsonReturn(['Display'=>1]);
	}

	//积分流水
	public function logListAction(){
		$post = I('post.');
		$count = $this->service->getPointLog($post, true);
		$list = $this->service->getPointLog($post);
		foreach ($list as $key => $value) {
			$userInfo = M('UserInfo')->where(['user_id'=> $value['user_id']])->field('real_name,user_img')->find();
			$list[$key]['real_name'] = $userInfo['real_name'];
			$list[$key]['user_img'] = getUserImg($userInfo['user_img']);
		}
		$this->jsonReturn(['List'=> $list, 'Count'=> $count]);
	}
}