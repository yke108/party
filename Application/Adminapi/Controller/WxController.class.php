<?php
namespace Adminapi\Controller;

use Common\Basic\Status;

class WxController extends FController {
    protected function apiSetCheck(){
        $this->apiset(false);
    }

    //小程序列表
    public function wxsoftAction(){
        $post = I('post.');
        //判断如果没有地址则返回空数组
        if($post['region_code'] <= 0) $this->jsonReturn(['List'=>[], 'Display'=>2,]);
        //判断如果是首页显示的话。。
        if($post['home'] != Status::YES)   $map['ref_id'] = Status::None;
        $params = array(
            'region_code'=>$post['region_code'],
            'keyword'   =>$post['keyword'],
            'status'    =>$post['status'],
            'page'      =>$post['page'] ?: 0,
            'pagesize'  =>$post['pagesize'] ?: 20,
        );

        //搜索条件 是否推荐
//        if(isset($post['is_hot']) && !empty($post['is_hot']))
//        {
//            //获取所有推荐的ID
//            $top = $this->gettop(Status::CollectTypeSpecial);
//            if(is_null($top)) $top = [0];
//
//            if($post['is_hot'] == Status::YES)
//            {
//                $params['id'] = ['in',$top];
//            }else{
//                $params['id'] = ['not in',$top];
//            }
//        }
        $result = $this->WxService()->getPagerList($params);
        $newlist = [];
        if($result['list'] != []){
            foreach($result['list'] as $k=>$v)
            {
                $newlist[$k] = $v;
                //推荐条件
                $tops[$v['id']] = $v['id'];
            }
            //判断推荐
            $top  = $this->topInfo()->getRecord(['top_type'=>Status::CollectTypeSpecial,'content_id'=>$tops]);
            foreach($newlist as $key => $va)
            {
                //判断推荐
                $newlist[$key]['is_hot'] = (!is_null($top[$va['id']])) ? Status::YES : Status::NO ;
            }
        }

        $data = [
            'List'=>$newlist,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
            'Display'=>2,
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


    //新增或编辑
    public function create_or_modifyAction(){
        $post = I('post.');
            $result = $this->WxService()->createOrModify($post);
            if($result)
            {
                $data = array(
                    'Message'=>$post['id'] ? '修改成功' : '添加成功',
                );
            }
        $this->jsonReturn($data);
    }

    private function WxService() {
        return D('Wx', 'Service');
    }

    private function regionService(){
        return D('Region','Service');
    }

//    private function categoryService() {
//        return D('Category', 'Service');
//    }
}