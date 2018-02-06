<?php
namespace Common\Basic;

class ApplyConst{
	const VerifyStatusStart = 10; //待审批
	const VerifyStatusWaitSignAgain = 50; //待复审
	const VerifyStatusOk = 100; //审批通过
	const VerifyStatusCancel = 110; //已取消
	const VerifyStatusFail = 150; //未通过
	
	static $verifyStatusList = [
		self::VerifyStatusStart => '待审批',
		self::VerifyStatusWaitSignAgain => '待复审',
		self::VerifyStatusOk => '已批准',
		self::VerifyStatusCancel => '已取消',
		self::VerifyStatusFail => '已驳回',
	];

	const FieldTypeText = 'text'; //文本
	const FieldTypeTime = 'time'; //时间
	const FieldTypeTextarea = 'textarea'; //文本域

	static $fieldTypeList = [
		self::FieldTypeText => '文本',
		self::FieldTypeTime => '时间',
		self::FieldTypeTextarea => '文本域',
	];
}