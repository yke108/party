<?php
namespace Adminapi\Controller;

class ToolsController extends FController {
	protected function apiSetCheck(){
		$this->apiset(false);
	}
    //任务列表
    public function option_listAction()
    {
        $params = I('post.');
        $data = [
            'page'=>$params['page'],
            'pagesize'=>$params['pagesize'],
            'branch_id'=>$params['branch_id'],
            'region_code'=>$params['region_code'],
            'keyword'=>$params['keyword'],
//            'status'=>$params['status'],

        ];
        $result = $this->ToolsService()->option_list($data);
        if($result)
        {
            $list = $result['list'];
        }else{
            $list = [];
        }
        $data = [
            'List'=>$list,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
            'Display'=>2,
        ];
        $this->jsonReturn($data);
    }

	//新增任务
	public function OptionAddAction()
    {
        $params = I('post.');
        $data = [
            'study_time'=>strtotime($params['study_time']),
            'type'=>$params['type'],
            'content_id'=>$params['content_id'],
            'importent_status'=>$params['importent_status'],
            'branch_id'=>$params['branch_id'],
            'region_code'=>$params['region_code'],
        ];
        $add = $this->ToolsService()->option_add($data);
        if($add) $this->jsonReturn('新增成功');
    }

    //删除任务
    public function OptionDelAction()
    {
        $params = I('post.');
        $data = [
            'id'=>$params['id'],
            'branch_id'=>$params['branch_id'],
            'region_code'=>$params['region_code'],
        ];
        $del = $this->ToolsService()->option_del($data);
        if($del) $this->jsonReturn('删除成功');
    }


    private function ToolsService()
    {
        return D('Tools','Service');
    }
}