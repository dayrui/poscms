<?php

class Home extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->output->enable_profiler(FALSE);
    }

    /**
     * 重置
     */
    public function home() {
        $this->index();
    }

    /**
     * 首页
     */
    public function index() {

        $top = array();
        $smenu = $this->_get_menu();
        $topid = 0; // 顶部菜单id
        $top_menu = array(); // 生成的菜单
        foreach ($smenu as $ii => $t) {
            //$string.= '<li class="heading"><h3 class="uppercase" id="D_T_'.$ii.'">'.$t['top']['name'].'</h3></li>';
            $_link = 0; // 是否第一个链接菜单，0表示第一个
            $_left = 0; // 是否第一个分组菜单，0表示第一个
            $string = '';
            foreach ($t['data'] as $left) {
                $string.= '<li id="D_M_'.$left['left']['id'].'" class="dr_left nav-item '.($_left ? '' : 'active open').'">
                    <a href="javascript:;" class="nav-link nav-toggle">
                        <i class="'.$left['left']['icon'].'"></i>
                        <span class="title">'.fc_lang($left['left']['name']).'</span>
                        <span class="arrow '.($_left ? '' : 'open').'"></span>
                    </a>';
                if (defined('SYS_CATE_SHARE') && SYS_CATE_SHARE && $left['left']['mark'] == 'content-content') {
                    $share = ' <ul class="sub-menu share" style="margin-top:0">';
                    // 表示共享栏目的内容管理
                    require FCPATH.'dayrui/libraries/CategoryTree.php';
                    $cat = $this->get_cache('module-'.SITE_ID.'-share', 'category');
                    $now = array();
                    if ($cat) {
                        // 判断管理权限
                        foreach ($cat as $i => $c) {
                            if ($this->admin['adminid'] != 1
                                && !$c['child']
                                && !$c['setting']['admin'][$this->admin['adminid']]['show']) {
                                unset($cat[$i]);
                                continue;
                            } elseif (!$c['child'] && $c['mid'] && !$now) {
                                $now = $c;
                            }
                            //
                            $cat[$i]['url'] = $c['mid'] ? dr_url($c['mid'].'/home/index', array('catid'=>$c['id'])) : dr_url('category_share/edit', array('id'=>$c['id']));
                        }
                    }
                    $tree = new CategoryTree($cat);
                    $share.= '<li> '.$tree->get_treeview(0, 'tree').'</li>';
                    $string.= $share;
                } else {
                    $string.= ' <ul class="sub-menu">';
                }
                $_left = 1; // 标识以后的菜单就不是第一个了
                foreach ($left['data'] as $link) {
                    if (!$_link) {
                        // 第一个链接菜单时 指定class
                        $class = 'dr_link nav-item active open';
                        $t['top']['link'] = $link;
                    } else {
                        $class = 'dr_link nav-item';
                    }
                    $_link = 1; // 标识以后的菜单就不是第一个了
                    $link['icon'] = $link['icon'] ? $link['icon'] : 'icon-th-large';
                    $string.= '<li tid="'.$ii.'" fid="'.$left['left']['id'].'" id="_MP_'.$link['id'].'" class="'.$class.'"><a href="javascript:_MP(\''.$link['id'].'\', \''.$link['url'].'\');" ><i class="iconm '.$link['icon'].'"></i> <span class="title">'.fc_lang($link['name']).'</span></a></li>';
                }

                $string.= '</ul>';
                $string.= '</li>';
                $top_menu[$ii] = $string;
            }
            unset($t['top']['left']);
            $top[$topid] = $t['top'];
            $topid ++;
        }

        $mysite = array();
        foreach ($this->site_info as $sid => $t) {
            if ($this->admin['adminid'] == 1
                || ($this->admin['role']['site'] && in_array($sid, $this->admin['role']['site']))) {
                $mysite[$sid] = $t['SITE_NAME'];
            }
        }

        @ob_start();
        @ob_clean();

        $this->template->assign(array(
            'top' => $top,
            'left' => $top_menu,
            'mysite' => $mysite,
        ));

        $this->template->display('index.html');
    }

    /**
     * 菜单缓存格式化
     */
    private function _get_menu() {

        $menu = $this->dcache->get('menu');
        $smenu = array();
        if (!$menu) {
            $this->load->model('menu_model');
            $menu = $this->menu_model->cache();
        }

        $mymenu = array();
        foreach ($menu as $t) {
            if ($t['mark'] == 'myspace' && !MEMBER_OPEN_SPACE) {
                continue; // 空间开启之后再显示
            } elseif ($t['mark'] == 'share' && !SYS_SHARE) {
                continue; // 存在共享模块时再显示内容菜单
            } elseif (is_array($t['left'])) {
                $left = array();
                if ($t['mark'] && strpos($t['mark'], 'module-') === 0) {
                    list($a, $dir) = explode('-', $t['mark']);
                    $mod = $this->get_cache('module-'.SITE_ID.'-'.$dir);
                    if (!$mod) {
                        continue; // 当前站点模块不存在时不显示
                    }
                }
                foreach ($t['left'] as $m) {
                    if (strpos($m['mark'], 'module-') === 0) {
                        // 表示模块
                        list($a, $dir) = explode('-', $m['mark']);
                        $mod = $this->get_cache('module-'.SITE_ID.'-'.$dir);
                        if (!$mod) {
                            continue; // 当前站点模块不存在时不显示
                        }
                    }
                    $link = array();
                    if (is_array($m['link'])) {
                        foreach ($m['link'] as $n) {
                            $n['tid'] = $t['id'];
                            if (!$n['uri'] && $n['url']) {
                                $link[] = $n;
                            } elseif ($this->is_auth($n['uri'])) {
                                // 判断模块表单权限
                                if ($n['mark']
                                    && strpos($n['mark'], 'module-') === 0
                                    && strpos($n['uri'], 'admin/form_')
                                    && substr_count($n['mark'], '-') == 3) {
                                    list($a, $mod, $sid, $mid) = explode('-', $n['mark']);
                                    // 判断是否是当前站点
                                    if ($sid != SITE_ID) {
                                        continue;
                                    } elseif (!$this->is_auth($mod.'/admin/home/index')) {
                                        continue; // 判断是否具有内容管理权限
                                    }
                                } elseif (strpos($m['mark'], 'content-form') === 0) {
                                    // 判断网站表单权限
                                    list($a, $b, $table) = explode('-', $n['mark']);
                                    if (!$this->get_cache('form-name-'.SITE_ID, $table)) {
                                        continue;
                                    }
                                }
                                $n['url'] = $this->duri->uri2url($n['uri']);
                                $mymenu[$n['uri']] = $link[] = $n;
                            }
                        }
                    }
                    if ($link || $m['mark'] == 'content-content') {
                        $left[] = array('left' => $m, 'data' => $link);
                    }
                }
                if ($left) {
                    $smenu[$t['id']] = array('top' => $t, 'data' => $left);
                }
            }
        }


        $this->dcache->set('mymenu', $mymenu);

        return $smenu;
    }

    // 初始化系统
    public function init() {


    }

    /**
     * 后台首页
     */
    public function main() {


        // 判断管理员ip状况
        $ip = '';
        $login = $this->db->where('uid', $this->uid)->order_by('logintime desc') ->limit(2)->get('admin_login')->result_array();
        if ($login
            && count($login) == 2
            && $login[0]['loginip'] != $login[1]['loginip']) {
            $this->load->library('dip');
            $now = $this->dip->address($login[0]['loginip']);
            $last = $this->dip->address($login[1]['loginip']);
            if (@strpos($now, $last) === FALSE
                && @strpos($last, $now) === FALSE) {
                // Ip异常判断
                $ip = fc_lang('登录IP出现异常，您上次登录IP是%s【%s】，请确认是本人登录，<a href="%s" style="color:blue">账号登录查询</a>', $login[1]['loginip'], $last, dr_url('root/log', array('uid' => $this->uid)));
            }
        }

        // 统计模块数据
        $total = array();
        $module = $this->get_module(SITE_ID);
        if ($module) {
            // 查询模块的菜单
            $mymenu = $this->_get_mymenu();
            // 判断审核权限
            if ($this->admin['adminid'] != 1) {
                $my = $this->_get_verify();
                $my = $my[$this->admin['adminid']]['status'];
            }
            foreach ($module as $dir => $mod) {
                // 判断模块表是否存在
                if (!$this->db->query("SHOW TABLES LIKE '%".$this->db->dbprefix(SITE_ID.'_'.$dir.'_verify')."%'")->row_array()) {
                    continue;
                }
                $total[$dir] = array(
                    'name' => fc_lang($mod['name']),
                    'today' => $this->_set_k_url($mymenu, $dir.'/admin/home/index', $dir.'/admin/home/index'),
                    'content' => $this->_set_k_url($mymenu, $dir.'/admin/home/index', $dir.'/admin/home/index'),
                    'content_verify' => $this->_set_k_url($mymenu, $dir.'/admin/home/verify', $dir.'/admin/home/verify'),
                    'extend_verify' => 'javascript:;',
                    'add' => $this->_set_k_url($mymenu, $dir.'/admin/home/index', $dir.'/admin/home/add'),
                    'url' => $mod['url'],
                );
                if ($this->admin['adminid'] == 1) {
                    // 扩展审核数据
                    if (is_file(FCPATH.'module/'.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $this->_set_k_url($mymenu, $dir.'/admin/verify/index', $dir.'/admin/verify/index');
                    }
                } else {
                    if (!$my) {
                        continue;
                    }
                    if (is_file(FCPATH.'module/'.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $this->_set_k_url($mymenu, $dir.'/admin/verify/index', $dir.'/admin/verify/index');
                    }
                }
            }
            $total['member'] = array(
                'name' => fc_lang('会员'),
                'today' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
                'content' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
                'content_verify' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index/groupid/1'),
                'extend_verify' => 'javascript:;',
                'add' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
                'url' => $this->_set_k_url($mymenu, 'member/admin/home/index', 'member/admin/home/index'),
            );
        }


        $server = @explode(' ', strtolower($_SERVER['SERVER_SOFTWARE']));
        if (isset($server[0]) && $server[0]) {
            $server = dr_strcut($server[0], 15);
        } else {
            $server = 'web';
        }

        // 
        $notice = $this->db->query('select * from `'.$this->db->dbprefix('admin_notice').'` where ((`to_uid`='.$this->uid.') or (`to_rid`='.$this->member['adminid'].') or (`to_uid`=0 and `to_rid`=0)) and `status`<>3 order by `status` asc, `inputtime` desc limit 10')->result_array();

        $this->template->assign(array(
            'ip' => $ip,
            'sip' => $this->_get_server_ip(),
            'mymain' => 1,
            'mtotal' => $total,
            'server' => ucfirst($server),
            'notice' => $notice,
            'notice_url' => $this->_set_k_url($mymenu, 'admin/notice/index', 'admin/notice/my'),
            'sqlversion' => $this->db->version(),
            'sqdomain' => dr_cms_domain_name($this->site_info[1]['SITE_URL'])
        ));
        $this->template->display('main.html');
    }

    /**
     * 更新全站缓存
     */
    public function cache() {


        if (isset($_GET['at']) && $_GET['at']) {

            switch ($_GET['at']) {

                case 'config':
                    $cache = $this->_cache_name();
                    foreach ($cache as $siteid => $c) {
                        foreach ($c as $t) {
                            list($n, $m) = explode('::', $t);
                            if (strpos($n, '/') !== false) {
                                list($app, $cls) = explode('/', $n);
                                $this->load->add_package_path(FCPATH.'module/'.$app);
                                $class = $app.'_'.$n.'_model';
                                $this->load->model($cls.'_model', $class);
                            } else {
                                $class = $n.'_model';
                                $this->load->model($n.'_model');
                            }
                            $this->$class->$m($siteid);
                        }
                    }
                    $this->system_log('更新配置缓存'); // 记录日志

                    break;

                case 'linkage':
                    $this->load->model('linkage_model');
                    foreach ($this->site_info as $sid => $t) {
                        $this->linkage_model->cache($sid);
                    }
                    break;

                case 'data':
                    $this->_clear_data();
                    break;

                case 'search':
                    $module = $this->db->where('disabled', 0)->order_by('displayorder ASC')->get('module')->result_array();
                    if ($module) {
                        foreach ($module as $t) {
                            $site = dr_string2array($t['site']);
                            foreach ($site as $sid => $s) {
                                if ($s['use']) {
                                    $table = $this->db->dbprefix($sid . '_' . $t['dirname'] . '_search');
                                    if (!$this->db->query("SHOW TABLES LIKE '".$table."'")->row_array()) {
                                        continue;
                                    }
                                    $this->db->query('TRUNCATE `'.$table.'`');
                                    $table = $this->db->dbprefix($sid . '_' . $t['dirname'] . '_search_index');
                                    $this->db->query('TRUNCATE `'.$table.'`');
                                }
                            }
                        }
                    }
                    break;

                case 'category':
                    $mod = array(
                        'share',
                    );
                    $module = $this->db->where('disabled', 0)->order_by('displayorder ASC')->get('module')->result_array();
                    if ($module) {
                        foreach ($module as $t) {
                            $mod[] = $t['dirname'];
                        }
                    }
                    foreach ($this->site_info as $siteid => $t) {
                        foreach ($mod as $dirname) {
                            $cache = $this->dcache->get('module-'.$siteid.'-'.$dirname);
                            if (!$cache['category']) {
                                continue;
                            }
                            $table = $this->db->dbprefix($siteid . '_' . $dirname . '_category');
                            if (!$this->db->query("SHOW TABLES LIKE '".$table."'")->row_array()) {
                                continue;
                            }
                            //
                            foreach ($cache['category'] as $i => $c) {
                                if ($c['mid'] && (!$c['child'] || $c['pcatpost'])) {
                                    $cache['category'][$i]['total'] = $this->db->where('status', 9)->where('catid', $c['id'])->count_all_results($siteid.'_'.$c['mid'].'_index');
                                } else {
                                    $cache['category'][$i]['total'] = 0;
                                }
                            }
                            foreach ($cache['category'] as $i => $c) {
                                if ($c['child']) {
                                    $arr = explode(',', $c['childids']);
                                    $cache['category'][$c['id']]['total'] = 0;
                                    foreach ($arr as $i) {
                                        $cache['category'][$c['id']]['total']+= $cache['category'][$i]['total'];
                                    }
                                }
                            }
                            $this->dcache->set('module-'.$siteid.'-'.$dirname, $cache);
                        }

                    }
                    break;

                case 'app':

                    break;

                case 'table':
                    $this->dcache->delete('table');
                    $this->system_model->cache();
                    break;

            }


            echo dr_json(1, 'ok');exit;

        }


        // 应用缓存
        $app = $this->db->select('disabled,dirname')->get('application')->result_array();
        $aurl = array();
        if ($app) {
            foreach ($app as $a) {
                if ($a['disabled'] == 0) {
                    $aurl[] = dr_url($a['dirname'].'/home/cache', array('admin' => 1));
                }
            }
        }


        $this->template->assign(array(
            'aurl' => $aurl,
            'list' => array(
                array('修改后台配置值、栏目、自定义内容等配置时，需要更新才会生效', 'config'),
                array('后台发布文章或修改文章后，前台进行实时显示时更新', 'data'),
                array('重建数据表字段结构，通常在自定义字段之后更新', 'table'),
                array('变更联动菜单数据后，更新联动菜单缓存数据', 'linkage'),
                array('更新模块搜索缓存，搜索不准时更新实时数据', 'search'),
                array('更新应用插件配置缓存', 'app'),
                array('重新统计栏目数据量', 'category'),
            )
        ));
        $this->template->display('cache.html');

    }

    // 清除缓存数据
    public function clear() {
        if (IS_AJAX || $this->input->get('todo')) {
            $this->_clear_data();
            if (!IS_AJAX) {
                $this->admin_msg(fc_lang('全站缓存数据更新成功'), '', 1);
            }
        } else {
            $this->admin_msg('Clear ... ', dr_url('home/clear', array('todo' => 1)), 2);
        }
    }


    // 更新表结构
    public function dbcache() {
        if (IS_AJAX || $this->input->get('todo')) {
            $this->dcache->delete('table');
            $this->system_model->cache();
            if (!IS_AJAX) {
                $this->admin_msg(fc_lang('数据表结构缓存更新成功'), '', 1);
            }
        } else {
            $this->admin_msg('Clear ... ', dr_url('home/dbcache', array('todo' => 1)), 2);
        }
    }





    // 域名检查
    public function domain() {
        $ip = $this->_get_server_ip();
        $domain = $this->input->get('domain');
        if (gethostbyname($domain) != $ip) {
            exit(fc_lang('请将域名【%s】解析到【%s】', $domain, $ip));
        }
        exit('');
    }

    // 清除缓存数据
    private function _clear_data() {

        // 删除全部缓存文件
        $this->load->helper('file');
        delete_files(WEBPATH.'cache/sql/');
        delete_files(WEBPATH.'cache/file/');
        delete_files(WEBPATH.'cache/page/');
        delete_files(WEBPATH.'cache/index/');
        delete_files(WEBPATH.'cache/attach/');
        delete_files(WEBPATH.'cache/templates/');

        // 重置Zend OPcache
        function_exists('opcache_reset') && opcache_reset();

        // 模块缓存
        $module = $this->db->select('disabled,dirname')->get('module')->result_array();
        if ($module) {
            foreach ($module as $mod) {
                $site = dr_string2array($mod['site']);
                if ($site[SITE_ID]) {
                    $this->db->where('inputtime<>', 0)->delete(SITE_ID.'_'.$mod['dirname'].'_search');
                }
            }
        }


        $this->hooks->call_hook('clear_cache'); // 清除缓存钩子

    }

    // 页面统计是的url
    private function _set_k_url($menu, $nuri, $uri) {
        return 'javascript:parent._MAP(\''.intval($menu[$nuri]['id']).'\', \''.intval($menu[$nuri]['tid']).'\', \''.$this->duri->uri2url($uri).'\');';
    }

    // 格式菜单
    private function _get_mymenu() {
        return $this->dcache->get('mymenu');
    }

    // 统计数据
    public function mtotal() {

        // 统计模块数据
        $total = $this->get_cache_data('admin_mtotal_'.SITE_ID);
        $module = $this->get_module(SITE_ID);
        if (!$module) {
            exit;
        }

        if (!$total) {
            // 查询模块的菜单
            $total = $top = array();
            $menu = $this->db
                ->where('pid=0')
                ->where('hidden', 0)
                ->order_by('displayorder ASC,id ASC')
                ->get('admin_menu')
                ->result_array();
            if ($menu) {
                $i = 0;
                foreach ($menu as $t) {
                    list($a, $dir) = @explode('-', $t['mark']);
                    if ($dir && !$module[$dir] && $dir != 'weixin') {
                        continue;
                    }
                    $top[$dir] = $i;
                    $i++;
                }
            }
            // 判断审核权限
            if ($this->admin['adminid'] != 1) {
                $verify = $this->_get_verify();
                $my = array();
                foreach ($verify as $t) {
                    $my+=$t['status'];
                }
                !$my && $my = array(-1);
            }
            foreach ($module as $dir => $mod) {
                // 判断模块表是否存在
                if (!$this->db->query("SHOW TABLES LIKE '%".$this->db->dbprefix(SITE_ID.'_'.$dir.'_verify')."%'")->row_array()) {
                    continue;
                }
                //
                $total[$dir] = array(
                    'today' => $this->db->where('status=9')->where('DATEDIFF(from_unixtime(inputtime),now())=0')->count_all_results(SITE_ID.'_'.$dir.'_index'),
                    'content' => $this->db->where('status=9')->count_all_results(SITE_ID.'_'.$dir.'_index'),
                    'content_verify' => 0,
                    'extend_verify' => 0,
                );
                if ($this->admin['adminid'] == 1) {
                    // 管理员显示审核全部流程数据
                    $total[$dir]['content_verify'] = $this->db->where('status<>0')->count_all_results(SITE_ID.'_'.$dir.'_verify');
                    // 扩展审核数据
                    if (is_file(WEBPATH.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $this->db->where('status<>0')->count_all_results(SITE_ID.'_'.$dir.'_extend_verify');
                    }
                } else {
                    if (!$my) {
                        continue;
                    }
                    $total[$dir]['content_verify'] = $this->db->where_in('status', $my)->count_all_results(SITE_ID.'_'.$dir.'_verify');
                    if (is_file(WEBPATH.$dir.'/config/extend.main.table.php')) {
                        $total[$dir]['extend_verify'] = $this->db->where_in('status', $my)->count_all_results(SITE_ID.'_'.$dir.'_extend_verify');
                    }
                }
            }
            $total['member'] = array(
                'today' => $this->db->where('DATEDIFF(from_unixtime(regtime),now())=0')->count_all_results('member'),
                'content' => $this->db->count_all_results('member'),
                'content_verify' => $this->db->where('groupid', 1)->count_all_results('member'),
                'extend_verify' => 0,
            );
            $this->set_cache_data('admin_mtotal_'.SITE_ID, $total, 60);
        }

        if (!$total) {
            exit;
        }

        // AJAX输出
        foreach ($total as $dir => $t) {
            echo '$("#'.$dir.'_today").html('.$t['today'].');';
            echo '$("#'.$dir.'_content").html('.$t['content'].');';
            echo '$("#'.$dir.'_content_verify").html('.$t['content_verify'].');';
            echo '$("#'.$dir.'_extend_verify").html('.$t['extend_verify'].');';
        }

    }
}