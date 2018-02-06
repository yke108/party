<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class GroupController extends FController {
    protected function apiSetCheck(){
        $this->apiset(false);
    }

    //小程序列表
    public function groupAction(){
        $post = I('post.');
        if($post['home'] != Status::YES)   $map['ref_id'] = Status::None;
        $params = array(
            'branch_id'     =>$post['branch_id'],
            'keyword'       =>$post['keyword'],
            'status'        =>$post['status'],
            'page'          =>$post['page'] ?: 0,
            'pagesize'      =>$post['pagesize'] ?: 20,
            'region_code'   =>$post['region_code'],
        );

        $result = $this->GroupService()->getPagerList($params);
        $newlist = $result['list'];

        $data = [
            'List'=>$newlist,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
            'Display'=>2,
            'Isnew'=>$result['isnew'],
        ];
        $this->jsonReturn($data);
    }

    public function regionAction(){
        $post = I('post.');

        $result = $this->regionService()->getlist($post['region_code']);
        $data   = [
            'region_list'=>$result,
        ];
        $this->jsonReturn($data);
    }


    public function categoryAction(){
        $post = I('post.');
        $map = array(
            'branch_id' =>$post['branch_id'],
            'cat_type'  =>Status::CatTypeDjzt,
            'status'    =>Status::YES,
        );
        $result = $this->categoryService()->getAvailableList($map);
        $data   = [
            'cat_list'=>$result,
        ];
        $this->jsonReturn($data);
    }

    public function infoAction(){
        $post = I('post.');
        $map = array(
            'id'=>$post['id'],
            'branch_id'=>$post['branch_id'],
        );
        $result = $this->specialService()->findInfo($map);
        $data = [
            'info'=>$result,
        ];
        $this->jsonReturn($data);
    }

    //新增或编辑
    public function create_or_modifyAction(){
        $post = I('post.');
        try {
            $result = $this->GroupService()->createOrModify($post);
            if($post['group_id']){
                $id = $post['group_id'];
            }else{
                $id = $result;
            }

            $data = array(
                'Message'=>$post['group_id'] ? '修改成功' : '添加成功',
            );
        } catch (\Exception $e) {
            $data = array(
                'Message'=>$e->getMessage(),
                'Error'=>$e->getCode(),
            );
        }
        $this->jsonReturn($data);
    }

    //状态开关
    public function switchStatusAction(){
        $post = I('post.');
        $params = array(
            'id'=>$post['id'],
            'branch_id'=>$post['branch_id'],
            'type'=>$post['type'],
            'cat_id'=>$post['cat_id'],
            'ref_id'=>$post['ref_id']
        );
        try {
            $result = $this->specialService()->switchStatus($params);
            $data = array(
                'Message'=>'操作成功',
                'ArticleStatus'=>$result['status'],
            );
        } catch (\Exception $e) {
            $data = array(
                'Message'=>$e->getMessage(),
                'Error'=>$e->getCode(),
            );
        }
        $this->jsonReturn($data);
    }


    private function GroupService() {
        return D('Group', 'Service');
    }

    private function BranchService(){
        return D('Branch','Service');
    }

//    private function categoryService() {
//        return D('Category', 'Service');
//    }
}