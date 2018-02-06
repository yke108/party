<?php
namespace Common\Service;
use Common\Basic\CsException;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class QuestionService{

	private $model;
	private $detailModel;

	private $whModel;
	private $whDetailModel;

	private $categoryModel;

	public function __construct() {
		$this->model = D('Common/Question/Question');
		$this->detailModel = D('Common/Question/Detail');

		$this->whModel = D('Common/Question/QuestionWh');
		$this->whDetailModel = D('Common/Question/DetailWh');

		$this->categoryModel = D('Common/Category/Category');
	}

	// 获取列表
	public function getList($param) {
		$param['page'] < 1 && $param['page'] = 1;
		$param['pagesize'] < 1 && $param['pagesize'] = 10;

		$where = ['is_delete'=> 0];
		if (isset($param['cat_id']) && !empty($param['cat_id'])) {
			$where['cat_id'] = $param['cat_id'];
		}
		if (isset($param['status']) && !empty($param['status'])) {
			$where['status'] = $param['status'];
		}
		if (isset($param['branch_id'])) {
			$where['branch_id'] = $param['branch_id'];
		}
		if (isset($param['region_code'])) {
			$where['region_code'] = $param['region_code'];
		}
		if (isset($param['_string'])) {
			$where['_string'] = $param['_string'];
		}
		if (isset($param['keyword']) && !empty($param['keyword'])) {
			$where['title|desc'] = ['like', "%{$param['keyword']}%"];
		}
		$field = isset($param['field']) ? $param['field'] : '*';
		$order = isset($param['order']) ? $param['order'] : 'ref_id desc,sort asc,id desc';
		$count = $this->model->where($where)->count();
		$list = $this->model->where($where)->page($param['page'], $param['pagesize'])->field($field)->order($order)->select();
		$list = $list ? $list : [];
		foreach ($list as $key => $value) {
			isset($value['cat_id']) && $list[$key]['cat_name'] = $this->categoryModel->where(['cat_id'=> $value['cat_id']])->getField('cat_name');
			isset($value['detail']) && $list[$key]['detail'] = htmlspecialchars_decode($value['detail']);
			isset($value['limit_time']) && $list[$key]['limit_time'] = $value['limit_time']/60;
		}
		return array(
			'list' => $list,
			'count' => $count ? $count : 0,
		);
	}

	// 获取官方列表
	public function getWhList($param) {
		$param['page'] < 1 && $param['page'] = 1;
		$param['pagesize'] < 1 && $param['pagesize'] = 10;

		$where = ['is_delete'=> 0];
		if (isset($param['cat_id']) && !empty($param['cat_id'])) {
			$where['cat_id'] = $param['cat_id'];
		}
		$id_list = $this->model->where(['branch_id'=>$param['branch_id'],'region_code'=>$param['region_code'],'ref_id'=>['gt',0],'is_delete'=>0])->getField('ref_id',true);
		$id_list = empty($id_list) ? [0] : $id_list;
		$where['id'] = ['not in', $id_list];
		if (isset($param['keyword']) && !empty($param['keyword'])) {
			$where['title|desc'] = ['like', "%{$param['keyword']}%"];
		}
		$field = isset($param['field']) ? $param['field'] : '*';
		$order = isset($param['order']) ? $param['order'] : 'sort asc,id desc';
		$count = $this->whModel->where($where)->count();
		$list = $this->whModel->where($where)->page($param['page'], $param['pagesize'])->field($field)->order($order)->select();
		$list = $list ? $list : [];
		foreach ($list as $key => $value) {
			$list[$key]['status'] = in_array($value['id'], $id_list) ? Status::Yes : Status::NO;
			isset($value['limit_time']) && $list[$key]['limit_time'] = $value['limit_time']/60;
		}
		return array(
			'list' => $list,
			'count' => $count ? $count : 0,
		);
	}

	// 获取详情
	public function getInfo($id, $field="*") {
		$info = $this->model->where(['id'=> $id])->field($field)->find();
		if (empty($info)) {
			return [];
		}
		isset($info['cat_id']) && $info['cat_name'] = $this->categoryModel->where(['cat_id'=> $info['cat_id']])->getField('cat_name');
		return $info;
	}

	// 编辑
	public function edit($data) {
		if (!$this->model->create($data)) {
			throw new CsException($this->model->getError());
		}
		if ($data['limit_time'] < 1) {
			throw new CsException("答题时间必须大于0");
		}
		$data['limit_time'] = $data['limit_time'] * 60;
		if (empty($data['cat_id'])) {
			throw new CsException("分类不能为空");
		}
		if (!$this->categoryModel->where(['cat_id'=>$data['cat_id'],'is_delete'=>0,'cat_type'=>Status::CatTypeQuestion,'branch_id'=>$data['branch_id'],'region_code'=>$data['region_code']])->count()) {
			throw new CsException("分类不存在");
		}
		if (isset($data['id']) && $data['id'] > 0) {
			$ret = $this->model->where(['id'=> $data['id'], 'branch_id'=>$data['branch_id'],'region_code'=>$data['region_code']])->save($data);
			if ($ret === false) {
				throw new CsException("编辑失败");
			}
		} else {
			$data['add_time'] = NOW_TIME;
			$ret = $this->model->add($data);
			if (!$ret) {
				throw new CsException("添加失败");
			}
		}
		return $ret;
	}

	//(支部和官方)修改启用状态
    public function switchStatus($params) {
    	if ($params['cat_id'] > 0) {
            $iscat = $this->categoryModel->where(['cat_type'=>Status::CatTypeQuestion,'cat_id' => $params['cat_id'],'branch_id'=>$params['branch_id'],'region_code'=>$params['region_code'],'is_delete'=>0])->find();
            if (!$iscat) throw new CsException('该分类不存在', 400);
        }
        if ($params['ref_id'] > 0) {
        	if ($params['cat_id'] < 1) throw new CsException("参数错误", CodeConst::ParamsError);
            $info = $this->model->where(['ref_id'=>$params['ref_id'],'branch_id'=>$params['branch_id'],'region_code'=>$params['region_code'],'is_delete'=>0])->find();
            if (!empty($info)) {
            	return ['status'=>$info['status']];
            }
            $info = $this->whModel->where(['id'=>$params['ref_id'],'is_delete'=>0])->find();
            if (empty($info)) {
            	throw new Exception("暂无该文章", 400);
            }
            // 插入评测
            $question_id = $this->model->add([
                'branch_id'=>$params['branch_id'],
                'ref_id'=>$params['ref_id'],
                'cat_id'=>$params['cat_id'],
                'region_code'=> $params['region_code'],
                'title'      => $info['title'],
                'limit_time' => $info['limit_time'],
                'desc'       => $info['desc'],
                'detail'     => $info['detail'],
                'sort'       => $info['sort'],
                'image'      => $info['image'],
                'status'     => Status::YES,
                'add_time'	 => NOW_TIME,
            ]);
            if (!$question_id) {
            	throw new CsException("启动失败", 400);
            }
            // 插入题目
            $list = $this->whDetailModel->where(['is_delete'=>0,'question_id'=>$params['ref_id']])->order('sort asc,id asc')->select();
            foreach ($list as $key => $value) {
            	unset($value['id']);
            	$value['add_time'] = NOW_TIME;
            	$value['question_id'] = $question_id;
            	$this->detailModel->add($value);
            }
            return array(
                'status'=>Status::YES,
            );
        } else {
        	if ($params['id'] < 1) throw new CsException("参数错误", CodeConst::ParamsError);
        	$info = $this->model->where(['id'=>$params['id'],'branch_id'=>$params['branch_id'],'region_code'=>$params['region_code'],'is_delete'=>0])->find();
            if (empty($info)) throw new CsException('文章不存在', CodeConst::DataNotExist);
            $status = $info['status'] == Status::YES ? Status::NO : Status::YES;
            $data = array(
                'status' => $status,
            );
            $params['cat_id'] && $data['cat_id'] = $params['cat_id'];
            if ($this->model->where(['id'=> $params['id']])->save($data) === false)  throw new CsException('系统错误', CodeConst::SystemError);
            return ['status'=> $status];
        }
    }

	// 删除
	public function del($map){
		return $this->model->where($map)->save(['is_delete'=> 1]);
	}

	// 获取列表
	public function getItemList($question_id, $type = 2) {
		$where = ['question_id'=> $question_id, 'is_delete'=> 0];
		$detailModel = $type == 2 ? $this->detailModel : $this->whDetailModel;
		$list = $detailModel->where($where)->field('id,question_id,title,type,sort,score,item,result')->order('sort asc,id asc')->select();
		$list = $list ? $list : [];
		foreach ($list as $key => $value) {
			$value['result'] = explode(',', $value['result']);
			$value['item'] = json_decode($value['item'], true);
			$list[$key]['item'] = [];
			foreach ($value['item'] as $k => $v) {
				$list[$key]['item'][] = [
					'content'=> $v,
					'right'=> in_array($k, $value['result']) ? 1 : 0,
				];
			}
		}
		return $list;
	}

	// 获取测评题目数量
    public function getItemCount($question_id) {
    	$count = $this->detailModel->where(['is_delete'=> 0, 'question_id'=> $question_id])->count();
    	return $count ? $count : 0;
    }

	// 获取详情
	public function getDetailInfo($id, $field="*") {
		return $this->detailModel->where(['id'=> $id])->field($field)->find();
	}

	// 编辑
	public function editDetail($data) {
		if (!$this->detailModel->create($data)) {
			throw new CsException($this->detailModel->getError());
		}
		if (isset($data['id']) && $data['id'] > 0) {
			$ret = $this->detailModel->where(['id'=> $data['id']])->save($data);
			if ($ret === false) {
				throw new CsException("编辑失败");
			}
		} else {
			$data['add_time'] = NOW_TIME;
			$ret = $this->detailModel->add($data);
			if (!$ret) {
				throw new CsException("添加失败");
			}
		}
		return $ret;
	}

	// 删除
	public function delDetail($id){
		return $this->detailModel->where(['id'=> $id])->save(['is_delete'=> 1]);
	}

	//统计阅读数
    public function increaseReadNum($params){
    	M()->startTrans();
        if ($this->model->where(['id'=> $params['id']])->setInc('read_num') === false) {
        	M()->rollback();
            return false;
        }
        if ($params['user_id']) {
            $map = array(
                'user_id'=>$params['user_id'],
                'article_id'=>$params['id'],
                'article_type'=>Status::CatTypeQuestion,
            );
            $log_info = $this->logReadDao()->findRecord($map);
            if (empty($log_info)) {
                $data = array(
                    'user_id'=>$params['user_id'],
                    'article_id'=>$params['id'],
                    'article_type'=>Status::CatTypeQuestion,
                    'add_time'=>NOW_TIME,
                    'update_time'=>NOW_TIME,
                );
                if ($this->logReadDao()->addRecord($data) === false) {
                    M()->rollback();
                    return false;
                }
            } else {
                $data = array(
                    'log_id'=>$log_info['log_id'],
                    'update_time'=>NOW_TIME,
                );
                if ($this->logReadDao()->saveRecord($data) === false) {
                    M()->rollback();
                    return false;
                }
            }
        }
        M()->commit();
        return true;
    }

    // 更新过期的评测状态
    public function updateOverExam($user_id) {
    	$userExamDao = $this->userExamDao();
    	$list = $userExamDao->where(['user_id'=> $user_id, 'status'=> 0])->select();
    	foreach ($list as $key => $value) {
    		$over_time = $value['limit_time'] + $value['start_time'];
    		if ($over_time <= NOW_TIME) {
    			$score = $this->calScore($value['exam_id']);
    			$right_count = $this->getRightCount($value['exam_id']);
    			$totol_count = $this->getItemCount($value['content_id']);
    			$wrong_count = $totol_count - $right_count;
    			$userExamDao->where(['exam_id'=> $value['exam_id']])->save([
    				'status'=> 1,
    				'score'=> $score,
    				'wrong_count'=> $wrong_count,
    				'right_count'=> $right_count,
    				'over_time'=> $over_time,
    				'answer_time'=> $value['limit_time'],
    			]);
    		}
    	}
    }

    // 表交答卷 id user_id
    public function submitExam($param) {
    	$userExamDao = $this->userExamDao();
    	$examInfo = $this->getExamInfo(['user_id'=> $param['user_id'], 'content_id'=> $param['id'], 'status'=> 0]);
    	if (!empty($examInfo)) {
			$score = $this->calScore($examInfo['exam_id']);
			$right_count = $this->getRightCount($examInfo['exam_id']);
			$totol_count = $this->getItemCount($examInfo['content_id']);
			$wrong_count = $totol_count - $right_count;
			$userExamDao->where(['exam_id'=> $examInfo['exam_id']])->save([
				'status'=> 1,
				'score'=> $score,
				'wrong_count'=> $wrong_count,
    			'right_count'=> $right_count,
				'over_time'=> NOW_TIME,
				'answer_time'=> NOW_TIME - $examInfo['start_time'],
			]);
    	}
    }

    // 获取我的评测信息
    public function getExamInfo($map) {
    	return $this->userExamDao()->where($map)->order('exam_id desc')->find();
    }

    // 开始我的评测
    public function addExam($data) {
    	return $this->userExamDao()->add([
    		'user_id'=> $data['user_id'],
    		'title'=> $data['title'],
    		'image'=> $data['image'],
    		'total_score'=> $this->getTotalScore($data['content_id']),
    		'content_id'=> $data['content_id'],
    		'limit_time'=> $data['limit_time'],
    		'option_id'=> $data['option_id'],
    		'start_time'=> NOW_TIME,
    	]);
    }

    // 获取我的评测信息
    public function updateExam($data) {
    	return $this->userExamDao()->where(['exam_id'=> $data['exam_id']])->save($data);
    }

    // 获取我的学习中的ID
    public function getLastExamLogId($exam_id) {
    	$rows_id = $this->userExamLogDao()->where(['exam_id'=> $exam_id])->order('id desc')->getField('rows_id');
    	return $rows_id ? $rows_id : 0;
    }

    // 获取最后一道题的ID
    public function getLastItemId($question_id) {
    	$id = $this->detailModel->where(['question_id'=> $question_id])->order('sort desc,id desc')->getField('id');
    	return $id ? $id : 0;
    }

    // 获取我的答题日志
    public function getExamLogInfo($map) {
    	return  $this->userExamLogDao()->where($map)->find();
    }

    // 计算分数
    public function calScore($exam_id) {
    	$score = $this->userExamLogDao()->where(['exam_id'=> $exam_id, 'is_right'=> 1])->sum('score');
    	return  $score ? $score : 0;
    }

    // 考卷总分
    public function getTotalScore($question_id) {
    	$score = $this->detailModel->where(['question_id'=> $question_id, 'is_delete'=> 0])->sum('score');
    	return  $score ? $score : 0;
    }

    // 获取正确题数
    public function getRightCount($exam_id) {
    	$count = $this->userExamLogDao()->where(['exam_id'=> $exam_id, 'is_right'=> 1])->count();
    	return  $count ? $count : 0;
    }

    // 开始我的评测日志
    public function addExamLog($data) {
    	$data['add_time'] = NOW_TIME;
    	return $this->userExamLogDao()->add($data);
    }

    // 我的评测列表
    public function getExamList($param) {
    	$param['page'] < 1 && $param['page'] = 1;
		$param['pagesize'] < 1 && $param['pagesize'] = 10;

		$where = [];
		if (isset($param['user_id']) && !empty($param['user_id'])) {
			$where['user_id'] = $param['user_id'];
		}
		if (isset($param['status'])) {
			$where['status'] = $param['status'];
		}
		if (isset($param['content_id']) && !empty($param['content_id'])) {
			$where['content_id'] = $param['content_id'];
		}
		if (isset($param['option_id']) && !empty($param['option_id'])) {
			$where['option_id'] = $param['option_id'];
		}
		if (isset($param['title']) && !empty($param['title'])) {
			$where['title'] = ['like', "%{$param['title']}%"];
		}
		$field = isset($param['field']) ? $param['field'] : '*';
		$order = isset($param['order']) ? $param['order'] : 'exam_id desc';
		$count = $this->userExamDao()->where($where)->count();
		$list = $this->userExamDao()->where($where)->page($param['page'], $param['pagesize'])->field($field)->order($order)->select();
		$list = $list ? $list : [];
		return array(
			'list' => $list,
			'count' => $count ? $count : 0,
		);
    }


    private function logReadDao() {
        return D('Common/User/LogRead');
    }

    private function userExamDao() {
        return D('Common/Question/UserExam');
    }

    private function userExamLogDao() {
        return D('Common/Question/UserExamLog');
    }
}