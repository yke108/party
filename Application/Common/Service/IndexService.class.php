<?php
namespace Common\Service;

// use Common\Basic\CsException;
use Common\Basic\Status;
// use Common\Basic\CodeConst;

class IndexService{
		
		public function getlist($post)
		{
			$branch_id = intval($post['branch_id']);

			$news_list = [];
			$even_list = [];
			$mien_list = [];
			$notice_list = [];
			$sort_list = [];
			//查询推荐到首页的表
			$top = $this->topDao()->select();
			foreach($top as $k=>$v)
			{
				$newtop[$v['top_type']][] = $v['content_id'];
			}


			//轮播广告列表
			$map = [
				'enabled'=>Status::YES,
				'start_time'=>['lt', NOW_TIME],
				'end_time'=>['gt', NOW_TIME],
				'position_code'=>'home',
			];
			$field = 'ad_type, ad_value, ad_picture,ad_id,ad_title';
			$ll = $this->adDao()->where($map)->field($field)->select();
			$ad_list = [];
			foreach ($ll as $v){
				$ad_list[] = [
					'AdId'		=> $v['ad_id'],
					'AdType' 	=> $v['ad_type'],
					'AdTitle'	=> $v['ad_title'],
					'AdValue' 	=> $v['ad_value'],
					'Picture' 	=> picurl($v['ad_picture']),
				];
			}
			//两学一做
			if($newtop[Status::CollectTypeLxyz]){
				$map = [
					'status'=>Status::YES,
					'branch_id'=>$branch_id,
					'id'=>['in',$newtop[Status::CollectTypeLxyz]],
				];
				$field = 'id, title, refer, desc, images, read_num, collect_num,show_time,ref_id,add_time,sort';
				$ll = $this->lxyzDao()->where($map)->field($field)->limit(3)->order('sort')->select();


				$temp_sort = [];
				foreach ($ll as $vo){
					$sort_list[Status::CollectTypeLxyz][$vo['id']] = $vo['sort'];

					$news_list[] = [
						'Id'          =>$vo['id'],
						'Title'       =>$vo['title'],
						'Refer'       =>$vo['refer'],
						'Desc'        =>$vo['desc'],
						'CatType'     =>Status::CatTypeLxyz,
						'CatTypeName' =>Status::$catTypeList[Status::CatTypeLxyz],
						'Images'      =>picurls($vo['images']),
						'ShowTime'    =>$vo['show_time'],
						'ReadNum'     =>$vo['read_num'],
						'CollectNum'  =>$vo['collect_num'],
						'AddTime'     =>$vo['add_time'],
						'Sort'        =>$vo['sort'],
					];
					$temp_sort[] = $sort_list[Status::CollectTypeLxyz][$vo['id']];
				}
			}

			//党建专题
			if($newtop[Status::CollectTypeSpecial]){
				$map = [
					'status'    =>Status::YES,
					'branch_id' =>$branch_id,
					'id'        =>['in',$newtop[Status::CollectTypeSpecial]],
				];
				$field = 'id, title, refer, desc, images, read_num, collect_num,show_time,ref_id,add_time,sort';
				$ll = $this->specialDao()->where($map)->field($field)->limit(3)->order('sort')->select();
				foreach ($ll as $vo){
					$sort_list[Status::CollectTypeSpecial][$vo['id']] = $vo['sort'];

					$news_list[] = [
						'Id'          =>$vo['id'],
						'Title'       =>$vo['title'],
						'Refer'       =>$vo['refer'],
						'Desc'        =>$vo['desc'],
						'CatType'     =>Status::CatTypeDjzt,
						'CatTypeName' =>Status::$catTypeList[Status::CatTypeDjzt],
						'Images'      =>picurls($vo['images']),
						'ShowTime'    =>$vo['show_time'],
						'ReadNum'     =>$vo['read_num'],
						'CollectNum'  =>$vo['collect_num'],
						'AddTime'     =>$vo['add_time'],
						'Sort'        =>$vo['sort'],
					];
					$temp_sort[] = $sort_list[Status::CollectTypeSpecial][$vo['id']];
				}
			}
			// dump($sort_list);
			// dump($sort_list[Status::CollectTypeSpecial][$v[]]);

			array_multisort($temp_sort, SORT_ASC, $news_list);

			
			//活动列表
			if($newtop[Status::CollectTypeActivity]){
				$map = [
					'status'    =>Status::YES,
					'branch_id' =>$branch_id,
					'even_id'   =>['in',$newtop[Status::CollectTypeActivity]],
				];
//                dump($map);
                $field = 'even_id, title, location, starttime, peoplenum, partakenum, photo, top, addtime,is_cancle';
				$ll    = $this->evenDao()->where($map)->field($field)->limit(2)->order('addtime desc')->select();
//				 dump(M()->getlastsql());
				$temp_sort = [];
				foreach($ll as $v)
				{
					$even_list[] =   [
						'EvenId'     =>	$v['even_id'],
						'Title'      =>	$v['title'],
						'Location'   =>	$v['location'],
						'StartTime'  =>	$v['starttime'],
						'PeopleNum'  =>	$v['peoplenum'],
						'PartakeNum' =>	$v['partakenum'],
						'Photo'      =>	picurl($v['photo'], 'w640'),
                        'IsCancle'   =>	$v['is_cancle'],
						'Addtime'    =>	$v['addtime'],
					];
				}
			}
			
			//风采列表
			if($newtop[Status::CollectTypeMien]){
				$map = [
					'status'    =>Status::YES,
					'branch_id' =>$branch_id,
					'mien_id'   =>['in',$newtop[Status::CollectTypeMien]],
				];
				$field = 'mien_id, user_id, content, readnum, likenum, photo, top, addtime';
				$ll    = $this->partymienDao()->where($map)->field($field)->order('addtime desc')->limit(3)->select();
				foreach ($ll as $v){
					$ids[$v['user_id']] = $v['user_id'];
					$other[] = $v['mien_id'];
				}
				$users = $this->userInfoDao()->getRecords($ids);
				if(!is_null($other)) $otherinfo = $this->getinfoAction('mien',$other,$post['user_id']);

				$temp_sort = [];
				foreach($ll as $v){
					$item = [
						'MienId'     =>$v['mien_id'],
						'Photo'      =>picurls($v['photo']),
						'SmallPhoto' =>picurls($v['photo'], 'b200'),
						'Content'    =>base64_decode($v['content']),
						'Readnum'    =>$v['readnum'],
						'Likenum'    =>$v['likenum'],
						// 'Top'     =>$v['top'],
						'Addtime'    =>$v['addtime'],
						'User'       =>[],
					];
					if ($user = $users[$v['user_id']]) {

						$item['User'] = [
							'UserId'   =>$user['user_id'],
							'RealName' =>$user['real_name'],
							'UserImg'  =>(!empty($user['user_img']))?picurls($user['user_img'],'b600'):[DK_DOMAIN.'/static/icons/common/basicprofile.jpg'],
							'Sex'      => $user['sex'] == Status::Sexboy ? '男' : '女',
							'Age'      => getAge($user['birthday']),
						];
					}
					$item['OtherStatus'] = ($otherinfo[$v['mien_id']]) ? Status::LikeFalse  : Status::LikeTrue;
					$mien_list[]         = $item;
					// $temp_sort[]         = $sort_list[Status::CollectTypeMien][$v['mien_id']];
				}
				// array_multisort($temp_sort, SORT_ASC, $mien_list);
			}
				
			//公告列表
			if($newtop[Status::CollectTypeNotice]){
				$map = [
					'branch_id'=>$branch_id,
					'notice_id'=>['in',$newtop[Status::CollectTypeNotice]],
				];
				$field = 'notice_id, title, content, top, addtime';
				$ll = $this->noticeDao()->where($map)->field($field)->limit(5)->select();
				$temp_sort = []; 
				foreach ($ll as $v){
					$notice_list[] = [
						'NoticeId' =>	$v['notice_id'],
						'Title'    =>	$v['title'],
						'Content'  =>	$v['content'],
						// 'Top'   =>	$v['top'],
						'Addtime'  =>	$v['addtime'],
					];
					$temp_sort[] = $sort_list[Status::CollectTypeNotice][$v['notice_id']];
				}

				array_multisort($temp_sort,SORT_ASC,$notice_list);
			}
//

			$data = [
				'AdList'     =>$ad_list,
				'NewsList'   =>$news_list,
				'EvenList'   =>$even_list,
				'MienList'   =>$mien_list,
				'NoticeList' =>$notice_list,
				'Display'    =>Status::YES,
			];
			return $data;
		}
	protected function topDao()
	{
		return D('top');
	}

	protected function adDao(){
		return D('AdInfo');
	}
	
	protected function evenDao(){
		return D('Even');
	}
	
	protected function partymienDao(){
		return D('Partymien');
	}
	
	protected function lxyzDao(){
        return D('Common/Article/Article');
	}

    protected function lxyz_whDao(){
        return D('Common/Article/ArticleWh');
    }
	
	protected function specialDao(){
        return D('Common/Article/Special');
	}

    protected function special_whDao(){
        return D('Common/Article/SpecialWh');
    }

	protected function noticeDao()
	{
		return D('Notice');
	}

	protected function userInfoDao(){
		return D('Common/User/UserInfo');
	}

	protected function branchInfo(){
		return D('Common/Branch/Branch');	
	}

	protected function getinfoAction($type,$other,$userid)
	{
		switch($type)
		{
			case 'mien':
				$arr = [
					'content_id'=>['in',$other],
					'user_id'=>$userid,
					'like_type'=>1,
				];
				return M('like_log')->where($arr)->getField('content_id,user_id,add_time',true);
			break;
		}
	}
}