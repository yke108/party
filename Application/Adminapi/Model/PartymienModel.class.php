<?php
namespace Adminapi\Model;
use Think\Model;

class PartymienModel extends Model{

	// 设置当前模型对应的完整数据表名称
   	// protected $tableName = 'user'; 

	protected $_validate = [
		['content'	,'require' 	,	'内容必填',1],
		['user_pwd'		,'require'  ,	'密码必填',1],
		['check_pwd'	,'require'  ,	'重复密码必填',1],
		['user_pwd'		,'check_pwd'  ,	'两次密码不一致',0,'confirm'],
		['user_phone'	,'require'	,	'患者手机必填',1,'',1],
		['user_phone', '#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#','手机号码不正确',0,'regex',1],
		['user_phone'	,'',	'该手机已存在',0,'unique',1],
		['user_role'	,'require' 	,	'权限必选',1],
	];
}