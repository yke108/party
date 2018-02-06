<?php
namespace Common\Basic;

class Point{

	const MAX_TYPE_ONLY_ONE = 1; //仅领一次
	const MAX_TYPE_PER_ITEM = 2; //每条上限
	const MAX_TYPE_PER_DAY = 3; //每日上限

	static $maxTypeList = array(
		self::MAX_TYPE_ONLY_ONE => '仅领一次',
		self::MAX_TYPE_PER_ITEM => '每条上限',
		self::MAX_TYPE_PER_DAY => '每日上限',
	);

	const RULE_CAT_ACCOUNT = 1; //帐号奖励
	const RULE_CAT_STUDY = 2; //学习文章
	const RULE_CAT_MIEN = 3; //风采

	static $ruleCatList = array(
		self::RULE_CAT_ACCOUNT => '帐号奖励',
		self::RULE_CAT_STUDY => '学习文章',
		self::RULE_CAT_MIEN => '风采',
	);

	const RULE_TYPE_AUTH_LOGIN = 11; //授权登录
	const RULE_TYPE_JOIN_ORG = 12; //加入党组织
	const RULE_TYPE_FILL_INFO = 13; //完善信息
	const RULE_TYPE_LOGIN = 14; //每日登录

	const RULE_TYPE_LXYZ = 21; //两学一做
	const RULE_TYPE_SPECIAL = 22; //党建专题
	const RULE_TYPE_VIDEO = 23; //视频管理
	const RULE_TYPE_AUDIO = 24; //音频管理
	const RULE_TYPE_EBOOK = 25; //电子书管理
	const RULE_TYPE_READ = 26; //读书频道
	const RULE_TYPE_QUESTION = 27; //题库管理
	const RULE_TYPE_ALBUM = 28; //党建相册

	const RULE_TYPE_ADD_MIEN = 31; //发布风采
	const RULE_TYPE_MIEN_SENDED = 32; //风采被转发
	const RULE_TYPE_MIEN_SEND = 33; //转发风采
	const RULE_TYPE_MIEN_LIKED = 34; //风采被点赞
	const RULE_TYPE_MIEN_LIKE = 35; //点赞风采
	
	static $ruleDefaultData = array(
		// 帐号奖励
		self::RULE_TYPE_AUTH_LOGIN => [
			'name'=> '授权登录', 'rule_cat'=> self::RULE_CAT_ACCOUNT, 'point'=> 10,
			'primary_key'=> '', 'max_type'=> self::MAX_TYPE_ONLY_ONE, 'max_point'=> 10,
		], 
		self::RULE_TYPE_JOIN_ORG => [
			'name'=> '加入党组织', 'rule_cat'=> self::RULE_CAT_ACCOUNT, 'point'=> 10,
			'primary_key'=> '', 'max_type'=> self::MAX_TYPE_ONLY_ONE, 'max_point'=> 10,
		], 
		self::RULE_TYPE_FILL_INFO => [
			'name'=> '完善信息', 'rule_cat'=> self::RULE_CAT_ACCOUNT, 'point'=> 10,
			'primary_key'=> '', 'max_type'=> self::MAX_TYPE_ONLY_ONE, 'max_point'=> 10,
		], 
		self::RULE_TYPE_LOGIN => [
			'name'=> '每日登录', 'rule_cat'=> self::RULE_CAT_ACCOUNT, 'point'=> 5,
			'primary_key'=> '', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 5,
		],

		// 学习文章
		self::RULE_TYPE_LXYZ => [
			'name'=> '两学一做', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],
		self::RULE_TYPE_SPECIAL => [
			'name'=> '党建专题', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],
		self::RULE_TYPE_VIDEO => [
			'name'=> '视频学习', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],
		self::RULE_TYPE_AUDIO => [
			'name'=> '音频学习', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],
		self::RULE_TYPE_EBOOK => [
			'name'=> '电子书学习', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],
		self::RULE_TYPE_READ => [
			'name'=> '读书学习', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],
		self::RULE_TYPE_QUESTION => [
			'name'=> '评测学习', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],
		self::RULE_TYPE_ALBUM => [
			'name'=> '相册学习', 'rule_cat'=> self::RULE_CAT_STUDY, 'point'=> 1,
			'primary_key'=> 'id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 10,
		],

		// 风采
		self::RULE_TYPE_ADD_MIEN => [
			'name'=> '发布风采', 'rule_cat'=> self::RULE_CAT_MIEN, 'point'=> 5,
			'primary_key'=> '', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 25,
		],
		self::RULE_TYPE_MIEN_SENDED => [
			'name'=> '风采被转发', 'rule_cat'=> self::RULE_CAT_MIEN, 'point'=> 2,
			'primary_key'=> 'content_id', 'max_type'=> self::MAX_TYPE_PER_ITEM, 'max_point'=> 20,
		],
		self::RULE_TYPE_MIEN_SEND => [
			'name'=> '转发风采', 'rule_cat'=> self::RULE_CAT_MIEN, 'point'=> 1,
			'primary_key'=> 'content_id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 20,
		],
		self::RULE_TYPE_MIEN_LIKED => [
			'name'=> '风采被点赞', 'rule_cat'=> self::RULE_CAT_MIEN, 'point'=> 1,
			'primary_key'=> 'content_id', 'max_type'=> self::MAX_TYPE_PER_ITEM, 'max_point'=> 10,
		],
		self::RULE_TYPE_MIEN_LIKE => [
			'name'=> '点赞风采', 'rule_cat'=> self::RULE_CAT_MIEN, 'point'=> 1,
			'primary_key'=> 'content_id', 'max_type'=> self::MAX_TYPE_PER_DAY, 'max_point'=> 20,
		],
	);

	
}