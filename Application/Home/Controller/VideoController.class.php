<?php
namespace Home\Controller;

use Common\Basic\CsException;
use Common\Basic\Status;

class VideoController extends FController {
	protected function apiSetCheck(){
        $this->loginck = Status::NO;
    }
	
	//视频列表
	public function video_listAction(){
		$post = I('post.');
		$params = array(
				'keyword'   =>$post['keyword'],
				'status'    =>Status::YES,
				'page'      =>$post['page'],
				'pagesize'  =>$post['pagesize'],
		);
        //获取所有上级分类的文章（查询条件）
        $params['_string'] = get_string();

		if($post['cat_id']) $params['cat_id'] = $post['cat_id'];
		//查询列表
		$result = $this->videoService()->getPagerList($params);
		$newlist = [];
		if($result['list'] != [])
		{
            foreach($result['list'] as $key => $va)
            {
                $newlist[$key]['Video'] = $this->VodService()->getPlayInfo($va['video_id'])['PlayInfoList']['PlayInfo'][0]['PlayURL'];
                $newlist[$key]['Video'] = [$newlist[$key]['Video']];
                $newlist[$key]['VideoId'] = $va['VideoId'];

                $newlist[$key]['Id'] = $va["id"];
                $newlist[$key]['Title'] = $va["title"];
                $newlist[$key]['Desc'] = $va["desc"];
                $newlist[$key]['CatId'] = $va["cat_id"];
                $newlist[$key]['Detail'] = $va["detail"];
                $newlist[$key]['Sort'] = $va["sort"];
                $newlist[$key]['Image'] = $va["image"];
                $newlist[$key]['Status'] = $va["status"];
                $newlist[$key]['AddTime'] = $va["add_time"];
                $newlist[$key]['ReadNum'] = $va["read_num"];
                $newlist[$key]['CollectNum'] = $va["collect_num"];
                $newlist[$key]['ForwardNum'] = $va["forward_num"];
                $newlist[$key]['BranchId'] = $va["branch_id"];
                $newlist[$key]['CatName'] = $va["cat_name"];
                $newlist[$key]['StatusLabel'] = $va["status_label"];
                $newlist[$key]['Type'] = $va["type"];
            }
        }
		$data = [
			'List'=>$newlist,
			'Count'=>$result['count'],
			'Page'=>$result['page'],
			'PageSize'=>$result['pagesize'],
		];
		$this->jsonReturn($data);
	}

    //视频详情
	public function infoAction(){
		$post = I('post.');
		if(!$post['id']) throw new CsException('参数为空',400);
		$map = array(
				'id'=>$post['id'],
				'cat_id'=>$post['cat_id'],
				'branch_id'=>$post['branch_id'],
		);
        $result = $this->videoService()->findInfo($map);
        if($result)
        {
            //查询该文章是否已经学习过 如果学习过则返回相应的 状态码 1=未开始 2=开始中 3=已结束
            $studywhere = [
                'id'=>$post['id'],
                'user_id'=>$post['user_id'],
                'type'=>Status::CollectTypeVideo,
            ];
            $studystatus = getStudyStatus($studywhere);
            //通过视频ID找到视频链接
            if($result['VideoId'])
            {
                $videos = $this->VodService()->getPlayInfo($result['VideoId'])['PlayInfoList']['PlayInfo'][0]['PlayURL'];
                $result['Video'] = is_null($videos) ? '' : '<video controls="controls" src="'.$videos.'"></video>';
            }else{
                $result['Video'] = '';
            }
            //统计阅读数
            $params = [
                'id'=>$post['id'],
                'user_id'=>$post['user_id'],
            ];
            $this->videoService()->increaseReadNum($params);
            //收藏状态
            $map = [
                'user_id'=>$post['user_id'],
                'collection_type'=>Status::CollectTypeVideo,
                'content_id'=>$post['id'],
            ];
            $collect_info = M('collection')->where($map)->find();
        }else{
            throw new CsException('暂无该视频');
        }
        $data = [
			'Info'=>$result,
            'IsCollect'=>$collect_info ? Status::YES : Status::None,
            'StudyStatus'=>$studystatus['status'],
            'Node'=>$studystatus['node'],
            'OptionId'=>$studystatus['option_id'],
        ];
		$this->jsonReturn($data);
	}

	
	//删除
	public function delAction(){
		$post = I('post.');
		$params = array(
				'id'=>$post['id'],
				'branch_id'=>$post['branch_id'],
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