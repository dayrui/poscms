<?php

/**
 * @since	    version 3.2.0
 * @author	    Lirui <lirui@dayrui.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc. QQ群618659751
 */


define('IS_ADMIN', TRUE); // 项目标识
define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME)); // 该文件的名称
$_GET['d'] = 'admin'; // 将项目标识作为directory
require('index.php'); // 引入主文件