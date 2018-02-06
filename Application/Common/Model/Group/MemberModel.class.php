<?php
namespace Common\Model\Group;

use Think\Model;
use Common\Basic\Status;

class MemberModel extends Model {
    protected $tableName = 'group_member';
    
    public function madd($group_id, $user_id) {
        $data = [
            'member_id'=>date('ymdHis').rand(1000, 9999),
            'group_id'=>$group_id,
            'user_id'=>$user_id,
            'add_time'=>NOW_TIME,
        ];
        return $this->add($data);
    }

    public function mleave($group_id, $user_id) {
        $where = [
            'group_id'=>$group_id,
            'user_id'=>$user_id,
            'leave_time'=>0,
        ];
        $data = [
            'leave_time'=>NOW_TIME,
        ];
        return $this->where($where)->save($data);
    }
    
}
