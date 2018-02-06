<?php
namespace Super\Controller;
use Think\Controller;
use Common\Basic\CsException;

class FController extends Controller {
	public function _initialize(){
		$post = $_POST;
		//检查公共参数是否齐全
		$version = $post['version'];
		$client = $post['client'];
		$vsign = $post['vsign'];
		$rstr = $post['rstr'];
		if(empty($version) || empty($client) || empty($vsign) || empty($rstr)){
			throw new CsException('缺少公共参数', 2);
		}
	
		//验证椄口
		$tmpArr = $post;
		$tmpArr['secKey'] = md5('AnApiForFood2China118');
		unset($tmpArr['vsign']);
	
		sort($tmpArr,SORT_STRING);
		$tmpStr = implode($tmpArr);
		$expSign = $this->apiSign($tmpStr);
		if($vsign != $expSign) throw new CsException('接口验证失败', 3);
	}
	
	protected function _empty(){
		throw new CsException('接口不存在', 1000);
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
}