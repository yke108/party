<?php
namespace Home\Controller;
use Common\Basic\Status;

class SpecialController extends FController {
	protected function apiSetCheck(){
		$this->loginck = Status::NO;
	}
	
	public function indexAction(){
		$post = I('post.');
		$params = array(
				'keyword'=>$post['keyword'],
				'cat_id'=>$post['cat_id'],
				// 'is_hot'=>$post['is_hot'],
				'status'=>Status::YES,
				'page'=>$post['page'],
				'pagesize'=>$post['pagesize'],
		);
		$result = $this->specialService()->getPagerList($params);
		$cat_list = [];
		foreach ($result['list'] as $v) {
			$cat_list[] = array(
					'Id'=>$v['id'],
					'Title'=>$v['title'],
					'Refer'=>$v['refer'],
					'Desc'=>$v['desc'],
					'CatId'=>$v['cat_id'],
					'CatName'=>$v['cat_name'],
					'IsHot'=>$v['is_hot'],
					'Images'=>$v['images'],
					'ShowTime'=>date('Y-m-d H:i:s', $v['show_time']),
					'ReadNum'=>$v['read_num'],
					'CollectNum'=>$v['collect_num'],
			);
		}
		$cat = current($cat_list);
		$data = [
			'CatName'=>$cat['cat_name'],
			'List'=>$cat_list,
			'Count'=>$result['count'],
			'Page'=>$result['page'],
			'PageSize'=>$result['pagesize'],
		];
		$this->jsonReturn($data);
	}
	
	public function infoAction(){
		$post = I('post.');
		$map = array(
				'id'=>$post['id'],
				'branch_id'=>$post['branch_id'],
		);
		$result = $this->specialService()->findInfo($map);
		$info = array(
				'Id'=>$result['id'],
				'Title'=>$result['title'],
				'Refer'=>$result['refer'],
				'Desc'=>$result['desc'],
				'Detail'=>$result['detail'],
				'CatId'=>$result['cat_id'],
				'CatName'=>$result['cat_name'],
				'IsHot'=>$result['is_hot'],
				'Images'=>$result['images'],
				'ShowTime'=>date('Y-m-d H:i:s', $result['show_time']),
				'ReadNum'=>$result['read_num']++,
				'CollectNum'=>$result['collect_num'],
		);
		//统计阅读数
		$result = $this->specialService()->increaseReadNum($info['Id']);
		//收藏状态
		$map = [
			'user_id'=>$post['user_id'],
			'collection_type'=>102,
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
		$data = [
			'Info'=>$info,
			'IsCollect'=>$collect_info ? Status::YES : Status::None,
            'StudyStatus'=>$studystatus['status'],
            'Node'=>$studystatus['node'],
            'OptionId'=>$studystatus['option_id'],
        ];
		$this->jsonReturn($data);
	}
	
	private function specialService() {
		return D('Special', 'Service');
	}
}