<?php
namespace Common\Service;
use Common\Basic\CsException;
use Common\Basic\Point;

class PointService{

	private $pointRuleDao;
	private $pointLogDao;
	private $userPointDao;

	public function __construct() {
		$this->pointRuleDao = D('Common/Point/PointRule');
		$this->pointLogDao = D('Common/Point/UserPointLog');
		$this->userPointDao = D('Common/Point/userPoint');
		$this->userInfoDao = D('Common/User/UserInfo');
	}

	/**
	 * desc 支部添加积分默认规则
	 * @param $branch_id
	 * @return
	 */
	public function addDefaultPointData($branch_id) {
		foreach (Point::$ruleDefaultData as $rule_type => $value) {
			if (!$this->pointRuleDao->where(['branch_id'=> $branch_id, 'rule_type'=> $rule_type])->count()) {
				$this->pointRuleDao->add([
					'branch_id'=> $branch_id,
					'rule_type'=> $rule_type,
					'rule_cat'=> $value['rule_cat'],
					'point'=> $value['point'],
					'primary_key'=> $value['primary_key'],
					'max_type'=> $value['max_type'],
					'max_point'=> $value['max_point'],
				]);
			}
		}
		return true;
	}

	/**
	 * desc 获取规则列表
	 * @param $branch_id
	 * @return
	 */
	public function getList($branch_id) {
		$list = $this->pointRuleDao->searchRecords(['branch_id'=> $branch_id]);
		$list = $list ? $list : [];
		$ruleDefaultData = Point::$ruleDefaultData;
		$ruleCatList = Point::$ruleCatList;
		$maxTypeList = Point::$maxTypeList;
		foreach ($list as $key => $value) {
			$list[$key]['rule_name'] = $ruleDefaultData[$value['rule_type']]['name'];
			$list[$key]['cat_name'] = $ruleCatList[$value['rule_cat']];
			$list[$key]['max_type_name'] = $maxTypeList[$value['max_type']];
		}
		return $list;
	}

	/**
	 * desc 编辑规则
	 * @param $param
	 * @return
	 */
	public function editRule($param) {
		$data['rule_id'] = isset($param['rule_id']) ? (int)$param['rule_id'] : 0;
		$data['branch_id'] = isset($param['branch_id']) ? (int)$param['branch_id'] : 0;
		$data['point'] = isset($param['point']) ? (int)$param['point'] : 0;
		$data['max_point'] = isset($param['max_point']) ? (int)$param['max_point'] : 0;
		if ($data['point'] < 1) {
			throw new CsException("积分必须大于0", 400);
		}
		$info = $this->pointRuleDao->findRecord(['rule_id'=> $data['rule_id'], 'branch_id'=> $data['branch_id']]);
		if (empty($info)) {
			throw new CsException("规则不存在", 400);
		}
		if ($info['max_type'] == Point::MAX_TYPE_ONLY_ONE) {
			$data['max_point'] = $data['point'];
		} elseif ($data['max_point'] < $data['point']) {
			throw new CsException("上限积分不能小于单次积分", 400);
		}
		$ret = $this->pointRuleDao->saveRecord($data);
		if ($ret === false) {
			throw new CsException("编辑失败", 400);
		}
	}

