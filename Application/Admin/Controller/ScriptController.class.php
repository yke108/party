<?php
namespace Admin\Controller;
use Think\Controller;
use Common\Basic\Point;

class ScriptController extends Controller {
	private $service;
	public function _initialize(){
		$this->service = Service('Point');
	}
	
	// 同步旧数据（支部默认积分规则）
	public function syncPointRuleAction() {
		$branch_id_list = M('branch')->getField('branch_id', true);
		if (empty($branch_id_list)) {
			exit("没有党支部");
		}
		foreach ($branch_id_list as $branch_id) {
			// 授权登录
			$this->service->addDefaultPointData($branch_id);
		}
		echo 'success';
	}
}
