<?php
namespace Adminapi\Controller;
use Common\Basic\Status;
use Common\Basic\CsException;

class NoticeController extends FController {

	protected $model;

	public function __construct()
	{
		parent::__construct();
		$this->model = M('notice');
	}

	/**
	 * [notice_listAction 公告列表接口]
	 * @return [type] [description]
	 */
	public function notice_listAction()
	{
		$post  = I('post.');
		$check = [
			'支部ID为空'=>'branch_id',
		];
		$this->check_empty($post,$check);
		$page     = '';
		$pagesize = '20';
		$where    = [
			'branch_id' =>$post['branch_id'],
			'is_delete' =>0,
		];
		if(isset($post['page'])) $page = $post['page'];//12
		if(isset($post['pagesize']) && $post['pagesize'] > 0) $pagesize = $post['pagesize'];
		//搜索条件
		if(isset($post['search']) && !empty($post['search'])) $where['title'] = ['like','%'.$post['search'].'%'];
		if(isset($post['top']) && !empty($post['top']))
		{
				//获取所有推荐的ID
				$top = $this->gettop(Status::CollectTypeNotice);
				if(is_null($top)) $top = [0];

				if($post['top'] == Status::YES)
				{
					$where['notice_id'] = ['in',$top];
				}else{
					$where['notice_id'] = ['not in',$top];
				}
		}

		$count = $this->model->where($where)->count();
		if($count > 0)
		{
			$list = $this->model->where($where)->page($page,$pagesize)->order('top,addtime desc')->select();
		}
		$newlist = [];
		if($list)
		{
			foreach($list as $k=>$v)
			{
				$newlist[$k] =[
					'NoticeId'=>$v['notice_id'],
					'Title'=>$v['title'],
					'Content'=> htmlspecialchars_decode($v['content']),
					// 'Top'=>$v['top'],
					'Addtime'=>$v['addtime'],
				];
				//推荐条件
				$tops[$v['notice_id']] = $v['notice_id'];
			}
			//判断推荐
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeNotice,'content_id'=>$tops]);
			foreach($list as $key => $va)
			{
				//判断推荐
				$newlist[$key]['Top'] = (!is_null($top[$va['notice_id']])) ? Status::YES : Status::NO ;
			}
		}
		
		$data = [
			'List'=>$newlist,
			'Count'=>$count,
			'Pagesize'=>$pagesize,
			'Display'=>2,
		];
		$this->jsonReturn($data);
	}
	/**
	 * [notice_saveAction 公告添加和修改接口]
	 * @return [type] [description]
	 */
	public function notice_saveAction()
	{
		$post = I('post.');
		if(isset($post['content']))
		{

			$check = [
				'公告标题为空'=>'title',
				'公告内容为空'=>'content',
				'推荐状态为空'=>'top',
			];
			//判断是否有content
			$this->check_empty($post,$check);
			if(isset($post['notice_id']) && !empty($post['notice_id'])){
				if($post['top']!=Status::YES&&$post['top']!=Status::NO) throw new CsException("推荐状态不正确", 400);
				
				//修改内容
				$map = [
					'content' => $post['content'],
					'title' => $post['title'],
					// 'top'   =>$post['top'],
				];
				$where = [
					'notice_id' => $post['notice_id'],
				];
				$edit = $this->model->where($where)->save($map);
				$where = [
					'top_type'=>Status::CollectTypeNotice,
					'content_id'=>$post['notice_id'],
					'top'=>$post['top'],
				];
				//修改推荐状态
				$change = $this->changetop($where);
				if($edit || $change){
					$data = '修改成功';
				}else{
					$data = [
						'Error'=>1003,
						'Message'=>'修改失败',
					];
				}
			}else{
				//添加内容
				$map = [
					'content' 	=> $post['content'],
					'title' 	=> $post['title'],
					'branch_id' => $post['branch_id'],
					'addtime' 	=> time(),
				];
				$add = $this->model->add($map);
				$post['notice_id'] = $add;					
				$where = [
					'top_type'=>Status::CollectTypeNotice,
					'content_id'=>$post['notice_id'],
					'top'=>$post['top'],
				];
				//修改推荐状态
				$change = $this->changetop($where);
				if($add){
					$data = '添加成功';
				}else{
					$data = [
						'Error'=>1003,
						'Message'=>'添加失败',
					];
				}
			}

			$this->jsonReturn($data);
		}else{
			$data = [
				'Display'=>1,
			];
			$post = I('post.');
			//判断是否是编辑  如果是则去INFO里面拿内容
			if(isset($post['notice_id']) && !empty($post['notice_id']))
			{
				$info = $this->notice_infoAction($post);
				$data['Info'] = $info;
			}
			$this->jsonReturn($data);
		}
	}
	/**
	 * [notice_changeAction 公告状态修改接口]
	 * @return [type] [description]
	 */
	public function notice_changeAction()
	{	
		$post = I('post.');
		$check = [
			'修改类型为空'=>'type',
			'公告ID为空'=>'notice_id',
			'支部ID为为空'=>'branch_id',
		];
		$this->check_empty($post,$check);

		switch($post['type'])
		{

			case 'status':
				$map = 'status';
				$message = ['修改成功:当前状态已审核','修改成功:当前状态未审核'];
			break;

			case 'top':
					$arr = [
						'content_id'=>$post['notice_id'],
						'top_type'=>Status::CollectTypeNotice,
					];
					$this->changetop($arr);
			break;

			default:
				throw new CsException("修改类型不正确", 400);
			break;
		}
			$where = [
				'notice_id'=>$post['notice_id'],
				'branch_id'=>$post['branch_id'],
			];
			$old = $this->model->where($where)->getfield($map);
			if(!$old) throw new CsException("活动ID不存在", 400);

			$new = ($old == Status::YES) ? Status::NO : Status::YES;
			$update = $this->model->where($where)->save([$map=>$new]);
			if($update) 
			{
				if($new==Status::YES)
				{
					$data = [
						'Message'=>$message[0],
						'Code'   =>Status::YES
					];
					$this->jsonReturn($data);
				}else if($new==Status::NO){
					$data = [
						'Message'=>$message[1],
						'Code'   =>Status::NO
					];
					$this->jsonReturn($data);
				}
			}
			throw new Exception("修改失败", 500);
	}
	/**
	 * [notice_infoAction 公告详情 挂起]
	 * @return [type] [description]
	 */
	public function notice_infoAction()
	{
		$post = I('post.');
		$this->check_empty($post,['notice_id']);
		$where = [
			'notice_id'=>$post['notice_id'],
			'status'=>0
		];
		$info = $this->model->where($where)->find();
		if($info)  
		{
			$arr =[
				'EvenId'	=>$info['notice_id'],
				'Content'	=>$info['content'],
				'Title'     =>$info['title'],
			];

			return $arr;
		}

		$data = [
			'Error'=>1001,
			'Message'=>'获取失败',
		];
		$this->jsonReturn($data);
	}

	/**
	 * [notice_delAction 删除公告接口]
	 * @return [type] [description]
	 */
	public function notice_delAction()
	{
		$post = I('post.');
		$check = [
			'公告ID为空'=>'notice_id',
			'支部ID为为空'=>'branch_id',
		];
		$this->check_empty($post,$check);
		$where = [
			'notice_id'=>$post['notice_id'],
			'branch_id'=>$post['branch_id'],
		];
		$del = $this->model->where($where)->save(['is_delete'=>1]);
		$where = [
			'top_type'=>Status::CollectTypeNotice,
			'content_id'=>$post['notice_id'],
			'top'=>Status::NO,
		];
		//修改推荐状态
		$change = $this->changetop($where);

		if($del) $this->jsonReturn('删除成功');

		throw new CsException("删除失败", 400);
	}
	

}
