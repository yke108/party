<?php
namespace Admin\Controller;
use Think\Controller;

class UploadController extends Controller {	
	
    public function indexAction(){
    	$curl = curl_init();
    	$data = [];
    	foreach ($_FILES as $ko => $vo){
    		$oldpath = $_FILES[$ko]['tmp_name'];
    		$newpath = $oldpath.'_'.$_FILES[$ko]['name'];
    		rename($oldpath, $newpath);
    		$data['imgFile'] = '@'.$newpath;
    	}
    	curl_setopt($curl, CURLOPT_URL, DK_API.'/api/admin/site/upload/index');
    	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($curl, CURLOPT_POST, true);
    	curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    	$result = curl_exec($curl);
    	curl_close($curl);
    	@unlink($newpath);
    	echo $result;
    }

    //  public function upfileAction()
    // {
    //     dump($_FILES);
    //     $upload = new \Think\Upload(); // 实例化上传类
    //     $upload->maxSize   =     31457280 ;// 设置附件上传大小
    //     $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg',);// 设置附件上传类型
    //     $upload->rootPath  =     UPLOAD_PATH;  // 设置附件上传根目录
    //     $upload->savePath  =     'base/'; // 设置附件上传（子）目录
    //     // $upload->subName   =      array('date', 'Ym');
    //     $info = $upload->upload();
    //     if($info) {
    //         $list = [];
    //         foreach ($info as $key => $value) {
    //             $list[] = [
    //                 'short_url'=>$value['savepath'].$value['savename'],
    //                 'url' => picurl($value['savepath'].$value['savename']),
    //             ];
    //         }
    //         dump($list);
    //         // $this->jsonReturn($list);
    //     } else {
    //         dump($upload->getError());
    //         // $this->jsonReturn($upload->getError());
    //     }

    // }
}
