<?php
namespace Home\Controller;

use Common\Basic\Status;
use Common\Basic\CsException;
class StudyController extends FController
{
    //任务列表
    public function optionListAction()
    {
        $post = I('post.');
        $params = array(
            'keyword'   =>$post['keyword'],
            'page'      =>$post['page'],
            'pagesize'  =>$post['pagesize'],
            'user_id'  =>$post['user_id'],
        );
        //获取所有上级分类的文章（查询条件）
        if($post['branch_id'] && $post['user_id'])
        {
            $region_list = join(',',getParentRegionCode($post['region_code']));
            $params['_string'] = "(branch_id = ".$post['branch_id'] .") or (branch_id = 0 && region_code in (".$region_list."))";
        }

        $result = $this->ToolsService()->option_list($params);
        $newlist = [];
        if(count($result) > 0)
        {
            foreach($result['list'] as $k=>$v)
            {
                $newlist[$k] = [
                    "Id"                =>  $v["id"],
                    "StudyTime"        =>  $v["study_time"],
                    "Type"              =>  $v["type"],
                    "ContentId"        =>  $v["content_id"],
                    "ImportentStatus"  =>  $v["importent_status"],
                    "ReadStatus"       =>  $v["read_status"],
                    "Info"              =>  $v["info"],
                    "CatType"           =>  $v['cat_type']
                ];
            }
        }
        $data = [
            'List'=>$newlist,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
        ];
        $this->jsonReturn($data);
    }


    //学习列表
    public function studyListAction()
    {
        $post = I('post.');
        $params = array(
            'keyword'   =>$post['keyword'],
            'page'      =>$post['page'],
            'pagesize'  =>$post['pagesize'],
            'user_id'   =>$post['user_id'],
            'status'    =>($post['status']) ? Status::YES  : Status::None,
        );
        $result = $this->ToolsService()->studyList($params);
        $newlist = [];
        if(count($result) > 0)
        {
            foreach($result['list'] as $k=>$v)
            {
                $newlist[$k] = [
                    "Id"            => $v['id'],
                    "UserId"        => $v['user_id'],
                    "Status"        => $v['status'],
                    "Type"          => $v['type'],
                    "ContentId"     => $v['content_id'],
                    "ReadThink"     => $v['read_think'],
                    "Node"          => $v['node'],
                    "StartTime"     => $v['start_time'],
                    "OverTime"      => $v['over_time'],
                    "OptionId"      => $v['option_id'],
                    'Info'          => $v['info'],
                    "CatType"       => $v['cat_type']
                ];
            }
        }
        $data = [
            'List'=>$newlist,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
        ];
        $this->jsonReturn($data);
    }

    //开始学习
    public function studyStartAction()
    {
        $post = I('post.');
        $params = [
            'user_id'=>$post['user_id'],
            'type'=>$post['type'],
            'content_id'=>$post['id'],
            'branch_id'=>$post['branch_id'],
            'region_code'=>$post['region_code'],
        ];
        //开始学习
        $add = $this->ToolsService()->studyStrart($params);
        if($add > 0) $this->jsonReturn('开始学习');
        throw new CsException('系统错误');
    }

    //停止学习
    public function studyStopAction()
    {
        $post = I('post.');
        $params = [
            'user_id'=>$post['user_id'],
            'type'=>$post['type'],
            'content_id'=>$post['id'],
            'status'=>Status::YES,
            'over_time'=>time(),
            'option_id'=>$post['option_id'],
        ];
        //读后感
        if($post['read_think']) $params['read_think'] = $post['read_think'];
        //停止学习
        $over = $this->ToolsService()->studyOver($params);
        if($over > 0) $this->jsonReturn('停止学习');
        throw new CsException('系统错误');
    }

    //修改进度
    public function changenodeAction()
    {
        $post = I('post.');
        $params = [
        'user_id'=>$post['user_id'],
        'type'=>$post['type'],
        'content_id'=>$post['id'],
        'node'=>$post['node'],
    ];
        $change = $this->ToolsService()->changenode($params);
        if($change > 0) $this->jsonReturn('记录成功');
        throw new CsException('系统错误');
    }

    private function ToolsService()
    {
        return D('Tools','Service');
    }

}