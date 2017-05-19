<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 火车采集器接口
 *
 * @since		version 1.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class Spider extends D_Common {

	public $link;

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
		if (!defined('APP_SPIDER')) exit('入口文件错误');
		$this->output->enable_profiler(FALSE);
		$this->link = $this->site[SITE_ID];
    }

    /**
     * 栏目选择
     */
    public function category() {
		echo "<select name='catid'>";
		$cats = $this->get_cache('module-'.SITE_ID.'-'.APP_DIR, 'category');
		foreach ($cats as $cat) {
		    if ($cat['child'] == 0) echo "<option value='" . $cat['id'] . "'>" . $cat['name'] . "</option>";
		}
		echo "</select>";
    }
	
	/**
     * 采集入库
     */
    public function add() {
	
		$uid = 1; // 发布者的id号
		$auth = '123456'; // 这里的密码要和火车采集器参数一致！
		$status = 9; // 文章审核状态：1为待审核，9为正式发布
		
		// 权限验证
		if ($this->input->get('auth') != $auth) exit('权限认证失败');
		
		$add = array();
		$data = $this->input->post('data');
		$this->load->model('content_model');
		
		// 参数验证
		if (!$data['catid']) exit('栏目不存在');
		if (!$data['catid'] || !$data['title'] || !$data['content']) exit('数据不完整');
		
		// 标题重复验证
		if ($this->link->where('title', $data['title'])->count_all_results($this->content_model->prefix)) exit('标题重复');
		
		// 按字段来归类
		$field = $this->get_cache('module-'.SITE_ID.'-'.APP_DIR, 'field');
		foreach ($field as $t) {
			$name = $t['fieldname'];
			if ($name && isset($data[$name])) $add[$t['ismain']][$name] = $data[$name];
		}
		
		// 默认字段值设定
		$member = dr_member_info($uid);
		$add[1]['uid'] = $uid; // 作者id
		$add[1]['catid'] = $data['catid']; // 栏目id
		$add[1]['author'] = $member['username']; // 作者名称
		$add[1]['status'] = $status; // 审核通过状态=9
		$add[1]['inputip'] = '来至采集'; // ip地址设定
		$add[1]['inputtime'] = $add[1]['updatetime'] = SYS_TIME; // 录入时间
		
		if (($id = $this->content_model->add($add)) != FALSE) {
			exit('成功');
		} else {
			exit('入库失败');
		}
    }
}