<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/* v3.1.0  */
	
class Mform extends M_Controller {

	public $mid;
	public $dir;

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('mform_model');
        $this->load->model('module_model');
		$this->dir = $this->input->get('dir');
        $module = $this->get_cache('module-'.SITE_ID.'-'.$this->dir);
		if (!$module) {
            $this->admin_msg(fc_lang('模块不存在，请尝试更新缓存'));
        }
        $this->mid = $module['id'];
		$this->template->assign('menu', $this->get_menu_v3(array(
            fc_lang('模块管理') => array('admin/module/index', 'table'),
		    fc_lang('【%s】表单', $module['name']) => array('admin/mform/index/dir/'.$this->dir, 'plus-square'),
		    fc_lang('添加') => array('admin/mform/add/dir/'.$this->dir, 'plus'),
            fc_lang('重建表单') => array('admin/mform/create/dir/'.$this->dir, 'refresh'),
		)));
        $this->template->assign(array(
            'dir' => $this->dir,
            'mid' => $this->mid,
            'tpl' => $module['template'] ? $module['template'] : SITE_TEMPLATE,
        ));
    }
	
	/**
     * 管理
     */
    public function index() {
		$this->template->assign(array(
			'list' => $this->db->where('module', $this->dir)->get('module_form')->result_array()
		));
		$this->template->display('mform_index.html');
    }

	/**
     * 创建
     */
    public function create() {
        $form = $this->db->where('module', $this->dir)->get('module_form')->result_array();
        if ($form) {
            foreach($form as $t) {
                // 表单控制器名称
                $name = 'Form_'.$t['table'];

                // 管理控制器
                $file = FCPATH.'module/'.$this->dir.'/controllers/admin/'.$name.'.php';
                if (!is_file($file) && !@file_put_contents($file, '<?php'.PHP_EOL.PHP_EOL
                    .'require FCPATH.\'branch/fqb/D_Admin_Form.php\';'.PHP_EOL.PHP_EOL
                    .'class '.$name.' extends D_Admin_Form {'.PHP_EOL.PHP_EOL
                    .'	public function __construct() {'.PHP_EOL
                    .'		parent::__construct();'.PHP_EOL
                    .'	}'.PHP_EOL
                    .'}')) {
                    $this->admin_msg( fc_lang('目录(%s)没有写入权限', FCPATH.'module/'.$this->dir.'/controllers/admin/'));
                }

                // 会员控制器
                $file = FCPATH.'module/'.$this->dir.'/controllers/member/'.$name.'.php';
                if (!is_file($file) && !@file_put_contents($file, '<?php'.PHP_EOL.PHP_EOL
                    .'require FCPATH.\'branch/fqb/D_Member_Form.php\';'.PHP_EOL.PHP_EOL
                    .'class '.$name.' extends D_Member_Form {'.PHP_EOL.PHP_EOL
                    .'	public function __construct() {'.PHP_EOL
                    .'		parent::__construct();'.PHP_EOL
                    .'	}'.PHP_EOL
                    .'}')) {
                    $this->admin_msg( fc_lang('目录(%s)没有写入权限', FCPATH.'module/'.$this->dir.'/controllers/member/'));
                }

                // 前端发布控制器
                $file = FCPATH.'module/'.$this->dir.'/controllers/'.$name.'.php';
                if (!is_file($file) && !@file_put_contents($file, '<?php'.PHP_EOL.PHP_EOL
                    .'require FCPATH.\'branch/fqb/D_Home_Form.php\';'.PHP_EOL.PHP_EOL
                    .'class '.$name.' extends D_Home_Form {'.PHP_EOL.PHP_EOL
                    .'	public function __construct() {'.PHP_EOL
                    .'		parent::__construct();'.PHP_EOL
                    .'	}'.PHP_EOL
                    .'}')) {
                    $this->admin_msg( fc_lang('目录(%s)没有写入权限', APPPATH.'controllers/'));
                }
            }
        }

        $this->admin_msg(fc_lang('表单控制器文件创建完成'), isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '', 1);
    }
	
	/**
     * 添加
     */
    public function add() {
	
		if (IS_POST) {
            $data = $this->input->post('data');
			$result = $this->mform_model->add($this->dir, $data);
			if ($result === FALSE) {
                $this->clear_cache('module');
                $this->system_log('添加模块【'.$this->dir.'】表单【'.$data['table'].'】'); // 记录日志
				$this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('mform/index', array('dir' => $this->dir)), 1);
			} else {
				$this->admin_msg($result);
			}
		}
		
		$this->template->assign(array(
			'data' => array()
		));
		$this->template->display('mform_add.html');
    }
	
	/**
     * 修改
     */
    public function edit() {
	
		$id = (int)$this->input->get('id');
		$data = $this->db->where('id', $id)->get('module_form')->row_array();
		if (!$data) {
            $this->admin_msg(fc_lang('对不起，数据被删除或者查询不存在'));
        }
		
		if (IS_POST) {
            $this->system_log('修改模块【'.$this->dir.'】表单【'.$data['table'].'】'); // 记录日志
			$post = $this->input->post('data');
			$this->db->where('id', $id)->update('module_form', array(
				'name' => $post['name'],
				'setting' => dr_array2string($post['setting']),
				'permission' => dr_array2string($post['permission']),
			));
            if ($m = $this->db->where('mark', 'module-'.$this->dir.'-'.$id)->get('admin_menu')->row_array()) {
                $this->db->where('id', $m['id'])->update('admin_menu', array(
                    'uri' => $this->dir.'/admin/form_'.$data['table'].'/index',
                    'name' => $post['name'].'管理'
                ));
            } else {
                $menu = $this->db
                              ->where('pid<0')
                              ->where('uri', '')
                              ->where('mark', 'module-'.$this->dir)
                              ->order_by('displayorder ASC,id ASC')
                              ->get('admin_menu')->row_array();
                if ($menu) {
                    // 将此表单放在模块菜单中
                    $this->system_model->add_admin_menu(array(
                        'uri' => $this->dir.'/admin/form_'.$data['table'].'/index',
                        'url' => '',
                        'pid' => $menu['id'],
                        'name' => $post['name'].'管理',
                        'mark' => 'module-'.$this->dir.'-'.$id,
                        'hidden' => 0,
                        'displayorder' => 0,
                    ));
                }
            }

            $this->clear_cache('module');
            $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('mform/index', array('dir' => $this->dir)), 1);
		}
		
		$data['setting'] = dr_string2array($data['setting']);
		$data['permission'] = dr_string2array($data['permission']);
		
		$this->template->assign(array(
			'data' => $data,
		));
		$this->template->display('mform_add.html');
    }
	
	/**
     * 禁用/可用
     */
    public function disabled() {
		if ($this->is_auth('mform/edit')) {
			$id = (int)$this->input->get('id');
			$data = $this->db->where('id', $id)->get('module_form')->row_array();
			$value = $data['disabled'] == 1 ? 0 : 1;
			$this->db->where('id', $id)->update('module_form', array('disabled' => $value));
            $this->system_log(($value ? '禁用' : '启用').'模块【'.$this->dir.'】表单【'.$data['table'].'】'); // 记录日志
		}
        $this->clear_cache('module');
		exit(dr_json(1, fc_lang('操作成功')));
    }

	/**
     * 删除
     */
    public function del() {
        $id = (int)$this->input->get('id');
		$this->mform_model->del($id, $this->dir);
        $this->clear_cache('module');
        $this->system_log('删除模块【'.$this->dir.'】表单【#'.$id.'】'); // 记录日志
        $this->admin_msg(fc_lang('操作成功，正在刷新...'), dr_url('mform/index', array('dir' => $this->dir)), 1);
	}

}