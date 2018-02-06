<?php
namespace Admin\Controller;
use Common\Basic\Pager;
include APP_PATH.'/Common/Weixin3rd/WxComponentService.class.php';

class SiteController extends FController {
	public function _initialize(){
		
	}
	
	public function loginAction(){
		layout(false);
		session(null);
		if(LOGINCITY != '') $this->assign('city',LOGINCITY);
        if(!defined('LOGINBACKGROUND'))
        {
            $login_background = DK_PUBLIC_URL.'/admin/img/login-background.jpg';
        }else{
            $login_background = LOGINBACKGROUND;
        }

        $this->assign('login_background',$login_background);
        $this->display();
	}
	
	public function forgetAction(){
        if(!defined('LOGINBACKGROUND'))
        {
            $login_background = DK_PUBLIC_URL.'/admin/img/login-background.jpg';
        }else{
            $login_background = LOGINBACKGROUND;
        }
        $this->assign('login_background',$login_background);
        $this->display();
	}
	
	public function logoutAction(){
		session('uid', null);
		session('sesspwd', null);
		session('avatar', null);
		session('admin_name', null);
		session('role_name', null);
		$this->success('退出成功', U('login'));
	}

	// 授权成功跳转页面
	public function authSuccessAction() {
		$branch_id = I('get.branch_id', 0, 'intval');
		$auth_code = $_GET['auth_code'];
		if ($branch_id < 1 || empty($auth_code)) {
			$this->redirect('index/index/callback_code/fail');
		}
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$authInfo = $wxComponentService->getAuthInfo($auth_code);
		$app_id = $authInfo['authorization_info']['authorizer_appid'];
		if (empty($app_id)) {
			$this->redirect('index/index/callback_code/fail');
		}
		$branchInfo = $this->branchService()->getInfo($branch_id, 'app_id');
		// 验证支部是否存在
		if (empty($branchInfo)) {
			$this->redirect('index/index/callback_code/fail');
		}
		// 小程序与曾绑过的不一致
		if (!empty($branchInfo['app_id']) && $branchInfo['app_id'] != $app_id) {
			$this->redirect('index/index/callback_code/fail');
		}
		// 小程序不能绑定多个支部
		$branchInfo = $this->branchService()->branchInfoFromAppId($app_id);
		if (!empty($branchInfo) && $branchInfo['branch_id'] != $branch_id) {
			$this->redirect('index/index/callback_code/fail');
		}
		$this->branchService()->addAppId(['branch_id'=> $branch_id, 'app_id'=> $app_id]);
		$this->redirect('index/index/callback_code/success');
	}

	protected function configService(){
		return D('Config', 'Service');
	}

	protected function branchService(){
		return D('Branch', 'Service');
	}
}
