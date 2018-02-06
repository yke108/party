<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class LxyzController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
	
	public function indexAction(){
		$post = I('post.');
		$result = $this->categoryService()->getPagerList($post);
		$data = [
			'cat_list'=>$result['list'],
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}
	
	public function categoryAction(){
		$post = I('post.');
		$map = array(
				'branch_id'=>$post['branch_id'],
                'cat_type'  =>Status::CatTypeLxyz,
                 'status'    =>Status::YES,
                'region_code'=>$post['region_code'],
        );
		$result = $this->categoryService()->getAllList($map);
		$data = [
			'cat_list'=>$result,
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}
	
	//总部分类
	public function whAction(){
		$post = I('post.');
		$result = $this->categoryService()->getWhPagerList($post);
		$data = [
			'cat_list' =>$result['list'],
			'Display'  =>1,
		];
		$this->jsonReturn($data);
	}
	
	public function infoAction(){
		$post = I('post.');
		$result = $this->categoryService()->getInfo($post['cat_id']);
		$data = [
			'info'=>$result,
		];
		$this->jsonReturn($data);
	}
	
	public function create_or_modifyAction(){
		$post = I('post.');
		try {
			$result = $this->categoryService()->createOrModify($post);
			$data = array(
					'Message'=>$post['cat_id'] ? '修改成功' : '添加成功',
			);
		} catch (\Exception $e) {
			$data = array(
					'Message'=>$e->getMessage(),
					'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}
	
	//拷贝总部分类
	public function copyAction(){
		$post = I('post.');
		try {
			$result = $this->categoryService()->copy($post);
			$data = array(
					'Message'=>'拷贝成功',
			);
		} catch (\Exception $e) {
			$data = array(
					'Message'=>$e->getMessage(),
					'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}
	
	//禁用或启用
	public function statusSwitchAction(){
		$post = I('post.');
		try {
			$result = $this->categoryService()->statusSwitch($post);
			$data = array(
					'Message'=>'操作成功',
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
			$result = $this->categoryService()->delete($post);
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
	
	private function categoryService() {
		return D('Category', 'Service');
	}
}