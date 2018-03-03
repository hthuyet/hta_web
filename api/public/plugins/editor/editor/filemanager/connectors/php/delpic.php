<?php


ob_start() ;

include('config.php') ;

$url = trim($_GET['url']);
if (file_exists("../../../../../../../".$url)) {
			unlink("../../../../../../../".$url);
}


?>
