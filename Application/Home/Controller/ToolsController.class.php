<?php
namespace Home\Controller;

use Common\Basic\Status;
use Common\Basic\CsException;
class ToolsController extends FController
{
	protected $post = [];
	protected $type = '';


	public function __construct()
	{
		parent::__construct();
		$this->post = I('post.');
	}
	/**
	 * [likeAction 点赞]
	 * @return [type] [description]
	 */
	public function likeAction()
	{
		$this->type = 'like';
		//启动事务处理
		M()->startTrans();
		//存入log数据库 并返回ID
		$id = $this->base($this->likemodel());
		if (!$id) {
			M()->rollback();
			throw new CsException("您已经点过赞啦！！", 400);
		}
		//修改其他表
		$addother = $this->other();
		if(!$addother){
			M()->rollback();
			throw new CsException("点赞失败", 400);
		}
		M()->commit();
		$this->jsonReturn('点赞成功');
	}

	/**
	 * [forwardAction 转发]
	 * @return [type] [description]
	 */
	public function forwardAction()
	{
		$this->type = 'forward';
		//修改其他表
		$addother = $this->other();
		if($addother){
			// 存入log数据库 并返回ID
			$id = $this->base($this->forwardmodel());
		}

		$this->jsonReturn('转发成功');
	}


	/**
	 * [collectionAction 收藏]
	 * @return [type] [description]
	 */
	public function collectionAction()
	{

		$this->type = 'collection';
		//启动事务处理
		M()->startTrans();
		//存入log数据库 并返回ID
		$id = $this->base($this->collectionmodel());
		if (!$id) {
			M()->rollback();
			throw new CsException("您已经收藏过啦！！", 400);
		}
		//修改其他表
		$addother = $this->other();
		if(!$addother){
			M()->rollback();
			throw new CsException("收藏失败", 400);
		}
		M()->commit();
		$this->jsonReturn('收藏成功');
	}

	/**
	 * [collectiondelAction 删除收藏]
	 * @return [type] [description]
	 */
	public function collectiondelAction()
	{
		$post = I('post.');
		$check = [
			'收藏ID为空'=>'id',
			'用户ID为空'=>'user_id',
		];
		$list = [];
		$this->check_empty($post,$check);
		$where = [
			'user_id'=>$post['user_id'],
			'id'=>$post['id'],
		];
		$del = M('collection')->where($where)->delete();
		if($del)
		{
			$this->jsonReturn('删除成功');
		}else{
			throw new CsException("删除失败", 400);
		}
	}

	/**
	 * [readlogdelAction 删除学习]
	 * @return [type] [description]
	 */
	public function readlogdelAction()
	{
		$post = I('post.');
		$check = [
			'学习ID为空'=>'id',
			'用户ID为空'=>'user_id',
		];
		$this->check_empty($post,$check);
		$where = [
			'user_id'=>$post['user_id'],
			'log_id'=>$post['id'],
		];
		$del = M('log_read')->where($where)->delete();
		if($del)
		{
			$this->jsonReturn('删除成功');
		}else{
			throw new CsException("删除失败", 400);
		}
	}


	/**
	 * [partakeAction 报名]
	 * @return [type] [description]
	 */
	public function partakeAction()
	{

		$this->type = 'partake';
		
		//启动事务处理
		M()->startTrans();
		//存入log数据库 并返回ID
		$id = $this->base($this->partakemodel());
		if (!$id) {
			M()->rollback();
			throw new CsException("您已经报过名啦！！", 400);
		}
		//修改其他表
		$addother = $this->other();
		if(!$addother){
			M()->rollback();
			throw new CsException("报名失败", 400);
		}
		M()->commit();
		$this->jsonReturn('报名成功');

	}


    /**
     * [cancle_partakeAction 取消报名]
     * @return [type] [description]
     */
    public function cancle_partakeAction()
    {
        $post = I('post.');
        $model = M('partake');
        $check = [
            '报名ID不能为空'=>'id',
            '用户ID不能为空'=>'user_id',
            '活动ID不能为空'=>'content_id',
            '取消原因不能为空'=>'reason',
        ];
        $this->check_empty($post,$check);
        $where = [
            'id'=>$post['id'],
            'user_id'=>$post['user_id'],
            'is_delete'=>Status::None,
            'partake_type'=>Status::CollectTypeActivity,
            'content_id'=>$post['content_id'],
        ];
        $map = [
            'is_cancle'=>Status::YES,
            'reason'=>$post['reason'],
        ];
        $cancle = $model->where($where)->save($map);
        if($cancle)
        {
            $newwhere = [
                'even_id'=>$post['content_id'],
                'is_delete'=>Status::None,
            ];
            M('even')->where($newwhere)->setdec('partakenum');
            $this->jsonReturn('取消成功');
        }
        throw new CsException('取消失败或该报名已取消');
    }


