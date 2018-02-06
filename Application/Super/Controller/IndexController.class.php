<?php
namespace Super\Controller;

class IndexController extends FController {
	private $service;
	public function _initialize(){
		parent::_initialize();
		$this->service = Service('Crontab');
	}

	// 定时同步
	public function indexAction(){
		$post = $_POST;
		// 分类
		$categoryList = isset($_POST['categoryList']) ? json_decode($_POST['categoryList'], true) : [];
		$cat_id_arr = [];
		foreach ($categoryList as $key => $value) {
			$ret = $this->service->addWh('Category', $value);
			if ($ret) $cat_id_arr[] = $value['cat_id'];
		}
		// 两学一做
		$lxyzList = isset($_POST['lxyzList']) ? json_decode($_POST['lxyzList'], true) : [];
		$lxyz_id_arr = [];
		foreach ($lxyzList as $key => $value) {
			$ret = $this->service->addWh('Lxyz', $value);
			if ($ret) $lxyz_id_arr[] = $value['id'];
		}
		// 党建专题
		$specialList = isset($_POST['specialList']) ? json_decode($_POST['specialList'], true) : [];
		$special_id_arr = [];
		foreach ($specialList as $key => $value) {
			$ret = $this->service->addWh('Special', $value);
			if ($ret) $special_id_arr[] = $value['id'];
		}

		// 返回
		$this->jsonReturn([
			'cat_id_arr'=> $cat_id_arr,
			'lxyz_id_arr'=> $lxyz_id_arr,
			'special_id_arr'=> $special_id_arr,
		]);
	}
}