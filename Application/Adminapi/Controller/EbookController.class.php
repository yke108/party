<?php
namespace Adminapi\Controller;
use Common\Basic\Status;

class EbookController extends FController {
	private $service;
	protected function apiSetCheck(){
		$this->apiset(false);
		$this->service = Service('Ebook');
	}
	
	//读书列表
	public function ebook_listAction(){
		$post = I('post.');
		$param = $post;
        $result = $this->service->getList($param);
		$data = [
			'List'=> $result['list'],
			'Count'=> $result['count'],
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}
	
	//官方文章
	public function whAction(){
		$post = I('post.');
        $result = $this->service->getWhList($post);
		$data = [
			'List'=> $result['list'],
			'Count'=> $result['count'],
		];
		$this->jsonReturn($data);
	}

    //分类列表 启用时的分类 和 编辑新增选择的分类
	public function categoryAction(){
        $post = I('post.');
        $map = array(
            'region_code'=>$post['region_code'],
            'branch_id'=>$post['branch_id'],
            'cat_type'=>Status::CatTypeEbook,
            'status'=>Status::YES,
        );
        $result = D('Category', 'Service')->getAvailableList($map);
        $data = [
            'cat_list'=>$result,
        ];
        $this->jsonReturn($data);
	}
	
	public function create_or_modifyAction(){
		try {
			$data['id'] = I('post.id', 0, 'intval');
            $data['title'] = I('post.title');
            $data['desc'] = I('post.desc');
            $data['cat_id'] = I('post.cat_id');
            $data['detail'] = I('post.detail');
            $data['image'] = trim(I('post.image'), ',');
            $data['status'] = I('post.status', 1, 'intval');
            $data['deep'] = I('post.deep', 0, 'intval');
            $data['sort'] = I('post.sort', 0, 'intval');
            $data['branch_id'] = I('post.branch_id', 0, 'intval');
            $data['region_code'] = I('post.region_code', 0, 'intval');
			$ret = $this->service->edit($data);
		} catch (\Exception $e) {
			$this->jsonReturn(['Error'=>400, 'Message'=>$e->getMessage()]);
			throw new \Exception($e->getMessage(), 400);
		}
		$Message = empty($data['id']) ? '添加成功' : '修改成功';
		$this->jsonReturn($Message);
	}
	
	//状态开关
	public function switchStatusAction(){
		$post = I('post.');
		$params = array(
            'id'=>intval($post['id']),
            'cat_id'=>intval($post['cat_id']),
            'ref_id'=>intval($post['ref_id']),
            'branch_id'=>$post['branch_id'],
            'region_code'=>$post['region_code'],
		);
		try {
			$result  = $this->service->switchStatus($params);
			$data = array(
				'Message'=>'操作成功',
				'Status'=>$result['status'],
			);
		} catch (\Exception $e) {
			$data = array(
				'Message'=>$e->getMessage(),
				'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}
	
	//删除
	public function delAction(){
		$post = I('post.');
		$params = array(
			'id'=>intval($post['id']),
			'branch_id'=>$post['branch_id'],
			'region_code'=>$post['region_code'],
		);
		if (!$this->service->del($params)) {
			$this->jsonReturn(['Message'=> '删除失败', 'Error'=> 400]);
		}
		$this->jsonReturn('删除成功');
	}

	//章节树状图
	public function tree_nodeAction(){
		$ebook_id = I('post.ebook_id', 0, 'intval');
		$type = I('post.type', 2, 'intval'); // 1:官方，2:自定义
		try {
			$tree = $this->service->getRreeNode($ebook_id, $type);
		} catch (\Exception $e) {
			$this->jsonReturn(['Message'=> $e->getMessage(), 'Error'=> 400]);
		}
		$this->jsonReturn(['Tree'=> $tree]);
	}

	//获取章节详情
	public function node_infoAction(){
		$id = I('post.id', 0, 'intval');
		$info = $this->service->getNodeInfo($id);
		$this->jsonReturn(['Info'=> $info]);
	}

	//添加章节
	public function add_nodeAction(){
		$pid = I('post.pid', 0, 'intval');
        $data['ebook_id'] = I('post.ebook_id', 0, 'intval');
        $data['title'] = I('post.title');
        $data['node_name'] = I('post.node_name');
        $data['detail'] = I('post.detail');
        $data['sort'] = intval(I('post.sort')) ? intval(I('post.sort')) : 100;
        try {
        	$info = $this->service->addNode($data, $pid);
        } catch (\Exception $e) {
        	$this->jsonReturn(['Message'=> $e->getMessage(), 'Error'=> 400]);
        }
		$this->jsonReturn('添加成功');
	}

	//编辑章节
	public function edit_nodeAction(){
        $data['id'] = I('post.id', 0, 'intval');
        $data['node_name'] = I('post.node_name');
        $data['title'] = I('post.title');
        $data['detail'] = I('post.detail');
        $data['sort'] = I('post.sort', 100, 'intval');
        try {
        	$info = $this->service->editNode($data);
        } catch (\Exception $e) {
        	$this->jsonReturn(['Message'=> $e->getMessage(), 'Error'=> 400]);
        }
		$this->jsonReturn('编辑成功');
	}

	//删除章节
	public function del_nodeAction(){
		$id = I('post.id');
		if (!$this->service->delNode($id)) {
			$this->jsonReturn(['Message'=> '删除失败', 'Error'=> 400]);
		}
		$this->jsonReturn('删除成功');
	}

}