<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Frame_content extends M_Controller {

    public function index() {

        $module = array('share' => array(
            'url' => dr_url('frame_content/content'),
            'icon' => 'fa fa-cog',
            'name' => fc_lang('网站'),
        ));

        $cache = $this->get_cache('module', SITE_ID);
        $dirname = 'share';
        if ($cache) {
            foreach ($cache as $dir) {
                $module[$dir] = $this->get_cache('module-'.SITE_ID.'-'.$dir);
                $module[$dir]['url'] = dr_url($dir.'/content/index');
            }
        }


		$this->template->assign(array(
		    'url' => $module[$dirname]['url'],
		    'dirname' => $dirname,
			'module' => $module,
		));
		$this->template->display('iframe.html');
    }

    public function content() {

        $cfile = SITE_ID.'share'.$this->uid.$this->input->ip_address().'_content_replace';

        if (IS_POST) {
            $bm = $this->input->post('bm');
            $t1 = $this->input->post('t1');
            $t2 = $this->input->post('t2');
            $fd = $this->input->post('fd');
            (!$fd || !$t1) && $this->mini_msg('“待替换字段”和“被替换内容”必须填写！');
            $fd == 'id' && $this->mini_msg('主键不支持替换！');
            // 表名判断
            $field = $this->get_table_field($bm);
            !$field && $this->mini_msg('此表【'.$bm.'】无可用字段');
            // 可用字段判断
            !isset($field[$fd]) && $this->mini_msg('在表【'.$bm.'】中没有找到字段【'.$fd.'】');
            $this->cache->file->save($cfile, array(
                'bm' => $bm,
                't1' => $t1,
                't2' => $t2,
                'fd' => $fd,
            ), 10000);
            $this->system_log('数据表替换内容操作'); // 记录日志
            $this->mini_msg('正在搜索替换...', dr_url('frame_content/content', array('todo' => 1)), 2);
        }

        // 处理url
        if ($this->input->get('todo')) {
            $cache = $this->cache->file->get($cfile);
            if (!$cache['fd'] || !$cache['t1']) {
                $this->cache->file->delete($cfile);
                $this->mini_msg('缓存失败：“待替换字段”和“被替换内容”必须填写！');
            }
            $count = 0;
            $replace = '`'.$cache['fd'].'`=REPLACE(`'.$cache['fd'].'`, \''.addslashes($cache['t1']).'\', \''.addslashes($cache['t2']).'\')';
            $this->db->query('UPDATE `'.$cache['bm'].'` SET '.$replace);
            $count = $this->db->affected_rows();
            $this->cache->file->delete($cfile);
            $this->mini_msg('替换完毕，共替换'.$count.'条数据', NULL, 1);
        } else {

            $this->template->assign(array(
                'bm' => $bm,
                'menu' => $this->get_menu(array(
                    fc_lang('替换内容') => 'admin/frame_content/content',
                    fc_lang('数据结构') => 'admin/db/index',
                )),
            ));
            $this->template->display('fcontent_replace.html');
        }
    }

}