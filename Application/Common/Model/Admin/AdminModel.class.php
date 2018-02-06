<?php
namespace Common\Model\Admin;
use Think\Model\RelationModel;
use Common\Basic\Status;

class AdminModel extends RelationModel {
    protected $tableName = 'admin';
    protected $pk = 'admin_id';
    
    protected $_validate = array(
    		array('branch_id','require','支部ID不能为空',1),
    		array('admin_name','require','管理员姓名不能为空',1),
    		array('username','require','管理员姓名不能为空',1),
    		array('mobile','require','手机号不能为空',1),
    		array('username','','用户名已存在',0,'unique',1),
    		array('mobile','/^1\d{10}$/','手机号格式不正确',0,'regex'),
    		array('password','require','登录密码不能为空',1,'require',1),
//    		array('repassword','password','确认密码不正确',0,'confirm'),  // 验证确认密码是否和密码一致
    		//array('avatar','require','头像不能为空',1),
    		array('role_ids','require','角色不能为空',0),
    		//array('role_ids','checkRoles','角色不存在',0,'function'),   // 自定义函数验证\
    );
    
    protected $_auto = array (
    		//array('log_time','time',1,'function'), // 对add_time字段在新增的时候写入当前时间戳
    );

	public function getRecord($id){
		if ($id < 1) return array();
		$map = array(
				'admin_id'=>$id,
				'is_delete'=>Status::None,
		);
   		return $this->where($map)->find();
	}

	public function findRecord($map){
		$map['is_delete'] = Status::None;
		return $this->where($map)->find();
	}
	
	public function addRecord($data){
		if (!empty($data['password'])){
			$data['salt'] = rand(1000,9999);
			$data['password'] = $this->password($data['password'], $data['salt']);
			$data['add_time'] = NOW_TIME;
		}
		return $this->add($data);
	}
	
	public function saveRecord($data){
		if (!empty($data['password'])){
			$data['salt'] = rand(1000,9999);
			$data['password'] = $this->password($data['password'], $data['salt']);
			$data['error_count'] = 0;
		} else {
			unset($data['password']);
		}
		return $this->save($data);
	}
	
	public function errorCountIncrease($admin_id){
		$map = array(
				'admin_id'=>$admin_id,
		);
		return $this->where($map)->setInc('error_count');
	}
	
	public function logined($admin_id, $password = ''){
		$map = array(
				'admin_id'=>$admin_id,
		);
	
		$data = array(
				'last_login'=>time(),
				'last_ip'=>get_client_ip(),
				'error_count'=>0,
		);
		if ($password){
			$data['salt'] = rand(1000,9999);
			$data['password'] = $this->password($password, $data['salt']);
		}
		return $this->where($map)->save($data);
	}

	public function password($password, $salt = ''){
		$str = md5(md5($password).$salt);
		$str = md5(substr($str, 3, 26));
		return $str;
	}
	
	public function delRecord($cat_id){
		$map = array('cat_id'=>$cat_id);
		$data = array('is_delete'=>Status::YES);
		return $this->where($map)->save($data);
	}
	
	public function delRecords($cat_ids){
		$map = array('cat_id'=>array('in',$cat_ids));
		$data = array('is_delete'=>Status::YES);
		return $this->where($map)->save($data);
	}
	
	public function searchRecords($map, $orderby = 'admin_id DESC', $start, $limit){
		$map['is_delete'] = Status::None;
		return $this->where($map)->order($orderby)->page($start, $limit)->select();
	}
	
	public function searchRecordsCount($map){
		$map['is_delete'] = Status::None;
		return $this->where($map)->count();
	}
	
	public function searchAllRecords($map, $orderby){
		$map['is_delete'] = Status::None;
		return $this->where($map)->order($orderby)->select();
	}
	
	public function searchFieldRecords($map, $field = 'admin_id, admin_name, mobile, avatar'){
		$map['is_delete'] = Status::None;
		return $this->where($map)->getField($field);
	}
}