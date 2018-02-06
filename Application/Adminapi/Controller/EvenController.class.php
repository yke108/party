<?php
namespace Adminapi\Controller;
use Common\Basic\Status;
use Common\Basic\CsException;

class EvenController extends FController {


	public function __construct()
	{
		parent::__construct();
		$this->model = M('even');
	}

	/**
	 * [even_listAction 活动列表接口]
	 * @return [type] [description]
	 */
	public function even_listAction()
	{
		$newlist = [];
		$list = $this->evenService()->evenlist();
		if($list['List'])
		{
			foreach($list['List'] as $k=>$v)
			{

				$newlist[$k] =[
					'EvenId'     =>	$v['even_id'],
					'Title'      =>	$v['title'],
					'Content'    =>	$v['content'],
					'Location'   =>	$v['location'],
					'StartTime'  =>	$v['starttime'],
					'PeopleNum'  =>	$v['peoplenum'],
					'PartakeNum' =>	$v['partakenum'],
					'Photo'      =>	picurls($v['photo']),
					'BranchId'   =>	$v['branch_id'],
					'Status'     =>	$v['status'],
					'Addtime'    =>	$v['addtime'],
					'SmallPhoto' =>	picurls($v['photo'],'b600'),
				];
				$arr[$v['user_id']] = $v['user_id'];
				//推荐条件
				$tops[$v['even_id']] = $v['even_id'];
			}
			//获取用户信息
			$user = $this->userInfoDao()->getRecords($arr);
			//判断推荐
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeActivity,'content_id'=>$tops]);
			foreach($list['List'] as $key => $va)
			{
				if(!is_null($user[$va['user_id']]))
				{
					$sex = ($user[$va['user_id']]['sex'] == Status::Sexboy) ? '男' : '女';
					$birthday = strtotime($user[$va['user_id']]['birthday']);
					$age = date('Y',time()) - date('Y',$birthday);
					$age = date('m-d',time()) > date('m-d',$birthday) ? $age : $age - 1;
					$userinfo = [
						'RealName' =>$user[$va['user_id']]['real_name'],
						'UserImg'  =>(!empty($user[$va['user_id']]['user_img']))?picurls($user[$va['user_id']]['user_img'],'b600'):[DK_DOMAIN.'/static/icons/common/basicprofile.jpg'],
						'Sex'      =>$sex,
						'Age'      =>$age,
					];
					$newlist[$key]['User'] = $userinfo;

					//判断推荐
					$newlist[$key]['Top'] = (!is_null($top[$va['even_id']])) ? Status::YES : Status::NO ;
				}else{
					$newlist[$key]['User'] = (object)[];
				}
			}
		}
		$data = [
			'List'    =>$newlist,
			'Count'   =>$list['Count'],
			'Display' =>1,
		];
		$this->jsonReturn($data);				
	}
	/**
	 * [even_saveAction 新增或修改活动接口（挂起）]
	 * @return [type] [description]
	 */
	public function even_saveAction()
	{
		$post = I('post.');
		// // dump($post);
		// if(isset($post['content']))
		// {

			// if(isset($post['even_id']) && !empty($post['even_id'])){
					$check = [
						// 'title',
						// 'content',
						// 'location',
						// 'branch_id',
						// 'start_time',
						// 'people_num',
						'活动ID不能为空' =>'even_id',
						'审核状态不能为空' =>'status',
						'首页推荐不能为空' =>'top',
					];
				//判断是否有空
				$this->check_empty($post,$check);
				//修改内容
				$map = [
					// 'title'      => $post['title'],
					// 'content'    => $post['content'],
					// 'photo'      => $post['photo'],
					// 'location'   => $post['location'],
					// 'starttime'  => $post['start_time'],
					// 'peoplenum'  => $post['people_num'],
					// 'partakenum' => $post['partake_num'],
					'status'        =>$post['status'],
					// 'top'        =>$post['top'],
				];
				$where = [
					'even_id' => $post['even_id'],
				];
				$edit = $this->model->where($where)->save($map);

				$where = [
					'top_type'   =>Status::CollectTypeActivity,
					'content_id' =>$post['even_id'],
					'top'        =>$post['top'],
				];

				//修改推荐状态
				$change = $this->changetop($where);
				if($change || $edit){
					$this->jsonReturn('修改成功');
				}else{
					$this->jsonReturn('修改失败');
				}

			
			// }else{
			// 	//判断是否有content
			// 	$this->check_empty($post,['title','content','location','branch_id','start_time','people_num']);
			// 	//添加内容
			// 	$map = [
			// 		'content' => $post['content'],
			// 		'title' => $post['title'],
			// 		'photo'   => $post['photo'],
			// 		'location' => $post['location'],
			// 		'starttime' => $post['start_time'],
			// 		'peoplenum' => $post['people_num'],
			// 		'partakenum' => $post['partake_num'],
			// 		'user_id' => $post['admin_id'],
			// 		'branch_id' => $post['branch_id'],
			// 		'addtime' => time(),
			// 	];
			// 	$add = $this->model->add($map);					
			// 	if($add) $this->jsonReturn('添加成功');
			// 	$data = [
			// 		'Error'=>1002,
			// 		'Message'=>'添加失败',
			// 	];
			// 	$this->jsonReturn($data);
			// }
			
		// }else{
		// 	$data = [
		// 		'Display'=>1,
		// 		'Message'=>'暂无修改',	
		// 	];
		// 	$post = I('post.');
		// 	if(isset($post['even_id']) && !empty($post['even_id']))
		// 	{
		// 		$info = $this->even_infoAction($post);
		// 		$data['Info'] = $info;
		// 	}
		// 	$this->jsonReturn($data);
		// }
	}

	/**
	 * [even_changeAction 活动状态修改接口]
	 * @return [type] [description]
	 */
	public function even_changeAction()
	{	
		$post = I('post.');
		//
		// $post['branch_id'] = 1;
		//
		$check = [
			'修改类型为空'  =>'type',
			'活动ID为空'  	=>'even_id',
			'支部ID为为空' 	=>'branch_id',
		];
		$this->check_empty($post,$check);
		switch($post['type'])
		{

			case 'status':
				$map     = 'status';
				$message = ['修改成功:当前状态已审核','修改成功:当前状态未审核'];
			break;

			case 'top':
				$arr = [
					'content_id' =>$post['even_id'],
					'top_type'   =>Status::CollectTypeActivity,
				];
				$this->changetop($arr);
			break;
			default:
				throw new CsException("修改类型不正确", 400);
			break;
		}
			$where = [
				'even_id'   =>$post['even_id'],
				'branch_id' =>$post['branch_id'],
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
	 * [even_userAction 活动参加人数列表]
	 * @return [type] [List数组 如果空则为空数组]
	 */
	public function even_userAction()
	{
		$post = I('post.');
		// $check = [
		// 	'活动ID为空'=>'even_id',
		// ];
		// $this->check_empty($post,$check);
		$where = [
			'content_id'   =>$post['even_id'],
			'partake_type' =>2,
		];

		$newlist = [];
		$count = M('partake')->where($where)->count();
		$arr = M('partake')->where($where)->getField('user_id,add_time',true);

		if($arr)  
		{
			foreach($arr as $k=>$v)
			{
				$userlist[$k] = $k;
			}
			$user = $this->userInfoDao()->getRecords($userlist);
			if($user)
			{
				foreach($user as $k=>$v)
				{
					$sex = ($v['sex'] == Status::Sexboy) ? '男' : '女';
					$birthday = strtotime($v['birthday']);
					$age = date('Y',time()) - date('Y',$birthday);
					$age = date('m-d',time()) > date('m-d',$birthday) ? $age : $age - 1;
					$list[$v['user_id']] = [
						'UserId'   =>$v['user_id'],
						'UserName' =>$v['real_name'],
						'UserImg'  =>(!empty($user[$v['user_id']]['user_img']))?picurls($user[$v['user_id']]['user_img'],'b600'):[DK_DOMAIN.'/static/icons/common/basicprofile.jpg'],
						'Sex'      =>$sex,
						'Age'      =>$age,
						'AddTime'  =>date('Y-m-d H:i',$arr[$k]),
					];
					$branch[$v['branch_id']] = $v['branch_id'];
				}
				$branchinfo = $this->branchInfo()->getRecords($branch);
				foreach($user as $v)
				{
					$list[$v['user_id']]['BranchName'] = isset($branchinfo[$v['branch_id']])?$branchinfo[$v['branch_id']]['branch_name']:'';
				}
				$newlist = array_values($list);

			}

		}

		$data = [
			'List'    =>$newlist,
			'Display' =>1,
			'Count'   =>$count,
		];
		$this->jsonReturn($data);
	}
	/**
	 * [even_infoAction 活动详情（挂起）]
	 * @return [type] [description]
	 */
	public function even_infoAction()
	{
		$post = I('post.');
		$this->check_empty($post,['even_id']);
		$where = [
			'even_id'=>$post['even_id'],
		];
		$info = $this->model->where($where)->find();
		if($info)  
		{
			if(!empty($info['photo']))
			{
				$newphoto = DK_DOMAIN.'/upload/'.$info['photo'];
				$mk = picurl($info['photo'],'b600');
			}
			$arr =[
				'EvenId'     =>$info['even_id'],
				'Title'      =>$info['title'],
				'Content'    =>$info['content'],
				'Location'   =>$info['location'],
				'StartTime'  =>$info['starttime'],
				'PeopleNum'  =>$info['peoplenum'],
				'PartakeNum' =>$info['partakenum'],
				'Photo'      =>$newphoto,
				'PhotoValue' =>$info['photo'],
				'BranchId'   =>$info['branch_id'],
				'Status'     =>$info['status'],
				'Top'        =>$info['top'],
				'Addtime'    =>$info['addtime'],
				'SmallPhoto' =>$mk,
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
	 * [even_delAction 活动删除]
	 * @return [type] [description]
	 */
	public function even_delAction()
	{
		$post = I('post.');
		$check = [
			'活动ID不能为空' =>'even_id',
			'支部ID不能为空' =>'branch_id',
		];
		$this->check_empty($post,$check);
		$where = [
			'even_id'   =>$post['even_id'],
			'branch_id' =>$post['branch_id'],
		];
		$del = $this->model->where($where)->save(['is_delete'=>1]);
		$where = [
			'top_type'   =>Status::CollectTypeActivity,
			'content_id' =>$post['even_id'],
			'top'        =>Status::NO,
		];
		//修改推荐状态
		$change = $this->changetop($where);
		if($del) $this->jsonReturn('删除成功');

		throw new CsException("删除失败", 400);
		
	}
	
	private function evenService()
	{
		return D('Even','Service');
	}
}
