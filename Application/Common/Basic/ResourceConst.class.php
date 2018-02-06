<?php
namespace Common\Basic;

class ResourceConst{
	const ShapeType = 1; //形象分类
	const BuildingType = 2; //合作方式
	const AdType = 3; //广告分类
	const SoftwareType = 4; //软件分类
	const HardwareType = 5; //硬件分类
	const ActivityType = 6; //推广渠道
	const CostType = 7; //成本分类
	const RenovationType = 8; //装修位置
	
	static $TypeList = [
		self::ShapeType => '形象分类',
		self::BuildingType => '合作方式',
		self::AdType => '广告分类',
		self::SoftwareType => '软件分类',
		self::HardwareType => '硬件分类',
		self::ActivityType => '推广渠道',
		self::CostType => '成本分类',
		self::RenovationType => '装修位置',
	];
}