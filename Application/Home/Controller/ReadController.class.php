<?php
namespace Home\Controller;

use Common\Basic\Status;

class ReadController extends FController {
    protected function apiSetCheck(){
        $this->loginck = Status::NO;
    }
	
	//读书列表
	public function read_listAction(){
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
        $result = $this->ReadService()->getPagerList($params);
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
                $newlist[$key]['CatName'] = $va["cat_name"];
                $newlist[$key]['StatusLabel'] = $va["status_label"];
                $newlist[$key]['Type'] = $va["type"];
                $newlist[$key]['JumpUrl'] = $va['jump_url'];
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

    //读书详情
    public function infoAction(){
        $post = I('post.');
        if(!$post['id']) throw new CsException('参数为空',400);
        $map = array(
            'id'=>$post['id'],
            'cat_id'=>$post['cat_id'],
            'branch_id'=>$post['branch_id'],
        );
        $result = $this->ReadService()->findInfo($map);
        if($result)
        {
            //统计阅读数
            $params = [
                'id'=>$post['id'],
                'user_id'=>$post['user_id'],
            ];
            $this->ReadService()->increaseReadNum($params);
            //收藏状态
            $map = [
                'user_id'=>$post['user_id'],
                'collection_type'=>Status::CollectTypeRead,
                'content_id'=>$post['id'],
            ];
            $collect_info = M('collection')->where($map)->find();

        }else{
            throw new CsException('文章不存在');
        }
        //查询该文章是否已经学习过 如果学习过则返回相应的 状态码 1=未开始 2=开始中 3=已结束
        $studywhere = [
            'id'=>$post['id'],
            'user_id'=>$post['user_id'],
            'type'=>Status::CollectTypeRead,
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
		return D('Read', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}

    private function VodService() {
        return D('Vod', 'Service');
    }

}