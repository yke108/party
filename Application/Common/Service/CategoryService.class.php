<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class CategoryService{
	public function getInfo($cat_id){
		if ($cat_id < 1) return false;
		$info = $this->categoryDao()->getRecord($cat_id);
		if (empty($info)) {
			throw new CsException('分类不存在', CodeConst::DataNotExist);
		}
		return $this->outputForInfo($info);
	}
	
	public function findInfo($map){
		$info = $this->categoryDao()->findRecord($map);
		if (empty($info)) {
			throw new CsException('分类不存在', CodeConst::DataNotExist);
		}
		return $this->outputForInfo($info);
	}
	
	public function createOrModify($params){
		if ($params['ref_id'] > 0) { //引用
			if ($params['cat_id'] > 0) { //编辑
				$map = array(
						'cat_id'=>intval($params['cat_id']),
						'branch_id'=>$params['branch_id'],
						'region_code'=>$params['region_code'],
				);
				$cat_info = $this->categoryDao()->findRecord($map);
				if (empty($cat_info)) {
					throw new CsException('分类不存在', CodeConst::DataNotExist);
				}
				
				$map = array(
						'cat_id'=>$cat_info['cat_id'],
				);
				$data = array(
						'status'=>intval($params['status']),
				);
				$result = $this->categoryDao()->where($map)->save($data);
			} else { //添加
				$cat_wh = $this->categoryWhDao()->getRecord($params['ref_id']);
				if (empty($cat_wh)) {
					throw new CsException('官方分类不存在', CodeConst::DataNotExist);
				}
				
				$data = array(
						'branch_id'=>$params['branch_id'],
						'ref_id'=>$cat_wh['cat_id'],
						'cat_type'=>$cat_wh['cat_type'],
						'cat_name'=>$cat_wh['cat_name'],
						'desc'=>$cat_wh['desc'],
						'icon'=>$cat_wh['icon'],
						'cat_key'=>$cat_wh['cat_key'],
						'status'=>$params['status'],
						'add_time'=>NOW_TIME,
						'region_code'=>$params['region_code'],
				);
				$result = $this->categoryDao()->addRecord($data);
			}
			if ($result === false) {
				throw new CsException('系统错误', CodeConst::SystemError);
			}
		} else { //自定义
			//接收到的参数
			$data = array(
					'branch_id'=>$params['branch_id'],
					'cat_name'=>trim($params['cat_name']),
					'desc'=>trim($params['desc']),
					'icon'=>trim($params['icon']),
					'cat_key'=>trim($params['cat_key']),
					'cat_type'=>$params['cat_type'],
					'sort'=>intval($params['sort']),
					'status'=>intval($params['status']),
					'region_code'=>$params['region_code'],
			);
			if ($params['cat_id']) {
				$data['cat_id'] = $params['cat_id'];
			}
			if (!$this->categoryDao()->create($data)){
				throw new CsException($this->categoryDao()->getError(), CodeConst::ParamsError);
			}
			if ($params['cat_id'] > 0){
				$result = $this->categoryDao()->save();
				if ($result === false){
					throw new CsException('修改失败', CodeConst::SystemError);
				}
				$cat_id = $params['cat_id'];
			} else {
				$cat_id = $this->categoryDao()->add();
				if ($cat_id < 1){
					throw new CsException('添加失败', CodeConst::SystemError);
				}
			}
		}
	}
	
	public function delete($params){
		$map = array(
				'cat_id'=>$params['cat_id'],
				'branch_id'=>$params['branch_id'],
				'region_code'=>$params['region_code'],
				'is_delete'=>Status::NO,
		);
		$info = $this->categoryDao()->findRecord($map);
		if (empty($info)) {
			throw new CsException('分类不存在', CodeConst::DataNotExist);
		}
		if ($this->categoryDao()->delRecord($info['cat_id']) === false) {
			throw new CsException('删除失败', CodeConst::SystemError);
		}
	}

	//修改状态
	public function switchStatus($params){
		$map = array(
				'ref_id'=>$params['ref_id'],
				'branch_id'=>$params['branch_id'],
				'region_code'=>$params['region_code'],
		);
		$info = $this->categoryDao()->findRecord($map);
		if (empty($info)) { //添加
			$cat_wh = $this->categoryWhDao()->getRecord($params['ref_id']);
			if (empty($cat_wh)) {
				throw new CsException('官方分类不存在', CodeConst::DataNotExist);
			}
			
			$data = array(
                'branch_id'=>$params['branch_id'],
                'region_code'=>$params['region_code'],
                'ref_id'=>$cat_wh['cat_id'],
                'cat_type'=>$cat_wh['cat_type'],
                'cat_name'=>$cat_wh['cat_name'],
                'desc'=>$cat_wh['desc'],
                'icon'=>$cat_wh['icon'],
                'cat_key'=>$cat_wh['cat_key'],
                'status'=>Status::YES,
                'add_time'=>NOW_TIME,
			);
			$result = $this->categoryDao()->addRecord($data);
		} else { //编辑
			$data = array(
					'cat_id'=>$info['cat_id'],
					'status'=>($info['status'] == Status::YES) ? Status::NO : Status::YES,
			);
			$result = $this->categoryDao()->saveRecord($data);
		}
		if ($result === false) {
			throw new CsException('系统错误', CodeConst::SystemError);
		}
		return array(
				'status'=>$data['status'],
		);
	}
	//获取分类列表
	public function getPagerList($params){
		$params['page'] < 1 && $params['page'] = 1;
		$params['pagesize'] < 1 && $params['pagesize'] = 20;
		
		$map = $params['map'] ? $params['map'] : array();
		if ($params['branch_id']) {
			$map['branch_id'] = $params['branch_id'];
		}
		if ($params['keyword']) {
			$map['cat_name'] = array('like', '%'.trim($params['keyword']).'%');
		}
		if ($params['cat_type']) {
			$map['cat_type'] = $params['cat_type'];
		}
		if ($params['status']) {
			$map['status'] = $params['status'];
		}
		
		$count = $this->categoryDao()->searchRecordsCount($map);
		$list = array();
		if($count > 0){
			$orderby = empty($params['orderby']) ? 'sort ASC, cat_id DESC' : $params['orderby'];
			$list = $this->categoryDao()->searchRecords($map, $orderby, $params['page'], $params['pagesize']);
		}
		
		return array(
			'list'=>$this->outputForList($list),
			'count'=>$count,
		);
	}
	
	//官方分类
	public function getWhPagerList($params){
		$params['page'] < 1 && $params['page'] = 1;
		$params['pagesize'] < 1 && $params['pagesize'] = 20;
		
		$map = $params['map'] ? $params['map'] : array();
		if ($params['branch_id']) {
			$map['branch_id'] = $params['branch_id'];
		}
		if ($params['keyword']) {
			$map['cat_name'] = array('like', '%'.trim($params['keyword']).'%');
		}
		if ($params['status']) {
			$map['status'] = $params['status'];
		}
		
		$count = $this->categoryWhDao()->searchRecordsCount($map);
		$list = array();
		if($count > 0){
			$orderby = empty($params['orderby']) ? 'sort ASC, cat_id DESC' : $params['orderby'];
			$list = $this->categoryWhDao()->searchRecords($map, $orderby, $params['page'], $params['pagesize']);
		}
		
		return array(
				'list'=>$list,
				'count'=>$count,
		);
	}

	public function getlist($map)
    {
        $list = $this->categoryDao()->searchFieldRecords($map);
        return $list;
    }


	public function getAllList($map, $orderby){
		$list = $this->categoryDao()->searchAllRecords($map, $orderby);
		return $this->outputForList($list, $map['cat_type']);
	}
	
	public function getWhAllList($map, $orderby){
		$list = $this->categoryWhDao()->searchAllRecords($map, $orderby);
		return $this->outputForWhList($list);
	}
	
	public function getWhFieldList($map){
		$list = $this->categoryWhDao()->searchFieldRecords($map);
		return $this->outputForWhList($list);
	}
	
	public function getAvailableList($map, $orderby){
		$list = $this->categoryDao()->searchAllRecords($map, $orderby);
		return $list;
	}
	
	private function outputForList($list, $cat_type = Status::CatTypeLxyz) {
		//官方分类
		$map = array('cat_type'=>$cat_type);
		$cat_list = $this->categoryWhDao()->searchAllRecords($map);
		$tmp_list = [];
		if (!empty($cat_list)) {
			foreach ($cat_list as $k => $v) {
				$tmp_list[$v['cat_id']] = array(
						'cat_id'=>0,
						'ref_id'=>$v['cat_id'],
						'icon'=>$v['icon'],
						'icon_url'=>picurl($v['icon']),
						'cat_name'=>$v['cat_name'],
						'desc'=>$v['desc'],
						'sort'=>$v['sort'],
						'status'=>Status::NO,
						'status_label'=>Status::$catStatusList[Status::NO],
						'type'=>Status::TypeWh,
				);
			}
		}
		
		//支部分类
		//$ref_ids = [];
		if (!empty($list)) {
			foreach ($list as $k => $v) {
				if ($v['ref_id']) {
					//$ref_ids[] = $v['ref_id'];
					$tmp_list[$v['ref_id']]['status'] = $v['status'];
					$tmp_list[$v['ref_id']]['status_label'] = Status::$catStatusList[$v['status']];
					unset($list[$k]);
				}else {
					$cat = array(
							'cat_id'=>$v['cat_id'],
							'ref_id'=>$v['ref_id'],
							'icon'=>$v['icon'],
							'icon_url'=>picurl($v['icon']),
							'cat_name'=>$v['cat_name'],
							'desc'=>$v['desc'],
							'sort'=>$v['sort'],
							'status'=>$v['status'],
							'status_label'=>Status::$catStatusList[$v['status']],
							'type'=>Status::TypeBranch,
					);
					$list[$k] = $cat;
				}
			}
		} else {
			$list = [];
		}
		
		$list = array_merge($tmp_list, $list);
		
		return $list;
	}
	
	private function outputForWhList($list) {
		if (!empty($list)) {
			foreach ($list as $k => $v) {
				$list[$k]['icon_url'] = picurl($v['icon']);
				$list[$k]['status_label'] = Status::$catStatusList[$v['status']];
			}
		}
		return $list;
	}
	
	private function outputForInfo($info) {
		if (!empty($info)) {
			if ($info['ref_id']) {
				$cat_id = $info['cat_id'];
				$info = $this->categoryWhDao()->getRecord($info['ref_id']);
				$info['cat_id'] = $cat_id;
			}
			$info['icon_url'] = picurl($info['icon']);
		}
		return $info;
	}
	
	private function categoryDao() {
		return D('Common/Category/Category');
	}
	
	private function categoryWhDao() {
		return D('Common/Category/CategoryWh');
	}
}//end CategoryService!甜品