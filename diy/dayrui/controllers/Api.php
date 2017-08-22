<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');
 
class Api extends M_Controller {

    /**
     * 二维码
     */
    public function qrcode() {

        // 输出图片
        ob_start();
        ob_clean();
        header("Content-type: image/png");
        ImagePng($this->get_qrcode($this->input->get('text'), $this->input->get('uid'), $this->input->get('level'), $this->input->get('size')));
        exit;
    }

    /**
     * 会员登录信息JS调用
     */
    public function member() {
        ob_start();
        $this->template->display('member.html');
        $html = ob_get_contents();
        ob_clean();
		$format = $this->input->get('format');
		// 页面输出
		if ($format == 'jsonp') {
			$data = $this->callback_json(array('html' => $html));
			echo $this->input->get('callback', TRUE).'('.$data.')';
		} elseif ($format == 'json') {
			echo $this->callback_json(array('html' => $html));
		} else {
			echo 'document.write("'.addslashes(str_replace(array("\r", "\n", "\t", chr(13)), array('', '', '', ''), $html)).'");';
		}
        exit;
    }


    /**
     * 广告访问
     */
    public function poster_show() {

        if (!dr_is_app('adm')) {
            $this->msg('广告插件未安装');
        }

        $id = (int)$this->input->get('id');
        $data = $this->db->where('id', $id)->get(SITE_ID.'_poster')->row_array();
        if ($data) {
            $value = dr_string2array($data['value']);
            if ($value['url']) {
                $this->db->where('id', $id)->update(SITE_ID.'_poster', array(
                    'clicks' => $data['clicks'] + 1
                ));
                redirect($value['url'], 'refresh');
            } else {
                $this->msg('此广告没有链接地址');
            }
        } else {
            $this->msg('广告信息不存在或者已过期');
        }

    }
    /**
     * 广告调用
     */
    public function poster() {

        $id = (int)$this->input->get('id');
        $html = dr_poster($id);
        $html = addslashes(str_replace(array("\r", "\n", "\t", chr(13)), array('', '', '', ''), $html));
        echo 'document.write("'.$html.'");';

    }


    /**
     * ck播放器接口
     */
    public function ckplayer() {

        $at = $this->input->get('at');
        //$form = $this->input->get('form');
        $data = array(
            'text' => '',
            'api_url' => SITE_URL.'index.php?c=api&m=ckplayer',
            'server_url' => SITE_URL.'api/ckplayer/',
        );

        // 功能部分
        switch($at) {
            case 'js' : // 动态加载js
                //
                $text = $this->get_cache('poster-text-'.SITE_ID);
                if ($text && dr_is_app('adm')) {
                    // 文字滚动广告
                    $this->load->add_package_path(FCPATH.'app/adm/');
                    $this->load->model('poster_model');
                    $poster = $this->poster_model->poster($text);
                    if ($poster) {
                        $url = $this->poster_model->get_url($poster['id']);
                        $value = dr_string2array($poster['value']);
                        if ($value) {
                            $data['text'] = '{a href="'.$url.'" target="_blank"}{font color="'.$value['color'].'" size="12"}'.($value['text'] ? dr_clearhtml($value['text']) : '没有输入广告内容').'{/font}{/a}';
                        }
                    }
                }
                $code = file_get_contents(WEBPATH.'api/ckplayer/config/config.js');
                break;
            case 'share' : // 分享
                header('Content-Type: text/xml');
                $code = file_get_contents(WEBPATH.'api/ckplayer/config/share.xml');
                break;
        }

        // 兼容php5.5
        if (version_compare(PHP_VERSION, '5.5.0') >= 0) {
            $rep = new php5replace($data);
            $code = preg_replace_callback('#{([a-z_0-9]+)}#U', array($rep, 'php55_replace_data'), $code);
            unset($rep);
        } else {
            extract($data);
            $code = preg_replace('#{([a-z_0-9]+)}#Ue', "\$\\1", $code);
        }

        exit($code);

    }

    /**
     * 会员登录信息JS调用
     */
    public function userinfo() {
        ob_start();
        $this->template->display('api.html');
        $html = ob_get_contents();
        ob_clean();
        $html = addslashes(str_replace(array("\r", "\n", "\t", chr(13)), array('', '', '', ''), $html));
        echo 'document.write("'.$html.'");';
    }

    /**
     * 自定义信息JS调用
     */
    public function template() {
        $this->api_template();
    }

