<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class PhotoController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
	
	//读书列表
	public function photo_listAction(){
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
            $top = $this->gettop(Status::CatTypeAlbum);
            if(is_null($top)) $top = [0];

            if($post['is_hot'] == Status::YES)
            {
                $params['id'] = ['in',$top];
            }else{
                $params['id'] = ['not in',$top];
            }
		}
		//查询列表
		$result = $this->ReadService()->getPagerList($params);
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
            $top  = $this->topInfo()->getRecord(['top_type'=>Status::CatTypeAlbum,'content_id'=>$tops]);
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
        $result = $this->ReadService()->getWhPagerList($params);
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
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CatTypeAlbum,'content_id'=>$tops]);
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

    //分类列表 启用时的分类 和 编辑新增选择的分类
	public function categoryAction(){
        $post = I('post.');
        $map = array(
				'branch_id'=>$post['branch_id'],
				'cat_type'=>Status::CatTypeAlbum,
				'status'=>Status::YES,
                'region_code'=>$post['region_code'],
        );
        $result = $this->categoryService()->getAvailableList($map);
        $data = [
			'cat_list'=>$result,
		];
		$this->jsonReturn($data);
	}

//
//	public function infoAction(){
//		$post = I('post.');
//		$map = array(
//				'id'=>$post['id'],
//				'branch_id'=>$post['branch_id'],
//		);
//		$result = $this->articleService()->findInfo($map);
//		$data = [
//			'info'=>$result,
//		];
//		$this->jsonReturn($data);
//	}
	
	public function create_or_modifyAction(){
		$post = I('post.');
		try {
			$result = $this->ReadService()->createOrModify($post);
			if($post['id']){
				$id = $post['id'];
			}else{
				$id = $result;
			}
            $where = [
				'top_type'=>Status::CatTypeAlbum,
				'content_id'=>$id,
				'top'=>intval($post['is_hot']),
			];
            //修改推荐状态
            $change = $this->changetop($where);
            $data = array(
					'Message'=>is_null($post['id']) ? '添加成功' : '修改成功',
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
			$result  = $this->ReadService()->switchStatus($params);
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
			'top_type'=>Status::CatTypeAlbum,
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
			$result = $this->ReadService()->delete($params);
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
	
	private function ReadService() {
		return D('Photo', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}

    private function VodService() {
        return D('Vod', 'Service');
    }

}