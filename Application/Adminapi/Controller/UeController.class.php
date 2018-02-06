<?php
namespace Adminapi\Controller;
use Think\Controller;
use Common\Basic\CsException;

class UeController extends FController {	
	protected $CONFIG;

    /**
     * @throws CsException
     */
    public function indexAction(){
        $file = current($_FILES);
        if (empty($file))  throw new CsException('上传的文件为空', 1003);
        if($_POST['uptype']=='None')
        {
            if (!in_array(strtolower(end(explode('.',$file['name']))), ['jpg', 'gif', 'png', 'jpeg'])) throw new CsException('上传的后续名不支持', 1003);
            try {
                $ossService = Service('Oss');
                $url = $ossService->uploadFile($file, 'editor');
            } catch (\CsException $e) {
                throw new CsException($e->getMessage(), 1003);
            }
        }else{
            switch($_POST['uptype'])
            {
                case 'audio':
                    if (!in_array(strtolower(end(explode('.',$file['name']))), ['mp3'])) throw new CsException('上传的后续名不支持', 1003);
                    try {
                        $ossService = Service('Oss');
                        $url = $ossService->uploadFile($file, 'radio');
                    } catch (\CsException $e) {
                        throw new CsException($e->getMessage(), 1003);
                    }
                break;
            }
        }

        $arr = [
            'url' =>$url,
            'link'=>$url,
        ];
        $this->jsonReturn($arr);
    }

    public function audioAction()
    {
        print_r($_FILES);
        $file = current($_FILES);
        if (empty($file))  throw new CsException('上传的文件为空', 1003);
        if (!in_array(strtolower(end(explode('.',$file['name']))), ['mp3'])) throw new CsException('上传的后续名不支持', 1003);
        try {
            $ossService = Service('Oss');
            $url = $ossService->uploadFile($file, 'audio');
        } catch (\CsException $e) {
            throw new CsException($e->getMessage(), 1003);
        }

        $arr = [
            'url' =>$url,
            'link'=>$url,
        ];
        $this->jsonReturn($arr);
    }


    public function refreshUploadVideoAction() {
        $video_id = I('post.video_id');
        $ret = Service('Vod')->refreshUploadVideo($video_id, false);
        if ($ret === false) {
            $this->ajaxReturn(['error' => 1]);
        }
        $this->ajaxReturn(['error' => 0, 'UploadAuth'=> $ret['UploadAuth']]);
    }

    public function getPlayInfoAction() {
        $video_id = I('post.video_id');
        $ret = Service('Vod')->getMezzanineInfo($video_id);
        if ($ret === false) {
            $this->ajaxReturn(['error' => 1]);
        }
        $this->ajaxReturn(['error' => 0, 'PlayURL'=> $ret['Mezzanine']['FileURL'],'Message'=>'上传成功']);
    }

    public function createUploadVideoAction() {
        $ret = Service('Vod')->createUploadVideo();
        if ($ret === false) {
            $this->ajaxReturn(['error' => 1]);
        }
        $this->ajaxReturn(['error' => 0, 'info'=> $ret,'Message'=>'正在上传,请稍后...']);
    }



}
