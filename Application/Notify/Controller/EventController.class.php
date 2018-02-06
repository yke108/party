<?php
namespace Notify\Controller;
use Think\Controller;
include APP_PATH.'/Common/Weixin3rd/WxComponentService.class.php';

class EventController extends Controller {

	public function indexAction() {
		$data = file_get_contents('php://input');
		$arr = [];
		foreach ($_GET as $ko => $vo){
			$arr[] = $ko.'='.$vo;
		}
		$url = implode('&',$arr);

		file_put_contents(RUNTIME_PATH.'/component_event.txt', date("Y-m-d H:i:s") . "\n" . print_r($url, true) . "\n" . print_r($data, true) . "\n", FILE_APPEND);
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->onComponentEventNotify();
	}

	protected function configService(){
		return D('Config', 'Service');
	}
}