<?php
namespace Home\Controller;
use Common\Basic\Status;
use Common\Basic\CsException;

class EvenController extends FController {
	
	public function __construct()
	{
		parent::__construct();
		$this->model = M('even');
	}

	/**
	 * [even_listAction 活动列表]
	 * @return [type] [description]
	 */
	public function even_listAction()
	{
		$newlist = [];
		$_POST['status'] = Status::YES;
		$list = $this->evenService()->evenlist();
//		dump($list);
		if($list['List'])
		{
			$newlist = [];
			$cancle = [
                '未取消',
			    '已取消',
            ];
			foreach($list['List'] as $k=>$v)
			{
				$newlist[$k] =[
					'EvenId'	=>  $v['even_id'],
					'Title'		=>  $v['title'],
					'Content'	=>  $v['content'],
					'Location'	=>  $v['location'],
					'StartTime'	=>  $v['starttime'],
					'PeopleNum'	=>  $v['peoplenum'],
					'PartakeNum'=>  $v['partakenum'],
					'Photo'		=>  picurls($v['photo']),
					'UserId'	=>  $v['user_id'],
					'BranchId'	=>  $v['branch_id'],
					'Status'	=>  $v['status'],
					'Top'		=>  $v['top'],
					'Addtime'	=>  $v['addtime'],
					'SmallPhoto'=>  picurls($v['photo'],'b600'),
                    'IsCancle'  => $v['is_cancle'],
                    'IsCancleLabel'=>$cancle[$v['is_cancle']],
				];
				$arr[$v['user_id']] = $v['user_id'];
				$other[] = $v['even_id'];
			}
			$user      = $this->userInfoDao()->getRecords($arr);
			$otherinfo = $this->getinfoAction($other,$post['user_id']);
			foreach($list['List'] as $key => $va)
			{
				if(!is_null($user[$va['user_id']]))
				{
					$sex = ($user[$va['user_id']]['sex'] == Status::Sexboy) ? '男' : '女';
					$birthday = strtotime($user[$va['user_id']]['birthday']);
					$age = date('Y',time()) - date('Y',$birthday);
					$age = date('m-d',time()) > date('m-d',$birthday) ? $age : $age - 1;
					$userinfo = [
						'RealName'=>$user[$va['user_id']]['real_name'],
						'UserImg'=>(!empty($user[$va['user_id']]['user_img']))?picurls($user[$va['user_id']]['user_img'],'b600'):[DK_DOMAIN.'/static/icons/common/basicprofile.jpg'],
						'Sex'=>$sex,
						'Age'=>$age,
					];
					$newlist[$key]['User'] = $userinfo;
				}else{
					$newlist[$key]['User'] = [];
				}
				$newlist[$key]['OtherStatus'] = ($otherinfo[$va['even_id']]) ? Status::LikeFalse  : Status::LikeTrue;
			}
		}
		$data = [
			'List'    =>$newlist,
			'Count'   =>$list['Count'],
		];
		$this->jsonReturn($data);				
	}

	/**
	 * [even_saveAction 新增活动]
	 * @return [type] [description]
	 */
	public function even_saveAction()
	{
		$post = I('post.');
		$check = [
			'标题不能为空'	  =>'title',
			'活动地点不能为空'=>'location',
			'活动时间不能为空'=>'start_time',
			'活动人数不能为空'=>'people_num',
			'活动内容不能为空'=>'content',
			'至少上传一张图片'=>'photo',
		];
		//判断是否有content
		$this->check_empty($post,$check);
		if(strtotime($post['start_time']) < time())
		{
			throw new CsException("活动时间不能小于当前时间");
			
		}
		if((int)$post['people_num'] <= 0)
		{
			throw new CsException('活动人数不能小于1人');
		}
		//添加内容
		$map = [
			'title'	 	=> $post['title'],
			'content' 	=> $post['content'],
			'photo'   	=> $post['photo'],
			'location' 	=> $post['location'],
			'starttime' => $post['start_time'],
			'peoplenum' => $post['people_num'],
			'user_id' 	=> $post['user_id'],
			'branch_id' => $post['branch_id'],
			'addtime' 	=> time(),
		];
		$add = $this->model->add($map);					
		if($add) $this->jsonReturn('添加成功');
		throw new CsException("添加失败");
	}

