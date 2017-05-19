<?php


class Test extends M_Controller {

    /**
     * 构造函数
     */
    public function __construct() {
        parent::__construct();
        $this->output->enable_profiler(FALSE);
    }


    public function index() {
        ignore_user_abort(true);
        for ($id=1;$id<500000;$id++) {
            $data[1] = $this->link // 主表
            ->where('id', $id)
                ->limit(1)
                ->get($this->content_model->prefix)
                ->row_array();
            if ($data[1]) {
                $data[0] = $this->link // 副表
                ->where('id', $id)
                    ->limit(1)
                    ->get($this->content_model->prefix.'_data_'.(int)$data[1]['tableid'])
                    ->row_array();
                if ($data[0]) {
                    $data[1]['title'].= rand(0, 9999);
                    $data[1]['title'] = dr_strcut($data[1]['title'], 40);
                    $data[1]['inputtime'] = $data[1]['updatetime'] = SYS_TIME - rand(0, 9999);
                    $data[1]['displayorder'] = 0;
                    $s = $this->content_model->add($data);
                }
            }
        }

    }

}