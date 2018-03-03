<?php
/*
 * FCKeditor - The text editor for Internet - http://www.fckeditor.net
 * Copyright (C) 2003-2007 Frederico Caldeira Knabben
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 *
 * This is the File Manager Connector for PHP.
 */

ob_start() ;

include('config.php') ;

$folder_name = trim($_GET['url']);

delfold($folder_name);

function delfold($folder_name) {
	$url ="../../../../../../files/editor/image";
	if (is_dir($url.$folder_name)) {
				$handle = opendir($url.$folder_name);
				while (false !== ($file = readdir($handle))) {
					if (($file == '.') || ($file == '..')) continue;
					$url2 = $url.$folder_name.$file;
					if (is_dir($url2)) delfold($folder_name."/".$file."/");
					else @unlink($url2);
				}

				closedir($handle);
				@rmdir($url.$folder_name);
	}
}

?>