<?php
namespace Home\Controller;
use Common\Basic\UserConst;
use Common\Basic\CsException;
use Common\Basic\Status;

class GroupController extends FController {
    protected $user = [];
    protected $group = [];

	public function _initialize(){
        parent::_initialize();
        $user_id = intval($_POST['user_id']);
        $this->user = $this->userService()->getUserInfo($user_id);
        if(isset($this->user['group_id']) && $this->user['group_id'] > 0) {
            $this->group = $this->groupService()->getInfo($this->user['group_id']);
        }
    }
   
    /**
     * 用户所属党部信息
     *
     */
	public function infoAction(){
        $info = [
            'GroupId'=>0, 
        ];
        if(isset($this->group['group_id'])){
            $info = [
                'GroupId'=>$this->group['group_id'],
                'GroupName'=>$this->group['group_name'],
                'MemberNumber'=>$this->group['member_num'],
                'Manifesto'=>$this->group['manifesto'],
                'CreateDay'=>$this->group['create_day'],
            ];
            $params = [
                'group_id'=>$this->user['group_id'],
                'user_type'=>['gt', UserConst::UserTypeNormal],
                'orderby'=>'user_type desc',
                'page'=>1,
                'pagesize'=>100,
            ];
            $ul = $this->userService()->getPagerList($params);
            foreach($ul['list'] as $vo) {
                $list[] = [
                    'Label'=>UserConst::$utypes[$vo['user_type']],
                    'Value'=>$vo['real_name'],
                ];
            }
            $info['Leaders'] = $list;
        }
		$data = [
			'Info'=>$info,
		];
		$this->jsonReturn($data);
	}

    /**
     * 添加成员
     */
    public function maddAction(){
        //检查权限 TODO
        //添加用户
        $post = I('post.');
        $params = [
            'real_name'=>$post['real_name'],
            'mobile'=>$post['mobile'],
            'id_no'=>$post['id_no'],
            'group_id'=>$this->group['group_id'],
            'branch_id'=>$this->group['branch_id'],
        ];
        $this->userService()->create($params);
        $this->jsonReturn('添加成功');
    }

    /**
     * 删除成员
     */
    public function mdelAction(){
        //检查权限 TODO
        $post = I('post.');
        $this->groupService()->deleteFromGroup($post['member_id'], $this->group['group_id']);
        $this->jsonReturn('操作成功');
    }

    /**
     * 党员列表
     */
    public function mlistAction(){
        $post = I('post.');
        $params = [
            'group_id'=>$this->user['group_id'],
            'page'=>$post['page'],
            'pagesize'=>$post['pagesize'],
        ];
        $result = $this->userService()->getPagerList($params);
        $list = [];
        foreach($result['list'] as $vo) {
            $list[] = [
                'Sex'=>Status::$sexList[$vo['sex']],
                'AddTime'=>date('Y-m-d', $vo['reg_time']),
                'UserName'=>$vo['real_name'],
                'UserImg'=>UserConst::avatar($vo['user_img']),
                'UserId'=>$vo['user_id'],
                'MemberId'=>$vo['user_id'], //目前与用户ID一致
                'JoinAge'=>getAge($vo['join_day']),
            ];
        }
        $data = [
            'List'=>$list,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
        ];
        $this->jsonReturn($data);
    }


    /**
     * 支部列表
     *
     */
    public function glistAction(){
        $post = I('post.');
        $params = array(
            'branch_id'     =>$this->user['branch_id'],
            'page'          =>$post['page'] ?: 0,
            'pagesize'      =>$post['pagesize'] ?: 20,
        );
        $result = $this->groupService()->getPagerList($params);
        $newlist = [];
        foreach($result['list'] as $vo) {
            $newlist[$vo['group_id']] = [
                'GroupId'=>$vo['group_id'],
                'GroupName'=>$vo['group_name'],
                'MemberNumber'=>$vo['member_num'],
                'CreateDay'=>$vo['create_day'],
                'Manifesto'=>$vo['manifesto'],
                'Secretary'=>'',
            ];
            $ids[] = $vo['group_id'];
        }
        if(isset($ids) && count($ids) > 0) {
            $params = [
                'group_id'=>['in', $ids],
                'user_type'=>UserConst::UserTypeSecretary,
                'orderby'=>'user_type desc',
                'page'=>1,
                'pagesize'=>100,
            ];
            $ul = $this->userService()->getPagerList($params);
            foreach($ul['list'] as $vo) {
                $newlist[$vo['group_id']]['Secretary'] = $vo['real_name']; 
            }
        }
        $data = [
            'List'=>$newlist,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
        ];
        $this->jsonReturn($data);
    }

    /**
     * 添加支部
     *
     */
    public function gaddAction() {
        $post = I('post.');
        $params = [
            'branch_id'=>$this->user['branch_id'],
            'group_name'=>$post['group_name'],
            'create_day'=>$post['create_day'],
            'manifesto'=>$post['manifesto'],
            'code'=>$post['region_code'],
        ];
        $this->groupService()->createOrModify($params);
        $this->jsonReturn('操作成功');
    }
	
