<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class ArticleController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
	
	//自定义文章
	public function indexAction(){
		$post = I('post.');
		$params = array(
				'branch_id' =>$post['branch_id'],
				'keyword'   =>$post['keyword'],
				'cat_id'    =>$post['cat_id'],
				'status'    =>$post['status'],
				'is_hot'    =>$post['is_hot'],
				'map'       =>$map,
				'page'      =>$post['page'],
				'pagesize'  =>$post['pagesize'],
                'region_code'=>$post['region_code'],
        );
		//搜索条件 是否推荐
		if(isset($post['is_hot']) && !empty($post['is_hot']))
		{
            //获取所有推荐的ID
            $top = $this->gettop(Status::CollectTypeLxyz);
            if(is_null($top)) $top = [0];

            if($post['is_hot'] == Status::YES)
            {
                $params['id'] = ['in',$top];
            }else{
                $params['id'] = ['not in',$top];
            }
		}
		$result = $this->articleService()->getPagerList($params);
		$newlist = [];
		if($result['list'] != [])
		{
			foreach($result['list'] as $k=>$v)
			{
				$newlist[$k] = $v;
				//推荐条件
				$tops[$v['id']] = $v['id'];
			}
			//判断推荐
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeLxyz,'content_id'=>$tops]);
			foreach($newlist as $key => $va)
			{
				//判断推荐
				$newlist[$key]['is_hot'] = (!is_null($top[$va['id']])) ? Status::YES : Status::NO ;
			}
		}


		$data = [
			'List'=>$newlist,
			'Count'=>$result['count'],
			'Page'=>$result['page'],
			'PageSize'=>$result['pagesize'],
			'Display'=>2,
		];
		$this->jsonReturn($data);
	}
	
	//官方文章
	public function whAction(){
		$post = I('post.');
		$params = array(
				'branch_id' =>$post['branch_id'],
				'keyword'   =>$post['keyword'],
				'cat_id'    =>$post['cat_id'],
				'status'    =>$post['status'],
				'is_hot'    =>$post['is_hot'],
				'page'      =>$post['page'],
				'pagesize'  =>$post['pagesize'],
                'region_code'=>$post['region_code'],
        );
		$result = $this->articleService()->getWhPagerList($params);
		// print_r($result);
		$newlist = [];
		if($result['list'] != [])
		{
			foreach($result['list'] as $k=>$v)
			{
				$newlist[$k] = $v;
				//推荐条件
				$tops[$v['id']] = $v['id'];
			}
			//判断推荐
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeLxyz,'content_id'=>$tops]);
                foreach($newlist as $key => $va)
			{
				//判断推荐
				$newlist[$key]['is_hot'] = (!is_null($top[$va['id']])) ? Status::YES : Status::NO ;
			}
		}

		$data = [
			'List'     =>$newlist,
			'Count'    =>$result['count'],
			'Page'     =>$result['page'],
			'PageSize' =>$result['pagesize'],
			'Display'  =>2,
		];
		$this->jsonReturn($data);
	}
	
	public function categoryAction(){
		$post = I('post.');
		$map = array(
				'branch_id'=>$post['branch_id'],
				'cat_type'=>Status::CatTypeLxyz,
				'status'=>Status::YES,
		);
		$result = $this->categoryService()->getAvailableList($map);
		$data = [
			'cat_list'=>$result,
		];
		$this->jsonReturn($data);
	}
	
	public function specialAction(){
		$post = I('post.');
		$map = array(
				'branch_id'=>$post['branch_id'],
				'cat_type'=>Status::CatTypeDjzt,
				'status'=>Status::YES,
		);
		$result = $this->categoryService()->getAvailableList($map);
		$data = [
			'cat_list'=>$result,
		];
		$this->jsonReturn($data);
	}
	
	public function infoAction(){
		$post = I('post.');
		$map = array(
				'id'=>$post['id'],
				'branch_id'=>$post['branch_id'],
		);
		$result = $this->articleService()->findInfo($map);
		$data = [
			'info'=>$result,
		];
		$this->jsonReturn($data);
	}
	
	public function create_or_modifyAction(){
		$post = I('post.');
		try {
			$result = $this->articleService()->createOrModify($post);
			if($post['id']){
				$id = $post['id'];
			}else{
				$id = $result;
			}
			$where = [
				'top_type'=>Status::CollectTypeLxyz,
				'content_id'=>$id,
				'top'=>intval($post['is_hot']),
			];
			//修改推荐状态
			$change = $this->changetop($where);
			$data = array(
					'Message'=>$post['id'] ? '修改成功' : '添加成功',
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
            'id'=>$post['id'],
            'branch_id'=>$post['branch_id'],
            'type'=>$post['type'],
            'cat_id'=>$post['cat_id'],
            'ref_id'=>$post['ref_id'],
            'region_code'=>$post['region_code'],
        );
		try {
			$result  = $this->articleService()->switchStatus($params);
			$data = array(
					'Message'=>'操作成功',
					'ArticleStatus'=>$result['status'],
			);
		} catch (\Exception $e) {
			$data = array(
					'Message'=>$e->getMessage(),
					'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}

	//推荐开关
	public function switchHotAction(){
		$post = I('post.');
		// $params = array(
		// 		'id'=>$post['id'],
		// 		'branch_id'=>$post['branch_id'],
		// 		'type'=>$post['type'],
		// );
		$arr = [
			'content_id'=>$post['id'],
			'top_type'=>Status::CollectTypeLxyz,
		];
		$this->changetop($arr);
		// try {
		// 	$result = $this->articleService()->switchHot($params);
		// 	$data = array(
		// 			'Message'=>'操作成功',
		// 			'IsHot'=>$result['is_hot'],
		// 	);
		// } catch (\Exception $e) {
		// 	$data = array(
		// 			'Message'=>$e->getMessage(),
		// 			'Error'=>$e->getCode(),
		// 	);
		// }
		// $this->jsonReturn($data);
	}
	
	//删除
	public function delAction(){
		$post = I('post.');
		$params = array(
				'id'=>$post['id'],
				'branch_id'=>$post['branch_id'],
		);
		try {
			$result = $this->articleService()->delete($params);
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
	
	private function articleService() {
		return D('Article', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}
}