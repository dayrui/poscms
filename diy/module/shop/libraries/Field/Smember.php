<?php

/**
 * Dayrui Website Management System
 *
 * @since		version 2.0.0
 * @author		Dayrui <dayrui@gmail.com>
 * @license     http://www.dayrui.com/license
 * @copyright   Copyright (c) 2011 - 9999, Dayrui.Com, Inc.
 */

class F_Smember extends A_Field {
	
	/**
     * 构造函数
     */
    public function __construct() {
		parent::__construct();
		$this->name = '文章签收'; // 字段名称
		$this->fieldtype = TRUE; // TRUE表全部可用字段类型,自定义格式为 array('可用字段类型名称' => '默认长度', ... )
		$this->defaulttype = 'VARCHAR'; // 当用户没有选择字段类型时的缺省值
    }
	
	/**
	 * 字段相关属性参数
	 *
	 * @param	array	$value	值
	 * @return  string
	 */
	public function option($option) {
		return '';
	}

    public function insert_value($field) {
        $this->ci->data[$field['ismain']][$field['fieldname']] = dr_array2string($this->ci->post[$field['fieldname']]);
    }

    /**
     * 创建sql语句
     */
    public function create_sql($name, $option) {
        $sql = 'ALTER TABLE `{tablename}` ADD `'.$name.'` VARCHAR(255) NULL , ADD `'.$name.'_info` VARCHAR(255) NULL';
        return $sql;
    }

    /**
     * 修改sql语句
     */
    public function alter_sql($name, $option) {
        return NULL;
    }

    /**
     * 删除sql语句
     */
    public function drop_sql($name) {
        $sql = 'ALTER TABLE `{tablename}` DROP `'.$name.'`, DROP `'.$name.'_info`';
        return $sql;
    }


    /**
	 * 字段表单输入
	 *
	 * @param	string	$cname	字段别名
	 * @param	string	$name	字段名称
	 * @param	array	$cfg	字段配置
	 * @param	string	$value	值
	 * @return  string
	 */
	public function input($cname, $name, $cfg, $value = NULL, $id = 0) {
		// 字段显示名称
		$text = (isset($cfg['validate']['required']) && $cfg['validate']['required'] == 1 ? '<font color="red">*</font>' : '').'&nbsp;'.$cname.'：';
		// 表单附加参数
		$attr = isset($cfg['validate']['formattr']) && $cfg['validate']['formattr'] ? $cfg['validate']['formattr'] : '';
		// 字段提示信息
		$tips = isset($cfg['validate']['tips']) && $cfg['validate']['tips'] ? '<div class="onShow" id="dr_'.$name.'_tips">'.$cfg['validate']['tips'].'</div>' : '';
		// 当字段必填时，加入html5验证标签
		if (isset($cfg['validate']['required'])
            && $cfg['validate']['required'] == 1) {
            $attr.= ' required="required"';
        }
		// 表单选项
		//$options = isset($cfg['option']['options']) && $cfg['option']['options'] ? $cfg['option']['options'] : '';
		$disabled = !IS_ADMIN && $id && $value && isset($cfg['validate']['isedit']) && $cfg['validate']['isedit'] ? 'disabled' : ''; 
		$str = '<select style="padding:10px" multiple=multiple '.$disabled.' name="data['.$name.'][]" id="dr_'.$name.'" '.$attr.' >';

        $gid = dr_string2array($value);

        $options = $this->ci->get_cache('member', 'group');
		if ($options) {
			foreach ($options as $t) {
                $v = $t['id'];
                $n = $t['name'];
                $selected = @in_array($v, $gid) ? ' selected' : '';
                $str.= '<option value="'.$v.'" '.$selected.'>'.$n.'</option>';
			}
		}
		$str.= '</select>'.$tips;
		return $this->input_format($name, $text, $str);
	}
	
}