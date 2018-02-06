<?php
namespace Common\Service;
require_once APP_PATH.'/Common/AliyunSdk/aliyun-php-sdk-core/Config.php';
use vod\Request\V20170321 as vod;

class VodService{

	const UPLOAD_AUTH_CACHE_KEY = 'vod_upload_auth_';//+videoId
	const PLAY_CACHE_KEY = 'vod_play_';//+videoId

	private $accessKeyId;
	private $accessKeySecret;
	private $client;

	public function __construct() {
		$this->accessKeyId = C('OSS_ACCESS_KEY_ID');
		$this->accessKeySecret = C('OSS_ACCESS_KEY_SECRET');
		$profile = \DefaultProfile::getProfile('cn-shanghai', $this->accessKeyId, $this->accessKeySecret);
		$this->client = new \DefaultAcsClient($profile);
	}

	/**
	 * 获取视频上传地址和凭证
	 *
	 * @param string $title 视频标题(必填参数)
	 * @param string $file_name 视频源文件名称，必须包含扩展名(必填参数)
	 * @param string $cover_url 自定义视频封面(可选)
	 * @param string $description 视频源文件描述(可选)
	 * @param string $tags 视频标签，多个用逗号分隔(可选)
	 * @return 
	 */
	public function createUploadVideo($data = []) {
		$title = isset($data['title']) && !empty($data['title']) ? $data['title'] : '小程序视频';
		$file_name = isset($data['file_name']) && !empty($data['file_name']) ? $data['file_name'] : '小程序视频.mp4';
		$cover_url = isset($data['cover_url']) && !empty($data['cover_url']) ? $data['cover_url'] : '';
		$description = isset($data['description']) && !empty($data['description']) ? $data['description'] : '';
		$tags = isset($data['tags']) && !empty($data['tags']) ? $data['tags'] : '';
		try {
			$request = new vod\CreateUploadVideoRequest();
		    $request->setTitle($title);        // 视频标题(必填参数)
		    $request->setFileName($file_name); // 视频源文件名称，必须包含扩展名(必填参数)
		    !empty($description) && $request->setDescription($description);  // 视频源文件描述(可选)
		    !empty($cover_url) && $request->setCoverURL($cover_url); // 自定义视频封面(可选)
		    !empty($tags) && $request->setTags($tags); // 视频标签，多个用逗号分隔(可选)
		    $request->setAcceptFormat('JSON');
		    $ret = $this->client->getAcsResponse($request);
		    $ret = $this->objectToArray($ret);
		} catch (\Exception $e) {
			return false;
		}
		S(self::UPLOAD_AUTH_CACHE_KEY.$ret['VideoId'], $ret, 3600 - 60 * 5);
		$this->aliyunVideoDao()->add(['video_id'=> $ret['VideoId'], 'branch_id'=> (int)$_POST['branch_id'], 'add_time'=> NOW_TIME]);
		return $ret;
	}

	/**
	 * 刷新视频上传凭证
	 *
	 * @param string $videoId 视频ID(必填参数)
	 * @param string $cache 是否优先读取缓存
	 * @return 
	 */
	public function refreshUploadVideo($videoId, $cache = true) {
		$ret = S(self::UPLOAD_AUTH_CACHE_KEY.$videoId);
		if ($cache && $ret) {
			return $ret;
		}
		try {
			$request = new vod\RefreshUploadVideoRequest();
		    $request->setVideoId($videoId);
		    $request->setAcceptFormat('JSON');
		    $ret = $this->client->getAcsResponse($request);
		    $ret = $this->objectToArray($ret);
		} catch (\Exception $e) {
			return false;
		}
		S(self::UPLOAD_AUTH_CACHE_KEY.$videoId, $ret, 3600 - 60 * 5);
		return $ret;
	}

	/**
	 * 获取播放地址
	 *
	 * @param string $videoId 视频ID(必填参数)
	 * @return 
	 */
	public function getPlayInfo($videoId, $cache = true) {
		$ret = S(self::PLAY_CACHE_KEY.$videoId);
		if ($cache && $ret) {
			return $ret;
		}
		try {
			$request = new vod\GetPlayInfoRequest();
		    $request->setVideoId($videoId);
		    $request->setAuthTimeout(3600*24);    // 播放地址过期时间（只有开启了URL鉴权才生效），默认为3600秒，支持设置最小值为3600秒
		    $request->setAcceptFormat('JSON');
		    $request->setFormats('mp4,mp3');
		    $ret = $this->client->getAcsResponse($request);
		    $ret = $this->objectToArray($ret);
		} catch (\Exception $e) {
			return false;
		}
		S(self::PLAY_CACHE_KEY.$videoId, $ret, 3600 - 60 * 5);
		return $ret;
	}

