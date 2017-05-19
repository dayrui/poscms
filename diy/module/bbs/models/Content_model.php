<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

require FCPATH.'branch/fqb/C_Model.php';

class Content_model extends C_Model {

    /*
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
    }


    public function _add_content($data) {

        $catid = intval($data[1]['catid']);
        if ($data[1]['status'] == 9 && $catid) {
            // 更新统计表
            $row = $this->link->where('catid', $catid)->get($this->prefix.'_cat_count')->row_array();
            if (!$row) {
                $this->link->insert($this->prefix.'_cat_count', array(
                    'catid' => $catid,
                    'today_subjects' => 1,
                    'subjects' => 1,
                    'today_replys' => 0,
                    'replys' => 0,
                    'last_title' => $data[1]['title'],
                    'last_cid' => $data[1]['id'],
                    'last_url' => $data[1]['url'],
                    'last_username' => $data[1]['author'],
                    'last_uid' => $data[1]['uid'],
                    'last_time' => SYS_TIME,
                ));
            } else {
                $this->link->where('catid', $catid)->update($this->prefix.'_cat_count', array(
                    'today_subjects' => $row['todays'] + 1,
                    'subjects' => $row['subjects'] + 1,
                    'last_title' => $data[1]['title'],
                    'last_cid' => $data[1]['id'],
                    'last_url' => $data[1]['url'],
                    'last_username' => $data[1]['author'],
                    'last_uid' => $data[1]['uid'],
                    'last_time' => SYS_TIME,
                ));
            }
        }

    }

}