<?php
namespace Adminapi\Controller;
use Common\Basic\CsException;
use Common\Basic\Status;
use Think\Controller;
include APP_PATH.'/Common/Weixin3rd/WxComponentService.class.php';

class TestController extends Controller {
	protected function apiSetCheck(){
		$this->apiset(false);
	}

	// 获取授权登录链接
	public function indexAction(){
		echo getConfig('xcx_api_host');
		exit;
	}

	// 草稿列表
	public function draftListAction(){
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->getTemplateDraftList();
		$this->ajaxReturn($ret);
	}

	// 将草稿箱的草稿选为小程序代码模版
	public function addToTemplateAction(){
		$draft_id = I('post.draft_id', 0, 'intval');
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->addToTemplate($draft_id);
        $ret['draft_id'] = $draft_id;
		$this->ajaxReturn($ret);
	}

	// 模板列表
	public function getTemplateListAction(){
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->getTemplateList();
		$this->ajaxReturn($ret);
	}

	// 获取授权小程序帐号的可选类目
	public function getCategoryAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		$branchInfo = $this->branchService()->getInfo($branch_id, 'app_id');
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->getCategory($branchInfo['app_id']);
		$this->ajaxReturn($ret);
	}

	// 获取授权小程序帐号的可选类目
	public function submitAuditAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		$branchInfo = $this->branchService()->getInfo($branch_id, 'app_id');
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->submitAudit($branchInfo['app_id'], [
			'item_list' => [
				[
					'address'=> 'pages/index/index',
					'tag'=> '',
					'first_class'=> '餐饮',
					'second_class'=> '点评与推荐',
					'first_id'=> '220',
					'second_id'=> '221',
					'title'=> '首页',
				]
			]
		]);
		$this->ajaxReturn($ret);
	}

	// 查询最新一次提交的审核状态
	public function getLatestAuditstatusAction(){
		$branch_id = I('post.branch_id', 0, 'intval');
		$branchInfo = $this->branchService()->getInfo($branch_id, 'app_id');
		$wxComponentConfig = getWxComponentConfig();
		$wxComponentService = new \WxComponentService($wxComponentConfig);
		$ret = $wxComponentService->getLatestAuditstatus($branchInfo['app_id']);
		$this->ajaxReturn($ret);
	}

	protected function branchService(){
		return D('Branch', 'Service');
	}
}
