<?php
namespace Common\Service;
include_once APP_PATH.'/Common/OssSdk/autoload.php';
use OSS\OssClient;
use OSS\Core\OssException;

class OssService{

	private $accessKeyId;
	private $accessKeySecret;
	private $endpoint;
	private $bucket;
	private $ossClient;

	public function __construct() {
		$this->accessKeyId = C('OSS_ACCESS_KEY_ID');
		$this->accessKeySecret = C('OSS_ACCESS_KEY_SECRET');
		$this->endpoint = C('OSS_ENDPOINT');
		$this->bucket = C('OSS_BUCKET');
		$this->ossClient = new OssClient($this->accessKeyId, $this->accessKeySecret, $this->endpoint);
	}

	/**
	 * 上传指定的本地文件内容
	 *
	 * @param file $file 上传的文件$_FILE['']
	 * @param string $pre 存放的目录
	 * @return 
	 */
	public function uploadFile($file, $pre = '') {
		$hz = strtolower(end(explode('.',$file['name'])));
		$savename = $pre.md5(time().rand(10000,99999)).'.'.$hz;
	    $ret = $this->ossClient->uploadFile($this->bucket, $savename, $file['tmp_name']);
	    $url = $ret['info']['url'];
	    $addData = [
	    	'savename'=> $savename,
	    	'branch_id'=> (int)$_POST['branch_id'],
	    	'url'=> $url,
	    	'add_time'=> NOW_TIME
	    ];
	    if (in_array($hz, ['jpg', 'gif', 'png', 'jpeg', 'bmp'])) {
	    	$this->aliyunImageDao()->add($addData);
	    } else {
	    	$this->aliyunFileDao()->add($addData);
	    }
	    return $url;
	}

	/**
	 * 列出Bucket内所有目录和文件， 根据返回的nextMarker循环调用listObjects接口得到所有文件和目录
	 *
	 * @param string $prefix 存储空间名称
	 * @param string $maxkeys pagesize
	 * @param string $nextMarker 设定结果从nextMarker之后按字母排序的第一个开始返回
	 * @return 
	 */
	public function listAllObjects($prefix = "", $maxkeys = 20, $nextMarker = '') {
        $listObjectInfo = $this->ossClient->listObjects($this->bucket, [
        	'delimiter' => '/',
            'prefix' => $prefix,
            'max-keys' => $maxkeys,
            'marker' => $nextMarker,
        ]);
        $nextMarker = $listObjectInfo->getNextMarker();
        $listObject = $listObjectInfo->getObjectList();
        $list = [];
        foreach ($listObject as $key => $value) {
        	$list[] = [
        		'key'=> $value->getKey(),
        		'lastModified'=> $value->getLastModified(),
        		'eTag'=> $value->getETag(),
        		'type'=> $value->getType(),
        		'size'=> $value->getSize(),
        		'storageClass'=> $value->getStorageClass(),
        		'url'=> 'http://' . $this->bucket . '.' . $this->endpoint.'/'.$value->getKey(),
        	];
        }
        return [
        	'nextMarker'=> $nextMarker,
        	'list'=> $list,
        ];
	}

	/**
	 * 获取
	 *
	 * @param $savename
	 * @return null
	 */
	public function getObjectMeta($savename) {
		try {
			$ret = $this->ossClient->getObjectMeta($this->bucket, $savename);
		} catch (\Exception $e) {
			return false;
		}
		$updateData = [
	    	'content_type'=> $ret['content-type'],
	    	'size'=> $ret['content-length'],
	    ];
		if (in_array(strtolower(end(explode('.',$savename))), ['jpg', 'gif', 'png', 'jpeg', 'bmp'])) {
	    	$this->aliyunImageDao()->where(['savename'=> $savename])->save($updateData);
	    } else {
	    	$this->aliyunFileDao()->where(['savename'=> $savename])->save($updateData);
	    }
		return $ret;
	}

	/**
	 * 删除
	 *
	 * @param $savename
	 * @return null
	 */
	public function deleteObject($savename) {
		try {
			$this->ossClient->deleteObject($this->bucket, $savename);
		} catch (\Exception $e) {
			return false;
		}
		return true;
	}

	private function aliyunImageDao() {
		return D('Common/Aliyun/Image');
	}

	private function aliyunFileDao() {
		return D('Common/Aliyun/File');
	}
}