	/**
	 * [even_infoAction 活动详情]
	 * @return [type] [description]
	 */
	public function even_infoAction()
	{
		$post = I('post.');
		$check = [
			'活动ID不能为空'=>'even_id',
		];
        $this->check_empty($post,$check);
        $where = [
			'even_id'=>$post['even_id'],
			'status'=>Status::YES,
			'is_delete'=>Status::None,
		];
		$info = $this->model->where($where)->find();
        $cancle = [
            '未取消',
            '已取消',
        ];
		if($info)  
		{
			$other[] = $info['even_id'];
			$otherinfo = $this->getinfoAction($other,$post['user_id']);
			$arr['Info'] =[
				'EvenId'	=>	$info['even_id'],
				'Title'		=>	$info['title'],
				'Content'	=>	$info['content'],
				'Location'	=>	$info['location'],
				'StartTime'	=>	$info['starttime'],
				'PeopleNum'	=>	$info['peoplenum'],
				'PartakeNum'=>	$info['partakenum'],
				'Photo'		=>	picurls($info['photo']),
				'BranchId'	=>	$info['branch_id'],
				'Status'	=>	$info['status'],
				'Top'		=>	$info['top'],
				'Addtime'	=>	$info['addtime'],
				'SmallPhoto'=>	picurls($info['photo'],'b600'),
                'EvenIsCancle'  => $info['is_cancle'],
                'EvenIsCancleLabel'=>$cancle[$info['is_cancle']],
//                'PartakeIsCancle'=>$otherinfo[$info['even_id']]['is_cancle'],
//                'PartakeIsCancleLabel'=>$cancle[$otherinfo[$info['even_id']]['is_cancle']],
                //判断是否是自己发布的 如果是则返回true 否则则返回false
                'IsRelease'=>($info['user_id'] == $post['user_id']) ? Status::LikeTrue : Status::LikeFalse,
                //判断是否可以参与该活动
                'OtherStatus' => ($otherinfo[$info['even_id']]) ? Status::LikeFalse  : Status::LikeTrue,
                //报名ID
                'PartakeId'=>$otherinfo[$info['even_id']]['id'],
			];
			$this->jsonReturn($arr);
		}

		throw new CsException("获取失败");
	}

