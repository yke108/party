<?php
namespace Common\Model\Ebook;
use Think\Model\RelationModel;

class NodeModel extends RelationModel {
    protected $tableName = 'ebook_node';

	protected $_validate = array(     
	);
	
	protected function checkEbookId($ebook_id) {
		if (M('Ebook')->where(['id'=> $ebook_id, 'is_delete'=> 0])->count()) {
			return true;
		} else {
			return false;
		}
	}
}