<?php
namespace Home\Controller;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\SystemConst;
include APP_PATH.'/Common/Weixin3rd/WxComponentService.class.php';

class WeixinController extends FController {
	protected function apiSetCheck(){
		$this->loginck = Status::NO;
	}
	
	public function loginAction(){
		$code = I('post.code');
		$app_id = I('post.app_id');
        $login_type = I('post.login_type');
	    $result = $this->checkBranchAndGetOpenid($code, $app_id);	
        $branch_id = $result['branch_id'];
        if(empty($login_type)) {
            $user_id = $this->userService()->loginByOpenid($branch_id, $result['openid']);
            if($user_id < 1) {
                throw new CsException('请登录', 33);
            }
        } else {
            $user_name = I('post.user_name');
            $password = I('post.password');
            $user_id = $this->userService()->loginByPassword($branch_id, $result['openid'], $user_name, $password);
        }
        //从用户信息获取地区
        $region_code = $this->userService()->getUserInfo($user_id)['district'];
        $_POST['user_id'] = $user_id; // 用于添加用户积分
        $_POST['branch_id'] = $branch_id; // 用于添加用户积分
        $_POST['region_code'] = $region_code;
        $sess = $this->sessionService()->createUserSession($user_id, $branch_id,$region_code);
        $userinfo = [
            'Token'=>$sess,
        ];
		$data = [
			'Info'=>$userinfo,
		];
		$this->jsonReturn($data);
	}

    public function logoutAction() {
        $user_id = intval($_POST['user_id']);
        $this->userService()->clearOpenid($user_id);
        $this->jsonReturn('退出成功');
    }

    protected function checkBranchAndGetOpenid($code, $app_id) {
		if (empty($code)){
			throw new CsException('code不能为空', 1001);
		}
		if (empty($app_id)){
			throw new CsException('AppId不能为空', 1004);
		}
		$branch = $this->branchService()->branchInfoFromAppId($app_id);
		if (empty($branch)){
			throw new CsException('组织信息不存在', 1009);
		}
		if ($branch['status'] != Status::YES || $branch['expire_time'] <= NOW_TIME){
			throw new CsException('组织状态异常,请联系管理员处理', 1009);
		}
		if ($branch['app_type'] == SystemConst::AppTypeNormal){
			if (empty($branch['app_secret'])){
				throw new CsException('未设置密钥', 1005);
			}
			$url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$app_id;
			$url .= '&secret='.$branch['app_secret'];
			$url .= '&js_code='.$code;
			$url .= '&grant_type=authorization_code';
			$content = file_get_contents($url);
			$result = json_decode($content, true);
		} else if ($branch['app_type'] == SystemConst::AppTypeThird){
			$wxComponentConfig = getWxComponentConfig();
			$wxComponentService = new \WxComponentService($wxComponentConfig);
			$result = $wxComponentService->getSessionByJscode($app_id, $code);
		} else {
			throw new CsException('未知应用类型', 1007);
		}
        if (!is_array($result)) {
            throw new CsException($result, 9004);
        }
        elseif (!isset($result['openid']) || empty($result['openid'])) {
            if (isset($result['errmsg'])) {
                $errcode = isset($result['errcode']) ? $result['errcode'] : 101;
                throw new CsException($result['errmsg'], $errcode);
            } else {
                throw new CsException('未知错误', 1093);
            }
        } 
        $result['branch_id'] = $branch['branch_id'];
        $result['district'] = $branch['district'];
        return $result;
    }



	protected function configService(){
		return D('Config', 'Service');
	}
	
	protected function weixinService(){
		return D('Weixin', 'Service');
	}

	protected function groupService(){
	    return D('Group','Service');
    }

	protected function userService(){
		return D('User', 'Service');
	}
	
	protected function branchService(){
		return D('Branch', 'Service');
	}
}
