<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

// 获取板块详情
function dr_cat_count($catid, $field = '') {

    $ci = &get_instance();
    $name = 'cat-count-value';
    $data = $ci->get_cache_data($name);
    
    if (!$data) {
        $tmp = $ci->db->get(SITE_ID.'_'.APP_DIR.'_cat_count')->result_array();
        if (!$tmp) {
            return NULL;
        }
        $data = array();
        foreach ($tmp as $t) {
            $data[$t['catid']] = $t;
        }
        $ci->set_cache_data($name, $data, 10000);
    }
    return $field ? $data[$catid][$field] : $data[$catid];
}