	/**
	 * desc 加积分
	 * @return void
	 */
	public function addPoint() {
		$branch_id = isset($_POST['branch_id']) && !empty($_POST['branch_id']) ? $_POST['branch_id'] : 0;
		$user_id = isset($_POST['user_id']) && !empty($_POST['user_id']) ? $_POST['user_id'] : 0;
		$action = strtolower(CONTROLLER_NAME).'/'.strtolower(ACTION_NAME);
		switch ($action) {
			case 'weixin/login': 
				$ret = $this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_AUTH_LOGIN);//授权登录
				!$ret && $this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_LOGIN);//每次登录
				break;
			case 'user/modify':
				$userInfo = $this->userInfoDao->getRecord($user_id);
				if (empty($userInfo['real_name']) || empty($userInfo['mobile']) || empty($userInfo['user_img']) || 
					empty($userInfo['nick_name']) || empty($userInfo['sex']) || empty($userInfo['birthday']) || 
					empty($userInfo['join_day']) || empty($userInfo['district']) || empty($userInfo['signature'])) return;
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_FILL_INFO);//完善信息
				break;
			case 'article/info':
				if ($_POST['cat_type'] == 1) {
					$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_LXYZ);//两学一做
				} elseif ($_POST['cat_type'] == 2) {
					$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_SPECIAL);//党建专题
				}
				break;
			case 'video/info':
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_VIDEO);//视频学习
				break;
			case 'audio/info':
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_AUDIO);//音频学习
				break;
			case 'ebook/ebook_info':
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_EBOOK);//电子书学习
				break;
			case 'read/info':
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_READ);//读书学习
				break;
			case 'question/rows_list':
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_QUESTION);//评测学习
				break;
			case 'photo/info':
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_ALBUM);//相册学习
				break;
			case 'mien/mien_save':
				$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_ADD_MIEN);//发布风采
				break;
			case 'tools/like':
				if ($_POST['like_type'] == 1) {
					$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_MIEN_LIKE);//点赞别人
					$creator_id = isset($_POST['creator_id']) && !empty($_POST['creator_id']) ? $_POST['creator_id'] : 0;
					$this->_addPoint($branch_id, $creator_id, Point::RULE_TYPE_MIEN_LIKED);//被点赞
				}
				break;
			case 'tools/forward':
				if ($_POST['forward_type'] == 1) {
					$this->_addPoint($branch_id, $user_id, Point::RULE_TYPE_MIEN_SEND);//转发别人
					$creator_id = isset($_POST['creator_id']) && !empty($_POST['creator_id']) ? $_POST['creator_id'] : 0;
					$this->_addPoint($branch_id, $creator_id, Point::RULE_TYPE_MIEN_SENDED);//被转发
				}
				break;
			default: return;
		}
	}

	/**
	 * desc 加积分
	 * @param $branch_id
	 * @param $user_id
	 * @param $rule_type
	 * @return bool
	 */
	private function _addPoint($branch_id, $user_id, $rule_type) {
		if ($branch_id < 1 || $user_id < 1) {
			return false;
		}
		$ruleInfo = $this->pointRuleDao->findRecord(['branch_id'=> $branch_id, 'rule_type'=> $rule_type]);
		if (empty($ruleInfo)) {
			return false;
		}
		$primary_id = !empty($ruleInfo['primary_key']) && isset($_POST[$ruleInfo['primary_key']]) ? (int)$_POST[$ruleInfo['primary_key']] : 0;
		$where = ['user_id'=> $user_id, 'rule_type'=> $rule_type];
		$primary_id > 0 && $where['primary_id'] = $primary_id;
		if ($ruleInfo['max_type'] == Point::MAX_TYPE_ONLY_ONE) {
			// 仅领一次
			if ($this->pointLogDao->where($where)->count()) {
				return false;
			}
		} elseif ($ruleInfo['max_type'] == Point::MAX_TYPE_PER_ITEM) {
			// 每条上限
			if ($primary_id < 1) {
				return false;
			}
			$sum = $this->pointLogDao->where($where)->sum('point');
			$sum = empty($sum) ? 0 : $sum;
			if ($sum + $ruleInfo['point'] > $ruleInfo['max_point']) {
				return false;
			}
		} elseif ($ruleInfo['max_type'] == Point::MAX_TYPE_PER_DAY) {
			// 每日上限
			if ($primary_id > 0 && $this->pointLogDao->where($where)->count()) {
				return false;
			}
			$where['add_time'] = ['egt', strtotime(date('Y-m-d', NOW_TIME))];
			$sum = $this->pointLogDao->where($where)->sum('point');
			$sum = empty($sum) ? 0 : $sum;
			if ($sum + $ruleInfo['point'] > $ruleInfo['max_point']) {
				return false;
			}
		}
		//添加积分流水
		$this->pointLogDao->add([
			'user_id'=> $user_id,
			'branch_id'=> $branch_id,
			'rule_type'=> $rule_type,
			'primary_id'=> $primary_id,
			'point'=> $ruleInfo['point'],
			'add_time'=> NOW_TIME,
		]);
		// 修改用户积分
		$userPointInfo = $this->userPointDao->where(['user_id'=> $user_id])->find();
		$updateData = [
			'rank_points'=> $userPointInfo['rank_points'] + $ruleInfo['point'],
			'study_points'=> $userPointInfo['study_points'],
			'mien_points'=> $userPointInfo['mien_points'],
		];
		if ($ruleInfo['rule_cat'] == Point::RULE_CAT_STUDY) {
			$updateData['study_points'] += $ruleInfo['point'];
		} elseif ($ruleInfo['rule_cat'] == Point::RULE_CAT_MIEN) {
			$updateData['mien_points'] += $ruleInfo['point'];
		}
		$this->userPointDao->where(['user_id'=> $user_id])->save($updateData);
		return true;
	}

	/**
	 * desc 我的积分
	 * @param $user_id
	 * @param $branch_id
	 * @return array
	 */
	public function myPoint($user_id, $branch_id) {
		$res = [
			'TotalPoints'=> 0,
			'MainRanking'=> 0,
			'SubRanking'=> 0,
		];
		$rank_points = $this->userPointDao->where(['branch_id'=> $branch_id, 'user_id'=> $user_id])->getField('rank_points');
		if (is_null($rank_points)) {
			return $res;
		}
		$res['TotalPoints'] = $rank_points;
		$total_rank = $this->userPointDao->where(['branch_id'=> $branch_id, 'rank_points'=> ['gt', $rank_points]])->count();
		$res['MainRanking'] = $total_rank ? $total_rank + 1 : 1;
		$res['SubRanking'] = $res['MainRanking'];
		return $res;
	}

	/**
	 * desc 排行榜
	 * @param $user_id
	 * @param $branch_id
	 * @param $type 1-总排行榜，2-支部排行榜，3-阅读排行榜，4-风采排行榜，5-考试排行榜
	 * @param $limit 取前多少名，默认100
	 * @return array
	 */
	public function getRanking($branch_id, $type, $limit = 100) {
		$iconArr = [1=> 'icon_7.png', 2=> 'icon_8.png', 3=> 'icon_9.png'];
		switch ($type) {
			case 1: $field = 'rank_points';$iconArr = [1=> 'icon_01.png', 2=> 'icon_02.png', 3=> 'icon_03.png'];break;
			case 2: $field = 'rank_points';$iconArr = [1=> 'icon_4.png', 2=> 'icon_5.png', 3=> 'icon_6.png'];break;
			case 3: $field = 'study_points';break;
			case 4: $field = 'mien_points';break;
			case 5: $field = 'exam_points';break;
			default: return [];
		}
		$list = $this->userPointDao
			->where(['branch_id'=> $branch_id, $field=> ['gt', 0]])
			->order($field.' desc')
			->field("user_id,{$field} as point")
			->select();
		if (empty($list)) {
			return $list;
		}
		$regionDao = D('Common/Region/Region');
		$rank = 1;
		foreach ($list as $key => $value) {
			$userInfo = $this->userInfoDao->where(['user_id'=> $value['user_id']])->field('user_img,district,real_name')->find();
			$list[$key]['icon'] = isset($iconArr[$rank]) ? DK_DOMAIN.'/static/icons/ranking/'.$iconArr[$rank] : '';
			$list[$key]['rank'] = $rank++;
			$list[$key]['user_img'] = getUserImg($userInfo['user_img']);
			$list[$key]['real_name'] = $userInfo['real_name'];
			$list[$key]['district'] = empty($userInfo['district']) ? "" : $regionDao->getRegionNameCity($userInfo['district']);
		}
		return $list;
	}

	/**
	 * desc 获取最高分用户
	 * @param $branch_id
	 * @param $type
	 * @return array
	 */
	public function getHighestUser($branch_id) {
		$user_id = $this->userPointDao->where(['branch_id'=> $branch_id])->order('rank_points desc')->getField('user_id');
		if (empty($user_id)) {
			return false;
		}
		$userInfo = $this->userInfoDao->where(['user_id'=> $user_id])->field('user_img,real_name')->find();
		$userInfo['user_img'] = getUserImg($userInfo['user_img']);
		return $userInfo;
	}

	/**
	 * desc 积分流水列表
	 * @param $user_id
	 * @param $page      1
	 * @param $pagesize  10
	 * @return array
	 */
	public function getPointLog($param, $count = false) {
		$page = $param['page'] < 1 ? 1 : (int)$param['page'];
		$pagesize = $param['pagesize'] < 1 ? 10 : (int)$param['pagesize'];
		$where = [];
		if (isset($param['user_id']) && !empty($param['user_id'])) {
			$where['user_id'] = $param['user_id'];
		}
		if (isset($param['branch_id']) && !empty($param['branch_id'])) {
			$where['branch_id'] = $param['branch_id'];
		}
		if (isset($param['keyword']) && !empty($param['keyword'])) {
			$user_id_list = M('UserInfo')->where(['real_name'=> ['like', "%{$param['keyword']}%"]])->getField('user_id', true);
			$where['user_id'] = !empty($user_id_list) ? ['in', $user_id_list] : -1;
		}
		if ($count) {
			$count = $this->pointLogDao->where($where)->count();
			return $count ? $count : 0;
		}
		$list = $this->pointLogDao->where($where)->page($param['page'], $param['pagesize'])->order('point_id desc')->field('user_id,rule_type,point,add_time')->select();
		$list = $list ? $list : [];
		foreach ($list as $key => $value) {
			$list[$key]['rule_label'] = Point::$ruleDefaultData[$value['rule_type']]['name'];
			$list[$key]['add_time'] = date('Y-m-d H:i', $value['add_time']);
		}
		return $list;
	}
}

