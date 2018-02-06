<?php
namespace Common\Model\Top;

use Think\Model\RelationModel;
use Common\Basic\Status;

class TopModel extends RelationModel {
    protected $tableName = 'top';
    
    public function getRecord($post){
    	if (!$post) return array();
        $map = [
             'top_type'=>$post['top_type'],
             'content_id'=>['in',$post['content_id']],
        ];
        // dump($map);
        // exit;
    	return $this->where($map)->getField('content_id,id',true);
    }
}