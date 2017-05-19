<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.7.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/news/controllers/home.php
 */

require FCPATH.'branch/fqb/D_Comment.php';
 
class Comment extends D_Comment {
	
    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->module(APP_DIR);
        if (IS_POST) {
            $_POST['content'] = $_POST['data']['content'];
        }
	}

    public function _safe_replace($data) {
        return $data;
    }


    // 提交评论之后，方便二次开发和重写
    public function _post_commnet($data) {
        // 格式化
        $title = dr_clearhtml($data['content']);
        // 更新统计
        if ($data['catid']) {
            $this->link
                 ->where('catid', intval($data['catid']))
                 ->set('last_uid', $data['uid'])
                 ->set('last_time', SYS_TIME)
                 ->set('last_url', $data['url'])
                 ->set('last_title', $data['title'])
                 ->set('last_cid', $data['cid'])
                 ->set('today_replys', 'today_replys+1', false)
                 ->set('replys', 'replys+1', false)
                 ->update($this->content_model->prefix.'_cat_count');
        }
        if ($data['cid']) {
            $this->link
                ->where('id', intval($data['cid']))
                ->set('reply_info', dr_array2string(array(
                    'uid' => $data['uid'],
                    'url' => $data['url'],
                    'title' => $title,
                    'inputtiem' => SYS_TIME,
                )))
                ->update($this->content_model->prefix);
        }

    }

}