    /**
     * 党员列表
     */
    public function gmembersAction(){
        $post = I('post.');
        $params = [
            'group_id'=>$post['group_id'],
            'page'=>$post['page'],
            'pagesize'=>$post['pagesize'],
        ];
        $result = $this->userService()->getPagerList($params);
        $list = [];
        foreach($result['list'] as $vo) {
            $list[] = [
                'Sex'=>Status::$sexList[$vo['sex']],
                'AddTime'=>date('Y-m-d', $vo['reg_time']),
                'UserName'=>$vo['real_name'],
                'UserImg'=>UserConst::avatar($vo['user_img']),
                'UserId'=>$vo['user_id'],
                'MemberId'=>$vo['user_id'], //目前与用户ID一致
                'JoinAge'=>getAge($vo['join_day']),
            ];
        }
        $data = [
            'List'=>$list,
            'Count'=>$result['count'],
            'Page'=>$result['page'],
            'PageSize'=>$result['pagesize'],
        ];
        $this->jsonReturn($data);
    }

    /**
     * 设置支部书记
     *
     */
    public function gsecretaryAction(){
        $post = I('post.');
        $this->groupService()->setSecretary($post['group_id'], $post['member_id']);
        $this->jsonReturn('设置成功');
    }
   
    /**
     * 党部信息
     *
     */
	public function ginfoAction(){
        $post = I('post.');
        $group = $this->groupService()->getInfo($post['group_id']);
        $info = [
            'GroupId'=>0, 
        ];
        $info = [
            'GroupId'=>$group['group_id'],
            'GroupName'=>$group['group_name'],
            'MemberNumber'=>$group['member_num'],
            'Manifesto'=>$group['manifesto'],
            'CreateDay'=>$group['create_day'],
        ];
        $params = [
            'group_id'=>$group['group_id'],
            'user_type'=>['gt', UserConst::UserTypeNormal],
            'orderby'=>'user_type desc',
            'page'=>1,
            'pagesize'=>100,
        ];
        $ul = $this->userService()->getPagerList($params);
        foreach($ul['list'] as $vo) {
            $list[] = [
                'Label'=>UserConst::$utypes[$vo['user_type']],
                'Value'=>$vo['real_name'],
            ];
        }
        $info['Leaders'] = $list;
		$data = [
			'Info'=>$info,
		];
		$this->jsonReturn($data);
	}

    /**
     * 参数列表
     *
     */
    public function goptionsAction(){
        $branch = $this->branchService()->getInfo($this->user['branch_id']);
        $result = [];
        if($branch) {
            $result = $this->regionService()->getlist($branch['region_code']);
        }
        $data   = [
            'region_list'=>$result,
            'sql'=>M()->getLastSql(),
        ];
        $this->jsonReturn($data);
    }

    /**
     * 支部管理-添加成员
     */
    public function gmaddAction(){
        //检查权限 TODO
        $post = I('post.');
        if($post['group_id'] < 1) throw new CsException('系统错误', 11);
        $group = $this->groupService()->getInfo($post['group_id']);
        //添加用户
        $params = [
            'real_name'=>$post['real_name'],
            'mobile'=>$post['mobile'],
            'id_no'=>$post['id_no'],
            'group_id'=>$group['group_id'],
            'branch_id'=>$group['branch_id'],
        ];
        $this->userService()->create($params);
        $this->jsonReturn('添加成功');
    }

    /**
    * @brief 党员信息详情
    *
    * @return 
    */
    public function gminfoAction() {
        $user_id = intval($_POST['member_id']);
        $group_id = intval($_POST['group_id']);
		$user     = $this->userService()->getUserInfo($user_id);
        if(empty($user) || $user['group_id'] != $group_id) {
            throw new CsException('党员信息不存在', 1323);
        }
		$user_img = empty($user['user_img']) ? DK_DOMAIN.'/static/icons/common/basicprofile.jpg' : picurl($user['user_img']);
        $district = $this->regionService()->getZone($user['district']);
        $district = is_array($district) ? implode(' ', $district) : '';
		$userinfo = [
			'UserId'       =>$user['user_id'],
			'Mobile'       =>$user['mobile'],
			'NickName'     =>$user['nick_name'],
			'RealName'     =>$user['real_name'],
			'Sex'          =>Status::$sexList[$user['sex']],
			'Birthday'     =>$user['birthday'],
            'Age'          =>getAge($user['birthday']),
			'UserImg'      =>$user_img,
			'Signature'    =>$user['signature'],
			'JoinDay'      =>$user['join_day'],
			'District'     =>$district,
			'UserTypeIcon' =>DK_DOMAIN.'/static/icons/myself/icon.png',
		];
		$data = [
			'Info'=>$userinfo,
		];
        $this->jsonReturn($data);
    }

	protected function userService(){
		return D('User', 'Service');
	}
	
	protected function branchService(){
		return D('Branch', 'Service');
	}
	
	protected function groupService(){
		return D('Group', 'Service');
	}

    protected function regionService() {
        return D('Region', 'Service');
    }

}
