<?php
namespace Common\Model;
use Think\Model\RelationModel;

class CommonModel extends RelationModel{
	protected $tablePrefix = COMMON_DB_PREFIX;
	protected $connection = [
		'db_type'  => 'mysql',
		'db_user'  => COMMON_DB_USER,
		'db_pwd'   => COMMON_DB_PWD,
		'db_host'  => COMMON_DB_HOST,
		'db_port'  => COMMON_DB_PORT,
		'db_name'  => COMMON_DB_NAME,
		'db_charset' =>    'utf8',
	];
}