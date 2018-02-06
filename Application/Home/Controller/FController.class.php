<?php
namespace Home\Controller;
use Think\Controller;
use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Model\Branch;

class FController extends Controller {
	protected $loginck = false;
	public function _initialize(){
		$actbefore = ACTION_NAME.'Before';
		if (method_exists($this, $actbefore)){
			$this->$actbefore();
		}
		$this->apiSetCheck();
		$input = file_get_contents('php://input');
        $post = json_decode($input, true);
        if(!$post) $post = I('post.');
        //throw new CsException(json_encode($input));

        //检查公共参数是否齐全
		$version = $post['version'];
		$client = $post['client'];
		$vsign = $post['vsign'];
		$rstr = $post['rstr'];
		if(empty($version) || empty($client) || empty($vsign) || empty($rstr)){
			// throw new CsException('缺少公共参数', 2);
		}
		//验证椄口
		$tmpArr = $post;
		$tmpArr['secKey'] = 'DangJianXiaoChengXi-GZhuiyi';
		unset($tmpArr['vsign']);
		sort($tmpArr,SORT_STRING);
		$tmpStr = implode($tmpArr);
		$tmpStr = base64_encode($tmpStr);
		$expSign = $this->apiSign($tmpStr);
		if($vsign != $expSign){
			// throw new CsException('接口验证失败', 3);
		}
		$_POST = $post;
		unset($_POST['user_id'], $_POST['branch_id'], $_POST['vsign'], $_POST['rstr']);
		if ($_POST['token']){
			$sess = $this->sessionService()->tokenCheck($_POST['token']);
			$_POST['user_id'] = $sess['user_id'];
			$_POST['branch_id'] = $sess['branch_id'];
			$_POST['region_code'] = $sess['region_code'];
			unset($_POST['token']);
		}
		if ($this->loginck === Status::NO){
			return;
		}		
		if ($_POST['user_id'] < 1){
			 throw new CsException('未登录', 31);
		}
	}
	
	protected function _empty(){
		throw new CsException('接口不存在', 1000);
	}
	
	protected function apiSetCheck(){
		if (empty($this->loginck)){
			$this->loginck = Status::YES;
		}
	}
	
	private function apiSign($str){
		return md5($str);
	}
	
	protected function jsonReturn($data){
		if (!is_array($data)){
			$data = array(
				'Message'=>$data,
			);
		}
		!isset($data['Error']) && $data['Error'] = 0;
		!isset($data['Message']) && $data['Message'] = 'Success';
		$data['Error'] == 0 && Service('Point')->addPoint();
		$this->ajaxReturn($data);
	}
	
	protected function sessionService(){
		return D('Session', 'Service');
	}


	protected function check_empty($arr,$check)
	{
		$message = '内容为空';
		foreach($check as $k=>$v)
		{
			if(!is_numeric($k)) $message = $k; 

			if(!isset($arr[$v]))
			{
				$data = [
					'Error'=>1001,
					'Message'=>$message,
				];
				$this->jsonReturn($data);
			}else if(empty($arr[$v]))
			{
				$data = [
					'Error'=>1001,
					'Message'=>$message,
				];
				$this->jsonReturn($data);
			}else if(is_null($arr[$v]))
			{
				$data = [
					'Error'=>1001,
					'Message'=>$message,
				];
				$this->jsonReturn($data);
			}else if(preg_match('/^\s+$/', $arr[$v]))
			{
				$data = [
					'Error'=>1001,
					'Message'=>$message,
				];
				$this->jsonReturn($data);
			}
		}
		return;
	}

	protected function userInfoDao(){
		return D('Common/User/UserInfo');
	}

	protected function branchInfoDao(){
		return D('Common/branch/Branch');
	}
}
