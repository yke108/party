<?php
namespace Adminapi\Controller;
use Common\Basic\Status;

class QuestionController extends FController {
	private $service;
	protected function apiSetCheck(){
		$this->apiset(false);
		$this->service = Service('Question');
	}
	
	//读书列表
	public function question_listAction(){
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
            'cat_type'=>Status::CatTypeQuestion,
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
            $data['limit_time'] = I('post.limit_time', 0, 'intval');
            $data['sort'] = I('post.sort', 100, 'intval');
            $data['image'] = trim(I('post.image'), ',');
            $data['status'] = I('post.status', 1, 'intval');
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

	//题目列表
	public function item_listAction(){
		$question_id = I('post.question_id', 0, 'intval');
		$type = I('post.type', 2, 'intval');
		try {
			$list = $this->service->getItemList($question_id, $type);
		} catch (\Exception $e) {
			$this->jsonReturn(['Message'=> $e->getMessage(), 'Error'=> 400]);
		}
		$this->jsonReturn(['List'=> $list]);
	}

	//添加或修改题目
	public function create_or_modify_itemAction(){
		$data['id'] = I('post.id', 0, 'intval');
        $data['question_id'] = I('post.question_id', 0, 'intval');
        $data['title'] = I('post.title');
        $data['type'] = I('post.type', 1, 'intval');
        $data['sort'] = I('post.sort', 100, 'intval');
        $data['score'] = I('post.score',0, 'floatval');
        $item = json_decode($_POST['item'], true);
        if (!is_array($item) || empty($item)) {
        	$this->jsonReturn(['Message'=> '选项不能为空', 'Error'=> 400]);
        }
        if (count($item) < 2) {
            $this->jsonReturn(['Message'=> '选项至少设置2项', 'Error'=> 400]);
        }
        $data['result'] = [];
        $data['item'] = [];
        for ($i=0; $i<count($item); $i++) {
            if (empty($item[$i]['content'])) {
            	$this->jsonReturn(['Message'=> '选项内容不能为空', 'Error'=> 400]);
            }
            $data['item'][] = $item[$i]['content'];
            $item[$i]['right'] && $data['result'][] = $i;
        }
        if (empty($data['result'])) {
        	$this->jsonReturn(['Message'=> '至少选择一个正确选项', 'Error'=> 400]);
        }
        if ($data['type'] == 1 && count($result) > 1) {
            $this->jsonReturn(['Message'=> '单选题目只能有一个正确答案', 'Error'=> 400]);
        }
        $data['item'] = json_encode($data['item'], JSON_UNESCAPED_UNICODE);
        $data['result'] = implode(',', $data['result']);
        try {
            $this->service->editDetail($data);
        } catch (\Exception $e) {
        	$this->jsonReturn(['Message'=> $e->getMessage(), 'Error'=> 400]);
        } 
		$this->jsonReturn('操作成功');
	}

	//删除题目
	public function del_itemAction(){
		$id = I('post.id');
		if (!$this->service->delDetail($id)) {
			$this->jsonReturn(['Message'=> '删除失败', 'Error'=> 400]);
		}
		$this->jsonReturn('删除成功');
	}

}