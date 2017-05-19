<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');



class Update extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->db->db_debug = TRUE;
    }

    /**
     * 更新程序
     */
    public function index() {


        // 删除不需要的文件
        $this->load->helper('file');
        $page = (int)$this->input->get('page');
        if (!$page) {
            $this->load->model('system_model');
            $tableinfo = $this->system_model->cache();
            $this->set_cache_data('table2', $tableinfo, 3600);
            $this->admin_msg('正在升级数据...', dr_url('update/index', array('page' => $page + 1)), 2);
        }
        // 表结构缓存
        $tableinfo = $this->get_cache_data('table2');
        if (!$tableinfo) {
            $this->load->model('system_model');
            $tableinfo = $this->system_model->cache();
            $this->set_cache_data('table2', $tableinfo, 3600);
        }
        delete_files(WEBPATH.'cache/backup/', TRUE);

        switch($page) {
            case 1:

                $this->admin_msg('附件表升级完成...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;

            case 2:

                // 模块部分
                $local = @array_diff(dr_dir_map(FCPATH.'module/', 1), array('member', 'space', 'order')); // 搜索本地模块
                if ($local) {
                    foreach ($local as $dir) {
                        if (!is_file(FCPATH.'module/'.$dir.'/config/module.php')) {
                            continue;
                        }
                        $cfg = require FCPATH.'module/'.$dir.'/config/module.php';
                        if ($cfg['nodb']) continue;
                        foreach ($this->site_info as $i => $tt) {
                            if ($this->site[$i]) {
                                $table = $this->db->dbprefix($i.'_'.$dir);
                                // 升级评论表结构
                                if ($tableinfo[$table.'_comment_data_0']
                                    && !isset($tableinfo[$table.'_comment_data_0']['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_comment_data_0` ADD `avgsort` DECIMAL(4,2) NOT NULL;');
                                }
                                if ($tableinfo[$table.'_extend_comment_data_0']
                                    && !isset($tableinfo[$table.'_extend_comment_data_0']['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_extend_comment_data_0` ADD `avgsort` DECIMAL(4,2) NOT NULL;');
                                }
                                // 将评论字段增加到主表
                                if ($tableinfo[$table]
                                    && !isset($tableinfo[$table]['field']['comments'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '` ADD `comments` INT(10) DEFAULT 0;');
                                }
                                if ($tableinfo[$table.'_extend']
                                    && !isset($tableinfo[$table]['field']['comments'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_extend` ADD `comments` INT(10) DEFAULT 0;');
                                }
                                // 将收藏字段增加到主表
                                if ($tableinfo[$table]
                                    && !isset($tableinfo[$table]['field']['favorites'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '` ADD `favorites` INT(10) DEFAULT 0;');
                                }
                                if ($tableinfo[$table.'_extend']
                                    && !isset($tableinfo[$table]['field']['favorites'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_extend` ADD `favorites` INT(10) DEFAULT 0;');
                                }
                                // 将评分字段增加到主表
                                if ($tableinfo[$table]
                                    && !isset($tableinfo[$table]['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '` ADD `avgsort` DECIMAL(4,2) DEFAULT 0;');
                                }
                                if ($tableinfo[$table.'_extend']
                                    && !isset($tableinfo[$table]['field']['avgsort'])) {
                                    $this->site[$i]->query('ALTER TABLE `' . $table . '_extend` ADD `avgsort` DECIMAL(4,2) DEFAULT 0;');
                                }
                                // 为评论表增加url字段
                                if ($tableinfo[$table.'_extend_comment_data_0']
                                    && !isset($tableinfo[$table.'_extend_comment_data_0']['field']['url'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_extend_comment_data_0` ADD `url` varchar(250) DEFAULT NULL;');
                                }
                                if ($tableinfo[$table.'_comment_data_0']
                                    && !isset($tableinfo[$table.'_comment_data_0']['field']['url'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_comment_data_0` ADD `url` varchar(250) DEFAULT NULL;');
                                }
                                // 为评论表增加title字段
                                if ($tableinfo[$table.'_extend_comment_data_0']
                                    && !isset($tableinfo[$table.'_extend_comment_data_0']['field']['title'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_extend_comment_data_0` ADD `title` varchar(250) DEFAULT NULL;');
                                }
                                if ($tableinfo[$table.'_comment_data_0']
                                    && !isset($tableinfo[$table.'_comment_data_0']['field']['title'])) {
                                    $this->site[$i]->query('ALTER TABLE `'.$table.'_comment_data_0` ADD `title` varchar(250) DEFAULT NULL;');
                                }
                            }
                        }
                    }
                }

                $this->admin_msg('模块表结构升级完成...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;


            case 3:


            case 4:
                // 升级联动菜单表
                $data = $this->db->get('linkage')->result_array();
                if ($data) {
                    foreach ($data as $t) {
                        $table = $this->db->dbprefix('linkage_data_'.$t['id']);
                        if ($tableinfo[$table] && !isset($tableinfo[$table]['field']['hidden'])) {
                            $this->db->query('ALTER TABLE `' . $table . '` ADD `hidden` TINYINT(1) UNSIGNED NULL DEFAULT 0 COMMENT \'前台隐藏\'');
                        }
                    }
                }
                $this->admin_msg('联动菜单表结构升级完成...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;

            case 5:
                // 升级会员组模型表
                $table = $this->db->dbprefix('member_group');
                if ($tableinfo[$table] && !isset($tableinfo[$table]['field']['allowregister'])) {
                    $this->db->query('ALTER TABLE `' . $table . '` ADD `allowregister` tinyint(1) unsigned NOT NULL COMMENT \'是否允许会员注册\'');
                }
                if ($tableinfo[$table] && !isset($tableinfo[$table]['field']['allowapply_orther'])) {
                    $this->db->query('ALTER TABLE `' . $table . '` ADD `allowapply_orther` tinyint(1) unsigned NOT NULL COMMENT \'是否允许会员申请其他组\'');
                }
                $this->admin_msg('会员组模型表结构...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;
            case 6:
                // 升级财务记录表
                $table = $this->db->dbprefix('member_paylog');
                $table2 = $this->db->dbprefix('member_scorelog');
                for ($i=0; $i<=9; $i++) {
                    if ($tableinfo[$table.'_'.$i]) {
                        $data = $this->db->query('SELECT * FROM `'.$table.'_'.$i.'`')->result_array();
                        if ($data) {
                            foreach ($data as $t) {
                                unset($t['id']);
                                $this->db->insert($table, $t);
                            }
                        }
                        $this->db->query('DROP TABLE `'.$table.'_'.$i.'`');
                    }
                    if ($tableinfo[$table2.'_'.$i]) {
                        $data = $this->db->query('SELECT * FROM `'.$table2.'_'.$i.'`')->result_array();
                        if ($data) {
                            foreach ($data as $t) {
                                unset($t['id']);
                                $this->db->insert($table2, $t);
                            }
                        }
                        $this->db->query('DROP TABLE `'.$table2.'_'.$i.'`');
                    }
                }
                $this->admin_msg('升级财务记录表结构...', dr_url('update/index', array('page' => $page + 1)), 2);
                break;
            default:
                $this->admin_msg('升级完成，请更新全站缓存在刷新页面', '', 1);exit;
                break;
        }
    }

    private function set_lang($file, $version, $code) {


    }
}