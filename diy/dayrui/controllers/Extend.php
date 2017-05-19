<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');



class Extend extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
    }

    /**
     * 内容
     */
    public function index() {

        $id = (int)$this->input->get('id');
        $page = max(1, (int)$this->input->get('page'));

        if (!$id) {
            $this->goto_404_page(fc_lang('ID参数不存在'));
        }

        // 查询模块
        $index = $this->db->where('id', $id)->get(SITE_ID.'_share_extend_index')->row_array();
        if (!$index) {
            $this->goto_404_page(fc_lang('无法通过%s找到对应的模块', $id));
        }

        // 设置模块信息
        $this->dir = $index['mid'];
        $this->_module_init();

        if ($this->input->get('type') == 'draft') {
            // 草稿数据
            $data = $this->content_model->get_draft($id);
            if (!$data || !($data['uid'] == $this->uid || $this->member['adminid'])) {
                $this->msg(fc_lang('数据不存在'));
            }
        } elseif ($this->input->get('type') == 'verify') {
            // 审核数据
            $verify = $this->content_model->get_extend_verify($id);
            $data = isset($verify['content']) ? $verify['content'] : array();
            if (!$data || !($data['uid'] == $this->uid || $this->member['adminid'])) {
                $this->msg(fc_lang('数据不存在'));
            }
        } else {
            // 正式内容缓存查询结果
            $name = 'extend'.$this->dir.SITE_ID.$id;
            $data = $this->get_cache_data($name);
        }

        if (!$data) {

            $mod = $this->get_cache('module-'.SITE_ID.'-'.$this->dir);
            if (!$mod) {
                $this->goto_404_page(fc_lang('模块不存在，请尝试更新缓存'));
            }

            $this->load->model('content_model');
            $data = $this->content_model->get_extend($id);
            if (!$data) {
                $this->goto_404_page(fc_lang('章节(id#%s)不存在', $id));
            }

            $content = $this->get_cache_data('show'.$this->dir.SITE_ID.$data['cid']);
            if (!$content) {
                $content = $this->get_cache_data('extend-show'.$this->dir.SITE_ID.$data['cid']);
            }
            if (!$content) {
                $content = $this->content_model->get($data['cid']);
                $this->set_cache_data('extend-show'.$this->dir.SITE_ID.$data['cid'], $content, SYS_CACHE_MSHOW);
            }
            if (!$content) {
                $this->goto_404_page(fc_lang('内容(id#%s)不存在', $data['cid']));
            }

            foreach ($content as $k => $v) {
                if (!isset($data['c'.$k])) {
                    $data['c'.$k] = $v;
                }
            }

            $data['fid'] = intval($content['fid']);

            $cat = $mod['category'][$data['catid']];

            // 检测转向字段
            $redirect = 0;
            foreach ($mod['extend'] as $t) {
                if ($t['fieldtype'] == 'Redirect'
                    && $data[$t['fieldname']]) {
                    if ($cat['setting']['html']) {
                        $redirect = 1;
                        $data['goto_url'] = $data[$t['fieldname']];
                        break;
                    } else {
                        redirect($data[$t['fieldname']], 'location', 301);
                        exit;
                    }
                }
            }

            // 上一篇文章
            $this->db->where('cid', (int)$data['cid'])->where('status', 9);
            $this->db->where('id<', $data['id']);
            $this->db->order_by('id desc');
            $data['prev_page'] = $this->db->limit(1)->get($this->content_model->prefix.'_extend')->row_array();

            // 下一篇文章
            $this->db->where('cid', (int)$data['cid'])->where('status', 9);
            $this->db->where('id>', $data['id']);
            $this->db->order_by('id asc');
            $data['next_page'] = $this->db->limit(1)->get($this->content_model->prefix.'_extend')->row_array();

            // 缓存数据
            if ($data['uid'] != $this->uid) {
                $data = $this->set_cache_data($name, $data, SYS_CACHE_MSHOW);
            }

        } else {

            $mod = $this->get_cache('module-'.SITE_ID.'-'.$this->dir);
            $cat = $mod['category'][$data['catid']];

        }

        // 状态判断
        if ( ($data['status'] == 10 || $data['cstatus'] == 10)
            && !($this->uid == $data['uid'] || $this->member['adminid'])) {
            $this->goto_404_page(fc_lang('您暂时无法访问'));
        }

        // 拒绝访问判断
        if ($cat['permission'][$this->markrule]['show']) {
            $this->goto_404_page(fc_lang('当前会员组无权限访问'));
        }

        // 格式化输出自定义字段
        $fields = $mod['field'];
        $fields = $cat['field'] ? array_merge($fields, $cat['field']) : $fields;
        $fields = $fields + $mod['extend'];
        $fields['inputtime'] = array('fieldtype' => 'Date');
        $fields['updatetime'] = array('fieldtype' => 'Date');
        $data = $this->field_format_value($fields, $data, 1);

        // 定向URL
        if (IS_PC && !defined('CT_HTML_FILE') && $data['url'] != dr_now_url()) {
            redirect($data['url'], 'location', '301');exit;
        }

        // 栏目下级或者同级栏目
        list($parent, $related) = $this->_related_cat($mod, $data['catid']);

        $this->template->assign($data);
        $this->template->assign(dr_extend_seo($mod, $data));
        $this->template->assign(array(
            'cat' => $cat,
            'params' => array('catid' => $data['catid']),
            'parent' => $parent,
            'related' => $related,
            'urlrule' => $this->mobile ? dr_mobile_extend_url($this->dir, $id, '{page}') : dr_extend_url($mod, $data, '{page}'),
        ));

        $tpl = $cat['setting']['template']['extend'] ? $cat['setting']['template']['extend'] : 'extend.html';
        $this->template->display($tpl);
    }
}