	/**
	 * 获取视频信息
	 *
	 * @param string $videoId 视频ID(必填参数)
	 * @return 
	 */
	public function getVideoInfo($videoId) {
		try {
			$request = new vod\GetVideoInfoRequest();
		    $request->setVideoId($videoId);
		    $request->setAcceptFormat('JSON');
		    $ret = $this->client->getAcsResponse($request);
		    $ret = $this->objectToArray($ret);
		} catch (\Exception $e) {
			return false;
		}
		$cover_url = $this->aliyunVideoDao()->where(['video_id'=> $videoId])->getField('cover_url');
		if (empty($cover_url)) {
			$this->aliyunVideoDao()->where(['video_id'=> $videoId])->save([
				'cover_url'=> $ret['Video']['CoverURL'],
				'status'=> $ret['Video']['Status'],
				'duration'=> (int)$ret['Video']['Duration'],
				'size'=> $ret['Video']['Size'],
			]);
		}
		return $ret['Video'];
	}

	/**
	 * 修改视频信息
	 *
	 * @param string $videoId 视频ID(必填参数)
	 * @return 
	 */
	public function updateVideoInfo($videoId, $data) {
		try {
			$request = new vod\UpdateVideoInfoRequest();
		    $request->setVideoId($videoId);
		    isset($data['title']) && !empty($data['title']) && $request->setTitle($data['title']);   // 更改视频标题
		    isset($data['description']) && !empty($data['description']) && $request->setDescription($data['description']);    // 更改视频描述
		    isset($data['cover_url']) && !empty($data['cover_url']) && $request->setCoverURL($data['cover_url']);    // 更改视频封面
		    isset($data['tags']) && !empty($data['tags']) && $request->setTags($data['tags']);    // 更改视频标签，多个用逗号分隔
		    $request->setAcceptFormat('JSON');
		    $ret = $this->client->getAcsResponse($request);
		} catch (\Exception $e) {
			return false;
		}
		return $this->objectToArray($ret);
	}

	/**
	 * 删除视频
	 *
	 * @param string $videoIds 为传入的视频ID列表，多个用逗号分隔(必填参数)
	 * @return 
	 */
	public function deleteVideos($videoIds) {
		try {
			$request = new vod\DeleteVideoRequest();
		    $request->setVideoIds($videoIds);   // 支持批量删除视频；videoIds为传入的视频ID列表，多个用逗号分隔
		    $request->setAcceptFormat('JSON');
		    $ret = $this->client->getAcsResponse($request);
		    $ret = $this->objectToArray($ret);
		} catch (\Exception $e) {
			return false;
		}
		$video_id_list = explode(',', $videoIds);
		foreach ($video_id_list as $key => $video_id) {
			S(self::UPLOAD_AUTH_CACHE_KEY.$video_id, null);
			S(self::PLAY_CACHE_KEY.$video_id, null);
		}
		return $ret;
	}

	/**
	 * 用于编辑或者添加视频
	 *
	 * @param string $videoId 视频ID
	 * @return 
	 */
	public function getUploadInfo($videoId = '') {
		$res = [
			'VideoId'=> '',
			'UploadAddress'=> '',
			'UploadAuth'=> '',
			'PlayURL'=> '',
		];
		if (!empty($videoId)) {
			$playInfo = $this->getPlayInfo($videoId);
			if ($playInfo !== false) {
				$res['VideoId'] = $videoId;
				$ret = $this->refreshUploadVideo($videoId);
				$res['UploadAddress'] = $ret['UploadAddress'];
				$res['UploadAuth'] = $ret['UploadAuth'];
				$res['PlayURL'] = $playInfo['PlayInfoList']['PlayInfo'][0]['PlayURL'];
			}
		}
		if (empty($res['VideoId'])) {
			$ret = $this->createUploadVideo();
			$res['VideoId'] = $ret['VideoId'];
			$res['UploadAddress'] = $ret['UploadAddress'];
			$res['UploadAuth'] = $ret['UploadAuth'];
		}
		return $res;
	}

	/**
	 * 获取源文件信息
	 *
	 * @param string $videoId 视频ID
	 * @return 
	 */
	public function getMezzanineInfo($videoId) {
		try {
			$request = new vod\GetMezzanineInfoRequest();
		    $request->setVideoId($videoId);
		    $request->setAcceptFormat('JSON');
		    $ret = $this->client->getAcsResponse($request);
		    $ret = $this->objectToArray($ret);
		} catch (\Exception $e) {
			return false;
		}
	    return $ret;
	}

	private function objectToArray($obj) {
	    $obj = (array)$obj;
	    foreach ($obj as $k => $v) {
	        if (gettype($v) == 'resource') {
	            return;
	        }
	        if (gettype($v) == 'object' || gettype($v) == 'array') {
	            $obj[$k] = (array)$this->objectToArray($v);
	        }
	    }
	    return $obj;
	}

	private function aliyunVideoDao() {
		return D('Common/Aliyun/Video');
	}
}