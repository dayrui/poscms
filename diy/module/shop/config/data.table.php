<?php

/**
 * Dayrui Website Management System
 * 
 * @since			version 2.5.2
 * @author			Dayrui <dayrui@gmail.com>
 * @license     	http://www.dayrui.com/license
 * @copyright		Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

/**
 * 附表结构（由开发者定义）
 */


return array (
  'sql' => 'CREATE TABLE IF NOT EXISTS `{tablename}` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT \'作者uid\',
  `catid` smallint(5) unsigned NOT NULL COMMENT \'栏目id\',
  `content` mediumtext COMMENT \'内容\',
  `duotu` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT=\'附表\'',
  'field' => 
  array (
    0 => 
    array (
      'fieldname' => 'duotu',
      'fieldtype' => 'Image',
      'relatedid' => '40',
      'relatedname' => 'module',
      'isedit' => '1',
      'ismain' => '0',
      'issystem' => 1,
      'ismember' => '1',
      'issearch' => '0',
      'disabled' => '0',
      'setting' => 
      array (
        'option' => 
        array (
          'width' => '80%',
          'size' => '5',
          'count' => '5',
          'uploadpath' => '',
        ),
        'validate' => 
        array (
          'required' => '0',
          'pattern' => '',
          'errortips' => '',
          'isedit' => '0',
          'xss' => '0',
          'check' => '',
          'filter' => '',
          'tips' => '',
          'formattr' => '',
        ),
      ),
      'displayorder' => '0',
      'textname' => '多图展示',
    ),
    1 => 
    array (
      'fieldname' => 'content',
      'fieldtype' => 'Ueditor',
      'relatedid' => '40',
      'relatedname' => 'module',
      'isedit' => '1',
      'ismain' => '0',
      'issystem' => 1,
      'ismember' => '1',
      'issearch' => '1',
      'disabled' => '0',
      'setting' => 
      array (
        'option' => 
        array (
          'mode' => 1,
          'width' => '90%',
          'height' => 400,
        ),
        'validate' => 
        array (
          'xss' => 1,
          'required' => 1,
        ),
      ),
      'displayorder' => '9',
      'textname' => '内容',
    ),
  ),
);?>