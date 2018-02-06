<?php
namespace Admin\Controller;
use Think\Controller;
use Common\Basic\Pager;

class FController extends Controller {
	public function _initialize(){
		header('Access-Control-Allow-Origin: *');
		header('Access-Control-Allow-Credentials: true');
		
		$uid = session('uid');
		/* 验证管理员身份 */
		if (intval($uid) < 1){
			$this->redirect('site/login');
		}
	}
	
    protected function apiRequest($api_name, $data){
    	$url = DK_API.'/api/admin/index.php/'.$api_name;
    	$data['password'] && $data['password'] = md5(md5($data['password']).'qj123!@#');
    	$data['version'] = '1';
    	$data['client'] = '21';
    	$data['rstr'] = NOW_TIME;
    	$data['token'] = session('sesspwd');
    	empty($data['token']) && $data['token'] = '';
    	$tparr = $data;
    	$tparr['secKey'] = md5('AnApiForFood2China118');
    	sort($tparr, SORT_STRING);
    	$tmpStr = implode($tparr);
    	$data['vsign'] = md5($tmpStr);
    	$result_str = $this->curlPost($url, $data);
    	$result = json_decode($result_str, true);
    	if (!is_array($result)){
            echo '<pre>';
    		echo $result_str; //测试用, 上线时注释
            exit;
    		$result = [
    			'Error'=>17,
    			'Message'=>'fail',
    		];
    	} else if(isset($result['Token']) && isset($result['AdminId'])) {
    		session('uid', $result['AdminId']);
            session('sesspwd', $result['Token']);
            session('avatar', $result['Avatar']);
            session('admin_name', $result['AdminName']);
            session('role_name', $result['RoleName']);
            session('branch_id', $result['BranchId']);
    	}
    	return $result;
    }
    
    protected function curlPost($url, $post_data=array(), $timeout=10){
    	$ch = curl_init();
    	curl_setopt($ch, CURLOPT_POST, true);
    	curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
    	curl_setopt($ch, CURLOPT_URL, $url);
    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER , false);
    	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST , false);
    	curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
    	$result = curl_exec($ch);
//    	var_dump(curl_error($ch));
    	curl_close($ch);
    	return $result;
    }
    
    protected function _empty(){
    	$view = strtolower(CONTROLLER_NAME).'/'.strtolower(ACTION_NAME);
    	$path = APP_PATH.MODULE_NAME.'/View/'.$view.'.html';
    	if (!file_exists($path) && !IS_POST){
    		echo $path;
    		exit('Not Exist');
    	}
    	$data = array_merge($_POST, $_GET);
    	$result = $this->apiRequest($view, $data);
    	if (!isset($result['Error'])){
    		$this->error('系统错误');
    	} elseif ($result['Error'] > 0) {
    		$this->error($result['Message']);
    	} elseif (isset($result['Display'])) {
    		$this->assign('result', $result);
    		if ($result['Display'] == 2) {
    			$page = new Pager($result['Count'],$result['Pagesize']);
    			$this->assign('pager',$page->show());
    		}
    		$this->assign('get', $_GET);
    		$this->display($view);
    	} else {
    		$this->success($result['Message'],'', $result);
    	}
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
}
