<?php
namespace Adminapi\Controller;
use Common\Basic\CsException;
use Common\Basic\Status;
class MienController extends FController {

	protected $model;

	public function __construct()
	{
		parent::__construct();
		$this->model = M('partymien');
	}

    /**
     * 风采列表
     */
	public function mien_listAction()
	{
		$post     = I('post.');
		$page     = '';
		$pagesize = '20';
		$where    = [
			'branch_id' =>$post['branch_id'],
			'is_delete' =>Status::None,
		];
		if(isset($post['p']) || isset($post['page']) ) $page = isset($post['p'])?$post['p']:$post['page'];
		if(isset($post['pagesize'])) $pagesize = $post['pagesize'];
		//搜索条件 是否推荐
		if(isset($post['top']) && !empty($post['top']))
		{
				//获取所有推荐的ID
				$top = $this->gettop(Status::CollectTypeMien);
				if(is_null($top)) $top = [0];

				if($post['top'] == Status::YES)
				{
					$where['mien_id'] = ['in',$top];
				}else{
					$where['mien_id'] = ['not in',$top];
				}
		}
		$count = $this->model->where($where)->count();
		$list  = $this->model->where($where)->order('mien_id desc')->page($page,$pagesize)->select();
		$newlist = [];
		if($count > 0 && !is_null($list)){

			foreach($list as $k=>$v)
			{
				$newphoto = [];
				$mk = [];
				if(!empty($v['photo']))
				{
					$photo = explode(',',$v['photo']);
					foreach($photo as $ke=>$val)
					{
						$newphoto[$ke] = DK_DOMAIN.'/upload/'.$val;
						$mk[$ke]       = picurl($val,'b600');
					}
				}
				$newlist[$k] =[
					'MienId'     =>	$v['mien_id'],
					'Content'    =>	base64_decode($v['content']),
					'Photo'      =>	$newphoto,
					'Readnum'    =>	$v['readnum'],
					'Likenum'    =>	$v['likenum'],
					'UserId'     =>	$v['user_id'],
					'BranchId'   =>	$v['branch_id'],
					'Status'     =>	$v['status'],
					'Forward'    =>	$v['forward_num'],
					'Addtime'    =>	$v['addtime'],
					'SmallPhoto' =>	$mk,
				];
				$arr[$v['user_id']]      = $v['user_id'];
				$branch[$v['branch_id']] = $v['branch_id'];
				//推荐条件
				$tops[$v['mien_id']]     = $v['mien_id'];
			}
			$user = $this->userInfoDao()->getRecords($arr);
			$branch = $this->branchInfo()->getRecords($branch);
			//判断推荐
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeMien,'content_id'=>$tops]);

