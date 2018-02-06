<?php
namespace Home\Controller;
use Common\Basic\CsException;
use Common\Basic\Status;

class MienController extends FController {
	
	public function __construct()
	{
		parent::__construct();
		$this->model = M('partymien');
	}

	/**
	 * [mien_listAction 风采列表]
	 * @return [type] [description]
	 */
	public function mien_listAction()
	{
		$post = I('post.');
		$page = '';
		$pagesize = '';
		$where = [
			'branch_id'=>$post['branch_id'],
			'status'=>Status::YES,
			'is_delete'=>Status::None,
		];
		//判断是否是查自己的风采 如果是则显示自己的 否则则显示所有
		if(isset($post['self'])) $where['user_id'] = $post['user_id'];
		if(isset($post['page'])) $page = $post['page'];
		if(isset($post['pagesize'])) $pagesize = $post['pagesize'];
		$count = $this->model->where($where)->count();
		$list = $this->model->where($where)->page($page,$pagesize)->order('addtime desc')->select();
		$newlist = [];
		if($list){
			foreach($list as $k=>$v)
			{
				$newlist[$k] =[
					'MienId'	=>$v['mien_id'],
					'Content'	=>base64_decode($v['content']),
					'Photo'		=>picurls($v['photo']),
					'Readnum'	=>$v['readnum'],
					'Likenum'	=>$v['likenum'],
					'UserId'	=>$v['user_id'],
					'BranchId'	=>$v['branch_id'],
					'Status'	=>$v['status'],
					'Top'		=>$v['top'],
					'Addtime'	=>$v['addtime'],
					'SmallPhoto'=>picurls($v['photo'],'b600'),
				];
					$arr[$v['user_id']] = $v['user_id'];
					$other[] = $v['mien_id'];

			}
			$user 		= $this->userInfoDao()->getRecords($arr);
			$otherinfo 	= $this->getinfoAction($other,$post['user_id']);
		
			foreach($list as $key => $va)
			{
				if(!is_null($user[$va['user_id']])){
					$sex = ($user[$va['user_id']]['sex'] == Status::Sexboy) ? '男' : '女';
					$userinfo = [
						'RealName'=>$user[$va['user_id']]['real_name'],
						'UserImg'=>(!empty($user[$va['user_id']]['user_img']))?picurls($user[$va['user_id']]['user_img'],'b600'):[DK_DOMAIN.'/static/icons/common/basicprofile.jpg'],
						'Sex'=>$sex,
						'Age'=>getAge($user[$va['user_id']]['birthday']),
					];
					$newlist[$key]['User'] = $userinfo;
				}else{
					$newlist[$key]['User'] = [];
				}
				$newlist[$key]['OtherStatus'] = ($otherinfo[$va['mien_id']]) ? Status::LikeFalse  : Status::LikeTrue;
			}

		}
		// 总积分第一人
		$MainTopUser = Service('Point')->getHighestUser($post['branch_id']);
		$data = [
			'List'=>$newlist,
			'MainTopUser'=>$MainTopUser,

		];
		$this->jsonReturn($data);				

	}

	/**
	 * [mien_saveAction 添加风采]
	 * @return [type] [description]
	 */
	public function mien_saveAction()
	{
		$post = I('post.');
		//判断是否有content
		$this->check_empty($post,['content']);
		//添加内容
		$map = [
			'content' 	=> base64_encode($post['content']),
			'photo'   	=> $post['photo'],
			'user_id' 	=> $post['user_id'],
			'branch_id' => $post['branch_id'],
			'addtime' 	=> time(),
		];
		$add = $this->model->add($map);					
		if($add) $this->jsonReturn('添加成功');
		throw new CsException("添加失败", 400);
	}


	/**
	 * [mien_infoAction 风采详情]
	 * @return [type] [description]
	 */
	public function mien_infoAction()
	{
		$post = I('post.');
		$this->check_empty($post,['mien_id']);
		$where = [
			'mien_id'=>$post['mien_id'],
			'status'=>Status::YES,
			'is_delete'=>Status::None,
		];
		$info = $this->model->where($where)->find();
		
		if($info){
			$arr['Info'] =[
				'MienId'	=>	$info['mien_id'],
				'Content'	=>	base64_decode($info['content']),
				'Photo'		=>	picurls($info['photo']),
				'Readnum'	=>	$info['readnum'],
				'Likenum'	=>	$info['likenum'],
				'UserId'	=>	$info['user_id'],
				'BranchId'	=>	$info['branch_id'],
				'Status'	=>	$info['status'],
				'Top'		=>	$info['top'],
				'Addtime'	=>	$info['addtime'],
				'SmallPhoto'=>	picurls($info['photo'],'b600'),
			];
			$check[$info['user_id']] = $info['user_id'];
			$user = $this->userInfoDao()->getRecords($check);
			$other[] = $info['mien_id'];
			$otherinfo = $this->getinfoAction($other,$post['user_id']);

			if(!is_null($user[$info['user_id']])){
				$sex = ($user[$info['user_id']]['sex'] == Status::Sexboy) ? '男' : '女';
				$userinfo = [
					'RealName'=>$user[$info['user_id']]['real_name'],
					'UserImg'=>(!empty($user[$info['user_id']]['user_img']))?picurls($user[$info['user_id']]['user_img'],'b600'):[DK_DOMAIN.'/static/icons/common/basicprofile.jpg'],
					'Sex'=>$sex,
					'Age'=>getAge($user[$info['user_id']]['birthday']),
				];
				$arr['User'] = $userinfo;
			}else{
				$arr['User'] = [];
			}

			$arr['Info']['OtherStatus'] = ($otherinfo[$info['mien_id']]) ? Status::LikeFalse  : Status::LikeTrue;

			$this->jsonReturn($arr);
		}

		throw new CsException('获取失败', 400);
		
	}

	/**
	 * [mien_delAction 删除风采]
	 * @return [type] [description]
	 */
	public function mien_delAction()
	{
		$post = I('post.');
		$this->check_empty($post,['mien_id']);
		$where = [
			'mien_id'=>$post['mien_id'],
			'branch_id'=>$post['branch_id'],
		];
		$del = $this->model->where($where)->save(['is_delete'=>Status::YES]);
		if($del) $this->jsonReturn('删除成功');

		throw new CsException("删除失败",400);
		
	}

	/**
	 * [getinfoAction 获取点赞风采ID]
	 * @param  [type] $other  [description]
	 * @param  [type] $userid [description]
	 * @return [type]         [description]
	 */
	protected function getinfoAction($other,$userid)
	{
		$arr = [
			'content_id'=>['in',$other],
			'user_id'=>$userid,
			'like_type'=>1,
		];
		return M('like_log')->where($arr)->getField('content_id,user_id,add_time',true);
	}
}