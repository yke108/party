<?php
namespace Home\Controller;
use Common\Basic\Status;

class CategoryController extends FController {
	protected function apiSetCheck(){
		$this->loginck = Status::NO;
	}

	public function indexAction(){
		$post = I('post.');
		$region_list = join(',',getParentRegionCode($post['region_code']));
		if(!$region_list) $region_list = 0;
		//两学一做
		$map = array(
				'status'=>Status::YES,
				'cat_type'=>Status::CatTypeLxyz,
		);
        $map['_string'] = "(branch_id = ".$post['branch_id'] .") or (branch_id = 0 && region_code in (".$region_list."))";
        $list = $this->categoryService()->getAvailableList($map);
		$lxyz = [];
		foreach ($list as $v) {
			$lxyz[] = array(
					'CatId'=>$v['cat_id'],
					'Icon'=>$v['icon'],
					'CatName'=>$v['cat_name'],
					'Desc'=>$v['desc'],
			);
		}
		//党建专题
		$map = array(
				'status'=>Status::YES,
				'cat_type'=>Status::CatTypeDjzt,
		);
        $map['_string'] = "(branch_id = ".$post['branch_id'] .") or (branch_id = 0 && region_code in (".$region_list."))";
        $list = $this->categoryService()->getAvailableList($map);
		$special = [];
		foreach ($list as $v) {
			$special[] = array(
					'CatId'=>$v['cat_id'],
					'Icon'=>$v['icon'],
					'CatName'=>$v['cat_name'],
					'Desc'=>$v['desc'],
			);
		}
//        //视频分类
//        $map = array(
//            'branch_id'=>$post['branch_id'],
//            'status'=>Status::YES,
//            'cat_type'=>Status::CatTypeVideo,
//        );
//        $list = $this->categoryService()->getAvailableList($map);
//        $video = [];
//        foreach ($list as $v) {
//            $video[] = array(
//                'CatId'=>$v['cat_id'],
//                'Icon'=>$v['icon_url'],
//                'CatName'=>$v['cat_name'],
//                'Desc'=>$v['desc'],
//            );
//        }
		$data = [
			'Lxyz'=>$lxyz,
			'Special'=>$special,
//            'Video'=>$video,
		];
		$this->jsonReturn($data);
	}
	
	public function infoAction(){
		$post = I('post.');
		$map = array(
				'cat_id'=>$post['cat_id'],
				'branch_id'=>$post['branch_id'],
		);
		$result = $this->categoryService()->findInfo($map);
		$info = array(
				'CatId'=>$result['cat_id'],
				'Icon'=>$result['icon_url'],
				'CatName'=>$result['cat_name'],
				'Desc'=>$result['desc'],
		);
		$data = [
			'Info'=>$info,
		];
		$this->jsonReturn($data);
	}

	public function cat_listAction(){
	    $post = I('post.');
        $map = array(
            'cat_type'=>$post['cat_type'],
            'branch_id'=>$post['branch_id'],
        );
        $result = $this->categoryService()->getlist($map);
        $list = [];
        if($result)
        {
            foreach($result as $k=>$v)
            {
                $list[$k]['CatId'] = $v['cat_id'];
                $list[$k]['CatName'] = $v['cat_name'];
                $list[$k]['Desc'] = $v['desc'];
                $list[$k]['Icon'] = $v['icon'];
            }
        }
        $data = [
            'List'=>array_values($list),
        ];
        $this->jsonReturn($data);
    }
	
	private function categoryService() {
		return D('Category', 'Service');
	}
}