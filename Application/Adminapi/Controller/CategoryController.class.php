<?php
namespace Adminapi\Controller;

use Common\Basic\Status;
class CategoryController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
	
	//两学一做分类
	public function categoryAction(){
		$post = I('post.');
		$map = array(
				'branch_id'=>$post['branch_id'],
				'region_code'=>$post['region_code'],
				'cat_type'=>Status::CatTypeLxyz,
		);
		$result = $this->categoryService()->getAllList($map);
		$data = [
			'cat_list'=>$result,
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}
	
	//党建专题分类
	public function specialAction(){
		$post = I('post.');
		$map = array(
				'branch_id'=>$post['branch_id'],
				'region_code'=>$post['region_code'],
				'cat_type'=>Status::CatTypeDjzt,
		);
		$result = $this->categoryService()->getAllList($map);
		$data = [
			'cat_list'=>$result,
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}

	//学堂分类
    public function studyAction(){
        $post = I('post.');
        $map = array(
            'branch_id'=>$post['branch_id'],
            'region_code'=>$post['region_code'],
            'cat_type'=>$post['cat_type'],
        );
        $result = $this->categoryService()->getAllList($map);
        $data = [
            'cat_list'=>$result,
            'Display'=>1,
        ];
        $this->jsonReturn($data);
    }
	
	//添加或编辑分类（两学一做）
	public function create_or_modifyAction(){
		$post = I('post.');
		$post['cat_type'] = Status::CatTypeLxyz;
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
	
	//添加或编辑分类（党建专题）
	public function create_or_modify_specialAction(){
		$post = I('post.');
		$post['cat_type'] = Status::CatTypeDjzt;
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

	//添加或编辑学堂分类
	public function editStudyAction(){
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
	
	//状态开关
	public function switchStatusAction(){
		$post = I('post.');
		$params = array(
				'ref_id'=>$post['ref_id'],
				'branch_id'=>$post['branch_id'],
				'region_code'=>$post['region_code'],
		);
		try {
			$result = $this->categoryService()->switchStatus($params);
			$data = array(
					'Message'=>'操作成功',
					'CatStatus'=>$result['status'],
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

	// 两学一做文章列表
	public function articleAction(){
		$post = I('post.');
		$map = array(
				'branch_id'=>$post['branch_id'],
				'cat_type'=>Status::CatTypeLxyz,
                'region_code'=>$post['region_code'],
        );
		$result = $this->articleService()->getPagerList($map);
		$data = [
			'List'=>$result['list'],
			'Count'=>$result['count'],
			'Page'=>$result['page'],
			'PageSize'=>$result['pagesize'],
			'Display'=>2,
		];
		$this->jsonReturn($data);
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}
	
	private function articleService() {
		return D('Article', 'Service');
	}
}