    /**
     * ajax 动态调用
     */
    public function html() {

        ob_start();
        $this->template->cron = 0;
        $_GET['page'] = max(1, (int)$this->input->get('page'));
        $params = dr_string2array(urldecode($this->input->get('params')));
        $params['get'] = @json_decode(urldecode($this->input->get('get')), TRUE);
        $this->template->assign($params);
        $name = str_replace(array('\\', '/', '..', '<', '>'), '', dr_safe_replace($this->input->get('name', TRUE)));
        $this->template->display(strpos($name, '.html') ? $name : $name.'.html');
        $html = ob_get_contents();
        ob_clean();

        // 页面输出
        $format = $this->input->get('format');
        if ($format == 'html') {
            exit($html);
        } elseif ($format == 'json') {
            echo $this->callback_json(array('html' => $html));
        } elseif ($format == 'js') {
            echo 'document.write("'.addslashes(str_replace(array("\r", "\n", "\t", chr(13)), array('', '', '', ''), $html)).'");';
        } else {
            $data = $this->callback_json(array('html' => $html));
            echo $this->input->get('callback', TRUE).'('.$data.')';
        }
    }

    /**
	 * 更新浏览数
	 */
	public function hits() {
	
	    $id = (int)$this->input->get('id');
	    $dir = dr_safe_replace($this->input->get('module', TRUE));
        $mod = $this->get_cache('module-'.SITE_ID.'-'.$dir);
        if (!$mod) {
            $data = $this->callback_json(array('html' => 0));
            echo $this->input->get('callback', TRUE).'('.$data.')';exit;
        }

        // 获取主表时间段
        $data = $this->db
                     ->where('id', $id)
                     ->select('hits,updatetime')
                     ->get($this->db->dbprefix(SITE_ID.'_'.$dir))
                     ->row_array();
        $hits = (int)$data['hits'] + 1;

        // 更新主表
		$this->db->where('id', $id)->update(SITE_ID.'_'.$dir, array('hits' => $hits));

        // 获取统计数据
        $total = $this->db->where('id', $id)->get($this->db->dbprefix(SITE_ID.'_'.$dir.'_hits'))->row_array();
        if (!$total) {
            $total['day_hits'] = $total['week_hits'] = $total['month_hits'] = $total['year_hits'] = 1;
        }

        // 更新到统计表
        $this->db->replace($this->db->dbprefix(SITE_ID.'_'.$dir.'_hits'), array(
            'id' => $id,
            'hits' => $hits,
            'day_hits' => (date('Ymd', $data['updatetime']) == date('Ymd', SYS_TIME)) ? $hits : 1,
            'week_hits' => (date('YW', $data['updatetime']) == date('YW', SYS_TIME)) ? ($total['week_hits'] + 1) : 1,
            'month_hits' => (date('Ym', $data['updatetime']) == date('Ym', SYS_TIME)) ? ($total['month_hits'] + 1) : 1,
            'year_hits' => (date('Ymd', $data['updatetime']) == date('Ymd', strtotime('-1 day'))) ? $hits : $total['year_hits'],
        ));

        // 点击时的钩子
        $this->hooks->call_hook('module_hits', array(
            'id' => $id,
            'dir' => $dir,
        ));
        // 输出数据
        echo $this->input->get('callback', TRUE).'('.$this->callback_json(array('html' => $hits)).')';exit;
	}

    /**
	 * 更新扩展的浏览数
	 */
	public function ehits() {

	    $id = (int)$this->input->get('id');
	    $dir = $this->input->get('module', TRUE);
        $mod = $this->get_cache('module-'.SITE_ID.'-'.$dir);
        if (!$mod) {
            $data = $this->callback_json(array('html' => 0));
            echo $this->input->get('callback', TRUE).'('.$data.')';exit;
        }

        $name = 'ehits'.$dir.SITE_ID.$id;
        $hits = (int)$this->get_cache_data($name);
		if (!$hits) {
			$data = $this->db->where('id', $id)->select('hits')->get(SITE_ID.'_'.$dir.'_extend')->row_array();
			$hits = (int)$data['hits'];
		}

		$hits++;
		$this->set_cache_data($name, $hits, (int)SYS_CACHE_MSHOW);

		$this->db->where('id', $id)->update(SITE_ID.'_'.$dir.'_extend', array('hits' => $hits));
        if ($mod['share']) {
            $this->db->where('id', $id)->update(SITE_ID.'_'.$dir.'_extend', array('hits' => $hits));
        }
        // 点击时的钩子
        $this->hooks->call_hook('extend_hits', array(
            'id' => $id,
            'dir' => $dir,
        ));
        $data = $this->callback_json(array('html' => $hits));
        echo $this->input->get('callback', TRUE).'('.$data.')';exit;
	}

	
	/**
	 * 伪静态测试
	 */
	public function test() {
		header('Content-Type: text/html; charset=utf-8');
		echo '服务器支持伪静态';
	}

    /**
     * 站点间的同步登录
     */
    public function synlogin() {
        $this->api_synlogin();
    }

    /**
     * 站点间的同步退出
     */
    public function synlogout() {
        $this->api_synlogout();
    }
}