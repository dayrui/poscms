<?php

/**
 * @since	    version 3.2.0
 * @author	    Lirui <lirui@dayrui.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc. QQ群618659751
 */
 
header('Content-Type: text/html; charset=utf-8');
if (!function_exists('mcrypt_encrypt')) {
    exit('PHP未开启Mcrypt扩展');
}
if (version_compare(PHP_VERSION, '5.3.7') >= 0) {
	header('Location: /index.php?c=install');
} else {
	exit('PHP至少需要5.3.7以上版本');
}

