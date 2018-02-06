<?php
namespace Adminapi\Controller;

use Common\Basic\Status;
use Common\Basic\CodeConst;

class SiteController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
		$this->gp_chk = false;
	}
	
	public function loginAction(){
		$data = [
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}
	
	public function dologinAction(){
		$post = I('post.');
		$admin = $this->adminService()->login($post);
		$sess = $this->sessionService()->createAdminSession($admin);
		$data = [
			'Message'=>'登录成功',
			'Token'=>$sess,
			'AdminId'=>$admin['admin_id'],
			'Avatar'=>picurl($admin['avatar']),
			'AdminName'=>$admin['admin_name'],
			'RoleName'=>$admin['role_name'],
			'BranchId'=>$admin['branch_id'],
		];
		$this->jsonReturn($data);
	}
	
	public function getForgetCodeAction(){
		$post = I('post.');
		
		$phone = trim($post['phone']);
		$map = array('mobile'=>$phone);
		try {
			$admin_info = $this->adminService()->findInfo($map);
		} catch (\Exception $e) {
			$this->error($e->getMessage(), CodeConst::DataNotExist);
		}
		
		$type = Status::ModifyPassword;
		try {
			$result = $this->smsService()->sendSms($admin_info, $phone, $type);
		} catch (\Exception $e) {
			$this->error($e->getMessage());
		}
	
		//过滤
		$filter = array('13912345678');
		if (in_array($phone, $filter)) {
			$this->success('验证码发送成功', '', $result);
		}
	
		$this->success('验证码发送成功', '', array('sms_id'=>$result['sms_id']));
	}
	
	public function logoutAction(){
		$data = [
			'Message'=>'退出登录成功',
		];
		$this->jsonReturn($data);
	}
	
	private function adminService() {
		return D('Admin', 'Service');
	}
	
	private function smsService(){
		return D('Sms', 'Service');
	}
}