	/**
	 * [even_userAction 活动参加人数列表]
	 * @return [type] [List数组 如果空则为空数组]
	 */
	public function even_userAction()
	{
		$post = I('post.');
		$check = [
			'活动ID不能为空'=>'even_id',
		];
		$this->check_empty($post,$check);
		$where = [
			'content_id'=>$post['even_id'],
			'partake_type'=>2,
            'is_cancle'=>Status::None,
		];

		$newlist = [];
		
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
						'UserId'=>$v['user_id'],
						'UserName'=>$v['real_name'],
						'UserImg'=>(!empty($user[$v['user_id']]['user_img']))?picurls($user[$v['user_id']]['user_img'],'b600'):[DK_DOMAIN.'/static/icons/common/basicprofile.jpg'],
						'Sex'=>$sex,
						'Age'=>$age,
						'AddTime'=>date('Y-m-d H:i',$arr[$k]),
					];
					$branch[$v['branch_id']] = $v['branch_id'];
				}
				$branchinfo = $this->branchInfoDao()->getRecords($branch);
				foreach($user as $v)
				{
					$list[$v['user_id']]['BranchName'] = isset($branchinfo[$v['branch_id']])?$branchinfo[$v['branch_id']]['branch_name']:'';
				}

			}
			$newlist = array_values($list); 

		}

		$data = [
			'List'=>$newlist
		];
		$this->jsonReturn($data);
	}

	/**
	 * [even_joinlistAction 参与的活动列表]
	 * @return [type] [List数组 如果空则为空数组]
	 */
	public function even_joinlistAction()
	{
		$post = I('post.');
		$check = [
			'用户ID为空'=>'user_id',
		];
		$this->check_empty($post,$check);
		$where = [
			'user_id'=>$post['user_id'],
			'partake_type'=>2,
            'is_cancle'=>Status::None,
        ];

		$arr = M('partake')->where($where)->getField('content_id',true);

		if($arr)  
		{
			foreach($arr as $v)
			{
				$evenlist[$v] = $v;
			}
			$even = $this->getjoinlistAction($evenlist);
			if($even)
			{
				foreach ($even as $k=>$v) {
					$newlist[$k] =[
						'EvenId'	=>$v['even_id'],
						'Title'		=>$v['title'],
						'Content'	=>$v['content'],
						'Location'	=>$v['location'],
						'StartTime'	=>$v['starttime'],
						'PeopleNum'	=>$v['peoplenum'],
						'PartakeNum'=>$v['partakenum'],
						'Photo'		=>picurls($v['photo']),
						'UserId'	=>$v['user_id'],
						'BranchId'	=>$v['branch_id'],
						'Status'	=>$v['status'],
						'Top'		=>$v['top'],
						'Addtime'	=>$v['addtime'],
						'SmallPhoto'=>picurls($v['photo'],'b600'),
					];
				}
			}

		}

		$data = [
			'List'=>$newlist
		];
		$this->jsonReturn($data);
	}

	/**
	 * [even_delAction 删除活动]
	 * @return [type] [description]
	 */
	public function even_delAction()
	{
        $post = I('post.');
        $tj = [
			'活动ID不能为空'=>'even_id',
			'支部ID不能为空'=>'branch_id',
		];
		$this->check_empty($post,$tj);
		$where = [
			'even_id'=>$post['even_id'],
			'branch_id'=>$post['branch_id'],
            'user_id'=>$post['user_id'],
            'is_delete'=>Status::None,
        ];
		$del = $this->model->where($where)->save(['is_delete'=>Status::YES]);
		if($del) $this->jsonReturn('删除成功');

		$data = [
			'Error'=>1004,
			'Message'=>'该ID不存在或已删除成功',
		];
		$this->jsonReturn($data);
	}

    /**
     * [even_cancleAction 取消活动]
     * @return [type] [description]
     */
    public function even_cancleAction()
    {
        $post = I('post.');
        $tj = [
            '活动ID不能为空'=>'even_id',
            '支部ID不能为空'=>'branch_id',
            '取消原因不能为空'=>'reason',
        ];
        $this->check_empty($post,$tj);
        $where = [
            'even_id'=>$post['even_id'],
            'branch_id'=>$post['branch_id'],
            'user_id'=>$post['user_id'],
            'is_delete'=>Status::None,
        ];
        $map = [
            'is_cancle'=>Status::YES,
            'reason'=>$post['reason'],
        ];
        $cancle = $this->model->where($where)->save($map);
        if($cancle) $this->jsonReturn('取消成功');

        $data = [
            'Error'=>1004,
            'Message'=>'该ID不存在或已取消成功',
        ];
        $this->jsonReturn($data);
    }

    /**
     * [even_editAction 修改活动]
     * @return [type] [description]
     */
    public function even_editAction()
    {
        $post = I('post.');
        $check = [
            '标题不能为空'	  =>'title',
            '活动地点不能为空'=>'location',
            '活动时间不能为空'=>'start_time',
            '活动人数不能为空'=>'people_num',
            '活动内容不能为空'=>'content',
            '至少上传一张图片'=>'photo',
        ];
        $this->check_empty($post,$check);
        if(strtotime($post['start_time']) < time())
        {
            throw new CsException("活动时间不能小于当前时间");
        }
        if((int)$post['people_num'] <= 0)
        {
            throw new CsException('活动人数不能小于1人');
        }
        $where = [
            'even_id'=>$post['even_id'],
            'branch_id'=>$post['branch_id'],
            'user_id'=>$post['user_id'],
            'is_delete'=>Status::None,
            'is_cancle'=>Status::None,
        ];
        //修改内容
        $map = [
            'title'	 	=> $post['title'],
            'content' 	=> $post['content'],
            'photo'   	=> $post['photo'],
            'location' 	=> $post['location'],
            'starttime' => $post['start_time'],
            'peoplenum' => $post['people_num'],
            'user_id' 	=> $post['user_id'],
            'branch_id' => $post['branch_id'],
            'addtime' 	=> time(),
        ];
        $save = $this->model->where($where)->save($map);
        if($save) $this->jsonReturn('修改成功');

        throw new CsException('修改失败');
    }

	/**
	 * [getinfoAction 批量获取用户的ID]
	 * @param  [type] $other  [description]
	 * @param  [type] $userid [description]
	 * @return [type]         [description]
	 */
	protected function getinfoAction($other,$userid)
	{
		$arr = [
			'content_id'=>['in',$other],
			'user_id'=>$userid,
			'partake_type'=>2,
            'is_cancle'=>Status::None,

		];
		return M('partake')->where($arr)->getField('content_id,user_id,id,add_time,is_cancle',true);
	}

	/**
	 * [getjoinlistAction 批量获取参与的活动]
	 * @param  [type] $other [description]
	 * @return [type]        [description]
	 */
	protected function getjoinlistAction($other)
	{
		$arr = [
			'even_id'=>['in',$other],
			'partake_type'=>2,
			'status'=>Status::YES,
			'is_delete'=>Status::None,
		];
		return M('even')->where($arr)->select();
	}


	private function evenService()
	{
		return D('Even','Service');
	}
}