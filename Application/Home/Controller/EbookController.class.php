<?php
namespace Home\Controller;
use Common\Basic\Status;
use Common\Basic\CsException;

class EbookController extends FController {
	protected function apiSetCheck(){
		$this->loginck = Status::NO;
	}
	
	//阅读列表
	public function ebook_listAction(){
		$post = I('post.');
		$param = [
			'page' => intval($post['page']),
			'pagesize' => intval($post['pagesize']),
			'status' => 1,
			'_string' => get_string(),
			'cat_id' => intval($post['cat_id']),
		];
        $result = $this->ebookService()->getList($param);
        $list = [];
        foreach ($result['list'] as $key => $value) {
        	$list[] = [
        		'Id'       =>$value['id'],
        		'Title'       =>$value['title'],
				'Image'       =>[$value['image']],
				'ReadNum'     =>$value['read_num'],
				'CollectNum'  =>$value['collect_num'],
				'ForwardNum'  =>$value['forward_num'],
        	];
        }
		$data = [
			'List'=> $list,
			'Count'=> $result['count'],
		];
		$this->jsonReturn($data);
	}
	
	//阅读详情
	public function ebook_infoAction(){
		$id = I('post.id', 0, 'intval');
		$user_id = I('post.user_id');
		$info = $this->ebookService()->getInfo($id);
		if (empty($info)) {
			throw new CsException('没有数据', 400);
		}
		$node_list = $this->ebookService()->getRreeNode($id);
		//添加阅读记录
		$this->ebookService()->increaseReadNum([
			'id'=>$id,
			'user_id'=>$user_id,
		]);
		//收藏状态
		$map = [
			'user_id'=>$user_id,
			'collection_type'=>Status::CollectTypeEbook,
			'content_id'=>$id,
		];
		$is_collect = M('collection')->where($map)->count();
        //查询该文章是否已经学习过 如果学习过则返回相应的 状态码 1=未开始 2=开始中 3=已结束
        $studywhere = [
            'id'=>$id,
            'user_id'=>$user_id,
            'type'=>Status::CollectTypeEbook,
        ];
        $studystatus = getStudyStatus($studywhere);
        $readIdList = [];
        if (!empty($studystatus)) {
        	$readIdList = $this->ebookService()->getParentCode($studystatus['node']);
        }
		$data = [
			'Info' => [
				'Id'=> $info['id'],
				'Title'=> $info['title'],
				'Desc'=> $info['desc'],
				'Detail'=> $info['detail'],
				'Image'=> $info['image'],
				'catName'=> $info['cat_name'],
				'Deep'=> $info['deep'],
				'readNum'=> $info['read_num'],
				'addTime'=> date('Y-m-d', $info['add_time']),
			],
			'Node'=> $node_list,
			'ReadIdList'=> $readIdList,
			'IsCollect'=> $is_collect ? Status::YES : Status:: None,
            'StudyStatus'=>$studystatus['status'],
            'OptionId'=>$studystatus['option_id'],
        ];
		$this->jsonReturn($data);
	}

	//章节详情
	public function node_infoAction(){
		$id = I('post.id', 0, 'intval');
		$user_id = I('post.user_id', 0, 'intval');
		$info = $this->ebookService()->getNodeInfo($id);
		if (empty($info) || empty($info['title'])) {
			throw new CsException('没有数据', 400);
		}
		$ret = $this->ebookService()->getPrevAndNext($id, $info['ebook_id'], $info['level']);
		$data = [
			'Info'=> [
				'Id'=> $info['id'],
				'EbookId'=> $info['ebook_id'],
				'NodeName'=> $info['node_name'],
				'NodeName'=> implode('', $this->ebookService()->getAllNodeName($info['ebook_id'], $info['node_code'])),
				'Title'=> $info['title'],
				'Detail'=> $info['detail'],
			],
			'PrevNode'=> $ret['prev'],
			'NextNode'=> $ret['next'],
		];
		M('user_study')->where(['user_id'=> $user_id, 'type'=> Status::CollectTypeEbook, 'content_id'=>$info['ebook_id']])->save(['node'=>$info['node_code']]);
		$this->jsonReturn($data);
	}
	
	private function ebookService() {
		return D('Ebook', 'Service');
	}
	
	private function categoryService() {
		return D('Category', 'Service');
	}

}