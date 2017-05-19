<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 * @filesource	svn://www.dayrui.net/v2/news/core/M_Controller.php
 */

require FCPATH.'branch/fqb/D_Module.php';

class M_Controller extends D_Module {

    /**
     * 构造函数继承公共Module类
     */
    public function __construct() {
        parent::__construct();
        $this->load->helper('bbs');
        $time = $this->link->where('id', 1)->get($this->content_model->prefix.'_config')->row_array();
        if (!$time) {
            $time = array('id' => 1, 'value' => SYS_TIME);
            $this->link->replace($this->content_model->prefix.'_config', $time);
            $this->link->update($this->content_model->prefix.'_cat_count', array('today_subjects' => 0, 'today_replys' => 0));
        } else {
            $mk = date('ymd', $time['value']) != date('ymd', SYS_TIME);
            // 更新时间不是当天的话就清空今日统计数量
            $mk && $this->link->update($this->content_model->prefix.'_cat_count', array('today_subjects' => 0, 'today_replys' => 0));
            // 更新时间不是当天的话就重置配置最新更新时间
            $mk && $this->link->update($this->content_model->prefix.'_config', array('value' => SYS_TIME));
        }
    }

}