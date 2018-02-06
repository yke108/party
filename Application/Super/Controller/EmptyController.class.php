<?php
namespace Super\Controller;
use Common\Basic\CsException;

class EmptyController extends FController {
	protected function _empty(){
		throw new CsException('接口不存在', 100);
	}
}
