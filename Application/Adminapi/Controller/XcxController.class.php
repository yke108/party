<?php
namespace Adminapi\Controller;
use Common\Basic\CsException;
use Common\Basic\Status;
include APP_PATH.'/Common/Weixin3rd/WxComponentService.class.php';

class XcxController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}

	public function publishAction(){
		$data = [
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}

	// 获取授权登录链接
	public function getAuthorizeUrlAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		if ($branch_id < 1) {
			$this->jsonReturn(['IsShow'=> 0]);
		}
		$branchInfo = $this->branchService()->getInfo($branch_id, 'is_auth,app_id,template_id,is_close,app_type');
		$data = [
			'IsShow' => $branchInfo['app_type'] == 2 && $branch_id > 0 ? 1 : 0,
			'IsAuth' => $branchInfo['is_auth'],
			'IsPush' => $branchInfo['template_id'] == -1 ? false : true,
			'IsClose' => $branchInfo['is_close'],
			'AuthorizeUrl' => '',
		];
		if ($branchInfo['is_auth'] == 1) {
			$this->jsonReturn($data);
		}
		$data['IsAuth'] = 0;
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$data['AuthorizeUrl'] = $wxComponentService->getAuthorizeUrl(DK_DOMAIN.'/admin/index.php/site/authSuccess.html?branch_id='.$branch_id);
		$this->jsonReturn($data);
	}

	// 发布代码
	public function commitCodeAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		if ($branch_id < 1) {
			throw new CsException("没有权限", 400);
		}
		$branchInfo = $this->branchService()->getInfo($branch_id, 'app_id,app_name');
		if (empty($branchInfo['app_id'])) {
			throw new CsException("请先授权才能发布", 400);
		}
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		// 获取最新的模板ID
		$ret = $wxComponentService->getTemplateList();
		if (empty($ret['template_list'])) {
			throw new CsException("没有代码模板", 400);
		}
		$templateInfo = [];
		foreach ($ret['template_list'] as $key => $value) {
			if (empty($templateInfo) || $templateInfo['create_time'] < $value['create_time']) {
				$templateInfo = $value;
			}
		}
		$xcx_api_host = Service('Config')->getConfig('xcx_api_host');
		$ret = $wxComponentService->commitCode($branchInfo['app_id'], [
			'template_id'=> $templateInfo['template_id'],
			'ext_json'=> '{"extAppid":"'.$branchInfo['app_id'].'","ext":{"host":"'.$xcx_api_host.'","name":"'.$branchInfo['app_name'].'","extAppId":"'.$branchInfo['app_id'].'"},"window":{"navigationBarTitleText": "'.$branchInfo['app_name'].'"},"directCommit":true}',
			'user_version'=> $templateInfo['user_version'],
			'user_desc'=> 'test',
		]);
		if (!$ret || $ret['errcode'] != 0) throw new CsException("发布失败", 400);
		$this->branchService()->edit($branch_id, ['template_id'=> $templateInfo['template_id']]);
		// 改变为可见状态
		$wxComponentService->changeVisitStatus($branchInfo['app_id'], 'open');
		$this->branchService()->edit($branch_id, ['is_close'=> 0]);
		// 添加日志
		$this->addAdminLog(Status::CommitCode);
		$this->jsonReturn('发布成功');
	}

	// 停止发布
	public function pauseAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		if ($branch_id < 1) {
			throw new CsException("没有权限", 400);
		}
		$branchInfo = $this->branchService()->getInfo($branch_id, 'app_id,is_close');
		if (empty($branchInfo['app_id'])) {
			throw new CsException("请先授权才能停止发布", 400);
		}
		if ($branchInfo['is_close'] == 1) {
			throw new CsException("当前已是停止状态，请勿重复操作", 400);
		}
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$wxComponentService->changeVisitStatus($branchInfo['app_id'], 'close');
		$this->branchService()->edit($branch_id, ['is_close'=> 1]);
		// 添加日志
		$this->addAdminLog(Status::PauseCommit);
		$this->jsonReturn('停止发布成功');
	}

	// 生成二维码
	public function getQrcodeAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		if ($branch_id < 1) {
			throw new CsException("没有权限", 400);
		}
		$branchInfo = $this->branchService()->getInfo($branch_id, 'app_id');
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$url = $wxComponentService->getQrcode($branchInfo['app_id']);
		$path = UPLOAD_PATH.'UE';
		if (!file_exists($path)) {
			@mkdir($path, '0777');
		}
		$file_name = uniqid().'.jpg';
		file_put_contents($path . '/' . $file_name, file_get_contents($url));
		$qrcode = DK_DOMAIN . '/upload/UE/'.$file_name;
		$this->jsonReturn(['Qrcode'=> $qrcode]);
	}

	// 获取小程序代码模版
	public function getTemplateListAction(){
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->getTemplateList();
		if (!isset($ret['template_list'])) {
			throw new CsException("获取失败", 400);
		}
		$this->jsonReturn(['list'=> $ret['template_list']]);
	}

	protected function branchService(){
		return D('Branch', 'Service');
	}
}