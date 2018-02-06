<?php
namespace Adminapi\Controller;

class ActivityController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
	
	public function indexAction(){
		$cat_list = $this->categoryService()->getPagerList();
		$data = [
			'cat_list'=>$cat_list,
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}
}