    /**
	 * [base 新增操作记录]
	 * @param  [type] $model [description]
	 * @return [type]        [description]
	 */
	public function base($model)
	{
		$post = $this->post;
		$type = $this->type.'_type';
		//判断条件
		$check = [
			'操作类型为空' =>$type,
			'内容ID为空' =>'content_id',
		];
		//判断是否为空
		$this->check_empty($post,$check);
		//条件设置
		$map = [
			'user_id'    =>$post['user_id'],
			$type        =>$post[$type],
			'content_id' =>$post['content_id'],
		];
		switch($this->type){
			case 'partake':
				//查看活动人数
				$evenpeople = M('even')->where(['even_id'=>$post['content_id']])->getfield('peoplenum');
				if($evenpeople)
				{
					$checkwhere = $map;
					unset($checkwhere['user_id']);
					$count = M('partake')->where($checkwhere)->count();
					if($evenpeople <= $count)
					{
						throw new CsException("抱歉,参与人数已满");
						exit;
					}
				}else{
					throw new CsException("暂无该内容");
					exit;
				}
				$map['is_cancle'] = Status::None;
			break;
		}
		//查询是否已经有操作的记录
		$find = $model->where($map)->count();
		//如果没有则插入
		if($find == 0)
		{
			$map['add_time'] = time();
			$add = $model->add($map);
			if($add) return $add;
		}
		return false;
	}


	/**
	 * [other 给其他表的字段增加]
	 * @return [type] [description]
	 */
	protected function other()
	{
		$post = $this->post;
		$type = $this->type.'_type';
		//判断条件
		$check = [
			'操作类型为空'=>$type,
			'内容ID为空'=>'content_id',
		];
		//判断是否为空
		$this->check_empty($post,$check);
		//对应方法里面的方法和类型 需要增加的字段名
		$option = [
			'like'=>[
				Status::CollectTypeMien =>'likenum',
			],
			'partake'=>[
				Status::CollectTypeActivity =>'partakenum',
			],
			'collection'=>[
				Status::CollectTypeLxyz    =>'collect_num',
				Status::CollectTypeSpecial =>'collect_num',
			],
			'forward'=>[
				Status::CollectTypeMien    =>'forward_num',
				Status::CollectTypeLxyz    =>'forward_num',
				Status::CollectTypeSpecial =>'forward_num',
			],
		];
		//如果客户输入的数据不在数据的限制里则返回错误
		$savetype = $option[$this->type][$post[$type]];
		if( $savetype == null) return false;		
		switch($post[$type])
		{
			//党员风采
			case Status::CollectTypeMien:
				$wherename = 'mien_id';
				$sql = 'partymien';
			break;
			//党员活动
			case Status::CollectTypeActivity:
				$wherename = 'even_id';
				$sql = 'even';
			break;
			//两学一做
			case Status::CollectTypeLxyz:
				$wherename = 'id';
				$sql = 'lxyz';
			break;
			//党建专题
			case Status::CollectTypeSpecial:
				$wherename = 'id';
				$sql = 'special';
			break;
			default:
				//输出错误
				return false;
			break;
		}
		//查询条件
		$where = [
			$wherename =>$post['content_id'],
		];
		//查询是否有该内容
		$check = M($sql)->where($where)->find();

		//判断是否存在和是否已经审核
		if($check && $check['status']==Status::YES){
			//把该数据返回给添加积分接口
			$_POST['creator_id'] = $check['user_id'];
		}else{
			return false;
		}
		//给当前的内容加上数量
		$saveother = M($sql)->where($where)->setInc($savetype,1);
		if($saveother) return $saveother;
		return false;
	}



	protected function likemodel()
	{
		return D('like_log');
	}

	protected function collectionmodel()
	{
		return D('collection');
	}

	protected function partakemodel()
	{
		return D('partake');
	}

	protected function forwardmodel()
	{
		return D('forward_log');
	}
}