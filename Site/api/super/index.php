<?php
define('APP_DEBUG',true);
define('MULTI_MODULE', false);
define('BIND_MODULE','Super');
try {
	include_once('../../../config.db.php');
} catch (Exception $e) {
	echo json_encode([
		'Error'=> $e->getCode(),
		'Message'=> $e->getMessage(),
	]);
	exit;
}