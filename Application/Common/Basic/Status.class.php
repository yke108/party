<?php
namespace Common\Basic;

class Status{
	const None = 0; //未知
	const YES  = 1; //是
	const NO   = 2; //否
	
	const UserRegister        = 1;
	const UnbindPhone         = 2;
	const BindPhone           = 3;
	const ModifyPassword      = 4;
	const UserLogin           = 5;
	const RedpacketReceive    = 6;
	const ModifyTradePassword = 7;
	
	static $catStatusList = array(
			self::YES =>'启用',
			self::NO  => '关闭',
	);
	
	const TypeWh        = 1; //总部
	const TypeBranch    = 2; //支部
	
	const CatTypeLxyz   = 1; //两学一做
	const CatTypeDjzt   = 2; //党建专题
    const CatTypeVideo  = 3; //视频管理
    const CatTypeAudio = 4; //音频分类
    const CatTypeEbook = 5; //电子书分类
    const CatTypeRead = 6; //读书分类
    const CatTypeQuestion = 7; //评测分类
    const CatTypeAlbum = 8; //相册分类

	static $catTypeList = array(
			self::CatTypeLxyz =>'两学一做',
			self::CatTypeDjzt => '党建专题',
            self::CatTypeVideo => '视频分类',
            self::CatTypeAudio => '音频分类',
            self::CatTypeEbook => '电子书分类',
            self::CatTypeRead => '读书分类',
            self::CatTypeQuestion => '评测分类',
            self::CatTypeAlbum => '相册分类',
	);
	
	const CollectTypeMien     = 1; //风采
	const CollectTypeActivity = 2; //活动
	const CollectTypeNotice   = 3; //公告
	const CollectTypeAd       = 4; //广告
	const CollectTypeLxyz     = 101; //两学一做
	const CollectTypeSpecial  = 102; //党建专题
	const CollectTypeVideo  = 103; //视频
	const CollectTypeAudio  = 104; //音频
	const CollectTypeEbook  = 105; //电子书
	const CollectTypeRead  = 106; //读书
	const CollectTypeQuestion  = 107; //评测
	const CollectTypeAlbum  = 108; // 相册
	
	const Sexboy  = 1;
	const Sexgirl = 2;
	const SexUnknown = 0;
	static $sexList = array(
			self::Sexboy  =>'男',
			self::Sexgirl => '女',
            self::SexUnknown=>'',
	);
	
	const LikeTrue  = true;
	const LikeFalse = false;

	const CommitCode  = 'commit_code';
	const PauseCommit  = 'pause_commit';
	
	static $actionTypeList = array(
			self::CommitCode  =>'发布代码',
			self::PauseCommit => '停止发布',
	);

	//管理员角色
	const RoleSuper = 1;//超级管理员
	const RoleAdmin = 2;//普通管理员
	const RoleWxAdmin = 3;//小程序负责人
	const RoleWxUser = 4;//小程序运营人员

}
