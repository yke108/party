<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class ArticleService{

    //支部文章
    public function getPagerList($params){
        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;

        $map = $params['map'] ? $params['map'] : array();
        //支部ID
        if($params['branch_id'])   $map['branch_id'] = $params['branch_id'];
        //地区ID
        if($params['region_code']) $map['region_code'] = $params['region_code'];
        //查询内容
        if ($params['keyword']) $map['title'] = array('like', '%' . trim($params['keyword']) . '%');
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
        if (count($list) > 0) {
            $list = $this->setDetail($list);
        } else {
            $list = [];
        }
        return array(
            'list'=>is_option($list,Status::CollectTypeLxyz),
            'count'=>$count,
            'page'=>$params['page'],
            'pagesize'=>$params['pagesize'],
        );
    }

    //(支部)处理特别数据
    private function setDetail($list)
    {
//        if(empty($list)) {
//            $list = [];
//        }else{
//            //搜索分类表 取分类名字
//
        $cats = $this->categoryDao()->searchFieldRecords();
        //循环处理数据
        foreach ($list as $k => $v) {
            //分类名称
            $list[$k]['cat_name'] = $cats[$v['cat_id']]['cat_name'];
            //图片处理
            $list[$k]['images'] = $v['images'] ? explode(',', $v['images']) : array();
            //文章详情格式化
            $list[$k]['detail'] = htmlspecialchars_decode($v['detail']);
            //状态类型 启用 不启用
            $list[$k]['status_label'] = Status::$catStatusList[$v['status']];
            //修改创建时间
            $list[$k]['show_time'] =  ($v['show_time'] > 0) ? $v['show_time'] : $v['add_time'];
            //修改启用类型 默认为空
            $list[$k]['cat_id'] = ($list[$k]['cat_id'] > 0) ? $list[$k]['cat_id']  : '';
        }

        return $list;
    }

    //官方文章
    public function getWhPagerList($params){


        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;
        //初始化条件
        $map = $params['map'] ? $params['map'] : array();

        $map['is_delete'] = Status::None;

        //查询内容
        if ($params['keyword']) $map['title'] = array('like', '%' . trim($params['keyword']) . '%');
        //是否把本地的文章复制到本地
        if ($params['status']) {
            $where['branch_id'] = ['in',$params['branch_list']];
            $where['ref_id'] = ['neq',0];
            $where['status'] = $params['status'];
            $tj = $this->listDao()->where($where)->getfield('ref_id',true);
            if($tj) $map['id'] = ['in',$tj];
        }

        //是否推荐首页
        if ($params['is_hot']) $map['id'] = $params['id'];
        $count = $this->listWhDao()->where($map)->count();

        if($count > 0){
            //排序条件
            $orderby = empty($params['orderby']) ? 'id DESC' : $params['orderby'];
            //查询官方文章列表
            $wh_list = $this->listWhDao()->where($map)->order($orderby)->page($params['page'], $params['pagesize'])->select();
        }


        if(count($wh_list) > 0)
        {
            $list  = array_values($this->setWhDetail($wh_list));
        }else{
            $list = [];
        }

        return array(
            'list'     =>$list,
            'count'    =>$count,
            'pagesize' =>$params['pagesize'],
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
                $newlist[$k]['expire_time'] = date('Y-m-d',$v['show_time']);
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
    public function createOrModify($params)
    {
        //接收到的参数
        $data = [
            'admin_id'=>$params['admin_id'],
            'title'=>trim($params['title']),
            'refer'=>trim($params['refer']),
            'keywords'=>trim($params['keywords']),
            'desc'=>trim($params['desc']),
            'cat_id'=>trim($params['cat_id']),
            'detail'=>trim($params['detail']),
            'sort'=>$params['sort'],
            'video_id'     =>trim($params['videonum']),
            'images'=>trim($params['images']),
            'status'=>intval($params['status']) ? intval($params['status']) : Status::YES,
            'show_time'=>strtotime($params['show_time']),
            'region_code'=>$params['region_code'],
        ];
        //修改条件
        if ($params['id']) {
            $data['id'] = $params['id'];
        }
        //如果branch_id不等于0则为超级管理员 可以修改 不可以新增
        if($params['branch_id'] != 0){
            $data['branch_id'] = $params['branch_id'];
        }

        //创建数据
        if (!$this->listDao()->create($data)) {
            throw new CsException($this->listDao()->getError(), CodeConst::ParamsError);
        }

        //判断id是否为0 如果为0则为新增 如果>0则为修改
        if ($params['id'] > 0) {
            //修改数据
            $result = $this->listDao()->save();
            if ($result === false) {
                throw new CsException('修改失败', CodeConst::SystemError);
            }
            $id = $params['id'];
        } else {

            $id = $this->listDao()->add();
            if ($id < 1) {
                throw new CsException('添加失败', CodeConst::SystemError);
            }
        }
        return $id;
    }

    //(支部文章删除) 字段删除  不是物理删除
    public function delete($params){
        $map = array(
            'id'        =>$params['id'],
            'branch_id' =>$params['branch_id'],
            'is_delete' =>Status::None,
        );
        $info = $this->listDao()->findRecord($map);
        if (empty($info)) {
            throw new CsException('文章不存在', CodeConst::DataNotExist);
        }
        $data = array(
            'id'=>$info['id'],
            'is_delete'=>Status::YES,
        );
        if ($this->listDao()->saveRecord($data) === false) {
            throw new CsException('删除失败', CodeConst::SystemError);
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
            if (isset($params['branch_list'])) {
                $map['branch_id'] = ['in',$params['branch_list']];
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

                    'title'=>trim($find['title']),
                    'refer'=>trim($find['refer']),
                    'keywords'=>trim($find['keywords']),
                    'desc'=>trim($find['desc']),
                    'detail'=>trim($find['detail']),
                    'sort'=>$find['sort'],
                    'video_id'     =>trim($find['videonum']),
                    'images'=>trim($find['images']),
                    'status'=>intval($find['status']) ? intval($find['status']) : Status::YES,
                    'show_time'=>time(),
                    'add_time'=>time(),
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



    //统计阅读数
    public function increaseReadNum($params){
        M()->startTrans();

        //统计文章阅读数
        $map = array(
            'id'=>$params['id'],
        );
        // dump($params);
        if ($this->listDao()->where($map)->setInc('read_num') === false) {
            M()->rollback();
            throw new CsException('系统错误', CodeConst::SystemError);
        }

        //添加浏览记录（匿名访问的不记录）
        if ($params['user_id']) {
            $map = array(
                'user_id'=>$params['user_id'],
                'article_id'=>$params['id'],
                'article_type'=>Status::CatTypeLxyz,
            );
            $log_info = $this->logReadDao()->findRecord($map);
            if (empty($log_info)) {
                $data = array(
                    'user_id'=>$params['user_id'],
                    'article_id'=>$params['id'],
                    'article_type'=>Status::CatTypeLxyz,
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


    //个人中心-我的学习
    public function getLogList($params){
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;

        $map = $params['map'] ? $params['map'] : array();
        if ($params['user_id']) {
            $map['user_id'] = $params['user_id'];
        }
        if (intval($params['filter_day']) == 1) {
            $map['_string'] = 'TO_DAYS(NOW()) = TO_DAYS(add_time)';
        }
        if (intval($params['filter_month']) == 1) {
            $map['_string'] = 'DAYOFMONTH(NOW()) = DAYOFMONTH(add_time)';
        }

        $count = $this->logReadDao()->searchRecordsCount($map);
        $list = array();
        if($count > 0){
            $list = $this->logReadDao()->searchRecords($map, $params['orderby'], $params['page'], $params['pagesize']);
//            dump($list);
        }
        return array(
            'list'     =>$this->outputForLogList($list),
            'count'    =>$count,
            'page'     =>$params['page'],
            'pagesize' =>$params['pagesize'],
        );
    }


    private function outputForLogList($list) {
        if (!empty($list)) {
            foreach ($list as $k => $v) {
                switch ($v['article_type']) {
                    case Status::CatTypeLxyz: //两学一做
                        $article = $this->listDao()->getRecord($v['article_id']);
                        $article['cat_type'] = Status::CatTypeLxyz;
                        $article['update_time'] = $v['update_time'];
                        $article['log_id']	= $v['log_id'];
                        break;
                    case Status::CatTypeDjzt: //党建专题
                        $article = $this->specialDao()->getRecord($v['article_id']);
                        if($article['ref_id']!=0)
                        {
                            $id = $article['id'];
                            $article = $this->SpecialWhDao()->getRecord($article['ref_id']);
                            $article['id'] = $id;
                        }
                        $article['cat_type'] = Status::CatTypeDjzt;
                        $article['update_time'] = $v['update_time'];
                        $article['log_id']	= $v['log_id'];
                        break;
                }
                $list[$k] = $article;
            }
        }
        return $list;
    }


    public function findInfo($map){
        $info = $this->listDao()->findRecord($map);
        if (empty($info)) {
            throw new CsException('文章不存在', CodeConst::DataNotExist);
        }
        return $this->outputForInfo($info);
    }


    private function outputForInfo($info) {
        if (!empty($info)) {
            $read = $info['read_num'];
            $collect =  $info['collect_num'];

            $cat = $this->categoryDao()->getRecord($info['cat_id']);

            $info['cat_name'] = $cat['cat_name'];
            $info['detail'] = htmlspecialchars_decode($info['detail']);
            $info['images'] = $info['images'] ? explode(',', $info['images']) : array();
            $info['status_label'] = Status::$catStatusList[$info['status']];
            $info['read_num'] = $read;
            $info['collect_num'] = $collect;
        }
//        dump($info);
        return $info;
    }

    private function listDao() {
        return D('Common/Article/Article');
    }

    private function listWhDao() {
        return D('Common/Article/ArticleWh');
    }


    private function categoryDao() {
        return D('Common/Category/Category');
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






}//end ArticleService!MK















































//namespace Common\Service;
//
//use Common\Basic\CsException;
//use Common\Basic\Status;
//use Common\Basic\CodeConst;
//
//class ArticleService{
//	public function getInfo($id){
//		if ($id < 1) return false;
//		$info = $this->listDao()->getRecord($id);
//		if (empty($info)) {
//			throw new CsException('文章不存在', CodeConst::DataNotExist);
//		}
//		return $this->outputForInfo($info);
//	}
//

//
//	public function createOrModify($params){
//		//接收到的参数
//		$data = array(
//				'branch_id' =>$params['branch_id'],
//				'admin_id'  =>$params['admin_id'],
//				'title'     =>trim($params['title']),
//				'refer'     =>trim($params['refer']),
//				'keywords'  =>trim($params['keywords']),
//				'desc'      =>trim($params['desc']),
//				'cat_id'    =>trim($params['cat_id']),
//				'detail'    =>trim($params['detail']),
//				'sort'      =>$params['sort'],
//				'is_hot'    =>intval($params['is_hot']) ? intval($params['is_hot']) : Status::NO,
//				'images'    =>trim($params['images']),
//				'video_id'     =>trim($params['videonum']),
//				'status'    =>intval($params['status']) ? intval($params['status']) : Status::YES,
//				'show_time' =>strtotime($params['show_time']),
//		);
//		if ($params['id']) {
//			$data['id'] = $params['id'];
//		}
//		if (!$this->listDao()->create($data)){
//			throw new CsException($this->listDao()->getError(), CodeConst::ParamsError);
//		}
//		if ($params['id'] > 0){
//			$result = $this->listDao()->save();
//			if ($result === false){
//				throw new CsException('修改失败', CodeConst::SystemError);
//			}
//			$id = $params['id'];
//		} else {
//			$id = $this->listDao()->add();
//			if ($id < 1){
//				throw new CsException('添加失败', CodeConst::SystemError);
//			}
//			return $id;
//		}
//	}
//
//	public function delete($params){
//		$map = array(
//				'id'        =>$params['id'],
//				'branch_id' =>$params['branch_id'],
//				'is_delete' =>Status::NO,
//		);
//		$info = $this->listDao()->findRecord($map);
//		if (empty($info)) {
//			throw new CsException('文章不存在', CodeConst::DataNotExist);
//		}
//		$data = array(
//				'id'        =>$info['id'],
//				'is_delete' =>Status::YES,
//		);
//		if ($this->listDao()->saveRecord($data) === false) {
//			throw new CsException('删除失败', CodeConst::SystemError);
//		}
//	}
//
//	//状态开关
//	public function switchStatus($params){
//		// $params['branch_id'] = 1;
//        if (!isset($params['id']) || empty($params['branch_id']) || empty($params['type'])) {
//            throw new CsException('参数错误', CodeConst::ParamsError);
//        }
//        if ($params['cat_id'] > 0) {
//            $iscat = $this->categoryDao()->where(['cat_id'=>$params['cat_id']])->find();
//            if(!$iscat) throw new CsException('该分类不存在',400);
//        }
//
//        if (!empty($params['id'])) {
//			$map = array(
//					'id'=>$params['id'],
//			);
//			if (isset($params['branch_id'])) {
//				$map['branch_id'] = $params['branch_id'];
//			}
//			$info = $this->listDao()->findRecord($map);
//			if (empty($info)) {
//				throw new CsException('文章不存在', CodeConst::DataNotExist);
//			}
//			$data = array(
//					'id'     =>$info['id'],
//					'status' =>($info['status'] == Status::YES) ? Status::NO : Status::YES,
//			);
//			if($params['cat_id'])$data['cat_id'] = $params['cat_id'];
//			if ($this->listDao()->saveRecord($data) === false) {
//				throw new CsException('系统错误', CodeConst::SystemError);
//			}
//
//		} else { //编辑
//			//当文章ID为空时 判断官方的ID是否为空
//			if(empty($params['ref_id'])) throw new CsException("参数错误");
//			//ID不为空则查询官方的内容是否存在
//			$find = $this->listWhDao()->getRecord($params['ref_id']);
//			//如果存在则把当前的ID存一份进入本地的数据表里
//			if($find){
//			//并且启动成功分类也一并存入
//				$map = [
//					'branch_id'=>$params['branch_id'],
//					'ref_id'=>$params['ref_id'],
//					'cat_id'=>$params['cat_id'],
//					'add_time'=>time(),
//				];
//				$add = $this->listDao()->addRecord($map);
//				if($add){
//					$data['status']=Status::YES;
//				}else{
//					throw new CsException("启动失败");
//				}
//			// $data = array(
//			// 		'id'     =>$info['id'],
//			// 		'status' =>($info['status'] == Status::YES) ? Status::NO : Status::YES,
//			// );
//			// if($params['cat_id'])$data['cat_id'] = $params['cat_id'];
//			// if ($this->listDao()->saveRecord($data) === false) {
//			// 	throw new CsException('系统错误', CodeConst::SystemError);
//			// }
//			}else{
//				//否则如果不存在官方文章则报错
//				throw new Exception("暂无该文章");
//			}
//		}
//
//		return array(
//				'status'=>$data['status'],
//		);
//	}
//
//	//推荐开关
//	public function switchHot($params){
//		if (empty($params['id']) || empty($params['branch_id']) || empty($params['type'])) {
//			throw new CsException('参数错误', CodeConst::ParamsError);
//		}
//		if ($params['type'] == Status::TypeBranch) { //支部
//			$map = array(
//					'id'=>$params['id'],
//			);
//			if (isset($params['branch_id'])) {
//				$map['branch_id'] = $params['branch_id'];
//			}
//			$info = $this->listDao()->findRecord($map);
//			if (empty($info)) {
//				throw new CsException('文章不存在', CodeConst::DataNotExist);
//			}
//			$data = array(
//					'id'=>$info['id'],
//					'is_hot'=>($info['is_hot'] == Status::YES) ? Status::NO : Status::YES,
//			);
//			if ($this->listDao()->saveRecord($data) === false) {
//				throw new CsException('系统错误', CodeConst::SystemError);
//			}
//		} elseif ($params['type'] == Status::TypeWh) { //总部
//			$map = array(
//					'ref_id'=>$params['id'],
//			);
//			if (isset($params['branch_id'])) {
//				$map['branch_id'] = $params['branch_id'];
//			}
//			$info = $this->listDao()->findRecord($map);
//			if (empty($info)) { //添加
//				$info_wh = $this->listWhDao()->getRecord($params['id']);
//				if (empty($info_wh)) {
//					throw new CsException('官方文章不存在', CodeConst::DataNotExist);
//				}
//
//				$data = array(
//						'branch_id'=>$params['branch_id'],
//						'admin_id'=>$params['admin_id'],
//						'ref_id'=>$info_wh['id'],
//						'status'=>Status::NO,
//						'is_hot'=>Status::YES,
//						'add_time'=>NOW_TIME,
//				);
//				if ($this->listDao()->addRecord($data) === false) {
//					throw new CsException('系统错误', CodeConst::SystemError);
//				}
//			} else { //编辑
//				$data = array(
//						'id'=>$info['id'],
//						'is_hot'=>($info['is_hot'] == Status::YES) ? Status::NO : Status::YES,
//				);
//				if ($this->listDao()->saveRecord($data) === false) {
//					throw new CsException('系统错误', CodeConst::SystemError);
//				}
//			}
//		}
//		return array(
//				'is_hot'=>$data['is_hot'],
//		);
//	}
//
//	//统计阅读数
//	public function increaseReadNum($params){
//		M()->startTrans();
//		//统计文章阅读数
//		$map = array(
//				'id'=>$params['id'],
//		);
//		// dump($params);
//		if ($this->listDao()->where($map)->setInc('read_num') === false) {
//			M()->rollback();
//			throw new CsException('系统错误', CodeConst::SystemError);
//		}
//		// dump($params);
//
//		//添加浏览记录（匿名访问的不记录）
//		if ($params['user_id']) {
//			$map = array(
//					'user_id'=>$params['user_id'],
//					'article_id'=>$params['id'],
//					'article_type'=>Status::CatTypeLxyz,
//			);
//			$log_info = $this->logReadDao()->findRecord($map);
//			if (empty($log_info)) {
//				$data = array(
//						'user_id'      =>$params['user_id'],
//						'article_id'   =>$params['id'],
//						'article_type' =>Status::CatTypeLxyz,
//						'add_time'     =>NOW_TIME,
//						'update_time'  =>NOW_TIME,
//				);
//				if ($this->logReadDao()->addRecord($data) === false) {
//					M()->rollback();
//					throw new CsException('系统错误', CodeConst::SystemError);
//				}
//			} else {
//				$data = array(
//						'log_id'      =>$log_info['log_id'],
//						'update_time' =>NOW_TIME,
//				);
//				if ($this->logReadDao()->saveRecord($data) === false) {
//					M()->rollback();
//					throw new CsException('系统错误', CodeConst::SystemError);
//				}
//			}
//		}
//
//		M()->commit();
//	}
//
//	//支部文章
//	public function getPagerList($params){
//		$params['page'] < 1 && $params['page'] = 1;
//		$params['pagesize'] < 1 && $params['pagesize'] = 20;
//
//		$map = $params['map'] ? $params['map'] : array();
//		if ($params['branch_id']) {
//			$map['branch_id'] = $params['branch_id'];
//		}
//		if ($params['keyword']) {
//			$map['title'] = array('like', '%'.trim($params['keyword']).'%');
//		}
//		if ($params['cat_id']) {
//			$map['cat_id'] = $params['cat_id'];
//		}
//		if ($params['status']) {
//			$map['status'] = $params['status'];
//		}
//		if ($params['is_hot']) {
//			$map['id'] = $params['id'];
//			// $map['is_hot'] = $params['is_hot'];
//		}
//		$count = $this->listDao()->searchRecordsCount($map);
//		$list = array();
//		if($count > 0){
//			$orderby = empty($params['orderby']) ? 'sort ASC, id DESC' : $params['orderby'];
//			$list = $this->listDao()->searchRecords($map, $orderby, $params['page'], $params['pagesize']);
//		}
//		if(count($list) > 0)
//		{
//			$list = $this->outputForList($list);
//		}else{
//			$list = [];
//		}
//		return array(
//            'list'=>$list,
//            'count'=>$count,
//            'page'=>$params['page'],
//            'pagesize'=>$params['pagesize'],
//		);
//	}
//
//	//官方文章
//	public function getWhPagerList($params){
//		if (empty($params['branch_id'])) {
//			throw new CsException('参数错误', CodeConst::ParamsError);
//		}
//		$params['page'] < 1 && $params['page'] = 1;
//		$params['pagesize'] < 1 && $params['pagesize'] = 20;
//
//		$map = array();
//		$map['is_delete'] = Status::None;
//		$where['branch_id'] = $params['branch_id'];
//        $where['ref_id'] = ['neq',0];
//		$where['is_delete'] = Status::None;
//		if ($params['keyword']) {
//			$map['title'] = array('like', '%'.trim($params['keyword']).'%');
//		}
//		if ($params['cat_id']) {
//			$map['cat_id'] = $params['cat_id'];
//		}
//		if ($params['status']) {
//			$where['status'] = $params['status'];
//			$tj = $this->listDao()->where($where)->getfield('ref_id',true);
//			if($tj) $map['id'] = ['in',$tj];
//
//		}
////		if ($params['is_hot']) {
////			$map['b.is_hot'] = $params['is_hot'];
////		}
//
//		$count = $this->listWhDao()->where($map)->count();
//        $list = array();
//        if($count > 0){
//            $orderby = empty($params['orderby']) ? 'id DESC' : $params['orderby'];
//            $wh_list = $this->listWhDao()->where($map)->order($orderby)->page($params['page'], $params['pagesize'])->select();
//            foreach($wh_list as $v) $ref_id[] = $v['id'];
//            $where['ref_id'] = ['in',$ref_id];
//            $list = $this->listDao()->where($where)->getfield('ref_id,status,id,read_num,sort,cat_id');
//            foreach($wh_list as $k=>$v)
//            {
//                $wh_list[$k]['id']      = is_null($list[$v['id']]['id']) ? '' : $list[$v['id']]['id'];
//                $wh_list[$k]['cat_id']  = is_null($list[$v['id']]['cat_id']) ? '' : $list[$v['id']]['cat_id'];
//                $wh_list[$k]['status']  = is_null($list[$v['id']]['status']) ? '' : $list[$v['id']]['status'];
//                $wh_list[$k]['read_num'] = is_null($list[$v['id']]['read_num'])? '' :$list[$v['id']]['read_num'] ;
//                $wh_list[$k]['sort']    = is_null($list[$v['id']]['sort'])? '' : $list[$v['id']]['sort'];
//                $wh_list[$k]['ref_id'] = $v['id'];
//            }
//        }
//        if(count($wh_list) > 0)
//		{
//			$list = $this->outputList($wh_list);
//		}else{
//			$list = [];
//		}
//		return array(
//				'list'     =>$list,
//				'count'    =>$count,
//				'pagesize' =>$params['pagesize'],
//		);
//	}
//
//	//浏览记录
//	public function getLogList($params){
//		$params['page'] < 1 && $params['page'] = 1;
//		$params['pagesize'] < 1 && $params['pagesize'] = 20;
//
//		$map = $params['map'] ? $params['map'] : array();
//		if ($params['user_id']) {
//			$map['user_id'] = $params['user_id'];
//		}
//		if (intval($params['filter_day']) == 1) {
//			$map['_string'] = 'TO_DAYS(NOW()) = TO_DAYS(add_time)';
//		}
//		if (intval($params['filter_month']) == 1) {
//			$map['_string'] = 'DAYOFMONTH(NOW()) = DAYOFMONTH(add_time)';
//		}
//
//		$count = $this->logReadDao()->searchRecordsCount($map);
//		$list = array();
//		if($count > 0){
//			$list = $this->logReadDao()->searchRecords($map, $params['orderby'], $params['page'], $params['pagesize']);
//		}
//		return array(
//				'list'     =>$this->outputForLogList($list),
//				'count'    =>$count,
//				'page'     =>$params['page'],
//				'pagesize' =>$params['pagesize'],
//		);
//	}
//
//	private function outputForList($list) {
//		if (!empty($list)) {
//			//找出所有引用的文章
//			$ref_ids = [];
//			foreach ($list as $v) {
//				$v['ref_id'] && $ref_ids[] = $v['ref_id'];
//                $v['video_id'] && $videos[$v['id']] = Service('Vod')->getMezzanineInfo($v['video_id'])['Mezzanine']['FileURL'];
//            }
//            if ($ref_ids) {
//				$map = ['id'=>['in', $ref_ids]];
//				$list_wh = $this->listWhDao()->searchAllRecords($map);
//				foreach ($list_wh as $k => $v) {
//					$list_wh[$v['id']] = $v;
//                    $v['video_id'] && $videos_wh[$v['id']] = Service('Vod')->getMezzanineInfo($v['video_id'])['Mezzanine']['FileURL'];
//                }
//			}
//			//自定义分类
//			$current_article = current($list);
//			$map = [
//				'ref_id'=>0,
//				'status'=>Status::YES,
//				'branch_id'=>$current_article['branch_id'],
//			];
//			$cats = $this->categoryDao()->searchFieldRecords($map);
//			//官方分类
//			$map = [
//				'status'=>Status::YES,
//			];
//			$cats_wh = $this->categoryWhDao()->searchFieldRecords($map);
//			foreach ($list as $k => $v) {
//				if ($v['ref_id']) { //引用的文章
//					$article_wh                = $list_wh[$v['ref_id']];
//					$article_wh['id']          = $v['id'];
//					$article_wh['cat_name']    = $cats_wh[$article_wh['cat_id']]['cat_name'];
//					$article_wh['type']        = Status::TypeWh;
//					$article_wh['read_num']    = $v['read_num'];
//					$article_wh['collect_num'] = $v['collect_num'];
//					$article_wh['images'] 	   = $list_wh[$v['ref_id']]['images'] ? explode(',', $list_wh[$v['ref_id']]['images']) : array();
//					$article_wh['sort'] 	   = $v['sort'];
//					$aritcle_wh['video']       = is_null($videos_wh[$v['id']]) ? '' : $videos_wh[$v['id']] ;
//					$list[$k] = $article_wh;
//				} else {
//					$list[$k]['cat_name'] = $cats[$v['cat_id']]['cat_name'];
//					$list[$k]['images'] = $v['images'] ? explode(',', $v['images']) : array();
//					$list[$k]['detail'] = htmlspecialchars_decode($v['detail']);
//					$list[$k]['status_label'] = Status::$catStatusList[$v['status']];
//					$list[$k]['type'] = Status::TypeBranch;
//					$list[$k]['video'] = is_null($videos[$v['id']]) ? '' : $videos[$v['id']] ;
//				}
//			}
//		}
//		return $list;
//	}
//
//	private function outputList($list) {
//		if (empty($list)) {
//			return [];
//		}
//		//官方分类
//		$map = [
//			'status'=>Status::YES,
//		];
//		$cats_wh = $this->categoryWhDao()->searchFieldRecords($map);
//		//自定义分类
//		$map = [
//			'status'    =>Status::YES,
//			'branch_id' =>$current_article['branch_id'],
//		];
//		$cats = $this->categoryDao()->searchFieldRecords($map);
//		foreach ($cats as $key => $value) {
//			if ($value['ref_id'] > 0) {
//				$cats[$key]['cat_name'] = $cats_wh[$value['ref_id']]['cat_name'];
//			}
//        }
//		foreach ($list as $k => $v) {
//            $v['video_id'] && $videos[$v['id']] = Service('Vod')->getMezzanineInfo($v['video_id'])['Mezzanine']['FileURL'];
//            $list[$k]['cat_name'] = $cats[$v['cat_id']]['cat_name'];
//			$list[$k]['images'] = $v['images'] ? explode(',', $v['images']) : array();
//			$list[$k]['detail'] = htmlspecialchars_decode($v['detail']);
//			$list[$k]['status_label'] = Status::$catStatusList[$v['status']];
//			$list[$k]['type'] = $v['ref_id']  ? Status::TypeWh : Status::TypeBranch;
//			$list[$k]['video'] = is_null($videos[$v['id']]) ? '' : $videos[$v['id']] ;
//			// $list[$k]['sort'] = $cats['sort'];
//		}
//		return $list;
//	}
//
//	private function outputForWhList($list) {
//		if (!empty($list)) {
//			//分类
//			$cats = $this->categoryWhDao()->searchFieldRecords();
//			foreach ($list as $k => $v) {
//				$list[$k]['cat_name'] = $cats[$v['cat_id']]['cat_name'];
//				$list[$k]['images'] = $v['images'] ? explode(',', $v['images']) : array();
//				$list[$k]['detail'] = htmlspecialchars_decode($v['detail']);
//				$list[$k]['status_label'] = Status::$catStatusList[$v['status']];
//				$list[$k]['type'] = Status::TypeWh;
//			}
//		}
//		return $list;
//	}
//
//	private function outputForLogList($list) {
//		if (!empty($list)) {
//			foreach ($list as $k => $v) {
//				switch ($v['article_type']) {
//					case Status::CatTypeLxyz: //两学一做
//						$article = $this->listDao()->getRecord($v['article_id']);
//						if($article['ref_id']!=0)
//						{
//							$id = $article['id'];
//							$article = $this->listWhDao()->getRecord($article['ref_id']);
//							$article['id'] = $id;
//						}
//						$article['cat_type'] = Status::CatTypeLxyz;
//						$article['update_time'] = $v['update_time'];
//						$article['log_id']	= $v['log_id'];
//					break;
//					case Status::CatTypeDjzt: //党建专题
//						$article = $this->specialDao()->getRecord($v['article_id']);
//						if($article['ref_id']!=0)
//						{
//							$id = $article['id'];
//							$article = $this->SpecialWhDao()->getRecord($article['ref_id']);
//							$article['id'] = $id;
//						}
//						$article['cat_type'] = Status::CatTypeDjzt;
//						$article['update_time'] = $v['update_time'];
//						$article['log_id']	= $v['log_id'];
//					break;
//				}
//				$list[$k] = $article;
//			}
//		}
//		return $list;
//	}
//
//	private function outputForInfo($info) {
//
//		if (!empty($info)) {
//			$read = $info['read_num'];
//			$collect =  $info['collect_num'];
//			if ($info['ref_id']) { //引用的文章
//				$info = $this->listWhDao()->getRecord($info['ref_id']);
//				$cat = $this->categoryWhDao()->getRecord($info['cat_id']);
//			} else {
//				$cat = $this->categoryDao()->getRecord($info['cat_id']);
//			}
//			$info['cat_name'] = $cat['cat_name'];
//			$info['detail'] = htmlspecialchars_decode($info['detail']);
//			$info['images'] = $info['images'] ? explode(',', $info['images']) : array();
//			$info['status_label'] = Status::$catStatusList[$info['status']];
//			$info['read_num'] = $read;
//			$info['collect_num'] = $collect;
//		}
//		return $info;
//	}
//
//	private function listDao() {
//		return D('Common/Article/Article');
//	}
//
//	private function listWhDao() {
//		return D('Common/Article/ArticleWh');
//	}
//
//	private function categoryDao() {
//		return D('Common/Category/Category');
//	}
//
//	private function categoryWhDao() {
//		return D('Common/Category/CategoryWh');
//	}
//
//	private function logReadDao() {
//		return D('Common/User/LogRead');
//	}
//
//	private function specialDao() {
//		return D('Common/Article/Special');
//	}
//
//	private function SpecialWhDao() {
//		return D('Common/Article/SpecialWh');
//	}
//}//end ArticleService!甜品