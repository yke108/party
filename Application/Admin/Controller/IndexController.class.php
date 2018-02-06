<?php
namespace Admin\Controller;

class IndexController extends FController {
	public function indexAction(){
		layout(false);
		$api_name = strtolower(CONTROLLER_NAME).'/'.strtolower(ACTION_NAME);
		$data = [];
		$result = $this->apiRequest($api_name, $data);
		$callback_code = 0;
		if (isset($_GET['callback_code'])) {
			$callback_code = $_GET['callback_code'] == 'success' ? 1 : 2;
		}
		$this->assign('callback_code', $callback_code);
		$this->assign('result', $result);
		$this->display();
	}
}
