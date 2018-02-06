<?php
$no_think_php = true;
//引入公共参数配置文件
include_once('../config.db.php');
//定义尺寸
$szl = array(
	'b150'=>array(150,150),
	'b160'=>array(160,160),
	'b72'=>array(72,72),
	'b32'=>array(32,32),
	'b48'=>array(48,48),
	'w48'=>array(48,0),
	'h48'=>array(0,48),
	'h75'=>array(0,75),
	'b90'=>array(90, 90),
	'b120'=>array(120, 120),
	'b200'=>array(200, 200),
	'b300'=>array(300, 300),
	'b400'=>array(400, 400),
	'b420'=>array(420, 290),
	'b512'=>array(512, 512),
	'b600'=>array(600, 600),
	'w640'=>array(640, 0),
);
//分解URL
$url = parse_url($_SERVER['PHP_SELF'], PHP_URL_PATH);
$cps = explode('/', $url);
$num = count($cps);
if($num < 2){
	trick();
}

$szname = '';
for($i = 0; $i < $num; $i++){
	$str = $cps[$i];
	if($str != 'thumbs'){
		unset($cps[$i]);
	} else {
		unset($cps[$i]);
		$i++;
		$szname = $cps[$i];
		unset($cps[$i]);
		break;
	}
}

$szinfo = $szl[$szname];
if(!is_array($szinfo) || count($cps) < 1){
	trick();
}

$fpath = implode('/', $cps);
$origion_path = UPLOAD_PATH.$fpath;
$thumb_path = UPLOAD_PATH.'thumbs/'.$szname.'/'.$fpath;

//生成缩略图
imagecropper($origion_path, $szinfo[0], $szinfo[1], $thumb_path);

//输出缩略图
echo file_get_contents($thumb_path);

/************以下为相关函数 *************/

function trick(){
	exit('...');
}

function imagecropper($source_path, $target_width, $target_height, $target_path = './abc/'){
	$source_info = getimagesize($source_path);
	$source_width = $source_info[0];
	$source_height = $source_info[1];
	$source_mime = $source_info['mime'];
	$source_ratio = $source_height / $source_width;
	
	if($target_width == 0){
		$target_ratio = $source_ratio;
		$target_width = $target_height / $target_ratio;
	} 
	elseif($target_height == 0){
		$target_ratio = $source_ratio;
		$target_height = $target_width * $target_ratio;
	} 
	else {
		$target_ratio = $target_height / $target_width;
	}
	
	

	// 源图过高
	if ($source_ratio > $target_ratio){
		$cropped_width = $source_width;
		$cropped_height = $source_width * $target_ratio;
		$source_x = 0;
		$source_y = ($source_height - $cropped_height) / 2;
	}
	// 源图过宽
	elseif ($source_ratio < $target_ratio){
		$cropped_width = $source_height / $target_ratio;
		$cropped_height = $source_height;
		$source_x = ($source_width - $cropped_width) / 2;
		$source_y = 0;
	}
	// 源图适中
	else{
		$cropped_width = $source_width;
		$cropped_height = $source_height;
		$source_x = 0;
		$source_y = 0;
	}

	switch ($source_mime){
		case 'image/gif':
		$source_image = imagecreatefromgif($source_path);
		break;

		case 'image/jpeg':
		$source_image = imagecreatefromjpeg($source_path);
		break;

		case 'image/png':
		$source_image = imagecreatefrompng($source_path);
		break;

		default:
		return false;
		break;
	}
	
	header('Content-Type: '.$source_mime);
	header('Content-Author:Gao');

	$target_image = imagecreatetruecolor($target_width, $target_height);
	// 裁剪、缩放
	imagealphablending($target_image,false);//这里很重要,意思是不合并颜色,直接用$img图像颜色替换,包括透明色;
    imagesavealpha($target_image,true); //保存透明色
	imagecopyresampled($target_image, $source_image, 0, 0, $source_x, $source_y, $target_width, $target_height, $cropped_width, $cropped_height);

	//保存图片到本地(两者选一)
	@mkdir(dirname($target_path), 0777, true);
	
	switch ($source_mime){
		case 'image/gif':
		@imagegif($target_image, $target_path);
		break;

		case 'image/jpeg':
		@imagejpeg($target_image, $target_path);
		break;

		case 'image/png':
		@imagepng($target_image, $target_path);
		break;
	}
	@imagedestroy($target_image);
	@imagedestroy($source_image);
}