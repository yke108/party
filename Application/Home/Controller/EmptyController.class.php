<?php
namespace Home\Controller;
use Common\Basic\Status;
use Common\Basic\CsException;

class EmptyController extends FController {
	protected function _empty(){
		throw new CsException('接口不存在', 100);
	}
	
	protected function apiSetCheck(){
		$this->loginck = Status::NO;
	}
}
