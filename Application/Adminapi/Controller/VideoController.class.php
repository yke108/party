<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class VideoController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
	
	//视频列表
	public function video_listAction(){
		$post = I('post.');
		//判断是否首页进入列表
//		if($post['home'] != Status::YES)
//		{
//			$map['ref_id'] = Status::None;
//		}
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
            $top = $this->gettop(Status::CatTypeVideo);
            if(is_null($top)) $top = [0];

            if($post['is_hot'] == Status::YES)
            {
                $params['id'] = ['in',$top];
            }else{
                $params['id'] = ['not in',$top];
            }
		}
		//查询列表
		$result = $this->videoService()->getPagerList($params);
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
            $top  = $this->topInfo()->getRecord(['top_type'=>Status::CatTypeVideo,'content_id'=>$tops]);
            foreach($newlist as $key => $va)
            {
                //判断推荐
                $newlist[$key]['is_hot'] = (!is_null($top[$va['id']])) ? Status::YES : Status::NO ;
                $newlist[$key]['video'] = $this->VodService()->getPlayInfo($va['video_id'])['PlayInfoList']['PlayInfo'][0]['PlayURL'];
                $newlist[$key]['video'] = [$newlist[$key]['video']];
                $newlist[$key]['video_id'] = $va['video_id'];
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
        $result = $this->videoService()->getWhPagerList($params);
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
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CatTypeVideo,'content_id'=>$tops]);
			foreach($newlist as $key => $va)
			{
				//判断推荐
				$newlist[$key]['is_hot'] = (!is_null($top[$va['id']])) ? Status::YES : Status::NO ;
                $newlist[$key]['video'] = $this->VodService()->getPlayInfo($va['video_id'])['PlayInfoList']['PlayInfo'][0]['PlayURL'];
                $newlist[$key]['video'] = [$newlist[$key]['video']];
                $newlist[$key]['video_id'] = $va['video_id'];

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
				'cat_type'=>Status::CatTypeVideo,
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
			$result = $this->videoService()->createOrModify($post);
			if($post['id']){
				$id = $post['id'];
			}else{
				$id = $result;
			}
            $where = [
				'top_type'=>Status::CatTypeVideo,
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
			$result  = $this->videoService()->switchStatus($params);
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
			'top_type'=>Status::CatTypeVideo,
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
                'is_delete' =>Status::None,
        );
		try {
			$result = $this->videoService()->delete($params);
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
	
	private function videoService() {
		return D('Video', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}

    private function VodService() {
        return D('Vod', 'Service');
    }

}