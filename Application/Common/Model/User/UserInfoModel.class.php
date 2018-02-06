<?php
namespace Common\Model\User;
use Think\Model\RelationModel;
use Common\Basic\Status;

class UserInfoModel extends RelationModel {
    protected $tableName = 'user_info';
    protected $pk = 'user_id';

	public function getRecord($id){
		if ($id < 1) return array();
		$map = array(
				$this->pk=>$id,
				'is_delete'=>Status::None,
		);
   		return $this->where($map)->find();
	}
	
	public function findRecord($map){
		$map['is_delete'] = Status::None;
		return $this->where($map)->find();
	}
	
	public function getRecords($ids){
		if (empty($ids)) return array();
		if (!is_array($ids)) $ids = array($ids);
		$map = array(
			'user_id'=>array('in', $ids),
		);
		return $this->where($map)->getField('user_id, nick_name, user_img, mobile,user_type,real_name,sex,birthday,branch_id');
	}
	
	public function findUser($map){
		return $this->where($map)->find();
	}
	
	public function findByMobile($mobile){
		$map = array(
			'mobile'=>$mobile,
		);
		return $this->where($map)->find();
	}
	
	public function getUserIdRecord($map){
		return $this->where($map)->getField("user_id",true);
	}
	
	public function getUsersByIds($ids){
		$map['user_id'] = array('in', $ids);
		return $this->where($map)->getField("user_id, nick_name, user_img");
	}
	
	public function addRecord($data){
		empty($data['user_id']) && $data['user_id'] = date('YmdHis').rand(100,999);
		$data['reg_time'] = NOW_TIME;
		return $this->add($data);
	}
	
	public function saveRecord($data){
		return $this->save($data);
	}
	
	public function saveMapRecord($data,$map){
		return $this->where($map)->save($data);
	}
	
	
	public function searchRecords($map, $orderBy, $start, $limit){
        return $this->where($map)->order($orderBy)->page($start, $limit)->select();
    }
	
	public function searchRecordsCount($map){
		return $this->where($map)->count();
    }
    
	public function deleteRecord($map){
		return $this->where($map)->delete();
	}
	
	public function depleteMoney($user_id, $money) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setDec('user_money', $money);
	}
	
	public function increaseUserMoney($user_id, $money) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setInc('user_money', $money);
	}
	
	public function increaseFrozenMoney($user_id,$money){
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setInc('frozen_money', $money);
	}
	
	public function depleteFrozenMoney($user_id,$money){
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setDec('frozen_money', $money);
	}
	
	public function increaseCommissionMoney($user_id, $money) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setInc('commission_money', $money);
	}
	
	public function increaseRankMoney($user_id, $money) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setInc('rank_money', $money);
	}
	
	public function increaseRankTimes($user_id) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setInc('rank_times');
	}
	
	public function increaseUserCommission($user_id, $money) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setInc('user_commission', $money);
	}
	
	public function increasePayPoints($user_id, $pay_points) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setInc('user_points', $pay_points);
	}
	
	public function depletePayPoints($user_id, $pay_points) {
		$map = array('user_id'=>$user_id);
		return $this->where($map)->setDec('user_points', $pay_points);
	}

    public function searchAllRecords($map, $orderBy, $groupby){
    	return $this->field('nick_name')->where($map)->group($groupby)->select();
    }
    
    public function searchFieldRecords($map, $field = 'user_id, real_name, mobile, user_img'){
    	$map['is_delete'] = Status::None;
    	return $this->where($map)->getField($field);
    }

    public function password($pwd, $salt) {
        $salt < 1 && $salt = '';
        return md5(md5($pwd.$salt).$salt);
    }

    public function passwd($pwd, $salt) {
        $pwd = md5(md5($pwd).'xiaocx!@#123');
        return $this->password($pwd, $salt);
    }
    
}
