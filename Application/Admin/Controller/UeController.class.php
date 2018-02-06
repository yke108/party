<?php
namespace Admin\Controller;
use Admin\Controller\FController;
use Common\Basic\CsException;

class UeController extends FController { /*system@系统管理*/
	protected $CONFIG;
	
	protected function _purviewCheck(){
		$this->purview_checked = true;
	}
	
	  public function centerAction()
	  {
	  		// $url = API_DOMAIN;
	  		$url = APP_PATH.'Common/Conf/config.json';

	  		$this->CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($url)), true);
			$action = $_GET['action'];

			switch ($action) {
			    case 'config':
			        $result =  json_encode($this->CONFIG);
			        break;

			    /* 上传图片 */
			    case 'uploadimage':
			    /* 上传涂鸦 */
			    case 'uploadscrawl':
			    /* 上传视频 */
			    case 'uploadvideo':
			    /* 上传文件 */
			    case 'uploadfile':
			        $result = $this->indexAction();
			        break;
			    // /* 列出图片 */
			    case 'listimage':
			  //   	$params = [
			  //   		'size'=>$_GET['size'],
					// 	'start'=>$_GET['start'],
			  //   	];
			  //   	$result = $this->apiRequest('Ue/listimage',$params);
			  //   	// if($result == false)
			  //   	// {
			  //   	// 	echo '失败';
			  //   	// }
			  //   	if(isset($result['result']['state']) && $result['result']['state']=='SUCCESS')
					// {
					// 	$arr['state'] = "SUCCESS";
					// 	foreach($result['result']['list'] as $k =>$v)
					// 	{
					// 		$arr['list'][$k]['url']	 = 	$v['url'];
					// 		$arr['list'][$k]['original'] = $v['short_url'];
					// 		$arr['list'][$k]['origion_url'] = $v['origion_url'];
					// 	}
					// 	$arr['start'] = $result['result']['start'];
					// }else{

					// 	$arr['state'] = '请求地址出错';
					// }
					// // dump($result);
			  //   	$this->ajaxReturn($arr);
			  //       break;
                    $branch_id = $_SESSION['wxuser']['branch_id'].'/';
			        try {
	                    $ossService = Service('Oss');
	                    $ret = $ossService->listAllObjects('editor/'.$branch_id, $_GET['size'], $_GET['marker']);
	                } catch (\CsException $e) {
	                    throw new CsException($e->getMessage()); 
	                }
	                $result = json_encode(["state" => 'SUCCESS', "list" => $ret['list'], "marker"=> $ret['nextMarker']]);
	                break;

			    default:
			        $result = json_encode(array(
			            'state'=> '请求地址出错'
			        ));
			        break;
			}

			/* 输出结果 */
			if (isset($_GET["callback"])) {
			    if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
			        echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
			    } else {
			        echo json_encode(array(
			            'state'=> 'callback参数不合法'
			        ));
			    }
			} else {
			    echo $result;
			}
	  }

	  public function indexAction(){ /*NoPurview*/
			$curl = curl_init();
			$data = [];
			//签名
			$data['version'] = '1';
			$data['client'] = '21';
			$data['rstr'] = NOW_TIME;
			$data['uptype'] = isset($_POST['uptype']) ? I('post.uptype') : 'None';
			$sesspwd = session('sesspwd');
			if (empty($sesspwd)){
				throw new CsException('请登录');
			}
			$data['token'] = session('sesspwd');
			$tparr = $data;
			$tparr['secKey'] = md5('AnApiForFood2China118');
			sort($tparr, SORT_STRING);
			$tmpStr = implode($tparr);
			$data['vsign'] = md5($tmpStr);
			
			foreach ($_FILES as $ko => $vo){
				$oldpath = $_FILES[$ko]['tmp_name'];
				$newpath = $oldpath.'_'.$_FILES[$ko]['name'];
				rename($oldpath, $newpath);
				$data[$ko] = '@'.$newpath;
			}
			// print_r($data);
			curl_setopt($curl, CURLOPT_URL, DK_API.'/api/admin/index.php/Ue/index');
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_POST, true);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
			$result = curl_exec($curl);