			foreach($list as $key => $va)
			{
				// dump($user[$va['user_id']]);
				// dump($newlist[$key]);
				if(!is_null($user[$va['user_id']]))
				{
					$sex      = ($user[$va['user_id']]['sex'] == Status::Sexboy) ? '男' : '女';
					$userinfo = [
						'RealName' =>$user[$va['user_id']]['real_name'],
						'UserImg'  =>getUserImg($user[$va['user_id']]['user_img']),
						'Sex'      =>$sex,
						'Age'      =>getAge($user[$va['user_id']]['birthday']),
					];
					$newlist[$key]['User'] = $userinfo;
				}else{
					$newlist[$key] = [];
				}

				if(!is_null($branch[$va['branch_id']]))
				{
					$BranchInfo = [
						'BranchName'=>$branch[$va['branch_id']]['branch_name'],
					];
					$newlist[$key]['Branch'] = $BranchInfo;
				}else{
					$newlist[$key]['Branch'] = [];
				}

				//判断如果查不出用户则不显示内容
				if($newlist[$key]['Branch']==[] && $newlist[$key]['User']==[])
				{
					unset($newlist[$key]);
					$count--;
				}else{
					//判断推荐
					$newlist[$key]['Top'] = (!is_null($top[$va['mien_id']])) ? Status::YES : Status::NO ;
				}
			}
		}

		$data = [
			'List'     =>$newlist,
			'Count'    =>$count,
			'Pagesize' =>$pagesize,
			'Display'  =>2,
		];
		$this->jsonReturn($data);
	}

    /**
     * 风采添加和修改
     */
	public function mien_saveAction()
	{
		$post = I('post.');
		if(isset($post['content']))
		{

			if(isset($post['mien_id']) && !empty($post['mien_id'])){
				//判断是否有content
				$this->check_empty($post,['content','readnum','likenum']);
				//修改内容
				$map = [
					'content' => base64_encode($post['content']),
					'photo'   => $post['photo'],
					'readnum' => $post['readnum'],
					'likenum' => $post['likenum'],
				];
				$where = [
					'mien_id' => $post['mien_id'],
				];
				$edit = $this->model->where($where)->save($map);
				if($edit) $this->jsonReturn('修改成功');
				$data = [
					'Error'=>1003,
					'Message'=>'修改失败',
				];
				$this->jsonReturn($data);
			}else{
				//判断是否有content
				$this->check_empty($post,['content','user_id','branch_id']);
				//添加内容
				$map = [
					'content'   => base64_encode($post['content']),
					'photo'     => $post['photo'],
					'user_id'   => $post['user_id'],
					'readnum'   => $post['readnum'],
					'likenum'   => $post['likenum'],
					'branch_id' => $post['branch_id'],
					'addtime'   => time(),
				];
				$add = $this->model->add($map);					
				if($add) $this->jsonReturn('添加成功');
				$data = [
					'Error'   =>1002,
					'Message' =>'添加失败',
				];
				$this->jsonReturn($data);
			}
			
		}else{
			$data = [
				'Display' =>1,
				'Message' =>'暂无修改',	
			];
			$post = I('post.');
				$user = M('user_info')->field('user_id,real_name')->select();
				foreach($user as $k=>$v)
				{
					$data['User'][$k] = [
						'UserId'   =>$v['user_id'],
						'UserName' =>$v['real_name'],
					];
				}
			if(isset($post['mien_id']) && !empty($post['mien_id']))
			{
				$info = $this->mien_infoAction($post);
				$data['Info'] = $info;
			}
			$this->jsonReturn($data);
		}
	}

    /**
     * 风采回收站列表
     */
	public function recovery_listAction()
    {
        $post     = I('post.');
        $page     = '';
        $pagesize = '20';
        $where    = [
            'branch_id' =>$post['branch_id'],
            'is_delete' =>Status::YES,
        ];
        if(isset($post['p']) || isset($post['page']) ) $page = isset($post['p'])?$post['p']:$post['page'];
        if(isset($post['pagesize'])) $pagesize = $post['pagesize'];
        //搜索条件 是否推荐
        if(isset($post['top']) && !empty($post['top']))
        {
            //获取所有推荐的ID
            $top = $this->gettop(Status::CollectTypeMien);
            if(is_null($top)) $top = [0];

            if($post['top'] == Status::YES)
            {
                $where['mien_id'] = ['in',$top];
            }else{
                $where['mien_id'] = ['not in',$top];
            }
        }
        $count = $this->model->where($where)->count();
        $list  = $this->model->where($where)->order('mien_id desc')->page($page,$pagesize)->select();
        $newlist = [];
        if($count > 0 && !is_null($list)){

            foreach($list as $k=>$v)
            {
                $newphoto = [];
                $mk = [];
                if(!empty($v['photo']))
                {
                    $photo = explode(',',$v['photo']);
                    foreach($photo as $ke=>$val)
                    {
                        $newphoto[$ke] = DK_DOMAIN.'/upload/'.$val;
                        $mk[$ke]       = picurl($val,'b600');
                    }
                }
                $newlist[$k] =[
                    'MienId'     =>	$v['mien_id'],
                    'Content'    =>	base64_decode($v['content']),
                    'Photo'      =>	$newphoto,
                    'Readnum'    =>	$v['readnum'],
                    'Likenum'    =>	$v['likenum'],
                    'UserId'     =>	$v['user_id'],
                    'BranchId'   =>	$v['branch_id'],
                    'Status'     =>	$v['status'],
                    'Forward'    =>	$v['forward_num'],
                    'Addtime'    =>	$v['addtime'],
                    'SmallPhoto' =>	$mk,
                ];
                $arr[$v['user_id']]      = $v['user_id'];
                $branch[$v['branch_id']] = $v['branch_id'];
                //推荐条件
                $tops[$v['mien_id']]     = $v['mien_id'];
            }
            $user = $this->userInfoDao()->getRecords($arr);
            $branch = $this->branchInfo()->getRecords($branch);
            //判断推荐
            $top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeMien,'content_id'=>$tops]);

            foreach($list as $key => $va)
            {
                // dump($user[$va['user_id']]);
                // dump($newlist[$key]);
                if(!is_null($user[$va['user_id']]))
                {
                    $sex      = ($user[$va['user_id']]['sex'] == Status::Sexboy) ? '男' : '女';
                    $userinfo = [
                        'RealName' =>$user[$va['user_id']]['real_name'],
                        'UserImg'  =>getUserImg($user[$va['user_id']]['user_img']),
                        'Sex'      =>$sex,
                        'Age'      =>getAge($user[$va['user_id']]['birthday']),
                    ];
                    $newlist[$key]['User'] = $userinfo;
                }else{
                    $newlist[$key] = [];
                }

                if(!is_null($branch[$va['branch_id']]))
                {
                    $BranchInfo = [
                        'BranchName'=>$branch[$va['branch_id']]['branch_name'],
                    ];
                    $newlist[$key]['Branch'] = $BranchInfo;
                }else{
                    $newlist[$key]['Branch'] = [];
                }

                //判断如果查不出用户则不显示内容
                if($newlist[$key]['Branch']==[] && $newlist[$key]['User']==[])
                {
                    unset($newlist[$key]);
                    $count--;
                }else{
                    //判断推荐
                    $newlist[$key]['Top'] = (!is_null($top[$va['mien_id']])) ? Status::YES : Status::NO ;
                }
            }
        }

        $data = [
            'List'     =>$newlist,
            'Count'    =>$count,
            'Pagesize' =>$pagesize,
            'Display'  =>2,
        ];
        $this->jsonReturn($data);
    }

    /**
     * 风采回收站内容拉出
     */
    public function recovery_changeAction()
    {
        $post = I('post.');
        $params = [
            'is_delete'=>Status::YES,
            'mien_id' => $post['mien_id'],
            'branch_id'=>$post['branch_id'],
        ];
        $count = $this->model->where($params)->count();
        if($count > 0)
        {
            $map = [
                'is_delete'=>Status::None,
            ];
            $save = $this->model->where($params)->save($map);
            if($save)
            {
                $this->jsonReturn('恢复成功');
            }else{
                throw new CsException('恢复失败，请稍后再试');
            }
        }else{
            throw new CsException('暂无该内容');
        }
    }


    /**
     * 修改风采状态
     */
	public function mien_changeAction()
	{	
		$post = I('post.');
		switch($post['type'])
		{
			case 'readnum':
				//type修改类型 num修改数量 mienid修改ID savetype增加或者减少(setInc/setDec)
				$this->check_empty($post,['num','mien_id','savetype']);
				if($post['savetype']=='setInc' || $post['savetype'] == 'setDec') 
				{
					$savetype = $post['savetype'];
					$where    = [
						'mien_id'=>$post['mien_id'],
					];

					//判断减少后的值是否小于0 如果是则不减
					$checknum = true;
					if($savetype == 'setDec')  $checknum = ($this->model->where($where)->getfield($post['type'])-$post['num'])>=0;
					if($checknum)
					{
						$save = $this->model->where($where)->$savetype($post['type'],$post['num']); 
						if($save) $this->jsonReturn('数据更新成功');
					}
				}

				$data = [
					'Error'   =>1003,
					'Message' =>'没更新任何数据',
				];
				$this->jsonReturn($data);
			break;

			case 'likenum':
				//type修改类型 num修改数量 mienid修改ID savetype增加或者减少(setInc/setDec)
				$this->check_empty($post,['num','mien_id','savetype']);
				if($post['savetype']=='setInc' || $post['savetype'] == 'setDec') 
				{
					$savetype = $post['savetype'];
					$where = [
						'mien_id'=>$post['mien_id'],
					];

					//判断减少后的值是否小于0 如果是则不减
					$checknum = true;
					if($savetype == 'setDec')  $checknum = ($this->model->where($where)->getfield($post['type'])-$post['num'])>=0;
					if($checknum)
					{
						$save = $this->model->where($where)->$savetype($post['type'],$post['num']); 
						if($save) $this->jsonReturn('数据更新成功');
					}
				}

				$data = [
					'Error'   =>1003,
					'Message' =>'没更新任何数据',
				];
				$this->jsonReturn($data);
			break;	

			case 'status':
				$map     = 'status';
				$message = ['修改成功:当前状态已审核','修改成功:当前状态未审核'];
                break;

			case 'top':
				$arr = [
					'content_id' =>$post['mien_id'],
					'top_type'   =>Status::CollectTypeMien,
				];
				$this->changetop($arr);
			break;

			default:
				$data = [
					'Error'   =>1003,
					'Message' =>'操作失败',
				];
				$this->jsonReturn($data);
			break;
		}
			$where = [
				'mien_id'=>$post['mien_id'],
				'branch_id'=>$post['branch_id'],
			];
			$old = $this->model->where($where)->getfield($map);
			$new = ($old == Status::YES) ? Status::NO : Status::YES;
			$update = $this->model->where($where)->save([$map=>$new]);
			if($update) 
			{
				if($new==Status::YES)
				{
					$data = [
						'Message' =>$message[0],
						'Code'    =>Status::YES
					];
					$this->jsonReturn($data);
				}else if($new==Status::NO){
					$data = [
						'Message' =>$message[1],
						'Code'    =>Status::NO
					];
					$this->jsonReturn($data);
				}
			}
			throw new CsException('修改失败',400);

	}

    /**
     * @return array
     * 风采详情
     */
	public function mien_infoAction()
	{
		$get = I('post.');
		$this->check_empty($get,['mien_id']);
		$info = $this->model->where(['mien_id = '. $get['mien_id']])->find();
		if($info)  
		{
			$arr =[
				'MienId'  =>$info['mien_id'],
				'Content' =>base64_decode($info['content']),
				'Photo'   =>$info['photo'],
				'Readnum' =>$info['readnum'],
				'Likenum' =>$info['likenum'],
				'UserId'  =>$info['user_id'],
				'Addtime' =>$info['addtime'],
			];

			return $arr;
		}
		throw new CsException('获取失败',400);
	}

    /**
     * 删除风采
     */
	public function mien_delAction()
	{
		$post = I('post.');
		$this->check_empty($post,['mien_id','branch_id']);
		$where = [
			'mien_id'   =>$post['mien_id'],
			'branch_id' =>$post['branch_id'],
		];
        $map = [
		    'is_delete' => Status::YES,
        ];
        $del = $this->model->where($where)->save($map);
        if($del) $this->jsonReturn('删除成功');

        throw new CsException('删除失败',400);
	}
}