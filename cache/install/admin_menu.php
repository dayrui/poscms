<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 管理后台菜单分布
 *
 * array(
 *		'name' => '分组菜单名称',
 *		'menu' => array(
 *			array(
 *				'name' => '链接菜单名称',
 *				'uri' => '链接菜单的uri'
 *			)
 *			......
 *		)
 * )
 * .......
 */

return array(

    // 后台菜单部分

    array(
        'name' => '首页',
        'mark' => 'home',
        'icon' => 'fa fa-home',
        'menu' => array(
            array(
                'name' => '控制台',
                'mark' => 'home-home',
                'icon' => 'fa fa-home',
                'menu' => array(
                    array(
                        'name' => '后台首页',
                        'uri' => 'home/main',
                        'icon' => 'fa fa-home',
                    ),
                    array(
                        'name' => '资料修改',
                        'uri' => 'root/my',
                        'icon' => 'fa fa-user',
                    ),
                    array(
                        'name' => '登录日志',
                        'uri' => 'root/log',
                        'icon' => 'fa fa-calendar-check-o',
                    ),
                    array(
                        'name' => '错误日志',
                        'uri' => 'system/debug',
                        'icon' => 'fa fa-bug',
                    ),
                    array(
                        'name' => '操作日志',
                        'uri' => 'system/oplog',
                        'icon' => 'fa fa-calendar',
                    ),
                )
            ),


        )
    ),

    array(
        'name' => '设置',
        'mark' => 'cog',
        'icon' => 'fa fa-cog',
        'menu' => array(
            array(
                'name' => '系统设置',
                'mark' => 'cog-sys',
                'icon' => 'fa fa-cog',
                'menu' => array(
                    array(
                        'name' => '系统设置',
                        'uri' => 'system/index',
                        'icon' => 'fa fa-cog',
                    ),
                    array(
                        'name' => '分离配置',
                        'uri' => 'system/file',
                        'icon' => 'fa fa-cubes',
                    ),
                    array(
                        'name' => '邮件设置',
                        'uri' => 'mail/index',
                        'icon' => 'fa fa-envelope',
                    ),
                    array(
                        'name' => '短信设置',
                        'uri' => 'sms/index',
                        'icon' => 'fa fa-envelope',
                    ),
                    array(
                        'name' => '会员设置',
                        'uri' => 'member/admin/setting/index',
                        'icon' => 'fa fa-cog',
                    ),
                    array(
                        'name' => '网银接口',
                        'uri' => 'member/admin/setting/pay',
                        'icon' => 'fa fa-rmb',
                    ),
                    array(
                        'name' => '多语言设置',
                        'uri' => 'language/index',
                        'icon' => 'fa fa-users',
                    ),
                )
            ),
            array(
                'name' => '网站设置',
                'icon' => 'fa fa-globe',
                'menu' => array(
                    array(
                        'name' => '网站设置',
                        'uri' => 'site/config',
                        'icon' => 'fa fa-cog',
                    ),
                    array(
                        'name' => '网站管理',
                        'uri' => 'site/index',
                        'icon' => 'fa fa-globe',
                    ),
                    array(
                        'name' => '内容模块',
                        'uri' => 'module/index',
                        'icon' => 'fa fa-cogs',
                    ),
                    array(
                        'name' => '网站表单',
                        'uri' => 'form/index',
                        'icon' => 'fa fa-tasks',
                    ),
                    array(
                        'name' => '模块评论',
                        'uri' => 'frame_comment/index',
                        'icon' => 'fa fa-comments',
                    ),
                )
            ),
            array(
                'name' => '权限设置',
                'icon' => 'fa fa-users',
                'menu' => array(
                    array(
                        'name' => '后台菜单',
                        'uri' => 'menu/index',
                        'icon' => 'fa fa-list',
                    ),
                    array(
                        'name' => '审核流程',
                        'uri' => 'verify/index',
                        'icon' => 'fa fa-square',
                    ),
                    array(
                        'name' => '角色管理',
                        'uri' => 'role/index',
                        'icon' => 'fa fa-users',
                    ),
                    array(
                        'name' => '会员权限',
                        'uri' => 'member/admin/setting/permission',
                        'icon' => 'fa fa-users',
                    ),
                    array(
                        'name' => '管理员管理',
                        'uri' => 'root/index',
                        'icon' => 'fa fa-user',
                    ),
                )
            ),

        )
    ),

    array(
        'name' => '内容',
        'mark' => 'content',
        'icon' => 'fa fa-th-large',
        'menu' => array(
            array(
                'name' => '内容管理',
                'mark' => 'content-content',
                'icon' => 'fa fa-th-large',
                'menu' => array(
                    array(
                        'name' => '共享栏目',
                        'uri' => 'category_share/index',
                        'icon' => 'fa fa-list',
                    ),
                    array(
                        'name' => '生成静态',
                        'uri' => 'html/index',
                        'icon' => 'fa fa-file',
                    ),
                    array(
                        'name' => '关键词库',
                        'uri' => 'tag/index',
                        'icon' => 'fa fa-tag',
                    ),
                    array(
                        'name' => '附件管理',
                        'uri' => 'attachment/index',
                        'icon' => 'fa fa-folder',
                    ),
                    array(
                        'name' => '自定义链接',
                        'uri' => 'navigator/index',
                        'icon' => 'fa fa-map-marker',
                    ),
                    array(
                        'name' => '自定义页面',
                        'uri' => 'page/index',
                        'icon' => 'fa fa-adn',
                    ),
                    array(
                        'name' => '自定义内容',
                        'uri' => 'block/index',
                        'icon' => 'fa fa-th-large',
                    ),
                    array(
                        'name' => '内容维护工具',
                        'uri' => 'frame_content/index',
                        'icon' => 'fa fa-wrench',
                    ),
                )
            ),
            array(
                'name' => '网站表单',
                'mark' => 'content-form',
                'icon' => 'fa fa-table',
                'menu' => array(
                )
            ),

        )
    ),


    array(
        'name' => '会员',
        'mark' => 'member',
        'icon' => 'fa fa-user',
        'menu' => array(
            array(
                'name' => '会员管理',
                'icon' => 'fa fa-user',
                'menu' => array(
                    array(
                        'name' => '会员管理',
                        'uri' => 'member/admin/home/index',
                        'icon' => 'fa fa-user',
                    ),

                    array(
                        'name' => '会员模型',
                        'uri' => 'member/admin/group/index',
                        'icon' => 'fa fa-users',
                    ),
                    array(
                        'name' => '财务流水',
                        'uri' => 'member/admin/pay/index',
                        'icon' => 'fa fa-calculator',
                    ),
                    array(
                        'name' => '会员菜单',
                        'uri' => 'member/admin/menu/index',
                        'icon' => 'fa fa-list',
                    ),
                    array(
                        'name' => '快捷登录',
                        'uri' => 'member/admin/setting/oauth',
                        'icon' => 'fa fa-weibo',
                    ),
                    array(
                        'name' => '自定义字段',
                        'uri' => 'admin/field/index/rname/member/rid/0',
                        'icon' => 'fa fa-code',
                    ),

                )
            ),

        )
    ),



    array(
        'name' => '界面',
        'mark' => '',
        'icon' => 'fa fa-html5',
        'menu' => array(
            array(
                'name' => '网站模板',
                'icon' => 'fa fa-folder',
                'menu' => array(
                    array(
                        'name' => '电脑模板',
                        'uri' => 'tpl/index',
                        'icon' => 'fa fa-desktop',
                    ),
                    array(
                        'name' => '手机模板',
                        'uri' => 'tpl/mobile',
                        'icon' => 'fa fa-mobile',
                    ),
                    array(
                        'name' => '风格样式',
                        'uri' => 'theme/index',
                        'icon' => 'fa fa-css3',
                    ),
                    array(
                        'name' => '标签向导',
                        'uri' => 'tpl/tag',
                        'icon' => 'fa fa-tag',
                    ),
                )
            ),
            array(
                'name' => '会员模板',
                'icon' => 'fa fa-user',
                'menu' => array(
                    array(
                        'name' => '电脑模板',
                        'uri' => 'member/admin/tpl/index',
                        'icon' => 'fa fa-desktop',
                    ),
                    array(
                        'name' => '手机模板',
                        'uri' => 'member/admin/tpl/mobile',
                        'icon' => 'fa fa-mobile',
                    ),
                    array(
                        'name' => '标签向导',
                        'uri' => 'member/admin/tpl/tag',
                        'icon' => 'fa fa-tag',
                    ),
                )
            ),

        )
    ),

    array(
        'name' => '插件',
        'mark' => 'myapp',
        'icon' => 'fa fa-puzzle-piece',
        'menu' => array(
            array(
                'name' => '系统插件',
                'mark' => 'cog-sys',
                'icon' => 'fa fa-puzzle-piece',
                'menu' => array(
                    array(
                        'name' => '系统提醒',
                        'uri' => 'notice/index',
                        'icon' => 'fa fa-volume-down',
                    ),
                    array(
                        'name' => '任务队列',
                        'uri' => 'cron/index',
                        'icon' => 'fa fa-forward',
                    ),
                    array(
                        'name' => 'URL规则',
                        'uri' => 'urlrule/index',
                        'icon' => 'fa fa-magnet',
                    ),
                    array(
                        'name' => '下载镜像',
                        'uri' => 'downservers/index',
                        'icon' => 'fa fa-arrow-circle-down',
                    ),
                    array(
                        'name' => '远程附件',
                        'uri' => 'attachment2/index',
                        'icon' => 'fa fa-upload',
                    ),
                    array(
                        'name' => '联动菜单',
                        'uri' => 'linkage/index',
                        'icon' => 'fa fa-windows',
                    ),
                    array(
                        'name' => '全局变量',
                        'uri' => 'sysvar/index',
                        'icon' => 'fa fa-tumblr',
                    ),
                    array(
                        'name' => '数据结构',
                        'uri' => 'db/index',
                        'icon' => 'fa fa-database',
                    ),
                    array(
                        'name' => '自定义控制器',
                        'uri' => 'syscontroller/index',
                        'icon' => 'fa fa-code',
                    ),
                )
            ),
            array(
                'name' => '应用插件',
                'mark' => 'cloud-cloud',
                'icon' => 'fa fa-cloud',
                'menu' => array(
                    array(
                        'name' => '应用插件',
                        'uri' => 'application/index',
                        'icon' => 'fa fa-cloud',
                    ),
                )
            ),

        )
    ),


    array(
        'name' => '云服务',
        'mark' => 'yun',
        'icon' => 'fa fa-cloud',
        'displayorder' => '250',
        'menu' => array(
            array(
                'name' => '云服务',
                'mark' => 'yun-home',
                'icon' => 'fa fa-cloud',
                'menu' => array(
                    array(
                        'name' => '使用文档',
                        'uri' => 'api/helponline',
                        'icon' => 'fa fa-book',
                    ),
                    array(
                        'name' => '在线插件',
                        'uri' => 'api/cjonline',
                        'icon' => 'fa fa-plug',
                    ),
                    array(
                        'name' => '模板大全',
                        'uri' => 'api/mbonline',
                        'icon' => 'fa fa-code',
                    ),
                    array(
                        'name' => '功能模块',
                        'uri' => 'api/mkonline',
                        'icon' => 'fa fa-cogs',
                    ),
                )
            ),


        )
    ),


);