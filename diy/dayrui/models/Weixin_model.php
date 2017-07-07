<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * v3.2
 */
class Weixin_model extends CI_Model {

    public $prefix;

    /**
     * 微信模型类
     */
    public function __construct() {
        parent::__construct();
        $this->prefix = SITE_ID.'_weixin';
    }


    // 缓存类
    public function cache($siteid = SITE_ID) {


    }

}