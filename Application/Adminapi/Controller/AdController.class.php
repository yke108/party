<?php
namespace Adminapi\Controller;
use Common\Basic\Status;
use Common\Basic\CsException;

class AdController extends FController {

	protected $model;
	protected $data;

	public function __construct()
	{
		parent::__construct();
		$this->model = M('ad_info');
		//设置广告摆放位置
		$this->data = [
				Status::CollectTypeActivity=>'活动',
				Status::CollectTypeLxyz=>'两学一做',
				Status::CollectTypeSpecial=>'党建专题',

		];
		$this->location = [
			'home'=>'首页',
			'study'=>'学习',
		];
	}

	/**
	 * [ad_listAction 广告列表接口]
	 * @return [type] [description]
	 */
	public function ad_listAction()
	{
		$post = I('post.');


		$page = '1';
		$pagesize = '20';
		$where = [
			// 'branch_id'=>$post['branch_id'],
		];
		if(isset($post['page'])) $page = $post['page'];//12
		if(isset($post['pagesize']) && $post['pagesize'] > 0) $pagesize = $post['pagesize'];
		// //搜索条件
		if(isset($post['search']) && !empty($post['search'])) $where['ad_title'] = ['like','%'.$post['search'].'%'];
		if(isset($post['status']) && !empty($post['status'])) $where['enabled'] = $post['status'];

		$count = $this->model->where($where)->count();
		if($count > 0)
		{
			$list = $this->model->where($where)->page($page,$pagesize)->order('sort_order')->select();
		}
		$newlist = [];
		if($list)
		{
			foreach($list as $k=>$v)
			{
				$location = $this->location[$v['position_code']];
				$sql = '';
				$newlist[$k] =[
					'AdId'			=>$v['ad_id'],
					'PositionCode'	=>$v['position_code'],
					'AdType'		=>$v['ad_type'],
					'Location'		=>$location,
					'AdTitle'		=>$v['ad_title'],
					'AdValue'		=>$v['ad_value'],
					'Picture'		=>$v['ad_picture'],
					'StartTime'		=>date('Y-m-d H:i:s',$v['start_time']),
					'EndTime'		=>date('Y-m-d H:i:s',$v['end_time']),
					'SortOrder'		=>$v['sort_order'],
					'ClickCount'	=>$v['click_count'],
					'Enabled'		=>$v['enabled'],
					//判断过期时间是否大于当前时间
					'Over'			=>($v['end_time'] > time()) ? Status::YES : Status::NO
				];

				switch($v['ad_type'])
				{
					//活动
					case Status::CollectTypeActivity:
						$sql = 'even';
						$where = ['even_id'=>$v['ad_value']];
					break;
					//两学一做
					case Status::CollectTypeLxyz:
						$sql = 'lxyz';
						$where = ['id'=>$v['ad_value']];
					break;
					//党建专题
					case Status::CollectTypeSpecial:
						$sql = 'special';
						$where = ['id'=>$v['ad_value']];
					break;
				}
				if($sql){
					$newlist[$k]['ValueName'] = M($sql)->where($where)->getfield('title');
				}
				//推荐条件
				$tops[$v['ad_id']] = $v['ad_id'];
			}
			// //判断推荐
			$top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeAd,'content_id'=>$tops]);
			foreach($list as $key => $va)
			{
				//判断推荐
				$newlist[$key]['Top'] = (!is_null($top[$va['ad_id']])) ? Status::YES : Status::NO ;
			}

		}
		
		$data = [
			'List'       =>$newlist,
			'Count'      =>$count,
			'Pagesize'   =>$pagesize,
			'Display'    =>2,
			'AdLocation' =>$this->location,
			'AdData'     =>$this->data,
		];
		$this->jsonReturn($data);
	}
	/**
	 * [notice_saveAction 公告添加和修改接口]
	 * @return [type] [description]
	 */
	public function ad_saveAction()
	{
		$post = I('post.');
		if(isset($post['Value']))
		{

			$check = [
				'广告标题不能为空'   =>'Title',
				'广告链接不能为空'   =>'Value',
				'开始结束日期不能为空' =>'Date',
				'排序值不能为空'    =>'SortOrder',
				'审核状态不能为空'   =>'Enabled',
				'首页显示不能为空'   =>'Top',
			];
			//判断是否为空
			$this->check_empty($post,$check);
			if($post['PositionCode'] =='null') throw new CsException("广告位置不能为空", 400);
			if($post['AdType']       =='null') throw new CsException("广告类型不能为空", 400);
			if(!$post['photo']) throw new CsException("至少选择一张图片", 400);
			if($post['Enabled']!=Status::YES &&  $post['Enabled']!=Status::NO) throw new CsException("审核状态不正确", 400);
			
			//处理时间
			$date = explode('//',$post['Date']);
			//内容
			$map = [
				'position_code' => $post['PositionCode'],
				'ad_title' 		=> $post['Title'],
				'ad_value' 		=> $post['Value'],
				'start_time'	=> strtotime($date[0]),
				'end_time' 		=> strtotime($date[1]),
				'sort_order' 	=> $post['SortOrder'],
				'ad_type' 		=> $post['AdType'],
				'ad_picture' 	=> $post['photo'],
				'enabled'		=> $post['Enabled'],
			];

			if(isset($post['AdId']) && !empty($post['AdId'])){
				$where = [
					'ad_id' => $post['AdId'],
				];
				$edit = $this->model->where($where)->save($map);
				$arr = [
					'content_id'=>$post['AdId'],
					'top_type'=>Status::CollectTypeAd,
					'top'=>$post['Top'],
				];
				$change = $this->changetop($arr);
				if($edit || $change) $this->jsonReturn('修改成功');
				$data = [
					'Error'=>1003,
					'Message'=>'修改失败',
				];
			}else{
				$add = $this->model->add($map);
				if($post['Top']==Status::YES){
					$arr = [
						'content_id'=>$add,
						'top_type'=>Status::CollectTypeAd,
						'top'=>$post['Top'],
					];
					$change = $this->changetop($arr);
				}
				if($add) $this->jsonReturn('添加成功');
				$data = [
					'Error'=>1002,
					'Message'=>'添加失败',
				];
			}
			$this->jsonReturn($data);
			
		}else{
			$data = [
				'Display'=>1,
			];
			$post = I('post.');
			//判断是否是编辑  如果是则去INFO里面拿内容
			if(isset($post['AdId']) && !empty($post['AdId']))
			{
				$info = $this->ad_infoAction($post);
				$data['Info'] = $info;
			}
			$data['AdData'] = $this->data;
			$data['AdLocation'] = $this->location;
			$this->jsonReturn($data);
		}
	}
	/**
	 * [notice_changeAction 公告状态修改接口]
	 * @return [type] [description]
	 */
	public function ad_changeAction()
	{	
		$post = I('post.');
		$check = [
			'修改类型为空' =>'type',
			'广告ID不能为空' =>'id',
		];
		$this->check_empty($post,$check);

		switch($post['type'])
		{

			case 'status':
				$map = 'enabled';
				$message = ['修改成功:当前状态已审核','修改成功:当前状态未审核'];
			break;

			case 'top':
				$arr = [
					'content_id'=>$post['id'],
					'top_type'=>Status::CollectTypeAd,
				];
				$this->changetop($arr);
			break;

			default:
				throw new CsException("修改类型不正确", 400);
			break;
		}
			$where = [
				'ad_id'=>$post['id'],
			];
			$old = $this->model->where($where)->getfield($map);
			if(!$old) throw new CsException("广告ID不存在", 400);

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
	public function ad_infoAction()
	{
		$post = I('post.');
		$this->check_empty($post,['AdId']);
		$where = [
			'ad_id'=>$post['AdId'],
			// 'enabled'=>Status::YES,
		];
		$info = $this->model->where($where)->find();
		if($info)  
		{
			$arr =[
				'AdId'			=>$info['ad_id'],
				'PositionCode'	=>$info['position_code'],
				'AdType'		=>$info['ad_type'],
				'AdTitle'		=>$info['ad_title'],
				'AdValue'		=>$info['ad_value'],
				'AdPicture'		=>$info['ad_picture'],
				'StartTime'		=>date('Y-m-d H:i:s',$info['start_time']),
				'EndTime'		=>date('Y-m-d H:i:s',$info['end_time']),
				'SortOrder'		=>$info['sort_order'],
				'ClickCount'	=>$info['click_count'],
				'Enabled'		=>$info['enabled'],
			];
			switch($info['ad_type'])
			{
				//活动
				case Status::CollectTypeActivity:
					$sql = 'even';
					$get = 'even_id,title';
				break;
				//两学一做
				case Status::CollectTypeLxyz:
					$sql = 'lxyz';
					$get = 'id,title';
				break;
				//党建专题
				case Status::CollectTypeSpecial:
					$sql = 'special';
					$get = 'id,title';
				break;
			}

			if($sql) $arr['Value'] = M($sql)->getfield($get,true);
				
			return $arr;
		}

		$data = [
			'Error'=>1001,
			'Message'=>'获取失败',
		];
		$this->jsonReturn($data);
	}

	public function locationAction()
	{
		$post = I('post.');
		$this->check_empty($post,'type');
		switch($post['type'])
		{
			//活动
			case Status::CollectTypeActivity:
				$sql = 'even';
				$get = 'even_id,title';
			break;
			//两学一做
			case Status::CollectTypeLxyz:
				$sql = 'lxyz';
				$get = 'id,title';
			break;
			//党建专题
			case Status::CollectTypeSpecial:
				$sql = 'special';
				$get = 'id,title';
			break;
		}

		$data = M($sql)->getfield($get,true);
		if($data)
		{
			$this->jsonReturn(['List'=>$data]);
		}	
	}

	/**
	 * [notice_delAction 删除公告接口]
	 * @return [type] [description]
	 */
	public function ad_delAction()
	{
		$post = I('post.');
		$check = [
			'广告ID不能为空'=>'AdId',
			// '支部ID为为空'=>'branch_id',
		];
		$this->check_empty($post,$check);
		$where = [
			'ad_id'=>$post['AdId'],
			// 'branch_id'=>$post['branch_id'],
		];
		$del = $this->model->where($where)->delete();
		if($del) $this->jsonReturn('删除成功');

		throw new CsException("删除失败", 400);
	}
	

}
