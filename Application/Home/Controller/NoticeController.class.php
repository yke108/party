<?php
namespace Home\Controller;
use Common\Basic\CsException;
use Common\Basic\Status;

class NoticeController extends FController {
	
	protected $model;

	public function __construct()
	{
		parent::__construct();
		$this->model = M('notice');
	}

	public function notice_listAction()
	{
		$post = I('post.');
		$page = '';
		$pagesize = '20';
		$where = [
			'branch_id'=>$post['branch_id'],
			'is_delete'=>Status::None,
		];
		if(isset($post['p'])) $page = $post['p'];
		if(isset($post['pagesize'])) $pagesize = $post['pagesize'];
		$count = $this->model->where($where)->count();
		$list = $this->model->where($where)->page($page,$pagesize)->order('top,addtime desc')->select();
		$newlist = [];
		foreach($list as $k=>$v)
		{
			$newlist[$k] =[
				'NoticeId'	=>$v['notice_id'],
				'Content'	=>$v['content'],
				'Title'		=>$v['title'],
				'Top'		=>$v['top'],
				'Addtime'	=>$v['addtime'],
			];
		}
		
		$data = [
			'List'=>$newlist,
			'Count'=>$count,
			'Pagesize'=>$pagesize,
			'Display'=>2,
		];
		$this->jsonReturn($data);
	}


	public function notice_infoAction()
	{
		$post = I('post.');
		$check = [ 
			'公告ID为空'=>'notice_id',
		];
		$this->check_empty($post,$check);
		$where = [
			'notice_id'=>$post['notice_id'],
			'is_delete'=>Status::None,
		];
		$info = $this->model->where($where)->find();
		if($info)  
		{
			$arr =[
				'NoticeId'	=>$info['notice_id'],
				'Content'	=>htmlspecialchars_decode($info['content']),
				// 'Content'	=>$info['content'],
				'Title'		=>$info['title'],
				'Top'		=>$info['top'],
				'Addtime'	=>$info['addtime'],
			];

			$this->jsonReturn($arr);
		}

		throw new CsException("公告ID不存在", 400);
		
	}
}