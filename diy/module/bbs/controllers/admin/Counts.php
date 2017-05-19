<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

 
class Counts extends M_Controller {
	
    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
	}

	public function index () {

        $page = (int)$this->input->get('page');
        if (!$page) {
            $this->admin_msg('正在重新统计数据...', dr_url(APP_DIR.'/counts/index', array('page' => $page + 1)), 2);
        }

        foreach ($this->module['category'] as $t) {


            $save = array(
                'today_subjects' => $this->db->where('status=9 and catid IN ('.$t['childids'].') and DATEDIFF(from_unixtime(inputtime),now())=0')->count_all_results($this->content_model->prefix.'_index'),
                'subjects' => $this->db->where('status=9 and catid IN ('.$t['childids'].')')->count_all_results($this->content_model->prefix.'_index'),
                'today_replys' => $this->db->where('cid IN (select id from '.$this->content_model->prefix.'_index'.' where status=9 and catid IN ('.$t['childids'].' and DATEDIFF(from_unixtime(inputtime),now())=0))')->count_all_results($this->content_model->prefix.'_comment_data_0'),
                'replys' => $this->db->where('cid IN (select id from '.$this->content_model->prefix.'_index'.' where status=9 and catid IN ('.$t['childids'].'))')->count_all_results($this->content_model->prefix.'_comment_data_0'),
            );
            $cat = $this->db->where('catid', $t['id'])->get($this->content_model->prefix.'_cat_count')->row_array();
            if ($cat) {
                $this->db->where('id', $cat['id'])->update($this->content_model->prefix.'_cat_count', $save);
            } else {
                $this->db->insert($this->content_model->prefix.'_cat_count', array(
                    'catid' => $t['id'],
                    'today_subjects' => $save['today_subjects'],
                    'subjects' => $save['subjects'],
                    'today_replys' => $save['today_replys'],
                    'replys' => $save['replys'],
                    'last_title' => '',
                    'last_cid' => 0,
                    'last_url' => '',
                    'last_username' => '',
                    'last_uid' =>0,
                    'last_time' => 0,
                ));

            }
        }


        $this->admin_msg('更新完成', '', 1);
exit;
    }

}