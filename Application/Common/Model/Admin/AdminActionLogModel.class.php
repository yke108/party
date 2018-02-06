<?php
namespace Common\Model\Admin;
use Think\Model\RelationModel;

class AdminActionLogModel extends RelationModel {
    protected $tableName = 'admin_action_log';

    public function addRecord($data){
    	$admin_name = M('Admin')->where(['admin_id'=> $data['admin_id']])->getField('admin_name');
    	$branchInfo = D('Common/Branch/Branch')->where(['branch_id'=> $data['branch_id']])->field('app_id,app_name,template_id')->find();
    	$temp['admin_name'] = $admin_name;
    	$temp['app_id'] = $branchInfo['app_id'];
    	$temp['app_name'] = $branchInfo['app_name'];
    	$temp['template_id'] = $branchInfo['template_id'];
    	$temp['add_time'] = NOW_TIME;
    	$data = array_merge($temp, $data);
		return $this->add($data);
	}
}