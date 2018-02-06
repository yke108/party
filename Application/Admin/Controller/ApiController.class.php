<?php
namespace Admin\Controller;

class ApiController extends FController {
    public function indexAction(){
		$ret = preg_match('/^[a-zA-Z0-9]+\/[a-zA-Z_0-9]+$/', $_SERVER['PATH_INFO']);
    	if(!$ret) {
    		$result = [
    			'Error'=>23,
    			'Message'=>'接口不存在',
    		];
    	}
    	$result = $this->apiRequest($_SERVER['PATH_INFO'], $_POST);
    	if (isset($result['Token'])){
    		unset($result['Token']);
    	}
    	exit(json_encode($result));
    }
}
