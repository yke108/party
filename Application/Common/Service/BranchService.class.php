<?php
namespace Common\Service;
use Common\Basic\CsException;


class BranchService{

	public function getInfo($branch_id, $field = "*"){
		$branchDao = $this->branchDao();
		$where = [
			'branch_id'=>$branch_id,
		];
		$info = $branchDao->where($where)->field($field)->find();
		return $info;
	}

	public function branchInfoFromAppId($app_id){
		if(empty($app_id)){
			throw new CsException('AppId不能为空', 1003);
		}
		$branchDao = $this->branchDao();
		$where = [
			'app_id'=>$app_id,
		];
		$field = 'branch_id, status, expire_time, app_type, app_secret';
		$info = $branchDao->where($where)->field($field)->find();
		return $info;
	}

	// 授权登录
	public function addAppId($param){
		$branch_id = isset($param['branch_id']) ? (int)$param['branch_id'] : 0;
		$app_id = isset($param['app_id']) ? (string)$param['app_id'] : '';
		if (empty($branch_id) || empty($app_id)) {
			return false;
		}
		$ret = $this->branchDao()->where(['branch_id'=> $branch_id])->save(['app_id'=> $app_id, 'is_auth'=> 1]);
		return $ret !== false;
	}

	// 取消授权
	public function delAppId($app_id){
		if (empty($app_id)) return false;
		$ret = $this->branchDao()->where(['app_id'=> $app_id])->save(['template_id'=> -1, 'is_close'=> 0, 'is_auth'=> 0]);
		return $ret !== false;
	}

	// 设置代码模版
	public function edit($branch_id, $data){
		if (empty($branch_id)) {
			return false;
		}
		$ret = $this->branchDao()->where(['branch_id'=> (int)$branch_id])->save($data);
		return $ret !== false;
	}

	private function branchDao(){
		return D('Common/Branch/Branch');
	}
}

