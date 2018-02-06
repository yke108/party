<?php
namespace Adminapi\Controller;
use Think\Controller;
use Common\Basic\CsException;
use Common\Basic\Status;

class FController extends Controller {
	protected $must_login = true;
	protected $gp_chk = true; //入口权限检测
	protected $api_setted = false;
    protected $action_list = '';
    protected $adminsess = [];
	public function _initialize(){
		// print_r($_SESSION);
		$actbefore = ACTION_NAME.'Before';
		if (method_exists($this, $actbefore)){
			$this->$actbefore();
		}
		$this->apiSetCheck();
		$post = $_POST;
		//检查公共参数是否齐全
		$version = $post['version'];
		$client = $post['client'];
		$vsign = $post['vsign'];
		$rstr = $post['rstr'];
		if(empty($version) || empty($client) || empty($vsign) || empty($rstr)){
			// throw new CsException('缺少公共参数', 2);
		}
	
		//验证椄口
		$tmpArr = $post;
		$tmpArr['secKey'] = md5('AnApiForFood2China118');
		unset($tmpArr['vsign']);

        sort($tmpArr,SORT_STRING);
        $tmpStr = implode($tmpArr);
		$expSign = $this->apiSign($tmpStr);
		if($vsign != $expSign){
			// throw new CsException('接口验证失败', 3);
		}
		unset($_POST['admin_id'], $_POST['branch_id']);
		if ($_POST['token']){
			$sess = $this->sessionService()->adminTokenCheck($_POST['token']);
            $this->action_list = $sess['action_list'];
            $this->adminsess = $sess;
			if ($this->gp_chk && strpos($sess['action_list'], ','.strtolower(CONTROLLER_NAME.'/'.ACTION_NAME).',') === false){
				throw new CsException('权限不足', 1000);
			}
			$_POST['admin_id'] = $sess['admin_id'];
			$_POST['branch_id'] = $sess['branch_id'];
            $_POST['is_admin'] = $sess['is_admin'];
            $_POST['region_code'] = $sess['region_code'];
            //取出地址编码 处理生成branch_id组 存入Session
            $arr = getpreg($sess['region_code']);
            $where['region_code'] = ['like',$arr.'%'];
            $blist = $this->branchInfo()->getbranch_list($where);
            $_POST['branch_list'] = empty($blist) ? [0] : $blist;
//            dump($_POST['token']);
			unset($_POST['token']);
		}

        if($_POST['branch_id']==0 && $_POST['is_admin']==1){
            $_POST['role'] = Status::RoleSuper; //超级管理员
        }else if($_POST['branch_id']==0 && $_POST['is_admin']==0){
            $_POST['role'] = Status::RoleAdmin;//普通管理员
        }else if($_POST['branch_id']>0 && $_POST['is_admin']==1){
            $_POST['role'] = Status::RoleWxAdmin;//小程序负责人
        }else if($_POST['branch_id']>0 && $_POST['is_admin']==0) {
            $_POST['role'] = Status::RoleWxUser;//小程序运营人员
        }
//        print_r($_POST['role']);
        if ($this->must_login === false){
            return;
        }
        if ($_POST['admin_id'] < 1 ){
            throw new CsException('未登录', 31);
        }

    }
	
	protected function _empty(){
		throw new CsException('接口不存在', 1000);
	}
	
	protected function apiset($must_login){
		if ($this->api_setted) return;
		$this->api_setted = true;
		$this->must_login = $must_login;
	}
	
	protected function apiSetCheck(){
		$this->apiset(true);
	}
	
	private function apiSign($str){
		return md5($str);
	}
	
	protected function jsonReturn($data){
		if (!is_array($data)){
			$data = array(
				'Message'=>$data,
			);
		}
		!isset($data['Error']) && $data['Error'] = 0;
		!isset($data['Message']) && $data['Message'] = 'Success';
		$this->ajaxReturn($data);
	}
	
	protected function sessionService(){
		return D('Session', 'Service');
	}

	protected function check_empty($arr,$check)
	{
		$message = '内容为空';
		foreach($check as $k=>$v)
		{
			if(!is_numeric($k)) $message = $k; 

			if(!isset($arr[$v]))
			{
				$data = [
					'Error'=>1001,
					'Message'=>$message,
				];
				$this->jsonReturn($data);
			}else if(empty($arr[$v]))
			{
				$data = [
					'Error'=>1001,
					'Message'=>$message,
				];
				$this->jsonReturn($data);
			}else if(is_null($arr[$v]))
			{
				$data = [
					'Error'=>1001,
					'Message'=>$message,
				];
				$this->jsonReturn($data);
			}
		}
		return;
	}

	protected function addAdminLog($action_type) {
		return $this->adminActionLogDao()->addRecord([
			'admin_id'=> $_POST['admin_id'],
			'branch_id'=> $_POST['branch_id'],
			'action_type'=> $action_type,
		]);
	}

	protected function adminActionLogDao() {
		return D('Common/Admin/AdminActionLog');
	}

	protected function userInfoDao(){
		return D('Common/User/UserInfo');
	}

	protected function branchInfo(){
		return D('Common/Branch/Branch');	
	}

	protected function topInfo(){
		return D('Common/Top/Top');	
	}


	protected function changetop($post)
	{
		$check = [
			'ID不能为空'=>'content_id',
			'类型不能为空'=>'top_type',
		];
		$this->check_empty($post,$check);

		$model = M('top');
		$where = [
			'top_type'=>$post['top_type'],
			'content_id'=>$post['content_id'],
		];

		//返回信息
		$message = ['修改成功:当前状态已推荐','修改成功:当前状态未推荐'];
		//判断是否已推荐
		$old = $model->where($where)->find();

		if(isset($post['top']) && !empty($post['top'])){
			switch($post['top'])
			{
				case Status::YES:
					//判断top是否等于1
					if($old) $this->jsonReturn('修改成功');
					//存储内容
					$map = [
						'top_type'=>$where['top_type'],
						'content_id'=>$where['content_id'],
						'add_time'=>time(),
					];
					//添加内容
					$add = $model->add($map);
					return true;
				break;

				case Status::NO:
					//判断top是否等于1
					if(!$old) $this->jsonReturn('修改成功');
					$delete = $model->where($where)->delete();
				// dump(M()->getlastsql());
				// exit;
					return true;
				break;
			}
			return false;
		}else{
			//如果有推荐则删除推荐
			if($old){
				$model->where($where)->delete();
				$data = [
					'Message'=>$message[1],
					'Code'   =>Status::NO,
					'Error'  =>0,
				];
				$this->jsonReturn($data);
			}else{
				//存储内容
				$map = [
					'top_type'=>$post['top_type'],
					'content_id'=>$post['content_id'],
					'add_time'=>time(),
				];
				//添加内容
				$add = $model->add($map);
				//如果成功
				if($add){
					//输出
					$data = [
						'Message'=>$message[0],
						'Code'   =>Status::YES,
						'Error'  =>0,
					];
					$this->jsonReturn($data);
				}else{
					//如果添加失败
					throw new CsException("推荐失败", 400);
				}
			}
		}

	}

	protected function gettop($type)
	{
		$model = M('top');
		$where = [
			'top_type'=>$type,
		];
		return $model->where($where)->getfield('content_id',true);
	}

}
