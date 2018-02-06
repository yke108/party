<?php
namespace Notify\Controller;
use Think\Controller;

class WechatController extends Controller {
	public function indexAction() {
		echo $_GET["echostr"];	
	}
}