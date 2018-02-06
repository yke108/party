<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class ToolsService
{
    //学习任务列表
    public function option_list($params)
    {
        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;
        $map = [];
        $map['is_delete'] = Status::None;
        //支部ID
        if($params['branch_id']) $map['branch_id'] = $params['branch_id'];
        //支部地址
        if($params['region_code']) $map['region_code']  = $params['region_code'];
        //支部特殊条件 查询上级
        if($params['_string']) $map['_string'] = $params['_string'];
        //查询内容
        if ($params['keyword'])  $map['title'] = array('like', '%'.trim($params['keyword']).'%');


        //查询数量
        $count = $this->OptionDao()->searchRecordsCount($map);
        $list = array();
        if($count > 0){
            //排序
            $orderby = empty($params['orderby']) ? 'id DESC' : $params['orderby'];
            //查询列表
            $list = $this->OptionDao()->searchRecords($map, $orderby, $params['page'], $params['pagesize']);
        }

        //判断获取的列表至少大于1条内容

        if(count($list) > 0)
        {
            $check = $this->checkContent($list,$params);
            $newlist = $this->getcontent($check,$params);
        }else{
            $newlist = [];
        }
        return array(
            'list'=>$newlist,
            'count'=>count($newlist),
            'page'=>$params['page'],
            'pagesize'=>$params['pagesize'],
        );
    }

    //新建学习任务
    public  function option_add($params)
    {
        $data = [
            'study_time'=>$params['study_time'],
            'type'=>$params['type'],
            'content_id'=>$params['content_id'],
        ];
        //判断重要状态是否选中 选中则修改 无选中则为0 默认不重要
        if($params['importent_status']) $data['importent_status']  = Status::YES;
        //支部ID
        if($params['branch_id']) $data['branch_id'] = $params['branch_id'];
        //支部地址
        if($params['region_code']) $data['region_code']  = $params['region_code'];

        //创建数据
        if (!$this->OptionDao()->create($data)) {
            throw new CsException($this->OptionDao()->getError(), CodeConst::ParamsError);
        }
        $add = $this->OptionDao()->add();
        if(!$add)  throw new CsException('添加失败');
        return($add);
    }
    //删除学习任务
    public function option_del($params)
    {
        if(!$params['id']) throw new CsException('任务ID为空');
        $data = [
            'id'=>$params['id'],
            'branch_id'=>$params['branch_id'],
            'region_code'=>$params['region_code'],
            'is_delete'=>Status::None,
        ];
        $map = [
            'is_delete'=>Status::YES
        ];
        $del = $this->OptionDao()->where($data)->save($map);
        if(!$del) throw new CsException('删除失败');
        return($del);
    }

    //学习列表
    public function studyList($params)
    {
        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;
        $map = $params['map'] ? $params['map'] : array();
        //查询内容
        if ($params['keyword'])  $map['title'] = array('like', '%'.trim($params['keyword']).'%');
        //状态
        $map['status']  =  $params['status'];
        $map['user_id'] =  $params['user_id'];
        //查询数量
        $count = $this->StudyDao()->searchRecordsCount($map);
        $newlist = array();
        if($count > 0){
            //排序
            $orderby = empty($params['orderby']) ? 'id DESC' : $params['orderby'];
            //查询列表
            $list = $this->StudyDao()->searchRecords($map, $orderby, $params['page'], $params['pagesize']);
        }
        //判断获取的列表至少大于1条内容
        if(count($list) > 0)
        {
            $newlist = $this->getcontent($list,$params);
        }else{
            $newlist = [];
        }
        return array(
            'list'=>$newlist,
            'count'=>count($newlist),
            'page'=>$params['page'],
            'pagesize'=>$params['pagesize'],
        );
    }

    //开始学习
    public function studyStrart($params)
    {
        $data = [
            'user_id'   =>     $params['user_id'],
            'status'    =>     Status::None,
            'type'      =>     $params['type'],
            'content_id'=>     $params['content_id'],
        ];
        //查询是否已经有开始的记录未完成的
        $check = $this->StudyDao()->findRecord($data);
        if($check) throw new CsException('您的学习已经开始了,请先停止');
        $data['start_time'] = time();
        //查询是否有任务 如果有则存入学习表 该学习是有任务的
        $map = [
            'content_id'=>$data['content_id'],
            'branch_id'=>$data['branch_id'],
            'region_code'=>$data['region_code'],
            'is_delete'=>Status::None,
            'study_time'=>['gt',time()],
        ];
        $option = $this->OptionDao()->findRecord($map);
        if($option > 0) $data['option_id'] = $option['id'];

        //创建数据
        if (!$this->StudyDao()->create($data)) {
            throw new CsException($this->StudyDao()->getError(), CodeConst::ParamsError);
        }
        $add = $this->StudyDao()->add($data);
        if(!$add) throw new CsException('系统错误',400);
        return $add;
    }

    //停止学习
    public function studyOver($params)
    {
        $data = [
            'user_id'   =>     $params['user_id'],
            'status'    =>     Status::None,
            'type'      =>     $params['type'],
            'content_id'=>     $params['content_id'],
            'option_id'=>     $params['option_id'],
        ];
        //查询是否已经有开始的记录未完成的
        $check = $this->StudyDao()->findRecord($data);
        if(!$check) throw new CsException('您暂无该文章的正在学习的记录');
        //创建数据
        if (!$this->StudyDao()->create($params)) {
            throw new CsException($this->StudyDao()->getError(), CodeConst::ParamsError);
        }
        $save = $this->StudyDao()->where($data)->save($params);
        if(!$save) throw new CsException('停止失败',400);
        return $save;
    }

    //修改进度
    public function changenode($params)
    {
        $data = [
            'user_id'   =>     $params['user_id'],
            'status'    =>     Status::None,
            'type'      =>     $params['type'],
            'content_id'=>     $params['content_id'],
        ];
        //查询是否已经有开始的记录未完成的
        $check = $this->StudyDao()->findRecord($data);
        if(!$check) throw new CsException('您暂无该文章的正在学习的记录');
        $map = [
            'node'=>$params['node'],
            'type'=>$params['type'],
            'content_id'=>$params['content_id'],
        ];
        //创建数据
        if (!$this->StudyDao()->create($map)) {
            throw new CsException($this->StudyDao()->getError(), CodeConst::ParamsError);
        }
        $save = $this->StudyDao()->where($data)->save($map);
        if(!$save) throw new CsException('记录失败',400);
        return $save;
    }

    //获取学习文章
    public function getcontent($list,$params = '')
    {
        foreach($list as $k=>$v)
        {
            $map = [
                'id'=>$v['content_id'],
            ];
            //查询内容
            if ($params['keyword'])  $map['title'] = array('like', '%'.trim($params['keyword']).'%');
            switch($v['type'])
            {
                //两学一做
                case Status::CollectTypeLxyz:
                     $list[$k]['info'] = $this->lxyzDao()->findRecord($map);
                     $list[$k]['cat_type'] = Status::CatTypeLxyz;
                    break;
                //党建专题
                case  Status::CollectTypeSpecial :
                    $list[$k]['info'] = $this->djztDao()->findRecord($map);
                    $list[$k]['cat_type'] = Status::CatTypeDjzt;
                    break;
                //视频
                case  Status::CollectTypeVideo :
                    $list[$k]['info'] = $this->videoDao()->findRecord($map);
                    $list[$k]['cat_type'] = Status::CatTypeVideo;
                    break;
                //音频
                case  Status::CollectTypeAudio :
                    $list[$k]['info'] = $this->AudioDao()->findRecord($map);
                    $list[$k]['cat_type'] = Status::CatTypeAudio;
                    break;
                //电子书
                case  Status::CollectTypeEbook :
                    $list[$k]['info'] = $this->EbookDao()->findRecord($map);
                    $list[$k]['cat_type'] = Status::CatTypeEbook;
                    break;
                //读书
                case  Status::CollectTypeRead :
                    $list[$k]['info'] = $this->ReadDao()->findRecord($map);
                    $list[$k]['cat_type'] = Status::CatTypeRead;
                    break;
                //评测
                case  Status::CollectTypeQuestion :
                    $list[$k]['info'] = $this->Question()->findRecord($map);
                    $list[$k]['cat_type'] = Status::CatTypeQuestion;
                    break;
                //相册
                case  Status::CollectTypeAlbum :
                    $list[$k]['info'] = $this->Photo()->searchFieldRecords($map);
                    $list[$k]['cat_type'] = Status::CatTypeAlbum;
                    break;
            }
            if(!$list[$k]['info'])unset($list[$k]);
        }
        return array_values($list);
    }

    public function checkContent($list,$params)
    {
        foreach($list as $k=>$v)
        {
            $map = [
                'content_id'=>$v['content_id'],
                'type'=>$v['type'],
                'status'=>Status::YES,
                'user_id'=>$params['user_id'],
            ];
            if ($params['keyword'])  $map['title'] = array('like', '%'.trim($params['keyword']).'%');

            if($this->StudyDao()->searchRecordsCount($map) > 0)
            {
                $list[$k]['read_status'] = Status::YES;
            }else{
                $list[$k]['read_status'] = Status::None;
            }
        }
        return $list;
    }

    public function getOptionByContentId($content_id, $type) {
        return $this->OptionDao()->where([
            '_string'=> get_string(),
            'type'=>$type,
            'content_id'=> $content_id,
            'is_delete'=> 0,
            'study_time'=> ['gt', NOW_TIME]])->find();
    }


    private function OptionDao()
    {
        return D('Common/Tools/Option');
    }

    private function StudyDao()
    {
        return D('Common/Tools/Study');
    }
    private function lxyzDao()
    {
        return D('Common/Article/Article');
    }
    private function djztDao()
    {
        return D('Common/Article/Special');
    }
    private function videoDao()
    {
        return D('Common/Video/Video');
    }
    private function AudioDao()
    {
        return D('Common/Audio/Audio');
    }
    private function EbookDao()
    {
        return D('Common/Ebook/Ebook');
    }
    private function ReadDao()
    {
        return D('Common/Read/Read');
    }
    private function Question()
    {
        return D('Common/Question/Question');
    }
    private function Photo()
    {
        return D('Common/Photo/Photo');
    }

}