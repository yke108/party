<?php
namespace Adminapi\Controller;
use Common\Basic\Status;

class AdminController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
	
	public function indexAction(){
		$post = I('post.');
		//管理员
		$params = [
			'keyword'=>$post['keyword'],
			'branch_id'=>$post['branch_id'],
		];
		$result = $this->adminService()->getPagerList($params);
		//角色
		$type_list[] = 1;
		$type_list[] = $post['branch_id'] > 0 ? 3 : 2;
		$role_list = $this->adminService()->getRoleList(['type'=> ['in', $type_list]]);
		$data = [
			'List'=>$result['list'],
			'RoleList'=>$role_list,
			'Count'=>$result['count'],
			'Page'=>$result['page'],
			'PageSize'=>$result['pagesize'],
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}
	
	//添加或编辑
	public function createOrModifyAction(){
		$post = I('post.');
		$post['admin_id'] = $post['id'];
		try {
			$result = $this->adminService()->createOrModify($post);
			$data = array(
					'Message'=>$post['admin_id'] ? '修改成功' : '添加成功',
			);
		} catch (\Exception $e) {
			$data = array(
					'Message'=>$e->getMessage(),
					'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}
	
	//状态开关
	public function switchStatusAction(){
		$post = I('post.');
		$params = array(
				'ref_id'=>$post['ref_id'],
				'branch_id'=>$post['branch_id'],
		);
		try {
			$result = $this->adminService()->switchStatus($params);
			$data = array(
					'Message'=>'操作成功',
					'AdminStatus'=>$result['status'],
			);
		} catch (\Exception $e) {
			$data = array(
					'Message'=>$e->getMessage(),
					'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}
	
	//删除
	public function delAction(){
		$post = I('post.');
		try {
			$result = $this->adminService()->delete($post);
			$data = array(
					'Message'=>'删除成功',
			);
		} catch (\Exception $e) {
			$data = array(
					'Message'=>$e->getMessage(),
					'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}

	//操作日志页面
	public function logAction(){
		$this->jsonReturn(['Display'=>1]);
	}

	//AJAX操作日志列表
	public function logListAction(){
		$post = I('post.');
		$ret = $this->adminService()->getActionLog($post);
		foreach ($ret['list'] as $key => $value) {
			$ret['list'][$key]['add_time'] = date('Y-m-d H:i', $value['add_time']);
			$ret['list'][$key]['action_type_label'] = Status::$actionTypeList[$value['action_type']];
		}
		$this->jsonReturn(['List'=> $ret['list'], 'Count'=> $ret['count']]);
	}
	
	private function adminService() {
		return D('Admin', 'Service');
	}
}