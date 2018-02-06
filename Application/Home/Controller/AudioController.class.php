<?php
namespace Home\Controller;

use Common\Basic\Status;

class AudioController extends FController {
    protected function apiSetCheck(){
        $this->loginck = Status::NO;
    }
	
	//音频列表
	public function audio_listAction(){
		$post = I('post.');
		$params = array(
				'keyword'   =>$post['keyword'],
				'status'    =>Status::YES,
				'page'      =>$post['page'],
				'pagesize'  =>$post['pagesize'],
		);
		//获取所有上级分类的文章（查询条件）
        $region_list = join(',',getParentRegionCode($post['region_code']));
        $params['_string'] = "(branch_id = ".$post['branch_id'] .") or (branch_id = 0 && region_code in (".$region_list."))";

        if($post['cat_id']) $params['cat_id'] = $post['cat_id'];
        //查询列表
		$result = $this->AudioService()->getPagerList($params);
        $newlist = [];
		if($result['list'] != [])
		{
            foreach($result['list'] as $key => $va)
            {
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
                $newlist[$key]['CatName'] = $va['cat_name'];
                $newlist[$key]['StatusLabel'] = $va["status_label"];
                $newlist[$key]['Type'] = $va["type"];
                $newlist[$key]['AudioUrl'] = $va['audio_url'];
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



    //分类列表 启用时的分类 和 编辑新增选择的分类
	public function categoryAction(){
        $post = I('post.');
        $map = array(
				'branch_id'=>$post['branch_id'],
				'cat_type'=>Status::CatTypeAudio,
				'status'=>Status::YES,
                 'region_code'=>$post['region_code'],
        );
        $result = $this->categoryService()->getAvailableList($map);
        $data = [
			'cat_list'=>$result,
		];
		$this->jsonReturn($data);
	}
	
	public function create_or_modifyAction(){
		$post = I('post.');
		try {
			$result = $this->AudioService()->createOrModify($post);
			if($post['id']){
				$id = $post['id'];
			}else{
				$id = $result;
			}
            $where = [
				'top_type'=>Status::CatTypeAudio,
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

    //音频详情
    public function infoAction(){
        $post = I('post.');
        if(!$post['id']) throw new CsException('参数为空',400);
        $map = array(
            'id'=>$post['id'],
            'cat_id'=>$post['cat_id'],
            'branch_id'=>$post['branch_id'],
        );
        $result = $this->AudioService()->findInfo($map);
        if($result)
        {
            $result['Audio'] = is_null($result['AudioUrl']) ? '' : '<audio controls="controls" src="'.$result['AudioUrl'].'"></audio>';
            //统计阅读数
            $params = [
                'id'=>$post['id'],
                'user_id'=>$post['user_id'],
            ];
            $this->AudioService()->increaseReadNum($params);
            //收藏状态
            $map = [
                'user_id'=>$post['user_id'],
                'collection_type'=>Status::CollectTypeAudio,
                'content_id'=>$post['id'],
            ];
            $collect_info = M('collection')->where($map)->find();
        }else{
            throw new CsException('暂无该视频');
        }
        //查询该文章是否已经学习过 如果学习过则返回相应的 状态码 1=未开始 2=开始中 3=已结束
        $studywhere = [
            'id'=>$post['id'],
            'user_id'=>$post['user_id'],
            'type'=>Status::CollectTypeAudio,
        ];
        $studystatus = getStudyStatus($studywhere);

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
			$result = $this->AudioService()->delete($params);
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
	
	private function AudioService() {
		return D('Audio', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}

    private function VodService() {
        return D('Vod', 'Service');
    }

}