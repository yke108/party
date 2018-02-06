<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;

class EvenService{
	
	public function evenlist()
	{
		$post = I('post.');
		$page     = '';
		$pagesize = '20';
		$where    = [
			'branch_id' =>$post['branch_id'],
			'is_delete' =>0,
		];
		//分页条件
		if(isset($post['self'])&&!empty($post['self'])) $where['user_id']=$post['user_id'];
		if(isset($post['page'])) $page = $post['page']; 
		if(isset($post['pagesize']) && $post['pagesize'] > 0) $pagesize        = $post['pagesize'];
		//搜索条件
		if(isset($post['search']) && !empty($post['search'])) $where['title']  = ['like','%'.$post['search'].'%'];
		if(isset($post['status']) && !empty($post['status'])) $where['status'] = $post['status'];
		if(isset($post['top'])    && !empty($post['top'])){
			//获取所有推荐的ID
			$top = $this->gettop(Status::CollectTypeActivity);
			if(is_null($top)) $top = [0];
			if($post['top'] == Status::YES){
				$where['even_id'] = ['in',$top];
			}else{
				$where['even_id'] = ['not in',$top];
			}
		}
		
		//查询总数量
		$count = $this->evenDao()->where($where)->count();
		if($count > 0){
			//查询列表
			$list = $this->evenDao()->where($where)->page($page,$pagesize)->order('top,addtime desc')->select();
		}
		
		$data = [
			'List'  =>$list,
			'Count' =>$count
		];
		return $data;
	}

	
	private function evenDao() {
		return D('even');
	}
	
	private function gettop($type)
	{
		$where = [
			'top_type'=>$type,
		];
		return M('top')->where($where)->getfield('content_id',true);
	}
}