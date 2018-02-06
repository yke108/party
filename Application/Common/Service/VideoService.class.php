<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class VideoService{

    //(支部)视频列表
    public function getPagerList($params){
        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;

        $map = $params['map'] ? $params['map'] : array();
        $map['is_delete'] = Status::None;

        //支部ID
        if($params['branch_id']) $map['branch_id'] = $params['branch_id'];
        //支部地址
        if($params['region_code']) $map['region_code']  = $params['region_code'];
        //支部特殊条件 查询上级
        if($params['_string']) $map['_string'] = $params['_string'];
        //查询内容
        if ($params['keyword'])  $map['title'] = array('like', '%'.trim($params['keyword']).'%');
        //分类
        if ($params['cat_id']) $map['cat_id'] = $params['cat_id'];
        //状态
        if ($params['status']) $map['status'] = $params['status'];
        //是否推荐首页
        if ($params['is_hot']) $map['id'] = $params['id'];
        //查询数量
        $count = $this->listDao()->searchRecordsCount($map);
        $list = array();
        if($count > 0){
            //排序
            $orderby = empty($params['orderby']) ? 'sort ASC, id DESC' : $params['orderby'];
            //查询列表
            $list = $this->listDao()->searchRecords($map, $orderby, $params['page'], $params['pagesize']);
        }
        //判断获取的列表至少大于1条内容
        if(count($list) > 0)
        {
            $list = $this->setDetail($list);
        }else{
            $list = [];
        }
        return array(
            'list'=>is_option($list,Status::CollectTypeVideo),
            'count'=>$count,
            'page'=>$params['page'],
            'pagesize'=>$params['pagesize'],
        );
    }

    //(支部)处理特别数据
    private function setDetail($list)
    {
        if(empty($list)) {
            $list = [];
        }else{
            $map['cat_type'] = Status::CatTypeVideo;
            //搜索分类表 取分类名字
            $cats = $this->categoryDao()->searchFieldRecords($map);
            //通过VideoId搜索视频链接

            //循环处理数据
            foreach($list as $k=>$v){
                //分类名称
                $list[$k]['cat_name'] = $cats[$v['cat_id']]['cat_name'];
                //图片处理
                $list[$k]['image'] = $v['image'] ? explode(',', $v['image']) : array();
                //文章详情格式化
                $list[$k]['detail'] = htmlspecialchars_decode($v['detail']);
                //状态类型 启用 不启用
                $list[$k]['status_label'] = Status::$catStatusList[$v['status']];
                //总部或支部识别符
                $list[$k]['type'] = Status::TypeBranch;
                //视频链接
                $list[$k]['video'] = is_null($videos[$v['id']]) ? '' : [$videos[$v['id']]] ;
                //修改创建时间
                $list[$k]['add_time'] =  date('Y-m-d',$v['add_time']);
            }
        }
        return $list;
    }


    //(官方)视频列表
	public function getWhPagerList($params){
        //判断支部ID是否存在
        if (empty($params['branch_id'])) throw new CsException('参数错误', CodeConst::ParamsError);
        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;

        //查询条件
        $map = $params['map'] ? $params['map'] : array();
        $map['is_delete'] = Status::None;

        $where['ref_id'] = ['neq',0];
        $where['is_delete'] = Status::None;
        $where['branch_id'] = $params['branch_id'];
        $where['region_code']  = $params['region_code'];


        //查询内容
        if ($params['keyword'])  $map['title'] = array('like', '%'.trim($params['keyword']).'%');
        //分类
        if ($params['cat_id']) $map['cat_id'] = $params['cat_id'];
        //状态
        if ($params['status']) {
            $map['status'] = $where['status'] = $params['status'];
            $tj = $this->listDao()->where($where)->getfield('ref_id',true);
            if($tj) $map['id'] = ['in',$tj];
        }
        //是否推荐首页
        if ($params['is_hot']) $map['id'] = $params['id'];
        //查询数量;
        $count = $this->listWhDao()->searchRecordsCount($map);
        if($count > 0){
            //排序
            $orderby = empty($params['orderby']) ? 'sort ASC, id DESC' : $params['orderby'];
            //查询列表
            $wh_list = $this->listWhDao()->where($map)->order($orderby)->page($params['page'], $params['pagesize'])->select();
        }
        //判断获取的列表至少大于1条内容
        if(count($wh_list) > 0)
        {
            //处理特殊数据
            $list = array_values($this->setWhDetail($wh_list));
        }else{
            $list = [];
        }

        return array(
            'list'=>$list,
            'count'=>$count,
            'page'=>$params['page'],
            'pagesize'=>$params['pagesize'],
        );

    }
    //(总部)处理特别数据
    private function setWhDetail($list)
    {

        $post = I('post.');
        //查询本地是否有该文章
        foreach($list as $v) $articleid[] = $v['id'];
        $where = [
            'ref_id' =>['in',$articleid],
            'branch_id'=>$post['branch_id'],
            'region_code'=>$post['region_code'],
        ];
        //如果有的话状态则为本地的状态
        $wharticle = $this->listDao()->searchFieldRecords($where,'ref_id');
//        if(empty($list)) {
//            $list = [];
//        }else{
//            //搜索分类表 取分类名字
//
        $newlist = [];
        //循环处理数据
        foreach ($list as $k => $v) {
            if(!in_array($v['id'],$wharticle))
            {
                $newlist[$k] = $v;
                //分类名称
                $newlist[$k]['cat_name'] = $cats[$v['cat_id']]['cat_name'];
                //图片处理
                $newlist[$k]['images'] = $v['images'] ? explode(',', $v['images']) : array();
                //文章详情格式化
                $newlist[$k]['detail'] = htmlspecialchars_decode($v['detail']);
                //状态类型 启用 不启用
                $newlist[$k]['status_label'] = Status::$catStatusList[$v['status']];
                //修改创建时间
                $newlist[$k]['add_time'] = date('Y-m-d',$v['add_time']);
                //修改启用类型 默认为空
                $newlist[$k]['cat_id'] = ($list[$k]['cat_id'] > 0) ? $list[$k]['cat_id']  : '';

                $newlist[$k]['status'] = '';
                $newlist[$k]['ref_id'] = $v['id'];
                unset($newlist[$k]['id']);

            }
        }
        return $newlist;
    }


    //新增或修改数据
    public function createOrModify($params){
        //接收到的参数
        $data = array(
            'branch_id' =>$params['branch_id'],
            'title'     =>trim($params['title']),
            'desc'      =>trim($params['desc']),
            'cat_id'    =>trim($params['cat_id']),
            'detail'    =>trim($params['detail']),
            'sort'      =>$params['sort'],
            'image'    =>trim($params['image']),
            'status'    =>intval($params['status']) ? intval($params['status']) : Status::YES,
            'region_code'=>$params['region_code'],
        );
        if($params['videonum']) $data['video_id'] = trim($params['videonum']);
        if ($params['id']) {
            $data['id'] = $params['id'];
        }
        if (!$this->listDao()->create($data)){
            throw new CsException($this->listDao()->getError(), CodeConst::ParamsError);
        }
        if ($params['id'] > 0){
            $result = $this->listDao()->save();
            if ($result === false){
                throw new CsException('修改失败', CodeConst::SystemError);
            }
            $id = $params['id'];
        } else {
            $id = $this->listDao()->add();
            if ($id < 1){
                throw new CsException('添加失败', CodeConst::SystemError);
            }
            return $id;
        }
    }

    //(支部和官方)修改启用状态
    public function switchStatus($params)
    {
        //判断文章ID是否存在 存在则是自定义文章状态开关
        if (isset($params['id']) && !empty($params['id'])) {
            //判断文章ID和（官方或自定义类型）是否存在
            if (empty($params['type'])) throw new CsException('参数错误', CodeConst::ParamsError);
            //判断需要启用的文章分类是否存在
            if ($params['cat_id'] > 0) {
                //查找当前是否有该分类
                $iscat = $this->categoryDao()->where(['cat_id' => $params['cat_id']])->find();
                if (!$iscat) throw new CsException('该分类不存在', 400);
            }
            //查询文章条件
            $map = [
                'id' => $params['id'],
            ];
            //判断是否有支部列表
            if (isset($params['branch_id'])) {
                $map['branch_id'] = $params['branch_id'];
            }

            //查询是否有该文章
            $info = $this->listDao()->findRecord($map);
            if (empty($info)) throw new CsException('文章不存在', CodeConst::DataNotExist);
            //修改数据条件
            $data = array(
                'id' => $info['id'],
                'status' => ($info['status'] == Status::YES) ? Status::NO : Status::YES,
            );
            //如果开启的话就会有分类ID 关闭则没有 直接修改状态不修改类型
            if ($params['cat_id']) $data['cat_id'] = $params['cat_id'];
            //执行修改
            if ($this->listDao()->saveRecord($data) === false)  throw new CsException('系统错误', CodeConst::SystemError);
        }else{
            //如果文章ID不存在则是官方改变状态
            //当文章ID为空时 判断官方的ID是否为空
            if(empty($params['ref_id'])) throw new CsException("参数错误");
            //ID不为空则查询官方的内容是否存在
            $find = $this->listWhDao()->getRecord($params['ref_id']);
            //如果存在则把当前的ID存一份进入本地的数据表里
            if($find){
                //并且启动成功分类也一并存入
                $map = [
                    'branch_id'=>$params['branch_id'],
                    'ref_id'=>$params['ref_id'],
                    'admin_id'=>$params['admin_id'],
                    'cat_id'=>trim($params['cat_id']),
                    'region_code'=>$params['region_code'],

                    'title'     =>trim($find['title']),
                    'desc'      =>trim($find['desc']),
                    'detail'    =>trim($find['detail']),
                    'sort'      =>$find['sort'],
                    'image'    =>trim($find['image']),
                    'video_id'  =>trim($find['video_id']),
                    'status'    =>intval($find['status']) ? intval($find['status']) : Status::YES,
                ];
                $add = $this->listDao()->addRecord($map);
                if($add){
                    $data['status']=Status::YES;
                }else{
                    throw new CsException("启动失败");
                }
            }else{
                //否则如果不存在官方文章则报错
                throw new Exception("暂无该文章");
            }
            return array(
                'status'=>$data['status'],
            );
        }
    }

    //获取详情
    public function findInfo($map){
//        $map['branch_id'] = 87;
        $info = $this->listDao()->findRecord($map);
        if (empty($info)) {
            throw new CsException('视频不存在', CodeConst::DataNotExist);
        }

        return $this->setInfo($info);
	}

    //(支部)处理特别数据
    private function setInfo($info)
    {
        if(empty($info)) {
            $info = [];
        }else{
            //搜索分类表 取分类名字
            $map['cat_type'] = Status::CatTypeVideo;
            //搜索分类表 取分类名字
            $cats = $this->categoryDao()->searchFieldRecords($map);
            //通过VideoId搜索视频链接

            //循环处理数据
            //分类名称
            $newinfo['CatName'] = $cats[$info['cat_id']]['cat_name'];

            //文章详情格式化
            $newinfo['Detail'] = htmlspecialchars_decode($info['detail']);
            //状态类型 启用 不启用
            $newinfo['StatusLabel'] = Status::$catStatusList[$info['status']];

            //修改创建时间
            $newinfo['Id'] = $info['id'];
            $newinfo['Title'] = $info['title'];
            $newinfo['Desc'] = $info['desc'];
            $newinfo['CatId'] = $info['cat_id'];
            $newinfo['VideoId'] = $info['video_id'];
            $newinfo['Sort'] = $info['sort'];
            $newinfo['Image'] = $info['image'];
            $newinfo['Status'] = $info['status'];
            $newinfo['AddTime'] =  date('Y-m-d',$info['add_time']);
            $newinfo['ReadNum'] = $info['read_num'];
            $newinfo['CollectNum'] = $info['collect_num'];
            $newinfo['ForwardNum'] = $info['forward_num'];
            $newinfo['BranchId'] = $info['branch_id'];
        }

        return $newinfo;
    }

    //统计阅读数
    public function increaseReadNum($params){
        M()->startTrans();

        //统计文章阅读数
        $map = array(
            'id'=>$params['id'],
        );
        if ($this->listDao()->where($map)->setInc('read_num') === false) {
            M()->rollback();
            throw new CsException('系统错误', CodeConst::SystemError);
        }

        //添加浏览记录（匿名访问的不记录）
        if ($params['user_id']) {
            $map = array(
                'user_id'=>$params['user_id'],
                'article_id'=>$params['id'],
                'article_type'=>Status::CatTypeVideo,
            );
            $log_info = $this->logReadDao()->findRecord($map);
            if (empty($log_info)) {
                $data = array(
                    'user_id'=>$params['user_id'],
                    'article_id'=>$params['id'],
                    'article_type'=>Status::CatTypeVideo,
                    'add_time'=>NOW_TIME,
                    'update_time'=>NOW_TIME,
                );
                if ($this->logReadDao()->addRecord($data) === false) {
                    M()->rollback();
                    throw new CsException('系统错误', CodeConst::SystemError);
                }
            } else {
                $data = array(
                    'log_id'=>$log_info['log_id'],
                    'update_time'=>NOW_TIME,
                );
                if ($this->logReadDao()->saveRecord($data) === false) {
                    M()->rollback();
                    throw new CsException('系统错误', CodeConst::SystemError);
                }
            }
        }

        M()->commit();
    }
    //删除视频
    public function delete($params){
        $map = array(
            'id'        =>$params['id'],
            'branch_id' =>$params['branch_id'],
            'is_delete' =>Status::None,
        );
        $info = $this->listDao()->findRecord($map);
        if (empty($info)) {
            throw new CsException('视频不存在', CodeConst::DataNotExist);
        }
        $data = array(
            'id'        =>$info['id'],
            'is_delete' =>Status::YES,
        );
        if ($this->listDao()->saveRecord($data) === false) {
            throw new CsException('删除失败', CodeConst::SystemError);
        }
    }

	private function listDao() {
		return D('Common/Video/Video');
	}
	
	private function listWhDao() {
		return D('Common/Video/VideoWh');
	}
	
	private function categoryDao() {
		return D('Common/Category/Category');
	}
	
	private function categoryWhDao() {
		return D('Common/Category/CategoryWh');
	}

	private function logReadDao() {
		return D('Common/User/LogRead');
	}
	
	private function specialDao() {
		return D('Common/Article/Special');
	}

	private function SpecialWhDao() {
		return D('Common/Article/SpecialWh');
	}
}//end ArticleService!甜品