//			print_r($result);
			curl_close($curl);
			@unlink($newpath);
			$res = json_decode($result);
			
			if(isset($res->Error) && $res->Error==0)
			{
				$arr = [
					'state'=>'SUCCESS',
					'url'=>$res->link, // '/'.$res->url,
					'link'=>$res->link,
				];
			}else{
				$arr = [
					'state'=>$res->Message,
				];
			}
			$this->ajaxReturn($arr);
	}


	// public function actionlistAction()
	// {
	// 		/* 判断类型 */
	// 		switch ($_GET['action']) {
	// 		    /* 列出文件 */
	// 		    case 'listfile':
	// 		        $allowFiles = $this->CONFIG['fileManagerAllowFiles'];
	// 		        $listSize = $this->CONFIG['fileManagerListSize'];
	// 		        $path = $this->CONFIG['fileManagerListPath'];
	// 		        break;
	// 		    /* 列出图片 */
	// 		    case 'listimage':
	// 		    default:
	// 		        $allowFiles = $this->CONFIG['imageManagerAllowFiles'];
	// 		        $listSize = $this->CONFIG['imageManagerListSize'];
	// 		        $path = $this->CONFIG['imageManagerListPath'];
	// 		}
	// 		$allowFiles = substr(str_replace(".", "|", join("", $allowFiles)), 1);

	// 		/* 获取参数 */
	// 		$size = isset($_GET['size']) ? htmlspecialchars($_GET['size']) : $listSize;
	// 		$start = isset($_GET['start']) ? htmlspecialchars($_GET['start']) : 0;
	// 		$end = $start + $size;

	// 		/* 获取文件列表 */
	// 		$path = $_SERVER['DOCUMENT_ROOT'] . (substr($path, 0, 1) == "/" ? "":"/") . $path;
	// 		$files = $this->getfiles($path, $allowFiles);
	// 		if (!count($files)) {
	// 		    return json_encode(array(
	// 		        "state" => "no match file",
	// 		        "list" => array(),
	// 		        "start" => $start,
	// 		        "total" => count($files)
	// 		    ));
	// 		}

	// 		/* 获取指定范围的列表 */
	// 		$len = count($files);
	// 		for ($i = min($end, $len) - 1, $list = array(); $i < $len && $i >= 0 && $i >= $start; $i--){
	// 		    $list[] = $files[$i];
	// 		}
	// 		//倒序
	// 		//for ($i = $end, $list = array(); $i < $len && $i < $end; $i++){
	// 		//    $list[] = $files[$i];
	// 		//}

	// 		/* 返回数据 */
	// 		$result = json_encode(array(
	// 		    "state" => "SUCCESS",
	// 		    "list" => $list,
	// 		    "start" => $start,
	// 		    "total" => count($files)
	// 		));

	// 		return $result;
	// }


	// /**
	//  * 遍历获取目录下的指定类型的文件
	//  * @param $path
	//  * @param array $files
	//  * @return array
	//  */
	// public function getfiles($path, $allowFiles, &$files = array())
	// {
	//     if (!is_dir($path)) return null;
	//     if(substr($path, strlen($path) - 1) != '/') $path .= '/';
	//     $handle = opendir($path);
	//     while (false !== ($file = readdir($handle))) {
	//         if ($file != '.' && $file != '..') {
	//             $path2 = $path . $file;
	//             if (is_dir($path2)) {
	//                 getfiles($path2, $allowFiles, $files);
	//             } else {
	//                 if (preg_match("/\.(".$allowFiles.")$/i", $file)) {
	//                     $files[] = array(
	//                         'url'=> substr($path2, strlen($_SERVER['DOCUMENT_ROOT'])),
	//                         'mtime'=> filemtime($path2)
	//                     );
	//                 }
	//             }
	//         }
 //    	}
 //   	 	return $files;
 //    }


}