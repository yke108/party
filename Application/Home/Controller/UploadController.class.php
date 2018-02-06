<?php
namespace Home\Controller;
use Common\Basic\CsException;
class UploadController extends FController {

	
	public function upfileAction()
	{
//        $branch_id = I('post.branch_id').'/';
//        $this->check_empty($branch_id);

        $file = current($_FILES);
        if (empty($file)) {
            throw new CsException('上传的文件为空', 1003);
        }
        if (!in_array(strtolower(end(explode('.',$file['name']))), ['jpg', 'gif', 'png', 'jpeg'])) {
            throw new CsException('上传的后续名不支持', 1003);
        }

        try {
            $ossService = Service('Oss');
            $url = $ossService->uploadFile($file, 'editor');
        } catch (\CsException $e) {
            throw new CsException($e->getMessage(), 1003);
        }
        $list = [
            'short_url'=>$url,
            'url' => $url,
        ];
        $arr = [
            'List'=>$list,
        ];
        $this->jsonReturn($arr);

//	    $upload = new \Think\Upload(); // 实例化上传类
//	    $upload->maxSize   =     31457280 ;// 设置附件上传大小
//	    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg',);// 设置附件上传类型
//	    $upload->rootPath  =     UPLOAD_PATH;  // 设置附件上传根目录
//	    $upload->savePath  =     'base/'; // 设置附件上传（子）目录
//		// $upload->subName   =      array('date', 'Ym');
//		$info = $upload->upload();
//		if($info) {
//			$list = [];
//			foreach ($info as $key => $value) {
//				$list[] = [
//					'short_url'=>$value['savepath'].$value['savename'],
//					'url' => picurl($value['savepath'].$value['savename']),
//				];
//			}
//			$data = [
//				'List'=>$list,
//			];
//			$this->jsonReturn($data);
//		} else {
//			$this->jsonReturn($upload->getError());
//		}

	}
}
