<?php
namespace Adminapi\Controller;
use Think\Controller;

class UploadController extends FController {	
	
    public function indexAction(){

//        $upload = new \Think\Upload();// 实例化上传类
//        $upload->maxSize   =     3145728 ;// 设置附件上传大小
//        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
//        $upload->rootPath  =      UPLOAD_PATH; // 设置附件上传根目录
//        $upload->savePath  =     'UE/'; // 设置附件上传（子）目录
//        $upload->autoSub   = false;
//        // 上传文件
//        $info   =   $upload->uploadOne($_FILES['upfile']);
//        if(!$info) {// 上传错误提示错误信息
//            $this->jsonReturn($upload->getError());
//        }else{// 上传成功
//            $arr = [
//                'url' =>$info['savepath'].$info['savename'],
//            ];
//            $this->jsonReturn($arr);
//        }
    }

    public function upfileAction()
    {
//        $upload = new \Think\Upload(); // 实例化上传类
//        $upload->maxSize   =     31457280 ;// 设置附件上传大小
//        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg',);// 设置附件上传类型
//        $upload->rootPath  =     UPLOAD_PATH;  // 设置附件上传根目录
//        $upload->savePath  =     'base/'; // 设置附件上传（子）目录
//        // $upload->subName   =      array('date', 'Ym');
//        $info = $upload->upload();
//        if($info) {
//            $list = [];
//            foreach ($info as $key => $value) {
//                $list[] = [
//                    'short_url'=>$value['savepath'].$value['savename'],
//                    'url' => picurl($value['savepath'].$value['savename']),
//                ];
//            }
//
//            $this->jsonReturn($list);
//        } else {
//            $this->jsonReturn($upload->getError());
//        }

    }
}
