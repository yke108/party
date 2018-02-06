<?php
namespace Common\Service;
use Common\Basic\CsException;
use Common\Basic\CategoryConst;
use Common\Basic\Status;
use Common\Basic\CodeConst;

class EbookService{

	private $model;
	private $nodeModel;

	private $whModel;
	private $whNodeModel;

	private $categoryModel;

	public function __construct() {
		$this->model = D('Common/Ebook/Ebook');
		$this->nodeModel = D('Common/Ebook/Node');

		$this->whModel = D('Common/Ebook/EbookWh');
		$this->whNodeModel = D('Common/Ebook/NodeWh');

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
		}
		return array(
			'list' => is_option($list,Status::CollectTypeEbook),
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
		isset($info['detail']) && $info['detail'] = htmlspecialchars_decode($info['detail']);
		return $info;
	}

	// 编辑
	public function edit($data) {
		if (!$this->model->create($data)) {
			throw new CsException($this->model->getError());
		}
		if (empty($data['cat_id'])) {
			throw new CsException("分类不能为空");
		}
		if (!$this->categoryModel->where(['cat_id'=>$data['cat_id'],'is_delete'=>0,'cat_type'=>Status::CatTypeEbook,'branch_id'=>$data['branch_id'],'region_code'=>$data['region_code']])->count()) {
			throw new CsException("分类不存在");
		}
		if (isset($data['id']) && $data['id'] > 0) {
			if ($this->nodeModel->where(['ebook_id'=> $data['id'], 'is_delete'=> 0])->count()) {
				unset($data['deep']);
			}
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
            $iscat = $this->categoryModel->where(['cat_type'=>Status::CatTypeEbook,'cat_id' => $params['cat_id'],'branch_id'=>$params['branch_id'],'region_code'=>$params['region_code'],'is_delete'=>0])->find();
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
            // 插入电子书
            $ebook_id = $this->model->add([
                'branch_id'=>$params['branch_id'],
                'ref_id'=>$params['ref_id'],
                'cat_id'=>$params['cat_id'],
                'region_code'=> $params['region_code'],
                'title'      => $info['title'],
                'desc'       => $info['desc'],
                'detail'     => $info['detail'],
                'sort'       => $info['sort'],
                'deep'       => $info['deep'],
                'image'      => $info['image'],
                'status'     => Status::YES,
                'add_time'	 => NOW_TIME,
            ]);
            if (!$ebook_id) {
            	throw new CsException("启动失败", 400);
            }
            // 插入章节
            $list = $this->whNodeModel->where(['is_delete'=>0,'ebook_id'=>$params['ref_id']])->order('sort asc,node_code asc')->select();
            foreach ($list as $key => $value) {
            	unset($value['id']);
            	$value['add_time'] = NOW_TIME;
            	$value['ebook_id'] = $ebook_id;
            	$this->nodeModel->add($value);
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

	// 获取列表 type:1-官方，2-自定义
	public function getRreeNode($ebook_id, $type = 2) {
		if ($ebook_id < 1) {
			throw new CsException("参数错误");
		}
		$model = $type == 2 ? $this->nodeModel : $this->whNodeModel;
		$list = $model->where(['is_delete'=> 0, 'ebook_id'=> $ebook_id])->order('sort asc,node_code asc')->getField('node_code,id,node_name,level');
		if (empty($list)) {
			return [];
		}
		foreach ($list as $key => $item) {
			$list[$key]['children'] = [];
		}
		$tree = [];
		foreach ($list as $item) {
		    $parent_node_code = substr($this->getAbNode($item['node_code']), 0, -4);
		    $parent_node_code = str_pad($parent_node_code, 13, '0');
		    if (isset($list[$parent_node_code])) {
		        $list[$parent_node_code]['children'][] = &$list[$item['node_code']];
		    } else {
		        $tree[] = &$list[$item['node_code']];
		    }
		}
		unset($list);
		return $tree;

	}

	// 获取详情
	public function getNodeInfo($id, $field="*") {
		return $this->nodeModel->where(['id'=> $id])->field($field)->find();
	}

	// 添加
	public function addNode($data, $pid = 0) {
		if (empty($data['node_name'])) {
			throw new CsException("章节名称不能为空");
		}
		$deep = $this->model->where(['id'=>$data['ebook_id'], 'is_delete'=> 0])->getField('deep');
		if (empty($deep)) {
			throw new CsException("电子书不存在");
		}
		if ($pid > 0) {
			$info = $this->nodeModel->where(['id'=>$pid, 'ebook_id'=> $data['ebook_id'], 'is_delete'=> 0])->field('level,node_code')->find();
			if (empty($info)) {
				throw new CsException("上级不存在");
			}
			$level = $info['level'];
		} else {
			$level = 0;
		}
		if ($level >= $deep) {
			throw new CsException("不能再添加子章节");
		}
		if ($level == ($deep-1)) {
			if (empty($data['title'])) {
				throw new CsException("标题不能为空");
			}
			if (empty($data['detail'])) {
				throw new CsException("内容不能为空");
			}
		}
		$level++;
		$ab_node = $pid == 0 ? 1 : $this->getAbNode($info['node_code']);
		$node_code = $this->nodeModel->where(['node_code'=> ['like', "{$ab_node}%"], 'ebook_id'=> $data['ebook_id'], 'level'=> $level])->max('node_code');
		if (empty($node_code)) {
			$node_code = $ab_node . "0001";
		} else {
			$node_code = $this->getAbNode($node_code) + 1;
		}
		$node_code = str_pad($node_code, 13, '0');
		$data['level'] = $level;
		$data['node_code'] = $node_code;
		$data['add_time'] = NOW_TIME;
		$ret = $this->nodeModel->add($data);
		if (!$ret) {
			throw new CsException("添加失败");
		}
		return $ret;
	}

	// 编辑
	public function editNode($data) {
		if (empty($data['node_name'])) {
			throw new CsException("章节名称不能为空");
		}
		$info = $this->getNodeInfo($data['id']);
		if (empty($info)) {
			throw new CsException("章节不存在");
		}
		$deep = $this->model->where(['id'=>$info['ebook_id'], 'is_delete'=> 0])->getField('deep');
		if ($info['level'] == $deep) {
			if (empty($data['title'])) {
				throw new CsException("标题不能为空");
			}
			if (empty($data['detail'])) {
				throw new CsException("内容不能为空");
			}
		} else {
			unset($data['title'], $data['detail']);
		}
		$ret = $this->nodeModel->where(['id'=> $data['id']])->save($data);
		if ($ret === false) {
			throw new CsException("编辑失败");
		}
		return true;
	}

	// 删除
	public function delNode($id){
		$info = $this->getNodeInfo($id);
		if (empty($info)) {
			return false;
		}
		$ab = $this->getAbNode($info['node_code']);
		return $this->nodeModel->where(['ebook_id'=> $info['ebook_id'], 'node_code'=> ['like', "{$ab}%"]])->save(['is_delete'=> 1]);
	}

	// 获取前后一页
	public function getPrevAndNext($id, $ebook_id, $level) {
		$tree = $this->getRreeNode($ebook_id);
		$list = [];
		if ($level == 1) {
			foreach ($tree as $value) {
				$list[] = $value['id'];
			}
		} elseif ($level == 2) {
			foreach ($tree as $value) {
				foreach ($value['children'] as $v1) {
					$list[] = $v1['id'];
				}
			}
		} else {
			foreach ($tree as $value) {
				foreach ($value['children'] as $v1) {
					foreach ($v1['children'] as $v2) {
						$list[] = $v2['id'];
					}
				}
			}
		}
		$_key = 0;
		foreach ($list as $key => $value) {
			if ($id == $value) {
				$_key = $key;
				break;
			}
		}
		unset($tree);
		return [
			'prev'=> isset($list[$_key - 1]) ? $list[$_key - 1] : 0,
			'next'=> isset($list[$_key + 1]) ? $list[$_key + 1] : 0,
		];
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
                'article_type'=>Status::CatTypeEbook,
            );
            $log_info = $this->logReadDao()->findRecord($map);
            if (empty($log_info)) {
                $data = array(
                    'user_id'=>$params['user_id'],
                    'article_id'=>$params['id'],
                    'article_type'=>Status::CatTypeEbook,
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

    //获取章节全名称
	public function getAllNodeName($ebook_id, $node_code) {
	    $list = $this->getParentCode($node_code);
	    $res = [];
	    foreach ($list as $key => $value) {
	    	$res[] = $this->nodeModel->where(['ebook_id'=> $ebook_id, 'node_code'=> $value])->getField('node_name');
	    }
	    return $res;
	}

	//递归获取父类
	public function getParentCode($node_code, $list = []) {
	    if (empty($list )) {
	        array_unshift($list,$node_code);
	    }
	    $node_code = substr($this->getAbNode($node_code), 0, -4);
	    if (strlen($node_code) > 1) {
	    	$node_code = str_pad($node_code, 13, '0');
	        array_unshift($list,$node_code);
	        $list = $this->getParentCode($node_code, $list);
	    }
	    return $list;
	}

	private function getAbNode($node_code) {
		preg_match('/^(\d+?)(0000)*$/', $node_code, $arr);
		return $arr[1];
	}

	private function logReadDao() {
        return D('Common/User/LogRead');
    }
}