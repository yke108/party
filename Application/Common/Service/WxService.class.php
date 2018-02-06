<?php
namespace Common\Service;

use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class WxService
{

    //小程序列表
    public function getPagerList($params)
    {
        //判断是否传分页的参数过来
        $params['page'] < 1 && $params['page'] = 1;
        $params['pagesize'] < 1 && $params['pagesize'] = 20;

        $map = $params['map'] ? $params['map'] : array();

        //支部ID
        if ($params['branch_id']) $map['branch_id'] = $params['branch_id'];
        //查询内容
        if ($params['keyword']) $map['title'] = array('like', '%' . trim($params['keyword']) . '%');
        //分类
        if ($params['cat_id']) $map['cat_id'] = $params['cat_id'];
        //状态
        if ($params['status']) $map['status'] = $params['status'];
        //是否推荐首页
        if ($params['is_hot']) $map['id'] = $params['id'];
        //同一个地区
        if ($params['region_code']) $map['region_code'] = ['like',getpreg($params['region_code']).'%'];
        //查询数量
        $count = $this->listDao()->searchRecordsCount($map);
        $list = array();
        if ($count > 0) {
            //排序
            $orderby = empty($params['orderby']) ? 'branch_id DESC' : $params['orderby'];
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
            'list' => $list,
            'count' => $count,
            'page' => $params['page'],
            'pagesize' => $params['pagesize'],
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
//            //通过VideoId搜索视频链接
//
//            //循环处理数据
        foreach ($list as $k => $v) {
//                //分类名称
//                $list[$k]['cat_name'] = $cats[$v['cat_id']]['cat_name'];
//                //图片处理
//                $list[$k]['images'] = $v['images'] ? explode(',', $v['images']) : array();
//                //文章详情格式化
//                $list[$k]['detail'] = htmlspecialchars_decode($v['detail']);
            //状态类型 启用 不启用
            $list[$k]['status_label'] = Status::$catStatusList[$v['status']];
            //获取地区组
            $list[$k]['region_code_pre'] = getParentRegionCode($v['region_code']);
            //修改BRANCH_ID
            $list[$k]['id'] = $v['branch_id'];
            unset($list[$k]['branch_id']);
            //修改创建时间
            $list[$k]['expire_time'] = date('Y-m-d',$v['expire_time']);
        }
//        }
        return $list;
    }



    //新增或修改数据
    public function createOrModify($params)
    {
//        print_r($params);
        //接收到的参数
        $data = [
            'branch_id' => time() . rand(100,999),
            'app_name' => trim($params['app_name']),
            'username' => trim($params['username']),
            'user' => trim($params['user']),
            'phone' => trim($params['phone']),
            'region_code' => trim($params['code']),
            'address' => trim($params['address']),
            'remark' => trim($params['remark']),
            'expire_time' => strtotime($params['expire_time']),
            'add_time' => time(),
            'status' => 1,
        ];
        if ($params['id']) {
            $data['branch_id'] = $params['id'];
        }

        if (!$this->listDao()->create($data)) {
            throw new CsException($this->listDao()->getError(), CodeConst::ParamsError);
        }

        if ($params['id'] > 0) {
            unset($data['app_name']);
            unset($data['username']);
            unset($data['branch_id']);
            $result = $this->listDao()->save();
            if ($result === false) {
                throw new CsException('修改失败', CodeConst::SystemError);
            }
            $id = $params['id'];
        } else {
            $this->listDao()->startTrans();
            $id = $this->listDao()->add();
            if ($id < 1) {
                throw new CsException('添加失败', CodeConst::SystemError);
            }
            $data['branch_id'] = $id;
            $data['password'] = $params['password'];
            $data['repassword'] = $params['repassword'];
            //新增一个管理员
            $adminid = $this->createadmin($data);
            if($adminid)
            {
                $this->listDao()->commit();
            }else{
                $this->listDao()->rollback();
            }
            //添加积分规则
            Service('Point')->addDefaultPointData($id);
        }
        return $id;
    }

    //新增一个管理员
    public function createadmin($params){
        //接收到的参数
        $data = array(
            'branch_id'=>$params['branch_id'],
            'admin_name'=>trim($params['user']),
            'username'=>trim($params['username']),
            'mobile'=>trim($params['phone']),
            'password'=>trim($params['password']),
            'repassword'=>trim($params['repassword']),
            'remark'=>$params['remark'],
            'status'=>$params['status'],
            'region_code'=>$params['region_code'],
            'is_admin'=>1,
        );
        if ($params['admin_id']) {
            $data['admin_id'] = $params['admin_id'];
        }
        if (!$this->adminDao()->create($data)){
            throw new CsException($this->adminDao()->getError(), CodeConst::ParamsError);
        }
        unset($data['repassword']);
            $admin_id = $this->adminDao()->addRecord($data);
            if ($admin_id < 1){
                throw new CsException('添加失败');
            }
        return $admin_id;
    }


































//
//	public function getInfo($id){
//		if ($id < 1) return false;
//		$info = $this->articleDao()->getRecord($id);
//		if (empty($info)) {
//			throw new CsException('文章不存在', CodeConst::DataNotExist);
//		}
//		return $this->outputForInfo($info);
//	}
//
//	public function findInfo($map){
//		$info = $this->articleDao()->findRecord($map);
//		if (empty($info)) {
//			throw new CsException('文章不存在', CodeConst::DataNotExist);
//		}
//		return $this->outputForInfo($info);
//	}
//

//
//	public function delete($params){
//		$map = array(
//				'id'        =>$params['id'],
//				'branch_id' =>$params['branch_id'],
//				'is_delete' =>Status::NO,
//		);
//		$info = $this->articleDao()->findRecord($map);
//		if (empty($info)) {
//			throw new CsException('文章不存在', CodeConst::DataNotExist);
//		}
//		$data = array(
//				'id'        =>$info['id'],
//				'is_delete' =>Status::YES,
//		);
//		if ($this->articleDao()->saveRecord($data) === false) {
//			throw new CsException('删除失败', CodeConst::SystemError);
//		}
//	}
//

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
//			$info = $this->articleDao()->findRecord($map);
//			if (empty($info)) {
//				throw new CsException('文章不存在', CodeConst::DataNotExist);
//			}
//			$data = array(
//					'id'=>$info['id'],
//					'is_hot'=>($info['is_hot'] == Status::YES) ? Status::NO : Status::YES,
//			);
//			if ($this->articleDao()->saveRecord($data) === false) {
//				throw new CsException('系统错误', CodeConst::SystemError);
//			}
//		} elseif ($params['type'] == Status::TypeWh) { //总部
//			$map = array(
//					'ref_id'=>$params['id'],
//			);
//			if (isset($params['branch_id'])) {
//				$map['branch_id'] = $params['branch_id'];
//			}
//			$info = $this->articleDao()->findRecord($map);
//			if (empty($info)) { //添加
//				$info_wh = $this->articleWhDao()->getRecord($params['id']);
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
//				if ($this->articleDao()->addRecord($data) === false) {
//					throw new CsException('系统错误', CodeConst::SystemError);
//				}
//			} else { //编辑
//				$data = array(
//						'id'=>$info['id'],
//						'is_hot'=>($info['is_hot'] == Status::YES) ? Status::NO : Status::YES,
//				);
//				if ($this->articleDao()->saveRecord($data) === false) {
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
//		if ($this->articleDao()->where($map)->setInc('read_num') === false) {
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
////			$ref_ids = [];
////			foreach ($list as $v) {
////				$v['ref_id'] && $ref_ids[] = $v['ref_id'];
////                $v['video_id'] && $videos[$v['id']] = Service('Vod')->getMezzanineInfo($v['video_id'])['Mezzanine']['FileURL'];
////            }
////            if ($ref_ids) {
////				$map = ['id'=>['in', $ref_ids]];
////				$list_wh = $this->articleWhDao()->searchAllRecords($map);
////				foreach ($list_wh as $k => $v) {
////					$list_wh[$v['id']] = $v;
////                    $v['video_id'] && $videos_wh[$v['id']] = Service('Vod')->getMezzanineInfo($v['video_id'])['Mezzanine']['FileURL'];
////                }
////			}
//			//自定义分类
////			$current_article = current($list);
////			$map = [
////				'ref_id'=>0,
////				'status'=>Status::YES,
////				'branch_id'=>$current_article['branch_id'],
////			];
////			$cats = $this->categoryDao()->searchFieldRecords($map);
////			//官方分类
////			$map = [
////				'status'=>Status::YES,
////			];
////			$cats_wh = $this->categoryWhDao()->searchFieldRecords($map);
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
//						$article = $this->articleDao()->getRecord($v['article_id']);
//						if($article['ref_id']!=0)
//						{
//							$id = $article['id'];
//							$article = $this->articleWhDao()->getRecord($article['ref_id']);
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
//				$info = $this->articleWhDao()->getRecord($info['ref_id']);
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

	private function listDao() {
		return D('Common/Wx/Wx');
	}
	
	// private function listWhDao() {
	// 	return D('Common/Wx/VideoWh');
	// }
	
	private function categoryDao() {
		return D('Common/Category/Category');
	}

    private function adminDao()
    {
        return D('Common/Admin/Admin');
    }
}//end ArticleService!甜品