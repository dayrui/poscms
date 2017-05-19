<?php
/**
 * Created by PhpStorm.
 * User: dayrui
 * Date: 2016/11/20
 * Time: 08:28
 */

$category = $this->ci->get_cache('module-'.SITE_ID.'-zhaopin', 'category');

$code = '<label>'.$this->ci->select_category($category, (int)$value, 'name=\'data['.$name.']\'', '--').'</label>';

