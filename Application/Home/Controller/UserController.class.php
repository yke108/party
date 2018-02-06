<?php
namespace Home\Controller;

use Common\Basic\CsException;
use Common\Basic\Status;

class UserController extends FController {
	public function infoAction(){
		$user_id   = I('post.user_id');
		$branch_id = I('post.branch_id');
		if ($user_id < 1){
			throw new CsException('缺少参数', 11);
		}
		$user     = $this->userService()->getUserInfo($user_id);
		$point    = $this->pointService()->myPoint($user_id, $branch_id);
		$user_img = empty($user['user_img']) ? DK_DOMAIN.'/static/icons/common/basicprofile.jpg' : picurl($user['user_img']);
		$userinfo = [
			'UserId'       =>$user['user_id'],
			'BranchId'     =>$user['branch_id'],
			'Mobile'       =>$user['mobile'],
			'NickName'     =>$user['nick_name'],
			'RealName'     =>$user['real_name'],
			'Sex'          =>$user['sex'],
			'Birthday'     =>$user['birthday'],
			'UserImg'      =>$user_img,
			'TotalPoints'  =>$point['TotalPoints'],
			'MainRanking'  =>$point['MainRanking'],
			'SubRanking'   =>$point['SubRanking'],
			'Signature'    =>$user['signature'],
			'JoinDay'      =>$user['join_day'],
			'District'     =>$user['district'],
			'UserTypeIcon' =>DK_DOMAIN.'/static/icons/myself/icon.png',
		];
		$data = [
			'Info'=>$userinfo,
		];
		$this->jsonReturn($data);
	}
	
	public function modifyAction(){
		$user_id = I('post.user_id');
		if ($user_id < 1){
			throw new CsException('缺少参数', 11);
		}
		$this->userService()->modify(I('post.'));
		$this->jsonReturn('操作成功');
	}

	/**
	 * desc 排行榜
	 * @param $type 1-总排行榜，2-支部排行榜，3-阅读排行榜，4-风采排行榜，5-考试排行榜
	 * @return array
	 */
	public function rankingAction(){
		$user_id = I('post.user_id');
		$branch_id = I('post.branch_id');
		$type = I('post.type', 0, 'intval');
		if ($user_id < 1 || $branch_id < 1 || !in_array($type, [1,2,3,4,5])){
			throw new CsException('缺少参数', 11);
		}
		$list = $this->pointService()->getRanking($branch_id, $type);
		$this->jsonReturn(['list'=> $list]);
	}

	/**
	 * desc 我的积分
	 * @param page    1
	 * @param pagesize  10
	 * @return array
	 */
	public function pointLogAction(){
		$param = I('post.');
		if ($param['user_id'] < 1){
			throw new CsException('缺少参数', 11);
		}
		$list = $this->pointService()->getPointLog($param);
		$this->jsonReturn(['list'=> $list]);
	}

	/**
	 * [collection 我的收藏]
	 * @return [type] [description]
	 */
	public function mycollectionAction()
	{
		$post = I('post.');
//		$check = [
//			'用户ID为空'=>'user_id',
//		];
//		$this->check_empty($post,$check);
		$post['page'] < 1 && $post['page'] = 1;
		$post['pagesize'] < 1 && $post['pagesize'] = 20;

		$list = [];
		$where = [
			'user_id'=>$post['user_id'],
//			'user_id'=>17122809483784,
		];
		$count = M('collection')->where($where)->page($post['page'],$post['pagesize'])->count();
            $coll = M('collection')->field('user_id',true)->where($where)->page($post['page'],$post['pagesize'])->order('add_time desc')->select();
        //查询收藏表 如果成功
		if($coll)
		{
			foreach($coll as $k=>$v)
			{
				switch($v['collection_type'])
				{
					case '101':
						$sql = 'lxyz';
						$catTypeName = '两学一做';
						$catType = 1;
					break;
					case '102':
						$sql = 'special';
						$catTypeName = '党建专题';
						$catType = 2;
					break;
					default:
						continue 2;						
					break;
				}
				$where = [
					'status'=>Status::YES,
					'id'=>$v['content_id'],
					'is_delete'=>Status::None,
				];
				$result = M($sql)->where($where)->find();
                $list[] = [
                    'Id'          =>$result['id'],
                    'LogId'       =>$v['id'],
                    'Title'       =>$result['title'],
                    'Refer'       =>$result['refer'],
                    'Desc'        =>$result['desc'],
                    'CatType'     =>$catType,
                    'CatTypeName' =>$catTypeName,
                    'Images'      =>picurls($result['images']),
                    'ReadNum'     =>$result['read_num'],
                    'CollectNum'  =>$result['collect_num'],
                    'AddTime'     =>$v['add_time'],
                ];
			}
		}
		$map = [
			'List'=>$list,
			'Count'=>$count,
			'Page'=>$post['page'],
			'Pagesize'=>$post['pagesize'],
		];

		$this->jsonReturn($map);
	}
	
	/**
	 * desc 文章浏览记录
	 * @param user_id
	 * @param page    1
	 * @param pagesize  10
	 * @return array
	 */
	public function logReadAction(){
		$post = I('post.');
		if ($post['user_id'] < 1){
			throw new CsException('缺少参数', 11);
		}
		$result = $this->articleService()->getLogList($post);
		$list = [];
		foreach ($result['list'] as $v) {
			$list[] = [
				'Id'=>$v['id'],
                'Images'=>picurls($v['images']),
                'ReadNum'=>$v['read_num'],
                'CollectNum'=>$v['collect_num'],
				'LogId'=>$v['log_id'],
				'Title'=>$v['title'],
				'CatType'=>$v['cat_type'],
				'AddTime'=>date('Y-m-d', $v['update_time']),
			];
		}
		$data = [
			'List'=> $list,
			'Count'=> $result['count'],
			'Page'=> $result['page'],
			'PageSize'=> $result['pagesize'],
		];
		$this->jsonReturn($data);
	}
	
	protected function userService(){
		return D('User', 'Service');
	}
	
	protected function branchService(){
		return D('Branch', 'Service');
	}

	protected function pointService(){
		return D('Point', 'Service');
	}
	
	protected function articleService(){
		return D('Article', 'Service');
	}
}