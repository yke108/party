<?php
namespace Common\Model\User;
use Think\Model\RelationModel;

class MobileAuthModel extends RelationModel {
    protected $tableName = 'user_auth_mobile';
	protected $cash_pwd_key="qjp123!@#";
	
	public function getRecord($id){
		if ($id < 1) return array();
   		return $this->find($id);
	}

	public function findRecord($map){
		return $this->where($map)->find();
	}
	
	public function addRecord($data){
		if (!empty($data['password'])){
			$data['salt'] = rand(1000,9999);
			$data['password'] = $this->password($data['password'], $data['salt']);
		}
		return $this->add($data);
	}
	
	public function saveRecord($data){
		if (!empty($data['password'])){
			$data['salt'] = rand(1000,9999);
			$data['password'] = $this->password($data['password'], $data['salt']);
			$data['error_count'] = 0;
		}
		return $this->save($data);
	}
	
	//设置支付密码
	public function addCashPwd($data){
		if (!empty($data['cash_password'])){
			$data['cash_salt'] = rand(1000,9999);
			$data['cash_password'] = $this->password($this->pwdAddKey($data['cash_password']), $data['salt']);
		}
		return $this->add($data);
	}
	
	//修改支付密码
	public function saveCashPwd($data){
		if (!empty($data['cash_password'])){
			$data['cash_salt'] = rand(1000,9999);
			$data['cash_password'] = $this->password($this->pwdAddKey($data['cash_password']), $data['cash_salt']);
		}
		return $this->save($data);
	}
	
	//给明码的密码加上key加密
	public function pwdAddKey($password){
		return md5(md5($password).$this->cash_pwd_key);
	}
	
	//检查支付密码是否正确
	public function checkCashPwdOk($password){
		
		if ($this->password($this->pwdAddKey($password), $this->cash_salt) != $this->cash_password){
			return false;
		} else {
			return true;
		}
	}
	
	public function loginFail($mobile){
		$data = array(
			'mobile'=>$mobile,
			'error_count'=>array('exp', 'error_count+1'),
		);
		return $this->saveRecord($data);
	}
	
	public function loginSuccess($mobile, $password = ''){
		$data = array(
			'mobile'=>$mobile,
			'error_count'=>0,
			'password'=>$password,
		);
		return $this->saveRecord($data);
	}
	
	public function isLoginOk($password){
		if ($this->password($password, $this->salt) != $this->password){
			$this->loginFail($this->mobile);
			return false;
		} else {
			$this->loginSuccess($this->mobile, $password);
			return true;
		}
	}
	
	
	public function password($password, $salt = ''){
		$str = md5(md5($password).$salt);
		$str = md5(substr($str, 3, 26));
		return $str;
	}
}