<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class UserController extends FController {
	
	public function indexAction(){
		$post = I('post.');
		$params = [
			'keyword'=>$post['keyword'],
			'status'=>$post['status'],
			'branch_id'=>$post['branch_id'],
			'page'=>$post['page'],
			'pagesize'=>$post['pagesize'],
		];
		$result = $this->userService()->getPagerList($params);
		$data = [
			'List'=>$result['list'],
			'Count'=>$result['count'],
			'page'=>$result['page'],
			'pagesize'=>$result['pagesize'],
			'Display'=>1,
		];
		$this->jsonReturn($data);
	}

    /**
     *添加党员
     */
    public function createAction() {
        $post = I('post.');
        $this->userService()->create($post);
        $this->jsonReturn('添加成功');
	}
	
	//状态开关
	public function switch_statusAction(){
		$post = I('post.');
		$params = array(
            'user_id'=>$post['user_id'],
            'branch_id'=>$post['branch_id'],
		);
		$this->userService()->switchStatus($params);
		$this->jsonReturn('操作成功');
	}
	
    public function optionsAction(){
        $post = I('post.');
        $params = array(
            'branch_id'     =>$post['branch_id'],
            'status'        =>Status::YES,
            'page'          =>1,
            'pagesize'      =>10000,
        );
        $result = $this->groupService()->getPagerList($params);
        $newlist = [];
        foreach($result['list'] as $vo) {
            $newlist[] = [
                'name'=>$vo['group_name'],
                'value'=>$vo['group_id'],
            ];
        }
        $data = [
            'GroupList'=>$newlist,
            'Display'=>2,
        ];
        $this->jsonReturn($data);
    }
	//删除
	public function delAction(){
		$post = I('post.');
		$params = [
				'user_id'=>$post['user_id'],
				'branch_id'=>$post['branch_id'],
		];
		try {
			$result = $this->userService()->delete($params);
			$data = array(
					'Message'=>'删除成功',
			);
		} catch (\Exception $e) {
			$data = array(
					'Message'=>$e->getMessage(),
					'Error'=>$e->getCode(),
			);
		}
		$this->jsonReturn($data);
	}
	
	private function userService() {
		return D('User', 'Service');
	}

    private function groupService() {
        return D('Group', 'Service');
    }
}
