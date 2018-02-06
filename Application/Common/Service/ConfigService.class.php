<?php
namespace Common\Service;
use Think\Cache\Driver\Redis;

class ConfigService{
	// 获取私有配置
	public function getConfig($fkey = '', $type = 'xiaocx'){
		if (empty($fkey)) {
			return $this->configDao()->where(['type'=> $type])->getField('fkey,fval');
		} else {
			return $this->configDao()->where(['type'=> $type, 'fkey'=> $fkey])->getField('fval');
		}
	}

	// 获取公共配置
	public function getPublicConfig($type = 'xiaocx') {
		$redis = new Redis();
		$config = $redis->get('public_config');
		if (empty($config)) {
			$config = $this->publicConfigDao()->where(['type'=> $type])->getField('fkey,fval');
			$redis->set('public_config', $config);
		}
		return $config;
	}

	protected function configDao(){
		return D('Common/System/Config');
	}

	protected function publicConfigDao(){
		return D('Common/System/PublicConfig');
	}
}