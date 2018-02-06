<?php
namespace Home\Controller;
use Common\Basic\Status;

class ArticleController extends FController {
	protected function apiSetCheck(){
		$this->loginck = Status::NO;
	}
	
	//文章列表
	public function indexAction(){
		$post = I('post.');
		//当前分类
		$cat_id = intval($post['cat_id']);
        $cat_info = $this->categoryService()->getInfo($cat_id);
        //文章列表
		$params = array(
				'keyword'=>$post['keyword'],
				'cat_id'=>$post['cat_id'],
				// 'is_hot'=>$post['is_hot'],
				'status'=>Status::YES,
				'page'=>$post['page'],
				'pagesize'=>$post['pagesize'],

		);
		if ($cat_info['cat_type'] == Status::CatTypeLxyz) { //两学一做
			$result = $this->articleService()->getPagerList($params);
		} elseif ($cat_info['cat_type'] == Status::CatTypeDjzt) { //党建专题
			$result = $this->specialService()->getPagerList($params);
		}

		$list = [];
		if($result)
		{
			foreach ($result['list'] as $v) {
				$list[] = array(
						'Id'          =>$v['id'],
						'Title'       =>$v['title'],
						'Refer'       =>$v['refer'],
						'Desc'        =>$v['desc'],
						'CatId'       =>$v['cat_id'],
						'CatName'     =>$v['cat_name'],
						'CatType'     =>$cat_info['cat_type'],
						'CatTypeName' =>Status::$catTypeList[$cat_info['cat_type']],
						'IsHot'       =>$v['is_hot'],
						'Images'      =>$v['images'],
						'ShowTime'    =>date('Y-m-d', $v['show_time']),
						'ReadNum'     =>$v['read_num'],
						'CollectNum'  =>$v['collect_num'],
				);
			}
		}
		$data = [
			'CatName'  =>$cat_info['cat_name'],
			'List'     =>$list,
			'Count'    =>$result['count'],
			'Page'     =>$result['page'],
			'PageSize' =>$result['pagesize'],
		];
		$this->jsonReturn($data);
	}
	
	//文章详情
	public function infoAction(){
		$post = I('post.');
		switch ($post['cat_type']) {
			case Status::CatTypeLxyz: //两学一做
				$map = array(
						'id'=>$post['id'],
						'branch_id'=>$post['branch_id'],
				);
				$result = $this->articleService()->findInfo($map);

                $result['video_id'] && $videos[$post['id']] = Service('Vod')->getMezzanineInfo($result['video_id'])['Mezzanine']['FileURL'];
                $info = array(
						'Id'         =>$post['id'],
						'Title'      =>$result['title'],
						'Refer'      =>$result['refer'],
						'Desc'       =>$result['desc'],
						'Detail'     =>$result['detail'],
						'CatId'      =>$result['cat_id'],
						'CatName'    =>$result['cat_name'],
						'CatType'    =>$post['cat_type'],
						'CatName'    =>Status::$catTypeList[$post['cat_type']],
						'IsHot'      =>$result['is_hot'],
						'Images'     =>$result['images'],
						'ShowTime'   =>date('Y-m-d', ($result['show_time']==0)?$result['add_time']:$result['show_time']),
						'ReadNum'    =>$result['read_num']++,
						'CollectNum' =>$result['collect_num'],
                        'Video'      => is_null($videos[$post['id']]) ? '' : '<video controls="controls" src="'.$videos[$post['id']].'"></video>',
                );
				//统计阅读数
				$params = [
					'id'=>$post['id'],
					'user_id'=>$post['user_id'],
				];
				// dump($result);
				// exit;
				$result = $this->articleService()->increaseReadNum($params);
				//收藏状态
				$map = [
					'user_id'=>$post['user_id'],
					'collection_type'=>Status::CollectTypeLxyz,
					'content_id'=>$info['Id'],
				];
				$collect_info = M('collection')->where($map)->find();

                //查询该文章是否已经学习过 如果学习过则返回相应的 状态码 1=未开始 2=开始中 3=已结束
                $studywhere = [
                    'id'=>$post['id'],
                    'user_id'=>$post['user_id'],
                    'type'=>Status::CollectTypeLxyz,
                ];
                $studystatus = getStudyStatus($studywhere);
			break;
			case Status::CatTypeDjzt: //党建专题
				$map = array(
						'id'=>$post['id'],
						'branch_id'=>$post['branch_id'],
				);
                $result = $this->specialService()->findInfo($map);
                $result['video_id'] && $videos[$post['id']] = Service('Vod')->getMezzanineInfo($result['video_id'])['Mezzanine']['FileURL'];
                $info = array(
						'Id'         =>$post['id'],
						'Title'      =>$result['title'],
						'Refer'      =>$result['refer'],
						'Desc'       =>$result['desc'],
						'Detail'     =>$result['detail'],
						'CatId'      =>$result['cat_id'],
						'CatName'    =>$result['cat_name'],
						'CatType'    =>$post['cat_type'],
						'CatName'    =>Status::$catTypeList[$post['cat_type']],
						'IsHot'      =>$result['is_hot'],
						'Images'     =>$result['images'],
						'ShowTime'   =>date('Y-m-d', ($result['show_time']==0)?$result['add_time']:$result['show_time']),
						'ReadNum'    =>$result['read_num']++,
						'CollectNum' =>$result['collect_num'],
                        'Video'      => is_null($videos[$post['id']]) ? '' : '<video controls="controls" src="'.$videos[$post['id']].'"></video>',

                );
				//统计阅读数
				$params = [
					'id'=>$post['id'],
					'user_id'=>$post['user_id'],
				];
				$result = $this->specialService()->increaseReadNum($params);
				// dump($result);
				//收藏状态
				$map = [
					'user_id'=>$post['user_id'],
					'collection_type'=>Status::CollectTypeSpecial,
					'content_id'=>$info['Id'],
				];
				$collect_info = M('collection')->where($map)->find();

                //查询该文章是否已经学习过 如果学习过则返回相应的 状态码 1=未开始 2=开始中 3=已结束
                $studywhere = [
                    'id'=>$post['id'],
                    'user_id'=>$post['user_id'],
                    'type'=>Status::CollectTypeSpecial,
                ];
                $studystatus = getStudyStatus($studywhere);
			break;
		}

		$data = [
			'Info'=>$info,
			'IsCollect'=>$collect_info ? Status::YES : Status::None,
            'StudyStatus'=>$studystatus['status'],
            'Node'=>$studystatus['node'],
            'OptionId'=>$studystatus['option_id'],

        ];
		$this->jsonReturn($data);
	}
	
	private function articleService() {
		return D('Article', 'Service');
	}
	
	private function specialService() {
		return D('Special', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}

}