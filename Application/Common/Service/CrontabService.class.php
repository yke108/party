<?php
namespace Common\Service;
use Common\Basic\CsException;

class CrontabService{
	// 添加公共数据仓的数据
	public function addWh($str, $data) {
		$model = D('Wh'.$str);
		$idName = $this->getIdName($str);
		if ($model->where([$idName=> $data[$idName]])->count()) {
			$ret = $model->where([$idName=> $data[$idName]])->save($data);
		} else {
			$ret = $model->add($data);
		}
		return $ret !== false;
	}

	private function getIdName($str) {
		$ret = '';
		switch ($str) {
			case 'Category':
				$ret = 'cat_id';break;
			default:
				$ret = 'id';break;
		}
		return $ret;
	}

	// 添加支部
	public function addBranch($data) {
		// 添加管理员
		D('Common/Admin/admin')->addRecord([
			'admin_name'=> $data['user'],
			'username'=> $data['username'],
			'mobile'=> '',
			'password'=> md5(md5(substr($data['phone'], -6)).'qj123!@#'),
			'is_admin'=> 1,
			'branch_id'=> $data['branch_id'],
			'add_time'=> NOW_TIME,
		]);
		// 添加默认积分规则
		Service('Point')->addDefaultPointData($data['branch_id']);
		return true;
	}
}