

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_block`
--

CREATE TABLE IF NOT EXISTS `dr_1_block` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '资料块名称',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='资料块表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_block`
--

INSERT INTO `dr_1_block` VALUES(1, '首页幻灯片', '{i-4}:"{\\"file\\":[\\"7\\",\\"8\\",\\"9\\"],\\"title\\":[\\"QQ20161104-4@2x\\",\\"QQ20161104-3@2x\\",\\"QQ20161104-2@2x\\"]}"');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `fuxuankuang` varchar(255) DEFAULT NULL,
  `ysxqfyb` varchar(10) DEFAULT NULL,
  `yuedushoufei` text,
  `dangewenjian` varchar(255) DEFAULT NULL,
  `dgwjhtp` text,
  `tpzy` varchar(255) DEFAULT NULL,
  `ldcd` mediumint(8) unsigned DEFAULT NULL,
  `spsx` text,
  `nrglxw` text,
  `spwj` text,
  `danxuananniu` varchar(255) DEFAULT NULL,
  `xialaxuanze` varchar(255) DEFAULT NULL,
  `baiduditu_lng` decimal(9,6) DEFAULT NULL,
  `baiduditu_lat` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_demo`
--

INSERT INTO `dr_1_demo` VALUES(1, 1, '测试名称', '258', '', '测试内容', 2, 1, 'admin', 9, '/index.php?s=demo&c=show&id=1', 0, 0, '127.0.0.1', 1480920480, 1480922516, 0, 0, 0, '["1","2"]', '#a71aed', '{"use":1,"3_1":2,"3_2":3,"3_3":4,"3_4":5,"4_5":6,"4_6":7,"4_7":8,"4_8":9}', '250', '{"file":["251","252","253","254","255"],"title":["QQ20161201-2@2x","QQ20161201-1@2x","QQ20161201-0@2x","QQ20161130-3@2x","QQ20161130-2@2x"]}', '["256","257"]', 0, '{"1":{"name":"aaa","value":"222"},"2":{"name":"333","value":"444"}}', '35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,19,20,18,17,16,15,14', '', '2', '2', '116.413554', '39.911013');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_buy`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_demo_buy`
--

INSERT INTO `dr_1_demo_buy` VALUES(1, 1, 1, '测试名称', '258', '/index.php?s=demo&c=show&id=1', 5, 1480922018);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_category`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dr_1_demo_category`
--

INSERT INTO `dr_1_demo_category` VALUES(1, 0, '0', '测试栏目1', 'c', 'ceshilanmu1', '', 0, '1', '', 1, NULL, '{"edit":"0","linkurl":"","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{modname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html"}}', 0);
INSERT INTO `dr_1_demo_category` VALUES(2, 0, '0', '测试栏目2', 'c', 'ceshilanmu2', '', 0, '2', '', 1, NULL, '{"edit":"0","linkurl":"","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{modname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{modname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html"}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_category_data`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_category_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_comment_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_demo_comment_index`
--

INSERT INTO `dr_1_demo_comment_index` VALUES(1, 1, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_comment_my`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `dr_1_demo_data_0`
--

INSERT INTO `dr_1_demo_data_0` VALUES(1, 1, 1, '<p>测试内容</p>');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_draft`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_favorite`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_flag`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_hits`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `dr_1_demo_hits`
--

INSERT INTO `dr_1_demo_hits` VALUES(1, 2, 2, 3, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_html`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_demo_index`
--

INSERT INTO `dr_1_demo_index` VALUES(1, 1, 1, 9, 1480920480);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_search`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_search_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_tag`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_demo_verify`
--

CREATE TABLE IF NOT EXISTS `dr_1_demo_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down`
--

CREATE TABLE IF NOT EXISTS `dr_1_down` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `language` varchar(255) DEFAULT NULL COMMENT '软件语言',
  `license` varchar(255) DEFAULT NULL COMMENT '软件授权',
  `os` varchar(255) DEFAULT NULL COMMENT '运行环境',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `status` (`status`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `dr_1_down`
--

INSERT INTO `dr_1_down` VALUES(36, 2, '与总理同框：里加16+1诞生了两张“全家福”', '25', '', '简体中文', '共享版', '["WinXp","Win7","Win8","Linux","Mac"]', '', '中国-中东欧合作机制似乎与水结缘。“16+1”领导人会晤，从最初的多瑙河畔到去年的太湖之滨，如今又来到波罗的海。似乎巧合、更像隐喻的是：中国哲学讲究“水到渠成”，16+1合作，尤其是中东欧16国对推动基础设施和...', 5, 1, 'admin', 9, '/index.php?c=show&id=36', 0, 0, '192.168.0.9', 1478484450, 1478485038, 0, 0, 0);
INSERT INTO `dr_1_down` VALUES(37, 2, '一图感知习近平制度治党有多拼', '24', '', '简体中文', '共享版', '["WinXp","Win7"]', '', '一图感知习近平制度治党有多拼', 1, 1, 'admin', 9, '/index.php?c=show&id=37', 0, 0, '192.168.0.9', 1478484505, 1478485025, 0, 0, 0);
INSERT INTO `dr_1_down` VALUES(38, 2, '中国和欧洲的农民起义有何区别', '23', '', '简体中文', '共享版', '["Win7","Win8"]', '', '中国和欧洲的农民起义有何区别1、古典文献中有“起义”一词，但无“农民起义”一词笔者使用“诸子百家中国哲学书电子化计划”检索，查询“农民起义”词条，所得结果为0；查询“起义”词条，则结果极多。如《水经注》...', 0, 1, 'admin', 9, '/index.php?c=show&id=38', 0, 0, '192.168.0.9', 1478484540, 1478485012, 0, 0, 0);
INSERT INTO `dr_1_down` VALUES(39, 2, '中国和欧洲的农民起义有何区别', '22', '', '简体中文', '共享版', '["Win7","Win8"]', '', '中国和欧洲的农民起义有何区别1、古典文献中有“起义”一词，但无“农民起义”一词笔者使用“诸子百家中国哲学书电子化计划”检索，查询“农民起义”词条，所得结果为0；查询“起义”词条，则结果极多。如《水经注》...', 0, 1, 'admin', 9, '/index.php?c=show&id=39', 0, 0, '192.168.0.9', 1478484540, 1478484997, 0, 0, 0);
INSERT INTO `dr_1_down` VALUES(40, 2, '中央派组督察15省份换届风气 严禁拉票贿选', '21', '', '简体中文', '共享版', '["Linux","Mac"]', '', '可通过电话网络短信信访举报据报道，中组部有关负责同志在动员部署时强调，督察工作要坚持从严从实，突出问题导向，对责任落实、教育宣传、监督察处、制度执行、“凡提四必”等方面情况进行“五个必查”，努力做到对...', 0, 1, 'admin', 9, '/index.php?c=show&id=40', 0, 0, '192.168.0.9', 1478484587, 1478484976, 0, 0, 0);
INSERT INTO `dr_1_down` VALUES(41, 2, '全球最富的20个国家 无中国', '20', '', '简体中文', '共享版', '["Win8"]', '', '全球最富的20个国家 无中国英国智库列格坦研究所(Legatum Institute)发布了2016年“全球繁荣指数”，为这个世界上最繁荣的国家进行了排名。财富是判断一个国家繁荣程度的重要因素，但是在进行国家排名时列格坦研究所...', 0, 1, 'admin', 9, '/index.php?c=show&id=41', 0, 0, '192.168.0.9', 1478484605, 1478484951, 0, 0, 0);
INSERT INTO `dr_1_down` VALUES(42, 2, '中联办主任：绝不容许“港独”分子就任议员', '19', '', '简体中文', '共享版', '["Win7"]', '', '中联办主任：绝不容许“港独”分子就任议员', 1, 1, 'admin', 9, '/index.php?c=show&id=42', 0, 0, '192.168.0.9', 1478484718, 1478484938, 0, 0, 0);
INSERT INTO `dr_1_down` VALUES(43, 2, '除了崔顺实，韩亲信干政事件还涉及哪些核心人物', '18', '', '简体中文', '共享版', '["Win7","Win8"]', '', '除了崔顺实，韩亲信干政事件还涉及哪些核心人物', 3, 1, 'admin', 9, '/index.php?c=show&id=43', 0, 0, '192.168.0.9', 1478484734, 1478484808, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_buy`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_category`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_category_data`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_category_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_comment_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dr_1_down_comment_index`
--

INSERT INTO `dr_1_down_comment_index` VALUES(1, 43, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_down_comment_index` VALUES(2, 37, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_down_comment_index` VALUES(3, 42, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_down_comment_index` VALUES(4, 36, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_comment_my`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `file` varchar(255) DEFAULT NULL COMMENT '文件',
  `demo` varchar(255) DEFAULT NULL COMMENT '演示地址',
  `siteurl` varchar(255) DEFAULT NULL COMMENT '官方网站',
  `images` text COMMENT '图片展示',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `dr_1_down_data_0`
--

INSERT INTO `dr_1_down_data_0` VALUES(36, 1, 2, '', '', '', '', '<p><span style="font: 16px/28px &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; color: rgb(0, 0, 0); text-transform: none; text-indent: 32px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">中国-中东欧合作机制似乎与水结缘。“16+1”领导人会晤，从最初的多瑙河畔到去年的太湖之滨，如今又来到波罗的海。似乎巧合、更像隐喻的是：中国哲学讲究“水到渠成”，16+1合作，尤其是中东欧16国对推动基础设施和互联互通巨大的需求，与中国在装备制造性价比最优的产能以及推动工业化进程的经验对接，从而使得相互间开展国际产能合作变得顺理成章、水到渠成。</span></p>');
INSERT INTO `dr_1_down_data_0` VALUES(37, 1, 2, '', '', '', '', '<h1 style="margin: 0px 0px 15px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; font-size: 26px; font-style: normal; font-variant: normal; font-weight: normal; word-spacing: 0px; white-space: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">一图感知习近平制度治党有多拼</h1><p>&nbsp;</p>');
INSERT INTO `dr_1_down_data_0` VALUES(38, 1, 2, '', '', '', '', '<h1 style="font: bold 32px/45px 微软雅黑, 黑体; margin: 0px; padding: 15px 0px 0px; height: 45px; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; overflow: hidden; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(246, 246, 246); -webkit-text-stroke-width: 0px;">中国和欧洲的农民起义有何区别</h1><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text"><strong>1、古典文献中有“起义”一词，但无“农民起义”一词</strong></p><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text">笔者使用“诸子百家中国哲学书电子化计划”检索，查询“农民起义”词条，所得结果为0；查询“起义”词条，则结果极多。如《水经注》“汝水”条下，有“汝南太守周矜起义于悬瓠者是矣”之句。《三国志·袁绍传》裴注中，有“袁绍起义，卑辞厚币以招致（田）丰”之句。《通典》中有“桓玄篡晋，宋武帝起义讨之”、“大唐高祖起义至京师”、“大唐起义太原”等句。《三国演义》中，“高祖斩白蛇而起义”、“斩蛇起义”等句，出现频率也很高。</p><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text"><strong>2、民国报刊杂志及学术界很少使用“农民起义”，该词直到50年代才出现井喷</strong></p><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text">“农民起义”一词最早见于何人作品，很难搞明白。可以肯定的是，要到50年代，该词才在报刊杂志和书籍中大量出现（40年代后期的《新华日报》，已较频繁使用该词）。笔者于《民国38年前重要剪报资料库》中检索“农民起义”，仅得1项结果（检索“起义”有130项结果）。孙中山生平文章，经常使用“起义”一词，但笔者于“国父全集全文检索系统”中检索“农民起义”，则结果为0（检索“起义”有481笔资料）。</p><p>&nbsp;</p>');
INSERT INTO `dr_1_down_data_0` VALUES(39, 1, 2, '', '', '', '', '<h1 style="font: bold 32px/45px 微软雅黑, 黑体; margin: 0px; padding: 15px 0px 0px; height: 45px; color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: normal; overflow: hidden; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(246, 246, 246); -webkit-text-stroke-width: 0px;">中国和欧洲的农民起义有何区别</h1><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text"><strong>1、古典文献中有“起义”一词，但无“农民起义”一词</strong></p><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text">笔者使用“诸子百家中国哲学书电子化计划”检索，查询“农民起义”词条，所得结果为0；查询“起义”词条，则结果极多。如《水经注》“汝水”条下，有“汝南太守周矜起义于悬瓠者是矣”之句。《三国志·袁绍传》裴注中，有“袁绍起义，卑辞厚币以招致（田）丰”之句。《通典》中有“桓玄篡晋，宋武帝起义讨之”、“大唐高祖起义至京师”、“大唐起义太原”等句。《三国演义》中，“高祖斩白蛇而起义”、“斩蛇起义”等句，出现频率也很高。</p><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text"><strong>2、民国报刊杂志及学术界很少使用“农民起义”，该词直到50年代才出现井喷</strong></p><p style="font: 16px/28px &quot;simsun Arial&quot;; margin: 0px; padding: 0px 0px 20px; color: rgb(68, 68, 68); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; -ms-word-wrap: break-word; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;" data-page-model="text">“农民起义”一词最早见于何人作品，很难搞明白。可以肯定的是，要到50年代，该词才在报刊杂志和书籍中大量出现（40年代后期的《新华日报》，已较频繁使用该词）。笔者于《民国38年前重要剪报资料库》中检索“农民起义”，仅得1项结果（检索“起义”有130项结果）。孙中山生平文章，经常使用“起义”一词，但笔者于“国父全集全文检索系统”中检索“农民起义”，则结果为0（检索“起义”有481笔资料）。</p><p>&nbsp;</p>');
INSERT INTO `dr_1_down_data_0` VALUES(40, 1, 2, '', '', '', '', '<p style="font: 16px/28px &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><strong>可通过电话网络短信信访举报</strong></p><p style="font: 16px/28px &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">据报道，中组部有关负责同志在动员部署时强调，督察工作要坚持从严从实，突出问题导向，对责任落实、教育宣传、监督察处、制度执行、“凡提四必”等方面情况进行“五个必查”，努力做到对换届进展情况、换届风气状况、突出问题矛盾、干部群众反映、潜在风险隐患等“五个搞清楚”，切实把督察工作沉下去，把真实情况摸清楚，进一步增强督察督导实效。</p><p style="font: 16px/28px &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">同时，中组部和15个被督察省（区、市）党委组织部门“12380”电话、网络、短信和信访“四位一体”举报平台，将认真受理违反换届纪律问题的举报。</p><p>&nbsp;</p>');
INSERT INTO `dr_1_down_data_0` VALUES(41, 1, 2, '', '', '', '', '<h1 style="margin: 0px; padding: 0px; border: 0px currentColor; border-image: none; color: rgb(227, 184, 118); text-transform: none; line-height: normal; text-indent: 0px; letter-spacing: normal; font-family: &quot;Microsoft YaHei&quot;; font-size: 40px; font-style: normal; font-variant: normal; word-spacing: 0px; vertical-align: baseline; white-space: normal; background-color: rgb(244, 244, 244); -webkit-text-stroke-width: 0px;">全球最富的20个国家 无中国</h1><p style="margin: 24px 0px; padding: 0px; border: 0px currentColor; border-image: none; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; vertical-align: baseline; white-space: normal; -ms-word-wrap: break-word; background-color: rgb(244, 244, 244); -webkit-text-stroke-width: 0px;" data-page-model="text">英国智库列格坦研究所(Legatum Institute)发布了2016年“全球繁荣指数”，为这个世界上最繁荣的国家进行了排名。</p><p style="margin: 24px 0px; padding: 0px; border: 0px currentColor; border-image: none; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; vertical-align: baseline; white-space: normal; -ms-word-wrap: break-word; background-color: rgb(244, 244, 244); -webkit-text-stroke-width: 0px;" data-page-model="text">财富是判断一个国家繁荣程度的重要因素，但是在进行国家排名时列格坦研究所考虑的因素远不止这个。统计数据显示，该研究所在进行排名时参考了104种可变因素，其中包括人均国内生产总值和全职工作人数等传统指标，还包括安全互联网服务器的数量，以及人们每日的起色如何等更加有趣的因素。</p><p>&nbsp;</p>');
INSERT INTO `dr_1_down_data_0` VALUES(42, 1, 2, '', '', '', '', '<h1 style="margin: 0px 0px 15px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; font-size: 26px; font-style: normal; font-variant: normal; font-weight: normal; word-spacing: 0px; white-space: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">中联办主任：绝不容许“港独”分子就任议员</h1><p>&nbsp;</p>');
INSERT INTO `dr_1_down_data_0` VALUES(43, 1, 2, '', '', '', '', '<h1 style="margin: 0px 0px 15px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; font-size: 26px; font-style: normal; font-variant: normal; font-weight: normal; word-spacing: 0px; white-space: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">除了崔顺实，韩亲信干政事件还涉及哪些核心人物</h1><p>&nbsp;</p>');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_draft`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_favorite`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_flag`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_hits`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `dr_1_down_hits`
--

INSERT INTO `dr_1_down_hits` VALUES(43, 3, 3, 4, 4, 1);
INSERT INTO `dr_1_down_hits` VALUES(37, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_down_hits` VALUES(42, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_down_hits` VALUES(36, 5, 1, 6, 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_html`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `dr_1_down_index`
--

INSERT INTO `dr_1_down_index` VALUES(36, 1, 2, 9, 1478484450);
INSERT INTO `dr_1_down_index` VALUES(37, 1, 2, 9, 1478484505);
INSERT INTO `dr_1_down_index` VALUES(38, 1, 2, 9, 1478484540);
INSERT INTO `dr_1_down_index` VALUES(39, 1, 2, 9, 1478484540);
INSERT INTO `dr_1_down_index` VALUES(40, 1, 2, 9, 1478484587);
INSERT INTO `dr_1_down_index` VALUES(41, 1, 2, 9, 1478484605);
INSERT INTO `dr_1_down_index` VALUES(42, 1, 2, 9, 1478484718);
INSERT INTO `dr_1_down_index` VALUES(43, 1, 2, 9, 1478484734);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_search`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_search_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_tag`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_down_verify`
--

CREATE TABLE IF NOT EXISTS `dr_1_down_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned DEFAULT NULL,
  `xiaoqumingcheng` varchar(255) DEFAULT NULL,
  `dizhi` varchar(255) DEFAULT NULL,
  `weizhi_lng` decimal(9,6) DEFAULT NULL,
  `weizhi_lat` decimal(9,6) DEFAULT NULL,
  `huxing` varchar(255) DEFAULT NULL,
  `shi` int(10) DEFAULT NULL,
  `ting` int(10) DEFAULT NULL,
  `wei` int(10) DEFAULT NULL,
  `mianji` int(10) DEFAULT NULL,
  `zhuangxiu` varchar(255) DEFAULT NULL,
  `chaoxiang` varchar(255) DEFAULT NULL,
  `zongceng` varchar(255) DEFAULT NULL,
  `suozaiceng` varchar(255) DEFAULT NULL,
  `zujin` int(10) DEFAULT NULL,
  `zujinleixing` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `displayorder` (`displayorder`,`updatetime`),
  KEY `zujin` (`zujin`),
  KEY `area` (`area`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `dr_1_fang`
--

INSERT INTO `dr_1_fang` VALUES(44, 3, '居家装修小户型 采光好拎包即住 诚租', '26', '', '居家装修小户型 采光好拎包即住 诚租', 1, 1, 'admin', 9, '/index.php?c=show&id=44', 0, 0, '192.168.0.9', 1478485238, 1478485238, 0, 0, 0, 1, '785', '安全全切切切切切切切切切切切切', '0.000000', '0.000000', '二居', 1, 2, 2, 2, '豪华装修', '朝南', '28', '28', 5000, '押一付三');
INSERT INTO `dr_1_fang` VALUES(45, 3, '实地拍摄 豪华装修 高区 24小时保安', '28', '', '实地拍摄 豪华装修 高区 24小时保安实地拍摄 豪华装修 高区 24小时保安实地拍摄 豪华装修 高区 24小时保安实地拍摄 豪华装修 高区 24小时保安', 1, 1, 'admin', 9, '/index.php?c=show&id=45', 0, 0, '192.168.0.9', 1478485573, 1478485573, 0, 0, 0, 1, '交换机', ' 后天天天天    ', '0.000000', '0.000000', '二居', 1, 1, 2, 2, '中等装修', '东西向', '1', '1', 777, '押一付三');
INSERT INTO `dr_1_fang` VALUES(46, 3, '地铁周边 11号线 独立一室户 适宜居家 干净 清爽', '30', '', '地铁周边 11号线 独立一室户 适宜居家 干净 清爽地铁周边 11号线 独立一室户 适宜居家 干净 清爽地铁周边 11号线 独立一室户 适宜居家 干净 清爽', 2, 1, 'admin', 9, '/index.php?c=show&id=46', 0, 0, '192.168.0.9', 1478485717, 1478485717, 0, 0, 0, 1, '是的', ' 是的飞洒我 ', '0.000000', '0.000000', '三居', 455, 5, 5, 555, '简装修', '朝东', '55', '55', 477, '押一付三');
INSERT INTO `dr_1_fang` VALUES(47, 3, '朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁', '31', '', '朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁', 1, 1, 'admin', 9, '/index.php?c=show&id=47', 0, 0, '192.168.0.9', 1478485812, 1478485812, 0, 0, 0, 1, '地方', ' 的份上飞飞', '0.000000', '0.000000', '四居以上', 12, 2, 2, 22, '精装修', '朝南', '2', '2', 2222, '押一付三');
INSERT INTO `dr_1_fang` VALUES(48, 3, '中环一号精装 看房方便 电梯9楼 优惠出租啦', '33', '', '中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦...', 1, 1, 'admin', 9, '/index.php?c=show&id=48', 0, 0, '192.168.0.9', 1478485973, 1478485973, 0, 0, 0, 1, '才', ' 是的   ', '0.000000', '0.000000', '四居以上', 12, 22, 2, 2, '中等装修', '朝西', '22', '22', 7425742, '押一付三');
INSERT INTO `dr_1_fang` VALUES(49, 3, '2号线精装改一室户,独立厨卫,可以做饭,拎包入住', '35', '', '2号线精装改一室户,独立厨卫,可以做饭,拎包入住2号线精装改一室户,独立厨卫,可以做饭,拎包入住2号线精装改一室户,独立厨卫,可以做饭,拎包入住', 2, 1, 'admin', 9, '/index.php?c=show&id=49', 0, 0, '192.168.0.9', 1478486073, 1478486073, 0, 0, 0, 1, '水电费', ' 发给费个个人非天然', '0.000000', '0.000000', '一居', 45, 555, 5, 5, '精装修', '朝北', '7', '5', 4563, '押一付三');
INSERT INTO `dr_1_fang` VALUES(50, 3, '精装修带地暖，业主出国诚意出租，之前自主', '37', '', '精装修带地暖，业主出国诚意出租，之前自主精装修带地暖，业主出国诚意出租，之前自主精装修带地暖，业主出国诚意出租，之前自主精装修带地暖，业主出国诚意出租，之前自主...', 3, 1, 'admin', 9, '/index.php?c=show&id=50', 0, 0, '192.168.0.9', 1478486625, 1478486625, 0, 0, 0, 1, '地方', ' 发的范德萨发', '0.000000', '0.000000', '四居以上', 5, 4, 4, 5, '豪华装修', '南北通透', '7', '5', 2147483647, '面议');
INSERT INTO `dr_1_fang` VALUES(51, 3, '大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房', '39', '', '大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房...', 1, 1, 'admin', 9, '/index.php?c=show&id=51', 0, 0, '192.168.0.9', 1478486743, 1478486743, 0, 0, 0, 1, '是的', ' 热改天', '0.000000', '0.000000', '四居', 1, 2, 2, 22, '豪华装修', '朝北', '22', '22', 2720, '押一付三');
INSERT INTO `dr_1_fang` VALUES(52, 3, '真实图片！假的不要钱！有窗户！超低价', '41', '', '真实图片！假的不要钱！有窗户！超低价真实图片！假的不要钱！有窗户！超低价真实图片！假的不要钱！有窗户！超低价真实图片！假的不要钱！有窗户！超低价...', 1, 1, 'admin', 9, '/index.php?c=show&id=52', 0, 0, '192.168.0.9', 1478486911, 1478486911, 0, 0, 0, 1, '好', ' 台海 ', '0.000000', '0.000000', '二居', 2, 2, 42, 55, '豪华装修', '朝西', '45', '45', 4555, '半年付');
INSERT INTO `dr_1_fang` VALUES(53, 3, '3号线边上 干净清爽 欢迎来看', '43', '', '3号线边上 干净清爽 欢迎来看3号线边上 干净清爽 欢迎来看3号线边上 干净清爽 欢迎来看3号线边上 干净清爽 欢迎来看', 0, 1, 'admin', 9, '/index.php?c=show&id=53', 0, 0, '192.168.0.9', 1478487070, 1478487070, 0, 0, 0, 1, '二', ' 二', '0.000000', '0.000000', '一居', 12, 2, 8, 2, '毛坯', '朝东', '282', '28', 822, '押一付一');
INSERT INTO `dr_1_fang` VALUES(54, 3, '电梯一房，业主诚租，要求女孩，要爱干净，2个人行！', '45', '', '电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯...', 0, 1, 'admin', 9, '/index.php?c=show&id=54', 0, 0, '192.168.0.9', 1478487139, 1478487139, 0, 0, 0, 1, '发给', '人同仁堂 ', '0.000000', '0.000000', '四居', 1, 2, 2, 425, '豪华装修', '南北通透', '2', '2', 4575, '押一付三');
INSERT INTO `dr_1_fang` VALUES(55, 3, '租放心房,住安心家 温馨宜家装修,配置齐全,可看房', '47', '', '租放心房,住安心家 温馨宜家装修,配置齐全,可看房租放心房,住安心家 温馨宜家装修,配置齐全,可看房租放心房,住安心家 温馨宜家装修,配置齐全,可看房租放心房,住安心家 温馨宜家装修,配置齐全,可看房...', 4, 1, 'admin', 9, '/index.php?c=show&id=55', 0, 0, '192.168.0.9', 1478487217, 1478487217, 0, 0, 0, 1, '二', ' 二', '0.000000', '0.000000', '四居以上', 12, 2, 3, 333, '中等装修', '朝东', '33', '33', 0, '年付');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_buy`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_category`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_category_data`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_category_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_comment_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `dr_1_fang_comment_index`
--

INSERT INTO `dr_1_fang_comment_index` VALUES(1, 44, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(2, 45, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(3, 46, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(4, 47, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(5, 48, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(6, 49, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(7, 50, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(8, 51, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(9, 52, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_fang_comment_index` VALUES(10, 55, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_comment_my`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `peitao` varchar(255) DEFAULT NULL,
  `images` text,
  `lianxiren` varchar(255) DEFAULT NULL,
  `lianxidianhua` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `dr_1_fang_data_0`
--

INSERT INTO `dr_1_fang_data_0` VALUES(44, 1, 3, '<h3 xss="removed">居家装修小户型 采光好拎包即住 诚租</h3><p>&nbsp;</p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168","\\u53ef\\u4e0a\\u7f51","\\u53ef\\u505a\\u996d","\\u53ef\\u6d17\\u6fa1","\\u7a7a\\u8c03\\u623f","\\u53ef\\u770b\\u7535\\u89c6","\\u6709\\u6696\\u6c14","\\u6709\\u8f66\\u4f4d"]', '{"file":["27"],"title":["06t58PICncZ_1024"]}', '护', '123655888888888888');
INSERT INTO `dr_1_fang_data_0` VALUES(45, 1, 3, '<p>实地拍摄 豪华装修 高区 24小时保安</p><p>实地拍摄 豪华装修 高区 24小时保安</p><p>实地拍摄 豪华装修 高区 24小时保安</p><p><br/></p><p>实地拍摄 豪华装修 高区 24小时保安</p><p><br/></p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168","\\u53ef\\u4e0a\\u7f51","\\u53ef\\u505a\\u996d","\\u53ef\\u6d17\\u6fa1","\\u7a7a\\u8c03\\u623f","\\u53ef\\u770b\\u7535\\u89c6","\\u6709\\u6696\\u6c14","\\u6709\\u8f66\\u4f4d"]', '{"file":["29"],"title":["56e7751ed6533"]}', '勾', '1236555555555');
INSERT INTO `dr_1_fang_data_0` VALUES(46, 1, 3, '<p>&nbsp;地铁周边 11号线 独立一室户 适宜居家 干净 清爽</p><p>地铁周边 11号线 独立一室户 适宜居家 干净 清爽</p><p>地铁周边 11号线 独立一室户 适宜居家 干净 清爽</p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168","\\u53ef\\u4e0a\\u7f51"]', '', '一', '5炎热 ');
INSERT INTO `dr_1_fang_data_0` VALUES(47, 1, 3, '<p>朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁</p><p>朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁</p><p></p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168"]', '{"file":["32"],"title":["914109_163208469000_2"]}', '可乐', '与他他');
INSERT INTO `dr_1_fang_data_0` VALUES(48, 1, 3, '<p>中环一号精装 看房方便 电梯9楼 优惠出租啦</p><p>中环一号精装 看房方便 电梯9楼 优惠出租啦</p><p>中环一号精装 看房方便 电梯9楼 优惠出租啦</p><p>中环一号精装 看房方便 电梯9楼 优惠出租啦</p><p>中环一号精装 看房方便 电梯9楼 优惠出租啦</p><p>中环一号精装 看房方便 电梯9楼 优惠出租啦</p><p>中环一号精装 看房方便 电梯9楼 优惠出租啦</p><p><img  src="http://img.baidu.com/hi/jx2/j_0002.gif"/><img  src="http://img.baidu.com/hi/jx2/j_0057.gif"/><img  src="http://img.baidu.com/hi/jx2/j_0071.gif"/></p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168","\\u53ef\\u4e0a\\u7f51","\\u53ef\\u505a\\u996d","\\u53ef\\u6d17\\u6fa1"]', '{"file":["34"],"title":["914109_210757456000_2"]}', '填合同', '他任然他人天天');
INSERT INTO `dr_1_fang_data_0` VALUES(49, 1, 3, '<p>2号线精装改一室户,独立厨卫,可以做饭,拎包入住</p><p>2号线精装改一室户,独立厨卫,可以做饭,拎包入住</p><p>2号线精装改一室户,独立厨卫,可以做饭,拎包入住</p><p><img  src="http://img.baidu.com/hi/jx2/j_0046.gif"/><img  src="http://img.baidu.com/hi/jx2/j_0046.gif"/></p>', '["\\u62ce\\u5305\\u5165\\u4f4f"]', '{"file":["36"],"title":["4114512_084432034885_2"]}', '个同仁堂', ' 投影仪');
INSERT INTO `dr_1_fang_data_0` VALUES(50, 1, 3, '<p>精装修带地暖，业主出国诚意出租，之前自主</p><p>精装修带地暖，业主出国诚意出租，之前自主</p><p>精装修带地暖，业主出国诚意出租，之前自主</p><p>精装修带地暖，业主出国诚意出租，之前自主</p><p><img  src="http://img.baidu.com/hi/jx2/j_0059.gif"/></p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168","\\u53ef\\u4e0a\\u7f51","\\u53ef\\u505a\\u996d","\\u53ef\\u6d17\\u6fa1","\\u7a7a\\u8c03\\u623f","\\u53ef\\u770b\\u7535\\u89c6","\\u6709\\u6696\\u6c14","\\u6709\\u8f66\\u4f4d"]', '{"file":["38"],"title":["4915200_114049531110_2"]}', '个 如果突然', ' 发的贴  ');
INSERT INTO `dr_1_fang_data_0` VALUES(51, 1, 3, '<p>大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房</p><p>大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房</p><p>大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房</p><p>大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房</p><p><br/></p>', '["\\u62ce\\u5305\\u5165\\u4f4f"]', '{"file":["40"],"title":["9880981_201646746168_2"]}', '775', '个好友');
INSERT INTO `dr_1_fang_data_0` VALUES(52, 1, 3, '<p>真实图片！假的不要钱！有窗户！超低价</p><p>真实图片！假的不要钱！有窗户！超低价</p><p>真实图片！假的不要钱！有窗户！超低价</p><p>真实图片！假的不要钱！有窗户！超低价</p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168","\\u53ef\\u505a\\u996d","\\u53ef\\u6d17\\u6fa1"]', '{"file":["42"],"title":["12993780_125123492000_2"]}', '44444444', ' 一一y6');
INSERT INTO `dr_1_fang_data_0` VALUES(53, 1, 3, '<p>3号线边上 干净清爽 欢迎来看</p><p>3号线边上 干净清爽 欢迎来看</p><p>3号线边上 干净清爽 欢迎来看</p><p>3号线边上 干净清爽 欢迎来看</p>', '', '{"file":["44"],"title":["20150318102238_4008"]}', '还有', '他一');
INSERT INTO `dr_1_fang_data_0` VALUES(54, 1, 3, '<h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="电梯一房，业主诚租，要求女孩，要爱干净，2个人行！" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028777309" target="_blank" _soj="Filter_51&amp;hfilter=filterlist">电梯一房，业主诚租，要求女孩，要爱干净，2个人行！</a></h3><p></p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168","\\u53ef\\u4e0a\\u7f51","\\u53ef\\u505a\\u996d","\\u53ef\\u6d17\\u6fa1","\\u7a7a\\u8c03\\u623f","\\u53ef\\u770b\\u7535\\u89c6","\\u6709\\u6696\\u6c14","\\u6709\\u8f66\\u4f4d"]', '{"file":["46"],"title":["b74e53a67d4511e6aae400163e00254c"]}', 'im7吗', 'y6t');
INSERT INTO `dr_1_fang_data_0` VALUES(55, 1, 3, '<h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="租放心房,住安心家 温馨宜家装修,配置齐全,可看房" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028304176" target="_blank" _soj="Filter_52&amp;hfilter=filterlist">租放心房,住安心家 温馨宜家装修,配置齐全,可看房</a></h3><p><br/></p><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="租放心房,住安心家 温馨宜家装修,配置齐全,可看房" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028304176" target="_blank" _soj="Filter_52&amp;hfilter=filterlist">租放心房,住安心家 温馨宜家装修,配置齐全,可看房</a></h3><p><br/></p><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="租放心房,住安心家 温馨宜家装修,配置齐全,可看房" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028304176" target="_blank" _soj="Filter_52&amp;hfilter=filterlist">租放心房,住安心家 温馨宜家装修,配置齐全,可看房</a></h3><p><br/></p><h3 style="font: 14px/34px &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Hiragino Sans GB&quot;, tahoma, arial, simhei; margin: 0px 0px 6px; padding: 0px; height: 34px; color: rgb(121, 121, 121); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a title="租放心房,住安心家 温馨宜家装修,配置齐全,可看房" style="outline: 0px; color: rgb(51, 51, 51); overflow: hidden; font-size: 16px; font-weight: bold; text-decoration: none; display: inline-block; white-space: nowrap; -ms-text-overflow: ellipsis; max-width: 420px;" href="http://sh.zu.anjuke.com/fangyuan/1028304176" target="_blank" _soj="Filter_52&amp;hfilter=filterlist">租放心房,住安心家 温馨宜家装修,配置齐全,可看房</a></h3><p></p>', '["\\u62ce\\u5305\\u5165\\u4f4f","\\u5bb6\\u7535\\u9f50\\u5168"]', '{"file":["48"],"title":["20150318102238_4008"]}', ' 让他', ' 让他');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_draft`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_favorite`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_flag`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_hits`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `dr_1_fang_hits`
--

INSERT INTO `dr_1_fang_hits` VALUES(44, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_fang_hits` VALUES(45, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_fang_hits` VALUES(46, 2, 2, 3, 3, 1);
INSERT INTO `dr_1_fang_hits` VALUES(47, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_fang_hits` VALUES(48, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_fang_hits` VALUES(49, 2, 2, 3, 3, 1);
INSERT INTO `dr_1_fang_hits` VALUES(50, 3, 1, 4, 4, 1);
INSERT INTO `dr_1_fang_hits` VALUES(51, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_fang_hits` VALUES(52, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_fang_hits` VALUES(55, 4, 1, 1, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_html`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `dr_1_fang_index`
--

INSERT INTO `dr_1_fang_index` VALUES(44, 1, 3, 9, 1478485238);
INSERT INTO `dr_1_fang_index` VALUES(45, 1, 3, 9, 1478485573);
INSERT INTO `dr_1_fang_index` VALUES(46, 1, 3, 9, 1478485717);
INSERT INTO `dr_1_fang_index` VALUES(47, 1, 3, 9, 1478485812);
INSERT INTO `dr_1_fang_index` VALUES(48, 1, 3, 9, 1478485973);
INSERT INTO `dr_1_fang_index` VALUES(49, 1, 3, 9, 1478486073);
INSERT INTO `dr_1_fang_index` VALUES(50, 1, 3, 9, 1478486625);
INSERT INTO `dr_1_fang_index` VALUES(51, 1, 3, 9, 1478486743);
INSERT INTO `dr_1_fang_index` VALUES(52, 1, 3, 9, 1478486911);
INSERT INTO `dr_1_fang_index` VALUES(53, 1, 3, 9, 1478487070);
INSERT INTO `dr_1_fang_index` VALUES(54, 1, 3, 9, 1478487139);
INSERT INTO `dr_1_fang_index` VALUES(55, 1, 3, 9, 1478487217);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_search`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_search_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_tag`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_fang_verify`
--

CREATE TABLE IF NOT EXISTS `dr_1_fang_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_form`
--

CREATE TABLE IF NOT EXISTS `dr_1_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='表单模型表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_form`
--

INSERT INTO `dr_1_form` VALUES(1, '网站留言', 'liuyan', '{"icon":"fa fa-user","post":"1","code":"1","send":"","template":"","rt_url":""}');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_form_liuyan`
--

CREATE TABLE IF NOT EXISTS `dr_1_form_liuyan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站留言表单表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_form_liuyan`
--

INSERT INTO `dr_1_form_liuyan` VALUES(1, '你好Finecms', 1, 'admin', '127.0.0.1', 1479737251, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_form_liuyan_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_form_liuyan_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `liuyanneirong` mediumtext,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='网站留言表单附表';

--
-- 转存表中的数据 `dr_1_form_liuyan_data_0`
--

INSERT INTO `dr_1_form_liuyan_data_0` VALUES(1, 1, '<p>你好Finecms</p>');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_navigator`
--

CREATE TABLE IF NOT EXISTS `dr_1_navigator` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级id',
  `pids` text COMMENT '所有上级id数据项',
  `type` tinyint(1) unsigned NOT NULL COMMENT '导航类型',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `url` varchar(255) NOT NULL COMMENT '导航地址',
  `thumb` varchar(255) NOT NULL COMMENT '图片标示',
  `show` tinyint(1) unsigned NOT NULL COMMENT '显示',
  `mark` varchar(255) DEFAULT NULL COMMENT '类型标示',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否继承下级',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有下级',
  `childids` text COMMENT '所有下级数据项',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否站外链接',
  `displayorder` tinyint(3) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`),
  KEY `list` (`id`,`type`,`show`,`displayorder`),
  KEY `mark` (`mark`),
  KEY `extend` (`extend`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站导航表' AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `dr_1_navigator`
--

INSERT INTO `dr_1_navigator` VALUES(36, 0, '0', 4, '天睿程序设计', '', 'http://www.dayrui.com', '', 1, '', 0, 0, '36', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news`
--

CREATE TABLE IF NOT EXISTS `dr_1_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `dr_1_news`
--

INSERT INTO `dr_1_news` VALUES(1, 7, '载能力也达到了14吨。在目前现役的大型', '10', 'e', '11月3日晚成功发射的长征五号运载火箭的近地轨道(LEO)运载能力高达25吨，地球同步转移轨道(GTO)运载能力也达到了14吨。在目前现役的大型运载火箭中，其运载能力已经可以比肩美俄欧等国航天巨头的现役主力运载火箭。...', 6, 1, 'admin', 9, '/index.php?c=show&id=1', 0, 0, '192.168.0.10', 1478252937, 1478256172, 1, 0, 0);
INSERT INTO `dr_1_news` VALUES(2, 7, '中国长五比肩全球现役最强火箭 还将研更强型号', '10', '', '11月3日晚成功发射的长征五号运载火箭的近地轨道(LEO)运载能力高达25吨，地球同步转移轨道(GTO)运载能力也达到了14吨。在目前现役的大型运载火箭中，其运载能力已经可以比肩美俄欧等国航天巨头的现役主力运载火箭。...', 1, 1, 'admin', 9, '/index.php?c=show&id=2', 0, 0, '192.168.0.10', 1478252937, 1478255296, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(3, 7, '美媒称美南海战略受创：“北京玩一手聪明外交牌”', '', '', '资料图：美国海军军舰在南海参考消息网11月7日报道 美媒称，多年来，美国及其盟国一直在努力遏制中国在南海的行动，同时中国也在稳步地在这个水域建设人工设施。美国《纽约时报》网站11月3日刊登题为《菲律宾渔民重...', 1, 1, 'admin', 9, '/index.php?c=show&id=3', 0, 0, '192.168.0.9', 1478482588, 1478482588, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(4, 7, '日美军演首增加新安保法内容 将练“离岛夺还”', '', '', '资料图：日美军演中新网11月7日电 (吴倩)本月7日，作为正在举行的“利剑”军演的一部分，日美将首次实施反映新安保法内容的联合演习。尽管战场上日本自卫队员伤亡的危险广遭诟病，但对于一直致力于推进该法乃至修改...', 1, 1, 'admin', 9, '/index.php?c=show&id=4', 0, 0, '192.168.0.9', 1478482710, 1478482710, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(5, 7, '韩称因韩执意部署萨德 中韩高层国防对话面临搁浅', '', '', '资料图：萨德反导系统“韩中国防高层对话全面停止”，韩联社6日称，受到“萨德”部署影响，韩国防长韩民求的访华计划和韩中国防战略对话，都因没有得到中方积极回应面临搁浅。韩联社6日称，去年在首尔举行的韩中防长...', 0, 1, 'admin', 9, '/index.php?c=show&id=5', 0, 0, '192.168.0.9', 1478482992, 1478482992, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(6, 7, '传美军黑客已待命网袭俄罗斯 俄专家：虚张声势', '', '', '资料图：美网络司令部内部工作场景“美国军事黑客已做好对俄罗斯发动网络战的准备。”5日，美国NBC新闻电视台援引情报部门的消息称：“美国军事黑客已经进入俄罗斯电网和电信部门，以及克里姆林宫指挥系统。美国政府...', 0, 1, 'admin', 9, '/index.php?c=show&id=6', 0, 0, '192.168.0.9', 1478483021, 1478483021, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(7, 7, '美媒评歼20：隐形能力不足为惧从一开始就输给F22', '', '', '资料图：歼20战机歼20战机在珠海航展首秀后，台湾《中时电子报》引述一篇刊登在CNN的评论文章称，军事专家贾斯汀·布朗克（Justin Bronk）表示歼-20的隐形能力并无法与F-22与F-35等美军战机相提并论。布朗克是英国皇...', 0, 1, 'admin', 9, '/index.php?c=show&id=7', 0, 0, '192.168.0.9', 1478483047, 1478483047, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(8, 7, '美前防长为何曾放言中国搞不出4代机：或被局座忽悠了', '', '', '资料图：歼20战机首飞发生在当时的美国防长盖茨访华之际珠海航展，J20 亮相大家都有心理准备，当时虽然没有百分百的确切消息，但三个方面可以表明 J20 将大概率亮相：一是因为早先就传出了J20将亮相的消息，且有两架...', 0, 1, 'admin', 9, '/index.php?c=show&id=8', 0, 0, '192.168.0.9', 1478483070, 1478483070, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(9, 7, '伊拉克政府军缩小对摩苏尔包围圈 将迎来与IS巷战', '', '', '资料图：伊拉克特种部队挺进摩苏尔伊拉克特种部队4日宣布夺取摩苏尔市的东部6个区，进一步缩小对极端组织“伊斯兰国”势力的包围圈。随着攻势深入，伊拉克特种部队正遭遇更顽强的抵抗。另一方面，“伊斯兰国”为拖延...', 0, 1, 'admin', 9, '/index.php?c=show&id=9', 0, 0, '192.168.0.9', 1478483098, 1478483098, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(10, 7, '印称巴军“违反停火协议”在克什米尔地区开火', '', '', '资料图：印巴边境哨兵据印度媒体Times Now11月5日报道，巴基斯坦违反停火协议，凌晨2点在克什米尔地区的krishna Ghati边境线附近开火。印度方面进行了回击...', 2, 1, 'admin', 9, '/index.php?c=show&id=10', 0, 0, '192.168.0.9', 1478483127, 1478483127, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(11, 8, '关于素颜、女儿、丈夫…杨幂在这篇专访全说了', '', '', '连续三周，杨幂每周六早上都能霸占微博热搜的第一名，即使作为明星这也很罕见，第一周上榜词是“杨幂素颜”，第二周是“杨幂吃西瓜”，第三周是“小糯米声音 杨幂”。无不与她参加的《真正男子汉2》有关。杨幂在节目...', 0, 1, 'admin', 9, '/index.php?c=show&id=11', 0, 0, '192.168.0.9', 1478483215, 1478483215, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(12, 8, '被批没保护家人不像男人 霍建华19字霸气回应', '', '', '11月6日报道，霍建华、林心如7月恋情修成正果，尽管夫妻俩对私生活低调，小俩口一举一动依旧备受瞩目，不过林心如近期屡遭酸民攻击，从逼婚、到咒她孕肚，霍建华懒理网友抹黑，却被酸不像男人，对此他也做出回应。霍...', 0, 1, 'admin', 9, '/index.php?c=show&id=12', 0, 0, '192.168.0.9', 1478483467, 1478483467, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(13, 8, '《中场战事》观影 120帧让肉体不由自主的哭了', '', '', '11月6日的中国电影圈是被“比利·林恩”刷屏的一天。早上10点，李安的新片《比利·林恩的中场战事》在北京悠唐博纳影城2号厅进行了首场4K/3D/120帧最高规格的媒体场放映。目前，全世界只有纽约、洛杉矶、北京、上海...', 0, 1, 'admin', 9, '/index.php?c=show&id=13', 0, 0, '192.168.0.9', 1478483496, 1478483496, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(14, 8, '杨紫24岁生日这天，张一山说愿意为她背叛全世界', '', '', '张一山更新微博上传了一段视频为杨紫庆24岁的生日。视频中，张一山先是为杨紫唱了一段生日歌，之后他说因为自己在拍戏所以没办法到现场为杨紫庆生。张一山还表示两人从12岁的彼此相识到12年后的现在彼此相知，他知道...', 0, 1, 'admin', 9, '/index.php?c=show&id=14', 0, 0, '192.168.0.9', 1478483514, 1478483514, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(15, 8, '太强了！蔡依林做“梦露”翻糖蛋糕英国夺金奖', '', '', '蔡依林近年迷上翻糖蛋糕，早前曾组“皇后陛下”翻糖团队，年初参加Cake international比赛已取得成绩夺下银牌，今次再接再厉以偶像“梦露”为范本的作品，再下一城获得金奖。蔡依林做的翻糖蛋糕得奖...', 0, 1, 'admin', 9, '/index.php?c=show&id=15', 0, 0, '192.168.0.9', 1478483575, 1478483575, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(16, 8, '叶璇晒证据怒斥保姆：上班第一天就洗坏白毛衣', '', '', '叶璇微博截图叶璇和保姆的纠纷闹得沸沸扬扬。一方称被拖欠工资，另一方称保姆盗抢财物、毁坏物品。叶璇昨日（11月6日）发文让保姆坐等法院传票，今日又晒出证据，称保姆倒打一耙。今日（11月7日），叶璇晒出一件有明...', 0, 1, 'admin', 9, '/index.php?c=show&id=16', 0, 0, '192.168.0.9', 1478483635, 1478483635, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(17, 8, '沙溢晒儿子照片：一生最好的作品是安吉和鱼儿', '', '', '沙溢晒两个儿子的照片沙溢晒一双儿子坐在一起的照片，并得意地称：“我这一生最好的作品就是安吉和鱼儿！”此照片曝光后，网友纷纷围观并留言表示羡慕沙溢的一对儿子，称：“你的福气，你两口子的福气，真的羡慕！”...', 0, 1, 'admin', 9, '/index.php?c=show&id=17', 0, 0, '192.168.0.9', 1478483658, 1478483658, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(18, 8, '徐若瑄儿子男友力爆表 为咘咘推学步车超萌', '', '', '徐若瑄5日凌晨在脸书分享儿子和咘咘的玩乐影片，只见咘咘坐在学步车里，而小V宝站在身后、踩着小步伐认真推车向前行。 小V宝为咘咘推车女星贾静雯和徐若瑄同样在去年8月产下宝贝儿女咘咘、小V宝（Dalton），两萌娃因...', 0, 1, 'admin', 9, '/index.php?c=show&id=18', 0, 0, '192.168.0.9', 1478483752, 1478483752, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(19, 8, '张伦硕：我和钟丽缇一见钟情 不担心婆媳关系', '', '', '今天上午，张伦硕接受记者采访，不仅分享了婚礼前的感受，还称“太太给我打九十分” ，句句甜言蜜语都呼应着钟丽缇前几天的那句 “亲爱的们，对不起我这几天秀恩爱撒狗粮，我要结婚了！”钟丽缇和张伦硕（资料图）...', 1, 1, 'admin', 9, '/index.php?c=show&id=19', 0, 0, '192.168.0.9', 1478483789, 1478483789, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(20, 8, '张伦硕：我和钟丽缇一见钟情 不担心婆媳关系', '', '', '今天上午，张伦硕接受记者采访，不仅分享了婚礼前的感受，还称“太太给我打九十分” ，句句甜言蜜语都呼应着钟丽缇前几天的那句 “亲爱的们，对不起我这几天秀恩爱撒狗粮，我要结婚了！”钟丽缇和张伦硕（资料图）...', 0, 1, 'admin', 9, '/index.php?c=show&id=20', 0, 0, '192.168.0.9', 1478483789, 1478483789, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(21, 9, '两岸在五方面孕育巨大合作商机', '', '', '新华社金门11月6日电 2016两岸企业家峰会年会6日在金门举行开幕式。两岸企业家、专家指出，有远见的企业家已经看到两岸优势互补、融合发展的潮流浩浩荡荡，看到两岸产业合作共同发展的远大前景。在新形势下，两岸企...', 0, 1, 'admin', 9, '/index.php?c=show&id=21', 0, 0, '192.168.0.9', 1478483881, 1478483881, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(22, 9, '一石激起千层浪：起底韩国“亲信门”关键人物', '', '', '新网11月7日电 (何路曼)一波未平一波又起，韩国三星手机爆炸事件还未走出人们的视线，总统朴槿惠的“闺蜜”崔顺实干政丑闻又在韩国政坛掀起轩然大波。众所周知，崔顺实是风暴的核心，但随着韩国检方的深入调查，牵涉...', 0, 1, 'admin', 9, '/index.php?c=show&id=22', 0, 0, '192.168.0.9', 1478483971, 1478483971, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(23, 9, '国民党将启动“瘦身”计划 800名党工拟砍半', '', '', '　　据台湾《联合报》11月6日报道 台北高等行政法院周五裁定，“不当党产委员会”9月间冻结国民党4.68亿元（新台币，下同）资金的行政处分不合法，诉讼确定前国民党可动支款项。国民党昨天表示，这些都不影响党将启...', 0, 1, 'admin', 9, '/index.php?c=show&id=23', 0, 0, '192.168.0.9', 1478483996, 1478483996, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(24, 9, '台当局拟解禁日本除福岛外4县市核灾食品 蓝营痛批', '', '', '中国台湾网11月7日讯  据台湾《中国时报》报道，台当局“卫福部”及“农委会”今（7日）将向“立院卫环委员会”报告福岛5县核灾食品赴日勘查报告，未来拟比照欧美韩等地区做法，针对高风险食品进行管制，但解除对区...', 2, 1, 'admin', 9, '/index.php?c=show&id=24', 0, 0, '192.168.0.9', 1478484026, 1478484026, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(25, 9, '立冬到 厦门的冬还挺远', '', '', '　　今天迎来“立冬”节气，但厦门却仍处于“夏天模式”，冬天还挺遥远。今天的天气以多云为主，白天气温在23℃-27℃。　　不过，立冬过后，冷空气活动开始频繁，明显的降温、大风天气将常至。预计，明天晚上新一股...', 0, 1, 'admin', 9, '/index.php?c=show&id=25', 0, 0, '192.168.0.9', 1478484073, 1478484073, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(26, 9, '罗智强：绿营启动&quot;洗风向&quot;工程 追杀马英九号角响起', '', '', '　　马英九。（网络图）　　中国台湾网11月7日讯  据台湾“东森新闻云”报道，近期传出绿营浩浩荡荡地列出所谓的“八大案”，要追杀前台湾地区领导人马英九。前马英九办公室副秘书长罗智强表6日表示，追杀马英九的号...', 0, 1, 'admin', 9, '/index.php?c=show&id=26', 0, 0, '192.168.0.9', 1478484099, 1478484099, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(27, 9, '中国爆发极端大范围重污染天气 三大因素为“元凶”', '', '', '中新社北京11月6日电 (记者 阮煜琳)中国东北、华北和华东地区近日相继爆发重污染天气，从哈尔滨开始，直至山东半岛、江苏和安徽北部，影响范围波及6省区30多个城市，跨越1600多公里，多个城市空气质量爆表。中国环境...', 0, 1, 'admin', 9, '/index.php?c=show&id=27', 0, 0, '192.168.0.9', 1478484132, 1478484132, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(28, 10, '10月青岛市区&quot;气质&quot;得满分 首次同期全月优良', '', '', '半岛都市报11月6日讯　记者6日从市环保部门获悉,10月份青岛市区空气质量优良率达到了100%,同比升高9.7个百分点,为2013年实施新《环境空气质量标准》以来历史同期最好水平,首次实现同期全月优良。 　　按照空气质量综...', 0, 1, 'admin', 9, '/index.php?c=show&id=28', 0, 0, '192.168.0.9', 1478484219, 1478484219, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(29, 10, '电商的&quot;双11&quot;求变之路:单调的打折促销成历史', '', '', '井然有序的大家电仓库里,工人用机器替代手工拣货。　　拣货员人手一“枪”,轻轻一扫即可核对货物。　　为了效率,所有拣货员几乎都是一路奔跑着工作。　　□文/半岛记者　景毅　图/半岛记者　刘延珉 　　自2009年起,...', 0, 1, 'admin', 9, '/index.php?c=show&id=29', 0, 0, '192.168.0.9', 1478484266, 1478484266, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(30, 10, '&quot;免费体检&quot;做饵非法集资220万 被告人被判刑', '', '', '免费体检就能成公司会员，再投资公司其他项目，每年可以获得高达30%的高回报。被告人张某在邦家租赁青岛分公司担任部门经理期间，通过发展客户投资等方式，先后向20余人非法集资共计220万元。而他背后所属的公司，截...', 0, 1, 'admin', 9, '/index.php?c=show&id=30', 0, 0, '192.168.0.9', 1478484289, 1478484289, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(31, 10, '&quot;人人车&quot;平台购买二手车 第二天暖风冒出白气', '', '', '半岛都市报1月20日讯（记者 刘玉凡） 受益于互联网平台的迅猛发展，二手车交易增长迅速。近日，家住市北区的王先生反映，15日，他通过“人人车”平台购买了一辆长城二手车，第二天开车去胶州时暖风就开始冒出白气，...', 0, 1, 'admin', 9, '/index.php?c=show&id=31', 0, 0, '192.168.0.9', 1478484308, 1478484308, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(32, 10, '一煤难求 济宁百万吨级用户到煤矿上蹲点抢煤', '', '', '“最近煤炭价格上来了，煤场的煤炭却已经连底煤都出手了，来求煤的企业业务员仍络绎不绝，真是一煤难求。”近日，在位于济宁市兖州区的兖矿集团兴隆庄煤矿，身为煤资发运科副科长的刘寨峰对最近煤炭价格的回涨深有感...', 0, 1, 'admin', 9, '/index.php?c=show&id=32', 0, 0, '192.168.0.9', 1478484333, 1478484333, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(33, 10, '前三季十大新型工业千亿级产业规模产值近万亿', '', '', '　　为转变工业发展方式、调整工业发展结构，进一步提高发展质量和效益，我市确定重点发展轨道交通、食品、机械装备、橡胶、电子信息、服装、石化、船舶海工、汽车、家电等十大新型工业千亿级产业，为稳增长、调结构...', 0, 1, 'admin', 9, '/index.php?c=show&id=33', 0, 0, '192.168.0.9', 1478484357, 1478484357, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(34, 10, '双11大战开始 小伙一天能卖1万个纸箱月赚3万', '', '', '　　距离今年双11还有不到一周的时间，对于今年26岁的张璨来说，现在正是他最忙碌的时候。做纸箱生意的他当天刚刚发完14000个纸箱，看着满满的一车货发走，他开始准备下一单货。习惯了网购，习惯了收发快递，习惯了...', 1, 1, 'admin', 9, '/index.php?c=show&id=34', 0, 0, '192.168.0.9', 1478484375, 1478484375, 0, 0, 0);
INSERT INTO `dr_1_news` VALUES(35, 10, '国务院安委会第一巡查组进驻青岛进行巡查', '', '', '半岛都市报11月6日讯　5日上午,国务院安委会第一巡查组进驻本市进行安全生产工作延伸巡查,并听取了本市安全生产工作汇报。 　　巡查组组长、国家安全生产监督管理总局原副局长、煤矿安监局原局长赵铁锤出席工作汇报...', 0, 1, 'admin', 9, '/index.php?c=show&id=35', 0, 0, '192.168.0.9', 1478484398, 1478484398, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_buy`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_category`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_category_data`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_category_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_news_comment_data_0`
--

INSERT INTO `dr_1_news_comment_data_0` VALUES(1, 1, 1, '/index.php?c=show&id=1', '载能力也达到了14吨。在目前现役的大型', 'admin', 'dafsd ', 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '127.0.0.1', 1478262274);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_comment_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `dr_1_news_comment_index`
--

INSERT INTO `dr_1_news_comment_index` VALUES(1, 1, 0, 0, 1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_news_comment_index` VALUES(2, 2, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_news_comment_index` VALUES(3, 3, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_news_comment_index` VALUES(4, 10, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_news_comment_index` VALUES(5, 4, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_news_comment_index` VALUES(6, 19, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_news_comment_index` VALUES(7, 34, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_news_comment_index` VALUES(8, 24, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_comment_my`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_news_comment_my`
--

INSERT INTO `dr_1_news_comment_my` VALUES(1, 1, 1, '载能力也达到了14吨。在目前现役的大型', '/index.php?c=show&id=1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `dr_1_news_data_0`
--

INSERT INTO `dr_1_news_data_0` VALUES(1, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><br/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">11月3日晚成功发射的长征五号运载火箭的近地轨道(LEO)运载能力高达25吨，地球同步转移轨道(GTO)运载能力也达到了14吨。在目前现役的大型运载火箭中，其运载能力已经可以比肩美俄欧等国航天巨头的现役主力运载火箭。不过专家表示，火箭的能力有多大，航天的舞台就有多大，所以中国未来还会研制运载能力更强的重型火箭。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">专家表示，目前LEO运载能力达到20吨级别的大推力运载火箭已经成为航天器发射的主力军，目前各国这一级别的运载火箭包括美国的“德尔塔-4”、“宇宙神”5号(又译阿特拉斯-5)、“猎鹰9”号运载火箭，欧洲的“阿里安5”运载火箭，俄罗斯的“质子”号、“安加拉A5”以及日本的H-2B运载火箭。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">与上述运载火箭比较，无论是LEO运载能力，还是GTO运载能力，长征五号均已经跻身世界前列。美国波音公司的“德尔塔4”重型运载火箭LEO运载能力根据轨道高度不同可以达到23.6到28.4吨之间，是目前近地轨道运载能力最强的，其初期型号GTO运载能力为13.8吨，使用了升级的RS-68A发动机后达到了14.2吨。其他各型火箭的运载能力均小于长征五号。其中，洛克希德·马丁公司研制的“宇宙神5”551构型的LEO达到18.9吨，GTO为8.9吨;俄罗斯的“质子M”运载火箭的LEO运载能力为23吨，GTO为6.9吨;俄罗斯2014年首次试射的“安加拉A5”运载火箭的LEO运载能力为24.5吨，GTO运载能力为7.5吨;欧洲航天局的“阿里安-5ES”的LEO运载能力为20吨，“阿里安5ECA”的GTO运载能力为10.7吨;日本的H2B的LEO为19吨，GTO为8吨。</p><p><br/></p>');
INSERT INTO `dr_1_news_data_0` VALUES(2, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><br/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">11月3日晚成功发射的长征五号运载火箭的近地轨道(LEO)运载能力高达25吨，地球同步转移轨道(GTO)运载能力也达到了14吨。在目前现役的大型运载火箭中，其运载能力已经可以比肩美俄欧等国航天巨头的现役主力运载火箭。不过专家表示，火箭的能力有多大，航天的舞台就有多大，所以中国未来还会研制运载能力更强的重型火箭。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">专家表示，目前LEO运载能力达到20吨级别的大推力运载火箭已经成为航天器发射的主力军，目前各国这一级别的运载火箭包括美国的“德尔塔-4”、“宇宙神”5号(又译阿特拉斯-5)、“猎鹰9”号运载火箭，欧洲的“阿里安5”运载火箭，俄罗斯的“质子”号、“安加拉A5”以及日本的H-2B运载火箭。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">与上述运载火箭比较，无论是LEO运载能力，还是GTO运载能力，长征五号均已经跻身世界前列。美国波音公司的“德尔塔4”重型运载火箭LEO运载能力根据轨道高度不同可以达到23.6到28.4吨之间，是目前近地轨道运载能力最强的，其初期型号GTO运载能力为13.8吨，使用了升级的RS-68A发动机后达到了14.2吨。其他各型火箭的运载能力均小于长征五号。其中，洛克希德·马丁公司研制的“宇宙神5”551构型的LEO达到18.9吨，GTO为8.9吨;俄罗斯的“质子M”运载火箭的LEO运载能力为23吨，GTO为6.9吨;俄罗斯2014年首次试射的“安加拉A5”运载火箭的LEO运载能力为24.5吨，GTO运载能力为7.5吨;欧洲航天局的“阿里安-5ES”的LEO运载能力为20吨，“阿里安5ECA”的GTO运载能力为10.7吨;日本的H2B的LEO为19吨，GTO为8吨。</p><p><br/></p>');
INSERT INTO `dr_1_news_data_0` VALUES(3, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="美媒称美南海战略受创：“北京玩一手聪明外交牌”" src="http://img1.gtimg.com/news/pics/hv1/190/157/2151/139909000.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：美国海军军舰在南海</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">参考消息网11月7日报道 美媒称，多年来，美国及其盟国一直在努力遏制中国在南海的行动，同时中国也在稳步地在这个水域建设人工设施。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">美国《纽约时报》网站11月3日刊登题为《菲律宾渔民重返争议海域，美国南海战略再受创》的报道称，如今，中菲关系改善为美国树立了一个“令人担忧”的先例，美国曾希望通过区域联盟来保持其作为Fine主导力量的地位。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">报道称，在对付中国的海上主权要求上，曾经有一个从日本到马来西亚的相当统一的防线，如今，这条防线在东南角、也就是菲律宾所在的位置上出了一个缺口。不久，防线在西南端也会出缺口，在那个位置上的马来西亚正在就改变结盟发出声音。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">促成这两个国家变心的原因也许都与一种不满有关，既对在不相关的事情上被视为是美国干涉的不满。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">菲律宾总统罗德里戈·杜特尔特被美国激怒，因为美国批评了他发起的缉毒运动导致很多人死亡，目前已有2000人被杀，大多数是被警察击毙的。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">报道称，中国<span class="infoMblog" style="position: relative; z-index: 9;"><a class="a-tips-Article-QQ" style="color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted;" href="http://t.qq.com/wj_xlt#pref=qqcom.keyword" target="_blank" rel="wj_xlt" reltitle="外交部">外交部</a></span>10月31日证实，在菲律宾总统访问北京后，中方决定允许菲律宾渔民靠近黄岩岛。中国并没有放弃主权主张，菲律宾也没有承认中国的主张。但菲律宾对该海域的主要兴趣是渔业资源，看来菲律宾已得到了那个东西，这是杜特尔特的胜利，是他保护本国的重要渔业受人欢迎做法的胜利。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">对中国来说，这种让步把一个重要的美国盟友转移到中国的势力范围里。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">“北京玩了一手聪明的外交牌，”澳大利亚悉尼大学美国研究中心研究员阿什利·汤曾德说，“中国通过解除封锁，确保了一次公关胜利，但中国并没有放弃主权主张，甚至也未撤走自己的海岸警卫队。”</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">对杜特尔特来说，在黄岩岛问题上做交易的代价很低，杜特尔特已经发誓要与美国冷却关系，包括可能不让美国军队使用菲律宾的五个军事基地。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">报道称，对中国来说，这笔交易的代价也很低。中国仍然控制着黄岩岛周围的海域，菲律宾政府很难就中国人从黄岩岛全面撤出问题与中国进行谈判</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(4, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="日美军演首加新安保法内容 将演练“离岛夺还”" src="http://img1.gtimg.com/news/pics/hv1/241/157/2151/139909051.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：日美军演</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">中新网11月7日电 (吴倩)本月7日，作为正在举行的“利剑”军演的一部分，日美将首次实施反映新安保法内容的联合演习。尽管战场上日本自卫队员伤亡的危险广遭诟病，但对于一直致力于推进该法乃至修改和平宪法的安倍政府而言，该训练将很可能起到“推波助澜”的作用。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><strong>新：“剑”指全球 结伴出海</strong></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">所谓美日“利剑”演习从1986年起每两年举行一次，是两国最大规模实兵演习之一。今年于10月30日正式登场，约1.1万名美军与2.6万名日本自卫队员、260架战机与20艘舰艇在日本周边、冲绳、关岛、天宁岛与北马里亚纳群岛海域，进行两栖登陆与导弹防御演习。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">此前，尽管日本防卫省反复强调演习属“例行性质”，但其包括的“离岛夺还”等敏感内容曾屡遭外界质疑。而在新安保法生效背景下，此次军演将首次反映其中新增的“紧急事态”概念，旨在强化日本自卫队为美军提供“后方支援”的能力。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="日美军演首加新安保法内容 将演练“离岛夺还”" src="http://img1.gtimg.com/news/pics/hv1/238/157/2151/139909048.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：日美军演</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">根据日本防卫省此前公开的日程，11月7日，日美将模拟日本航空自卫队直升机救助在海上遇险的美军机机组人员，9日则将假设日本航空自卫队与美军机在海上发现大量伤员，并出动水上救援飞机联合救助。此外，两国还将继续举行“离岛夺还”等实战演练。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">不仅如此，日本自卫队还计划模拟演练向友军提供弹药、为准备战斗的友军飞机加油等，乃</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">至“进一步实施假想行使集体自卫权的训练”。为此，除与盟友美韩联合举行军演外，日本航空自卫队不久前还与英国空军首次在日本本土举行联合军演，其意义可见一斑。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="日美军演首加新安保法内容 将演练“离岛夺还”" src="http://img1.gtimg.com/news/pics/hv1/244/157/2151/139909054.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：安倍晋三</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">而首相安倍晋三此前也在日本自卫队检阅仪式上强调，根据安保法已可以赋予自卫队新任务；同日，日本防卫大臣稻田朋美也在陆上自卫队岩手驻屯地就将派往南苏丹的自卫队部队的安保法新任务训练表示，在“驰援护卫”等一系列情况下，自卫队对各种行动掌握得“很充分”。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">日本共同社对此分析称，基于新安保法的日美间部队运用由此已然正式展开，为自卫队后方支援范围扩大至全球打下基础；时事通讯社认为，日本政府或将继续借日美同盟体制和“覆盖全球范围的安全合作网络”，将新法制转换为新实践，进一步推进“安全保障政策建设”。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(5, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="韩称中韩国防高层对话面临搁浅 因韩执意部署萨德" src="http://img1.gtimg.com/news/pics/hv1/24/157/2151/139908834.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：萨德反导系统</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">“韩中国防高层对话全面停止”，韩联社6日称，受到“萨德”部署影响，韩国防长韩民求的访华计划和韩中国防战略对话，都因没有得到中方积极回应面临搁浅。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">韩联社6日称，去年在首尔举行的韩中防长会谈上，中国防长常万全邀请韩民求2016年合适的时候访华，韩民求原计划应邀出访，但中方后来没有提及相关事宜，韩方也没有专门推动此事。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">报道还称，2011年开始，中韩每年定期举行的国防部高层对话机制——韩中国防战略对话，今年恐怕也难如期举行。韩国国防部相关人士透露称，已向中方提议年内举行对话，但中方至今没有做出回应。报道称，过去几年，韩中在该对话中就两国国防部开通热线、加强军事交流与合作，乃至设定防空识别区等敏感问题进行了广泛的交流与沟通。这一对话机制已成为韩中国防领域的核心协商机制。韩联社称，2015年的韩中国防战略对话会议因当年举行韩中防长会谈而取消。如果今年也不能如期举行，将是连续两届“泡汤”。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">韩联社称，多数分析认为，中方之所以对举行韩中国防高层对话不那么积极，是因为对韩国决定部署“萨德”不满。报道称，若韩中在国防领域长期不沟通，恐怕会对韩国应对朝鲜核试及射弹产生影响</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(6, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="美媒称美军黑客待命网攻俄罗斯 俄专家：胡说 " src="http://img1.gtimg.com/news/pics/hv1/239/155/2151/139908539.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：美网络司令部内部工作场景</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">“美国军事黑客已做好对俄罗斯发动网络战的准备。”5日，美国NBC新闻电视台援引情报部门的消息称：“美国军事黑客已经进入俄罗斯电网和电信部门，以及克里姆林宫指挥系统。美国政府担心俄罗斯使用网络能力破坏即将举行的总统选举，如有必要，美国秘密网络武器将对俄方发动攻击。”对这种说法，俄官方迅速做出强烈反应。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">俄新网5日说，美国黑客准备对俄发动攻击，是虚张声势还是实际威胁？俄<span class="infoMblog" style="position: relative; z-index: 9;"><a class="a-tips-Article-QQ" style="color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted;" href="http://t.qq.com/wj_xlt#pref=qqcom.keyword" target="_blank" rel="wj_xlt" reltitle="外交部">外交部</a></span>发言人扎哈罗娃5日说，俄外交部期待美国政府对军事黑客可能袭击俄电信和电网的消息做出反应。她说：“美国官方不表态意味着那里存在国家层面的网络恐怖主义，如果媒体报道的黑客威胁成为现实，莫斯科有权对华盛顿提出相应指控。”俄总统新闻秘书佩斯科夫也说，莫斯科正采取措施保证网络和信息安全。美国情报部门拒绝对此发表评论。此前，该部门多次指责俄罗斯企图利用网络攻击影响美总统选举，并暗示俄支持特朗普。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">俄罗斯“今日经济”网5日称，有俄专家认为，目前俄美两国间严重不信任，美国对俄发动网络攻击并非只是虚张声势。但目前看，美方公布这一信息只是对克里姆林宫施压。俄战略与国际问题研究所专家尼古拉丘克说，网络安全对美国来说是头号问题，美国轻易不敢对他国发动网络攻击，否则会遭到对方针锋相对的回应。从这一点看，美国媒体宣称对俄发动网络攻击纯属胡说八道。美国这一宣传与其国内举行的大选有关，目的是吓唬俄罗斯。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(7, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="美媒评歼20：隐形能力不足为惧从一开始就输给F22" src="http://img1.gtimg.com/news/pics/hv1/52/114/2151/139897897.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：歼20战机</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">歼20战机在珠海航展首秀后，台湾《中时电子报》引述一篇刊登在<span class="infoMblog" style="position: relative; z-index: 9;"><a class="a-tips-Article-QQ" style="color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted;" href="http://t.qq.com/CNN_NEWS#pref=qqcom.keyword" target="_blank" rel="CNN_NEWS" reltitle="CNN">CNN</a></span>的评论文章称，军事专家贾斯汀·布朗克（Justin Bronk）表示歼-20的隐形能力并无法与F-22与F-35等美军战机相提并论。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">布朗克是英国皇家联合军种国防研究所研究员。他表示，歼-20前鸭翼、几乎没有掩蔽的发动机与后翼的设计都大幅减低这款战斗机雷达截面积可变小的程度。而一款战斗机隐形性能上表现的好坏，首先就取决于雷达反射面积的多寡。由于大陆在雷达波涂装（指吸波材料）的技术掌握上明显不如美国，歼-20的隐形能力几乎从一开始就输给F-22与F-35。大陆飞行员在空中一旦与F-22或者F-35遭遇，根本还来不及发现美机踪影就会被击落。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">尽管如此，布朗克还是列举出了几个歼-20的优点。首先，体积巨大的歼-20能装载更多的燃油，这意味着大陆空军在亚太地区能够打击比过去更远的地方。其次，同样因为体积原因，歼-20装备的武器系统也超过F-22与F-35。最重要的，则是歼-20在数量上也必然会生产的比两款美军战斗机还要多。歼-20的存在，将严重威胁美国在西Fine的空军基地、航空母舰、预警机与加油机。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(8, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="美前防长为何曾放言中国搞不出4代机：或被局座忽悠了" src="http://img1.gtimg.com/news/pics/hv1/154/123/2151/139900294.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：歼20战机首飞发生在当时的美国防长盖茨访华之际</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">珠海航展，J20 亮相大家都有心理准备，当时虽然没有百分百的确切消息，但三个方面可以表明 J20 将大概率亮相：</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">一是因为早先就传出了J20将亮相的消息，且有两架J20飞往珠海附近。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">二是 J20 今年底或明年初服役是大概率的事情，以中国现在的国防政策，J20 此时亮相符合当前形势，早前 运20 和 J31已经亮相过。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">三是中国此时展示即将服役（或已经服役）的 J20 ，有助于震慑中国周边，对冲美国在亚太的军事优势，有利于我国对美博弈。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">不过，在珠海航展上，J20 的亮相真的是太给力了。一方面，J20没有像其它飞机那样在现场起飞降落，而是从其它机场起飞后突然飞临航展上空，在空中展示了漂亮的流线型身姿、具有明显隐身特性的设计、鸭式布局给飞机带来的超强机动能力、几乎90°角的垂直爬升能力等之后，又瞬间消失在人们的实现里。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">看完航展上J20 短短的几分钟的表演，你可以深刻体会到这是当今世界最先进的隐形战机之一，应该说仅次于美国的F22。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">说起 J20，这里还有一则非常有趣的故事，故事的主角是中国空军前副司令何为荣中将、中国战忽局局长张召忠<span class="Apple-converted-space">&nbsp;</span>(<a class="a-tips-Article-QQ" style="color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted;" href="http://t.qq.com/zhangzhaozhong#pref=qqcom.keyword" target="_blank">微博</a>)少将、美国前防长盖茨先生和美国国防情报局。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(9, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="摩苏尔将迎巷战 伊政府军缩小包围圈对IS包围" src="http://img1.gtimg.com/news/pics/hv1/163/114/2151/139898008.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：伊拉克特种部队挺进摩苏尔</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">伊拉克特种部队4日宣布夺取摩苏尔市的东部6个区，进一步缩小对极端组织“伊斯兰国”势力的包围圈。随着攻势深入，伊拉克特种部队正遭遇更顽强的抵抗。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">另一方面，“伊斯兰国”为拖延政府军攻城进展和躲避打击也绞尽脑汁，竟然点燃多处油田，借漫天黑烟掩盖行踪。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><strong>【两年来首升国旗】</strong></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">伊拉克官员说，特种部队当天对“伊斯兰国”发起又一重大攻势，在炮火和空袭帮助下一举攻克萨马赫、卡德拉等摩苏尔东部6个区，并在当地升起伊拉克国旗。这是摩苏尔被“伊斯兰国”控制两年多来，这座伊拉克第二大城市首次升起国旗。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">伊拉克陆军中将卡西姆·贾西姆·纳扎勒说，摩苏尔东部另一区域也已被特种部队攻下大部分，极端武装“正试图逃离”。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">伊拉克特种部队一名指挥官说，特种部队可能继续向纵深挺进，准备直接攻打至流经摩苏尔中心的底格里斯河。</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">美联社报道，随着战事推进，伊拉克政府军正着手准备在摩苏尔市内与极端武装的巷战，因被困摩苏尔的平民仍超过百万，市区人口稠密、房屋密集，政府军可能面临数周、甚至数月的战斗。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(10, 1, 7, '<p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="印称巴军“违反停火协议”在克什米尔地区开火" src="http://img1.gtimg.com/news/pics/hv1/171/123/2151/139900311.jpg"/></p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">资料图：印巴边境哨兵</p><p style="font: 16px/28px 宋体, Arial, sans-serif; margin: 0px 0px 29px; padding: 0px; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">据印度媒体Times Now11月5日报道，巴基斯坦违反停火协议，凌晨2点在克什米尔地区的krishna Ghati边境线附近开火。印度方面进行了回击</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(11, 1, 8, '<p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">连续三周，<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="75545">杨幂</a>每周六早上都能霸占微博热搜的第一名，即使作为明星这也很罕见，第一周上榜词是“杨幂素颜”，第二周是“杨幂吃西瓜”，第三周是“小糯米声音 杨幂”。无不与她参加的《真正男子汉2》有关。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="关于素颜、女儿、丈夫…杨幂在这篇专访全说了" src="http://img1.gtimg.com/ent/pics/hv1/2/142/2151/139904987.jpg"/></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">杨幂</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">在节目中，她是一位空军士兵，会因教官的批评羞红脸，而在私底下，她更具有老板气质，两年前，杨幂成立了嘉行传媒公司。在奥体中心附近的一家酒店里，接受腾讯娱乐专访的杨幂也确实有老板的一面，干练而简洁。看到记者，先礼貌地打招呼，之后继续低头关注手机。等待记者把摄像机位架好，她主动走到椅子前，坐下。听到周遭的吵闹声，她提高声音说，“要开始了”，房间里原本七嘴八舌的工作人员瞬间<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="73647">安静</a>。采访开始。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">在与记者对话过<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="432241">程中</a>，杨幂思路清晰，回答问题简洁明了。谈及参加节目的心理活动，“脑子被雷劈了”、“鬼知道我经历了什么”、“真没想到这么狠”，一连串诙谐又带有明确情感指向的表达从她口中流出。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">她是《真正男子汉2》最先确认的嘉宾。尽管她后来很快意识到，支撑自信的“体力好”这个选项，只是一个“错觉”。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">军队训练辛苦，她却很兴奋。每次录制后迫不及待与<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="101458">周围</a>人分享感受。她的工作人员形容就像放学回来的孩子，跟家人分享学校见闻一样。“一点抱怨都没有”。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">卸妆、倒滑索、吃西瓜……节目里的每个细节她都能聊到背后的故事。聊得多了，“少女幂”的一面不断凸显。比如记者请她形容一下自己，没有一秒停顿，脱口而出，“一个大美女，没了”。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">采访结束，还坐在面对着摄像机的位置上，杨幂做的第一件事是，大喊一声，“给我手机”！</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(12, 1, 8, '<p class="text" style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">11月6日报道，霍建华、<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="75842">林心如</a>7月恋情修成正果，尽管夫妻俩对私生活低调，小俩口一举一动依旧备受瞩目，不过林心如近期屡遭酸民攻击，从逼婚、到咒她孕肚，霍建华懒理网友抹黑，却被酸不像男人，对此他也做出回应。</p><p class="text" style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">霍建华升格当人夫工作满档，大婚后投入拍摄古装《如懿传》，近期则是忙宣传新片<a class="a-tips-Article-QQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted;" href="http://datalib.ent.qq.com/movie/83/index.shtml" target="_blank">《捉迷藏》</a>，霍建华接受采访，提到遭网友质疑他没在第一时间护娇妻，霍建华则维持一贯风格回应：“那是他们，我是我。每个人管好自己的事就好了。”</p><p class="text" style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">霍建华受访时提到，私下他不爱热闹，热爱演戏的他就用作品和粉丝互动，不过在外界瞩目下，甚至连没有笑容都会引发热议，霍建华则认为：“我不是看到谁都要笑，对吧？我是演戏的，不是卖笑的，不能这样要求，每个人都有自己的个性。”面对酸言酸语，霍建华态度坦然</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(13, 1, 8, '<p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">11月6日的中国<a class="a-tips-Article-QQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted;" href="http://ent.qq.com/movie/" target="_blank">电影</a>圈是被“比利·林恩”刷屏的一天。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">早上10点，<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="75294">李安</a>的新片《比利·林恩的中场战事》在北京悠唐博纳影城2号厅进行了首场4K/3D/120帧最高规格的媒体场放映。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">目前，全世界只有纽约、洛杉矶、北京、上海、台北5个城市中的5家影院的5个影厅能够满足这种播放要求。北京只有博纳优唐影城的2号厅，上海的则是上海影城的一号厅。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">作为李安导演的最新作品，以及他运用超前电影技术进行拍摄的实验性，本片承载了舆论巨大的期待。不过，本片此前已经在纽约电影节期间进行全球首映，北美媒体给予的评价，争议相当大。烂番茄新鲜度53%、专业影评聚合网站Metacritic的平均打分只有53分。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">是李安失手了？还是西方的媒体有失偏颇？</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"></p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><strong><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="《中场战事》观影体验报告 腾讯娱乐编辑部测评" src="http://img1.gtimg.com/ent/pics/hv1/40/160/2151/139909615.jpg"/></strong></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><strong>李安在北京首映礼接受媒体采访</strong></p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">正因为基于这样的评价，影片到底成色如何？所谓4K/3D/120帧到底是什么效果？答案就子在6日早上的悠唐影院，能够让全中国所有有影响力的电影人、媒体人士起个大早，一睹为快。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><strong>4K/3D/120帧到底什么样？前所未有的真实感</strong></p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">其实，要回答这个问题，只有一句老话：百闻不如一见。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(14, 1, 8, '<p class="text" style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">张一山更新微博上传了一段视频为<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="75571">杨紫</a>庆24岁的生日。</p><p class="text" style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">视频中，张一山先是为杨紫唱了一段生日歌，之后他说因为自己在拍戏所以没办法到现场为杨紫庆生。张一山还表示两人从12岁的彼此相识到12年后的现在彼此相知，他知道杨紫心里的苦，知道杨紫心里的乐。最后张一山还很Man的说道“就算全世界背叛你，我也会站在你身后背叛全世界”，并祝杨紫<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="225008">开开</a>心心每一天。张一山还在微博附文写道“都二十四了，找个好人就嫁了吧。。。要不他们老觉得咱俩有事儿。”</p><p class="text" style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">网友看后纷纷留言“实在不行，你俩凑合凑合得了”“真希望你俩能有点什么事儿”。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; display: block; max-width: 640px;" alt="杨紫24岁生日这天，张一山说愿意为她背叛全世界" src="http://inews.gtimg.com/newsapp_bt/0/758122778/641"/></p><p class="text image_desc" style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">微博截图</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(15, 1, 8, '<p class="titdd-Article" style="font: 14px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 12px 18px 10px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(243, 243, 243); -webkit-text-stroke-width: 0px;">蔡依林近年迷上翻糖蛋糕，早前曾组“皇后陛下”翻糖团队，年初参加Cake international比赛已取得成绩夺下银牌，今次再接再厉以偶像“梦露”为范本的作品，再下一城获得金奖。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="太强了！蔡依林做“梦露”翻糖蛋糕英国夺金奖 " src="http://img1.gtimg.com/ent/pics/hv1/166/147/2151/139906426.png"/></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="112401">蔡依林</a>做的翻糖蛋糕得奖</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(16, 1, 8, '<p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="叶璇晒证据怒斥保姆：上班第一天就洗坏白毛衣" src="http://img1.gtimg.com/ent/pics/hv1/56/154/2151/139908101.png"/></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="72642">叶璇</a>微博截图</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">叶璇和保姆的纠纷闹得沸沸扬扬。一方称被拖欠工资，另一方称保姆盗抢财物、毁坏物品。叶璇昨日（11月6日）发文让保姆坐等法院传票，今日又晒出证据，称保姆倒打一耙。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">今日（11月7日），叶璇晒出一件有明显污渍的毛衣，附文称“黑家政的证据很多，不胜枚举，都呈上法庭了。先看其中一件李明翠第一天上班时用84洗地水洗坏颜色的白色毛衣，当时家人对她没有半句责骂，但是她至今未赔偿，家人也并未追究。既然还要变<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="125063">本加</a>厉倒打一耙，那就上法庭一并追究吧。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(17, 1, 8, '<p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="沙溢晒儿子照片：一生最好的作品是安吉和鱼儿" src="http://img1.gtimg.com/ent/pics/hv1/54/148/2151/139906569.png"/></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">沙溢晒两个儿子的照片</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">沙溢晒一双儿子坐在一起的照片，并得意地称：“我这一生最好的作品就<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="93748">是安</a>吉和鱼儿！”</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">此照片曝光后，网友纷纷围观并留言表示羡慕沙溢的一对儿子，称：“你的福气，你两口子的福气，真的羡慕！”更有网友调侃道：“有组团去东北偷孩子的么？</p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"></p><p>&nbsp;</p>');
INSERT INTO `dr_1_news_data_0` VALUES(18, 1, 8, '<p class="titdd-Article" style="font: 14px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 12px 18px 10px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(243, 243, 243); -webkit-text-stroke-width: 0px;">徐若瑄5日凌晨在脸书分享儿子和咘咘的玩乐影片，只见咘咘坐在学步车里，而小V宝站在身后、踩着小步伐认真推车向前行。</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">&nbsp;</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="徐若瑄儿子男友力爆表 为咘咘推学步车超萌" src="http://img1.gtimg.com/ent/pics/hv1/214/147/2151/139906474.png"/></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">小V宝为咘咘推车</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">女星<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="94425">贾静雯</a>和<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="74553">徐若瑄</a>同样在去年8月产下宝贝儿女咘咘、小V宝（Dalton），两萌娃因妈妈偶尔的聚会不时相遇，常被网友拱着指腹为婚，受到大批喜爱。5日凌晨，徐若瑄再贴出两娃使用学步车的可爱互动，让大家直呼太萌啦！</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 2em; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">徐若瑄5日凌晨在脸书分享儿子和咘咘的玩乐影片，只见咘咘坐在学步车里，而小V宝站在身后、踩着小步伐认真推车向前行。尽管中间不小心跌倒了，仍迅速站起身继续往前进，互动过<a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="432241">程中</a>，两个小朋友面露灿笑，玩得不亦乐乎。而徐若瑄也大赞儿子“是Strong man，真男人！”两个高人气萌娃再次碰面玩得如此开心，令网友再度高喊要他们多在一起当青梅竹马，相当期待两人能结成娃娃亲。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(19, 1, 8, '<p class="titdd-Article" style="font: 14px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 12px 18px 10px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(243, 243, 243); -webkit-text-stroke-width: 0px;">今天上午，张伦硕接受记者采访，不仅分享了婚礼前的感受，还称“太太给我打九十分” ，句句甜言蜜语都呼应着钟丽缇前几天的那句 “亲爱的们，对不起我这几天秀恩爱撒狗粮，我要结婚了！”</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="张伦硕：我和钟丽缇一见钟情 不担心婆媳关系" src="http://img1.gtimg.com/ent/pics/hv1/225/123/2151/139900365.png"/></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="79555">钟丽缇</a>和张伦硕（资料图）</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(20, 1, 8, '<p class="titdd-Article" style="font: 14px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 12px 18px 10px; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(243, 243, 243); -webkit-text-stroke-width: 0px;">今天上午，张伦硕接受记者采访，不仅分享了婚礼前的感受，还称“太太给我打九十分” ，句句甜言蜜语都呼应着钟丽缇前几天的那句 “亲爱的们，对不起我这几天秀恩爱撒狗粮，我要结婚了！”</p><p style="font: 16px/28px 微软雅黑, Arial, Helvetica, sans-serif; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><img style="border: 0px currentColor; border-image: none; vertical-align: bottom; max-width: 640px;" alt="张伦硕：我和钟丽缇一见钟情 不担心婆媳关系" src="http://img1.gtimg.com/ent/pics/hv1/225/123/2151/139900365.png"/></p><p style="font: 10pt/28px 宋体; margin: 0px 0px 28px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><a class="nameStarQQ" style="outline: 0px; color: rgb(0, 0, 0); text-decoration: none; border-bottom-color: rgb(83, 109, 166); border-bottom-width: 1px; border-bottom-style: dotted; white-space: nowrap;" href="javascript:void(0)" nameid="79555">钟丽缇</a>和张伦硕（资料图）</p><p>&nbsp;</p>');
INSERT INTO `dr_1_news_data_0` VALUES(21, 1, 9, '<p>新华社金门11月6日电&nbsp;2016两岸企业家峰会年会6日在金门举行开幕式。两岸企业家、专家指出，有远见的企业家已经看到两岸优势互补、融合发展的潮流浩浩荡荡，看到两岸产业合作共同发展的远大前景。在新形势下，两岸企业家应该对市场负责、对社会负责，更应为两岸关系的和平稳定发展作出贡献。</p><p>　　峰会资讯家电产业合作推动小组台湾方面召集人许胜雄表示，两岸业界过去几年在共同推动产业发展方向、增加合作、联合开拓新市场等方面取得了显著成效。随着5G时代的来临和全球市场竞争日趋激烈，如何持续深化两岸产业的合作非常关键。</p><p>　　他建议，两岸企业家峰会应该持续强化作为推动两岸企业合作及进行两岸经贸策略对话的功能定位，成为长效、常态性的交流平台；协同创新，以合作促进两岸产业转型升级，促进两岸产业融合；共筑青年创业策略，给两岸青年提供创业沃土等。他指出，台湾要抓住大陆“一带一路”战略机遇，努力拓展新兴国际市场。</p><p>　　峰会宏观经济交流推进小组大陆方面召集人王春正指出，随着互联网、物联网、智能制造及其应用等的兴起，未来两岸产业合作会有更多机遇。在新的形势下，需要进一步创新，不断开拓新思路、寻找新商机，创造和搭建新平台。</p><p>　　他提出，两岸在五个方面孕育着巨大合作商机，包括：“一带一路”建设将为两岸经济扩大合作、融合发展提供广阔空间；“十三五”新商机将不断涌现，特别是大陆产业转型升级、消费结构优化速度加快，将为两岸产业合作、创新、共拓市场提供新的动力；两岸服务经济合作前景可期，建议选择具有互补基础和市场需求的科技服务、现代物流、健康养老等产业，作为合作重点领域；地方和基层合作的作用会日益突出；台湾青年到大陆就学、就业、创业的环境将不断完善。今后，大陆会努力为两岸青年创造更多的机会，切实推动两岸青年的交流与合作，让青年真正成为经贸合作的生力军。</p><p>　　在会上，台湾青年企业家许毓仁分享了自己的创业经历。他说，青年在两岸未来发展合作中扮演着重要的角色，“是最大的公约数”，新一代的两岸青年要有共同的担当，积极参与社会发展，成为改变未来的力量。</p><p>　　大陆TCL集团总裁薄连明表示，在移动互联网时代，两岸产业合作应向技术转移和共同研发方向发展。两岸在产品技术创新、提升智能制造水平、拓展国际市场等方面有着广阔合作前景、空间。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(22, 1, 9, '<p>新网11月7日电 \r\n(何路曼)一波未平一波又起，韩国三星手机爆炸事件还未走出人们的视线，总统朴槿惠的“闺蜜”崔顺实干政丑闻又在韩国政坛掀起轩然大波。众所周知，崔顺实是风暴的核心，但随着韩国检方的深入调查，牵涉到总统“亲信干政门”的绝非仅崔顺实一人，而是一个以其为中心铺展开来的巨大“干政网”。</p><p>　　深陷“亲信干政”丑闻后，朴槿惠在10月28日深夜指示以安钟范为首的青瓦台首席秘书官集体递交辞呈。9天后，前青瓦台总管经济事务的首席秘书安钟范和前青瓦台附属秘书郑虎成被批捕，距离真相水落石出的那天更近了一步。</p><p>　　除了主角崔顺实，搅动韩国政坛的“亲信门”还涉及哪些幕后核心人物？</p><p>　　<strong>朴槿惠的“政策大脑”——安钟范</strong></p><p style="text-align: center;" sizset="1" sizcache="2"><img style="width: auto; height: auto; visibility: visible; -ms-zoom: 1;" src="http://upload.taihainet.com/2016/1107/1478476275358.jpg" border="0" jquery1478483872279="25"/></p><p class="pictext" style="text-align: left; text-indent: 2em;">&nbsp;当地时间2016年11月4日，韩国，电视在直播总统朴槿惠讲话。韩国总统朴槿惠当天发表电视直播讲话，就好友崔顺实“幕后干政”事件再次表达立场。</p><p>　　2014年6月12日，朴槿惠更换4名首席秘书，其中身为新世界党议员的安钟范提名为经济首席秘书，被称为朴槿惠的“政策大脑”。当时的青瓦台发言人闵庚旭表示，安钟范是一名精通税收、财政和福利的经济专家，他在国家推进“经济改革三年规划”时会起到重大作用。</p><p>　　两年后，朴槿惠任命安钟范为政策调整首席秘书。而早在2012年12月朴槿惠当选韩国总统后，时任政策参谋的安钟范曾表示，朴槿惠跟随了以公平、正义为核心价值的时代变化。</p><p>　　一介青瓦台经济首席秘书在“干政门”中扮演何种角色？11月4日，安钟范被指控联手崔顺实，逼迫53家大企业为成立两大基金会捐款，金额达774亿韩元(约合人民币4.6亿元)。两大基金会分别是Mir财团和K体育财团，实际上由崔顺实主导成立并掌控。</p><p>　　安钟范还被指控深入介入K体育财团，要求乐天、SK、POSCO等企业集团再次出资，甚至直接给POSCO会长打电话要求为K体育财团捐款，为崔顺实经营的公司“THE \r\nBLUE K”的盈利项目添力。另外，他还涉嫌介入“总统亲信干政案”的另一名涉案人员车恩泽逼迫某家广告公司转让收购对象公司股权一事。</p><p>　　当地时间6日清晨，检方以涉嫌滥用职权、强迫交易批捕安钟范，首尔中央地方法院认为其犯罪事实明确，逮捕理由和必要性充分，因此签发检方针对安钟范提请的逮捕令。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(23, 1, 9, '<p style="text-align: center;" sizset="1" sizcache="2"><img style="width: auto; height: auto; visibility: visible; -ms-zoom: 1;" src="http://upload.taihainet.com/2016/1107/1478474526465.jpg" border="0" jquery1478483899145="25"/></p><p>　　据台湾《联合报》11月6日报道&nbsp;台北高等行政法院周五裁定，“不当党产委员会”9月间冻结国民党4.68亿元（新台币，下同）资金的行政处分不合法，诉讼确定前国民党可动支款项。国民党昨天表示，这些都不影响党将启动的募款与瘦身计划，目前有朝党工人数400人的精简目标努力，而党对未来发展仍无法乐观。</p><p>　　国民党党务人士表示，党主席洪秀柱最快本周起，将再启动“六都”小额募款晚会，前往台中市与台南市争取民众支持。此外，预计年底前，将现行近800位党工的庞大党务组织，比照民进党，朝400人的规模瘦身，让党从明年起能短小精干。</p><p>　　前天台北高等行政法院裁定，“不当党产委员会”行政处分合法性有疑义，判定终审确定前，冻结国民党本票的行政处分应停止执行。对于这项裁定，党务人士昨天表示，等收到高等行政法院裁定书后，会立刻向“不当党产委员会”要求解冻遭冻结提领的九张支票。但党务人士也坦言，由于全案仍可抗告，已有心理准备本票要二审定谳后才能解冻，目前仍与律师做最后沙盘推演。</p><p>　　若遭冻结支票能顺利解冻，党务人士坦言，想到过去“不当党产委员会”不顾法律与法理规范的恶意抄家，这次应该会尽速将支票完成兑领，避免“不当党产委员会”再恶意钳制。</p><p>　　有基层党工反映，党推动募缴特别党费与募款后不久，已有9000万无息借款帮忙纾困。是否仍继续推动特别党费，党务人士回应，以党目前的财务状况，财源进账当然是多多益善。</p><p>　　党务人士强调，国民党财务重整与组织改造，都要继续推动，组织改造、瘦身幅度会很大，而且整并不会只牵涉一两个部门。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(24, 1, 9, '<p>中国台湾网11月7日讯&nbsp; \r\n据台湾《中国时报》报道，台当局“卫福部”及“农委会”今（7日）将向“立院卫环委员会”报告福岛5县核灾食品赴日勘查报告，未来拟比照欧美韩等地区做法，针对高风险食品进行管制，但解除对区域管制，其中福岛暂不解禁，其余4县（群马、栃木、茨城、千叶）可优先开放进口，今将与“立委”先行沟通。“蓝委”质疑项目报告是为核灾食品开放铺路，痛批“卫福部”帮核灾食品背书。</p><p>　　据报道，福岛核灾5县市食品是否开放进口引发各界关注。这次报告攸关“府”“院”高层评估对福岛5县市核灾食品解禁的关键指标。是否要分二阶段开放？福岛先暂不解禁，其余4县市先解禁？“农委会副主委”陈吉仲称，要先确定是否要调整成针对高风险产品管制，此一前提确立，才会进一步针对区域解禁。据悉，此方向是高层腹案之一。</p><p>　　陈吉仲表示，今天将向“立法院”报告八月组团赴日考察结果信息，日本境内稽查结果，及各地针对日本核灾食品管制情形进行报告。</p><p>　　“蓝委”质疑项目报告是为核灾食品开放铺路，痛批“卫福部”帮核灾食品背书。“立委”蒋万安痛批，报告从头到尾未见“卫福部”针对核灾食品对人体的健康影响评估，只一面倒的说，日方检验没问题，超标个案数极少，“这不是背书，甚么才是背书。”</p><p>　　“立委”李彦秀说，这根本就是霸王硬上弓！民进党特地安排这场项目报告，想要等同完成程序，目的就是为开放日本核灾食品铺路。</p><p>　　林口长庚医院临床毒物科主任颜宗海表示，站在医师的角度，若仍有部分日本食品检出超标的辐射值，台当局应该维持目前的边境管制模式。倘若未来真的要开放，应由岛内单位主动检验，整理数据，并召开专家会议。（中国台湾网 \r\n李宁）</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(25, 1, 9, '<p style="text-align: center;" sizset="1" sizcache="2"><img style="width: auto; height: auto; visibility: visible; -ms-zoom: 1;" src="http://upload.taihainet.com/2016/1107/1478476131971.jpg" border="0" jquery1478483974798="25"/></p><p>　　今天迎来“立冬”节气，但厦门却仍处于“夏天模式”，冬天还挺遥远。今天的天气以多云为主，白天气温在23℃-27℃。</p><p>　　不过，立冬过后，冷空气活动开始频繁，明显的降温、大风天气将常至。预计，明天晚上新一股冷空气的前锋将抵达厦门，风力加强。后天气温将跳水，最高温会从28℃直降到21℃。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(26, 1, 9, '<p style="text-align: center;">　　<span style="font-size: 0px;">马英九。（网络图）</span></p><p>　　中国台湾网11月7日讯&nbsp; \r\n据台湾“东森新闻云”报道，近期传出绿营浩浩荡荡地列出所谓的“八大案”，要追杀前台湾地区领导人马英九。前马英九办公室副秘书长罗智强表6日表示，追杀马英九的号角已响起来，绿营除了采取“讼海策略”，对马英九进行扑天盖地的滥告，绿营和绿媒更全面透过各种偏颇的言论，营造马英九有罪的社会氛围，以为司法清算的脏步进行先期的“洗风向工程”。</p><p>　　罗智强6日晚间在脸谱网（Facebook）撰文表示，马英九当然不是完人，施政也不是没有缺点。但在当今政坛，比起其他政治人物，尤其是绿营政客，马英九的清廉与自持操守，如果是第二名，“我怀疑还有第一名存在”。</p><p>　　“他的清廉，是我这些年当他幕僚，亲眼见证”，罗智强说，今天如果民进党滥用司法成功追杀马英九，这滥冤义人的血刃刀釜，下一刻就会锁上我们每一个人的咽喉！如果一个正直清廉的人，也被罗织以莫须有的罪名，以冤坐之，也就是这个执政者自取灭亡的时候。（中国台湾网 \r\n李宁）</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(27, 1, 9, '<p>中新社北京11月6日电 (记者 \r\n阮煜琳)中国东北、华北和华东地区近日相继爆发重污染天气，从哈尔滨开始，直至山东半岛、江苏和安徽北部，影响范围波及6省区30多个城市，跨越1600多公里，多个城市空气质量爆表。中国环境保护部6日表示，此次空气污染程度之重、影响范围之广为历年少有。工业排放、机动车排放、冬季燃煤采暖这三大因素是此轮大范围空气重污染天气爆发的“元凶”。</p><p style="text-align: center;" sizset="1" sizcache="2"><img style="width: auto; height: auto; visibility: visible; -ms-zoom: 1;" src="http://upload.taihainet.com/2016/1107/1478473951625.jpg" border="0" jquery1478484043061="25"/></p><p class="pictext" style="text-align: left; text-indent: 2em;">资料图 \r\n11月5日，一场“鹅毛大雪”将吉林长春“涂成”白色，与此同时，静稳的大气条件使得连日袭击这里的雾霾无法消散，截至当日8时，长春市区PM2.5浓度达到358微克/立方米，空气质量状况达到污染级别最高的“严重污染”。张瑶 \r\n摄</p><p>　　<strong>极端重污染笼罩30多个城市东北十城爆表</strong></p><p>　　中国环境监测总站大气室主任宫正宇6日晚对记者说，11月2日至6日，中国东北、华北和华东地区出现大范围重污染过程，东北地区相继有10个城市的空气质量指数(AQI)爆表。</p><p>　　在空气检测中，空气质量指数设置的最高数值为500，超过500的即为爆表。</p><p>　　其中，哈尔滨市污染最为严重，4日的PM2.5日均值和小时值分别达到每立方米704微克和每立方米1281微克，大庆市PM2.5小时值也超过每立方米1000微克。</p><p>　　5日夜间至6日上午，受东北地区污染传输影响，山东省烟台、潍坊、青岛、日照、枣庄，江苏省徐州、宿迁，安徽省淮北市、亳州市相继出现重度以上污染。京津冀及周边地区重污染过程则主要集中在河北、北京、天津和山西等地，其中山西多个城市出现长时间重污染。</p><p>　　大范围重污染“元凶”：工业和机动车排放及冬季采暖</p><p>　　“此次出现大范围重污染天气的原因，主要是大气污染物排放量过大，而不利的气象条件是重要诱因。”中国环境科学研究院研究员柴发合对记者说，东北地区冬季发生大范围极重污染天气过程，已经连续出现了4年。当地冬季燃煤采暖和生物质燃烧排放，是导致此次区域性大范围重污染的“元凶”。</p><p>　　而此次京津冀地区重污染的主要来源是工业和机动车排放，有机组分和硝酸盐仍是本次过程中PM2.5的主要组分。</p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(28, 1, 10, '<p><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">半岛都市报11月6日讯　记者6日从市环保部门获悉,10月份青岛市区空气质量优良率达到了100%,同比升高9.7个百分点,为2013年实施新《环境空气质量标准》以来历史同期最好水平,首次实现同期全月优良。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　按照空气质量综合指数评价,各区空气质量由好到差排名依次为:市南(3.26)、崂山(3.28)、城阳(3.54)、黄岛(3.71)、李沧(4.05)、市北(4.24)。另外,四市空气质量优良率,即墨为93.6%,其余三市均为100.0%；空气质量综合指数排名由好到差依次是:胶州(3.68)、平度(3.74)、莱西(3.78)、即墨(4.09)。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　市区环境空气中,各项污染物全部达标。同比,PM2.5降低33.3%、PM10降低32.6%。自今年7月以来,已连续4个月实现PM2.5、PM10等月均浓度达标,其中六项污染物均为2013年以来的同期最好水平。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　另外,本月六区各项污染物全部达标,且已连续四个月实现PM2.5浓度全部达标,四市已连续三个月实现PM10浓度全部达标。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　另据了解,近期本市不断加强大气污染综合防治工作力度,深入开展燃煤锅炉超低排放污染治理,全面实施全覆盖网格化环境监管执法,大力开展重点区域扬尘污染专项整治行动,进一步强化全市重点行业挥发性有机物专项治理,有效控制了各类大气污染物的排放。同时,本月平均气温同比降低,降雨量、降雨频次明显增加,气象扩散条件较去年同期有所好转,也是空气质量改善的因素之一。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/></p>');
INSERT INTO `dr_1_news_data_0` VALUES(29, 1, 10, '<p class="imgArea" style="list-style: none; margin: 0px; padding: 0px; text-align: center; font-weight: normal;"><img style="border: 0px currentColor; border-image: none; max-width: 570px;" src="http://bdszb.bandao.cn/mobile/bddsb/20161107/A04_A04_3891.jpg"/></p><p class="imgComm" style="font: 12px/25px 宋体, sans-serif; list-style: none; margin: 0px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">井然有序的大家电仓库里,工人用机器替代手工拣货。</p><p><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　</span></p><p class="imgArea" style="list-style: none; margin: 0px; padding: 0px; text-align: center; font-weight: normal;"><img style="border: 0px currentColor; border-image: none; max-width: 570px;" src="http://bdszb.bandao.cn/mobile/bddsb/20161107/A04_A04_3892.jpg"/></p><p class="imgComm" style="font: 12px/25px 宋体, sans-serif; list-style: none; margin: 0px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">拣货员人手一“枪”,轻轻一扫即可核对货物。</p><p><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　</span></p><p class="imgArea" style="list-style: none; margin: 0px; padding: 0px; text-align: center; font-weight: normal;"><img style="border: 0px currentColor; border-image: none; max-width: 570px;" src="http://bdszb.bandao.cn/mobile/bddsb/20161107/A05_A05_3894.jpg"/></p><p class="imgComm" style="font: 12px/25px 宋体, sans-serif; list-style: none; margin: 0px; padding: 0px; text-align: center; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">为了效率,所有拣货员几乎都是一路奔跑着工作。</p><p><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　□文/半岛记者　景毅　图/半岛记者　刘延珉<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　自2009年起,每年寒风乍起之时,国内电商圈都会上演一场惊心动魄的“鏖战”。阿里、京东无疑是这场战争的“主角”。两家公司一个身居紫禁之巅,一个占据江南高地,虽然不是金庸笔下的武侠世界,可是两大高手的过招丝毫不比武侠逊色。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　2016年,双11走到了第8年。8年来,它确实在发挥着推动整个电商行业技术进步与产业链创新的作用,如此巨大的流量与交易量,不断提升着各大电商平台的系统承载量与稳定性,还有物流体系,从最初双11时的物流爆仓到如今的井然有序,这就是行业的进步。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　2016年“双11”大幕已经开启,每年“双11”不仅是一场消费者的狂欢盛宴,更是电商的一次年度终极考核。零售变革、技术升级和新生代用户需求变化,让走过七年之痒的“双11”今年有了诸多新花样。而这些种种动作背后,折射出的是传统电商对新业态的理解。如今的电商行业,流量为王的时代早已过去,消费者对品质和服务的精挑细选,倒逼电商不得不做出改变。</span></p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(30, 1, 10, '<p><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">免费体检就能成公司会员，再投资公司其他项目，每年可以获得高达30%的高回报。被告人张某在邦家租赁青岛分公司担任部门经理期间，通过发展客户投资等方式，先后向20余人非法集资共计220万元。而他背后所属的公司，截至目前在青岛地区累计骗取1200余人“投资款”，共计2.8亿元。张某因非法吸取公众存款被判刑2年，缓刑3年，其他涉案人员另案处理。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　</span><span class="chuT" style="font: bold 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">安排免费体检骗投资</span><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　嫌疑人蒋某于2002年12月到2008年10月期间，在广州市先后注册成立了“绿色世纪管理有限公司”“邦家租赁有限公司”等。期间绿色世纪青岛分公司、青岛东部分公司、青岛四方分公司相继成立，分别由孟某等人担任分公司负责人。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　绿色世纪、邦家租赁等3家公司在青岛设立的各分公司的工作人员，按照蒋某的要求，以保健品、有机食品销售及汽车、家电、家具等租赁业务为掩护，通过宣传、安排免费体检等方式发展社会群众成为公司的“嘉宾”“会员”，其中大部分为中老年人。此后再以会员制消费、区域合作、人民币资金借款等名义，虚构嘉宾、会员投资上述项目，可以定期获得年利率16%-30%不等的固定回报，合同期满可以返还本金等事实，诱骗社会群众与公司签定会员制消费合同、人民币资金借款合同等名目不同的合同，开展非法集资活动，骗取社会群众的“投资款”。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　其中，部分集资款用于上述公司负责人、总监、经理、主管、业务员的奖金和业绩提成，部分用于向投资群众支付到期本息，制造社会群众的投资款得到高额回报的假象，达到进一步诈骗社会群众“投资款”的目的。截至目前，在青岛地区累计骗取1200余人“投资款”共计2.8亿余元，其中，支付本息3000余万元，造成损失人民币2.5亿余元。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/></p>');
INSERT INTO `dr_1_news_data_0` VALUES(31, 1, 10, '<p><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">半岛都市报1月20日讯（记者 刘玉凡） 受益于互联网平台的迅猛发展，二手车交易增长迅速。近日，家住市北区的王先生反映，15日，他通过“人人车”平台购买了一辆长城二手车，第二天开车去胶州时暖风就开始冒出白气，着实把他吓得不轻，后来修理时才知道是水箱存在问题，维修师傅把水箱打开，发现里面都生锈了。为了修车，他又多花了1000多元。“我和人人车那边沟通，他们让我把修车的发票发过去。”王先生说道。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　18日下午，记者联系了王先生的销售顾问方先生，他告诉记者，王先生确实通过人人车平台购买了一辆长城二手车。记者又拨打了人人车的售后电话，工作人员查询后答复，王先生的车受损的是水箱，此事还在处理过程中。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　19日下午2时许，记者又联系了王先生的售后顾问陈先生，他表示公司一直在积极处理此事。“我们在对这辆长城车进行检测时，已经检测出车辆冷却系统存在高温等问题，并且在车辆档案里如实注明，同时如实告知了客户，后来王先生签完字后才办理了过户手续。”陈先生说道，“我们当时提醒他最好复检一下再上路，不要长时间开车，可他却把车开走了。”<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　陈先生说，他已经把王先生的情况上报给北京总部，目前公司正在研究处理此事。19日下午5时30分，王先生再次给本报打来电话，称对方已经打给他1000余元车辆维修费，他对处理结果感到满意，并对本报新闻帮的关注表示感谢。</span></p>');
INSERT INTO `dr_1_news_data_0` VALUES(32, 1, 10, '<p><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">“最近煤炭价格上来了，煤场的煤炭却已经连底煤都出手了，来求煤的企业业务员仍络绎不绝，真是一煤难求。”近日，在位于济宁市兖州区的兖矿集团兴隆庄煤矿，身为煤资发运科副科长的刘寨峰对最近煤炭价格的回涨深有感触。据悉，在经历了此前煤炭行业的寒冬之后，今年6月份以来，全国性煤炭价格开始上涨，到现在价格翻了一番。省内不少用煤企业都开始排队买煤，一些百万吨以上的用煤大户，甚至在今年八九月份派专人到山西、陕西等地的煤矿上蹲点，就为抢到煤源。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　本报记者马辉庄子帆张玉岩<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　</span><span class="chuT" style="font: bold 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">煤炭价格翻番企业跑外地“抢煤”</span><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　“我们企业从每年6月份开始组织煤源，当时的预算是每吨煤炭400元，而到煤炭进场的时候，落地价格已经涨到了800元，比预算翻了一番。”济南一大型热企工作人员介绍，今年6月份以来，我省煤炭价格开始上涨，到现在价格翻了一番。他透露说，由于煤炭价格上涨，我省一些百万吨以上的用煤大户，早在今年的八九月份就派专人到山西、陕西煤矿上蹲点，就为抢到煤源。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　济南清洁煤供应中标企业绿地泉景负责人介绍，现在济南市场上的劣质无烟煤块也已经卖到1185元到1200元一吨，不少中标供应清洁燃煤的小型企业因为负担不起，已经撂挑子不干了。公司供应的煤球原料一部分是朝鲜煤，一部分是山西晋城的无烟煤。中标时，朝鲜煤的价格是340元到350元一吨，而现在已经涨到了800元一吨，而且在丹东港已经买不到朝鲜煤，现在只能在日照港排队买朝鲜煤。山西晋城的无烟煤价格更高，已经到了870元，还在向着900元逼近。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　不光是济南，我省不少城市都出现了类似的情况。在济宁，负责煤炭销售发运的兴隆庄煤资发运科科长蒋年武介绍，今年7月份，兖矿集团内部的一家化工企业因缺煤生产全面告急，最终通过集团总部找到了兴隆庄煤矿。但当时兴隆庄煤矿的储煤仓库也是空的，最后没有办法，只能将仓库内长年积压的起底的陈煤用推土机耕出来。蒋年武说，现在经常有好几个企业守在矿上要煤，新用户上门求煤，因没有余量，除非到了锅炉濒临停火的状态，才予以发运。<span class="Apple-converted-space">&nbsp;</span></span></p>');
INSERT INTO `dr_1_news_data_0` VALUES(33, 1, 10, '<p class="imgArea" style="list-style: none; margin: 0px; padding: 0px; text-align: center; font-weight: normal;"><img style="border: 0px currentColor; border-image: none; max-width: 570px;" src="http://s.news.bandao.cn/news_upload/201611/20161107062843_8MA1DQMB.jpg"/></p><p><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　为转变工业发展方式、调整工业发展结构，进一步提高发展质量和效益，我市确定重点发展轨道交通、食品、机械装备、橡胶、电子信息、服装、石化、船舶海工、汽车、家电等十大新型工业千亿级产业，为稳增长、调结构、增效益提供重要支撑。近日，记者从市经信委采访了解到，今年前三季度我市十大新型工业千亿级产业规模产值接近万亿，整体呈现“九升一降”。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　</span><span class="chuT" style="font: bold 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">轨道交通产业增速最快</span><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　目前在中国的铁路网里，往来疾驰的高速列车，有一半以上都诞生在青岛的棘洪滩。这里曾经是一片荒芜的盐碱地，如今，它因为另一个名字——“动车小镇”开始变得广为人知。据统计，全国60%的高速动车、25%的城轨地铁都是青岛造，青岛已成为中国的“高铁心脏”，轨道交通装备产业正是我市推广的十大新型工业千亿级产业之一。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　从今年的统计数据来看，轨道交通装备产业是这十大千亿级产业链中增速最快的。 “动车小镇”集聚了中车四方股份、庞巴迪、威奥集团等100多家整车装备及零配件配套企业，其中规模以上企业26家，被认定为国家级新型工业化产业示范基地。我市计划到2020年，轨道交通产业产值达到1000亿元以上，到2030年达到2000亿元以上。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　记者了解到，今年前三季度，我市十大新型工业千亿级产业规模以上工业企业完成产值9991亿元，同比增长5.4%，占全市规模以上工业企业总产值的75.9%，高于去年同期0.9个百分点。轨道交通装备产业继续保持较快增长，船舶海工产业受航运市场低迷影响下降明显，总体呈现“九升一降”态势。除了轨道交通装备产业前三季度的产值同比增长11.5%外，汽车产业同比增长9.6%、电子信息产业同比增长8.8%、食品产业同比增长7.4%、家电产业同比增长5.6%、橡胶产业同比增长5.4%、石化产业同比增长4.2%、机械装备产业同比增长3.9%、服装产业同比增长3.1%，船舶海工产业同比下降3.2%。</span></p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(34, 1, 10, '<p class="imgArea" style="list-style: none; margin: 0px; padding: 0px; text-align: center; font-weight: normal;"><img style="border: 0px currentColor; border-image: none; max-width: 570px;" src="http://s.news.bandao.cn/news_upload/201611/20161107063637_F7UGQM01.jpg"/></p><p><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　距离今年双11还有不到一周的时间，对于今年26岁的张璨来说，现在正是他最忙碌的时候。做纸箱生意的他当天刚刚发完14000个纸箱，看着满满的一车货发走，他开始准备下一单货。习惯了网购，习惯了收发快递，习惯了收箱子、开箱子，其实一个小小的快递纸箱里竟然也藏着巨大的商机。连日来，记者走访我市多家为淘宝商家提供纸箱的经营者，听他们讲述了这里面的生意经。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　</span><span class="chuT" style="font: bold 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">每天能卖出上万个纸箱</span><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　张璨是山东科技大学的一名学生，学的是机械专业。见到张璨时，他带领着小伙伴们正在库房里整理他的纸箱。这名鼻梁上架着一副眼镜的小伙子，虽然浑身充满着书生气，可搬运起纸箱来时，却毫不含糊，身上体现出的更多的是一种吃苦耐劳的精神。 “今天发了14000个纸箱，都发到即墨去了，买家催得急，我们天天加班加点地干。 ”张璨说。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　“我也没想到自己会做纸箱生意。 ”张璨告诉记者，大学毕业后，他从莱阳老家来到青岛，一连找了两三份工作，但始终不如意。无意中，在原来工作的公司里，他发现很多淘宝商家缺少纸箱。 “我当时是在一家食品公司工作，负责给各个超市配送产品。因为跑的地方多，也跟不少电商有联系，发现他们经常找纸箱，所以想尝试着做纸箱供货的生意，没想到却变成主业了。 ”忙完手中的活，张璨坐下来跟记者聊了起来。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　</span><span class="chuT" style="font: bold 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">不怕苦挨家挨户送箱子</span><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"><span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　“我是2014年开始做纸箱生意的，那时别人都不认识我，也不知道我卖箱子，我就是进来货之后，挨家挨户地跑着去批发。 ”张璨告诉记者，当时，他跑过即墨、李沧、市北。 “我去过电子信息城，挨家挨户地问人家需不需要箱子，但我忽略了一点，这些商家经营的都是电脑配件，本身就有纸盒，他们怎么可能再去订纸箱。 ”张璨告诉记者，后来他在即墨小商品城里，找到了商机。 “小商品城里的东西以装饰品居多，大都需要纸箱，然后我挨家挨户问，开始是一两个商家找我要纸箱，慢慢的越来越多的人问我要纸箱，一个纸箱从最初的只赚两三毛钱，到后来发展成定制专用箱，我觉得我把一辈子的苦都吃完了。 ”张璨告诉记者，为了找到买家，他一个人大冬天在商场里啃过馒头，有时候甚至还要饿着肚子</span></p><p></p>');
INSERT INTO `dr_1_news_data_0` VALUES(35, 1, 10, '<p><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">半岛都市报11月6日讯　5日上午,国务院安委会第一巡查组进驻本市进行安全生产工作延伸巡查,并听取了本市安全生产工作汇报。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　巡查组组长、国家安全生产监督管理总局原副局长、煤矿安监局原局长赵铁锤出席工作汇报会并讲话,省委常委、市委书记李群主持会议,副省长张务锋出席会议,市委副书记、市长张新起汇报了本市安全生产工作情况。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　在听取了本市安全生产工作情况汇报后,赵铁锤对本市安全生产工作给予充分肯定。他强调,要深入学习领会近期习近平总书记、李克强总理等党中央、国务院领导同志的重要指示精神,切实把思想和行动统一到党中央、国务院的决策部署上来,始终把安全放在第一位,不断增强全社会的安全意识,着力提高安全生产和城市公共安全水平,保障人民群众生命财产安全。安全生产永远在路上,要深刻认识新的历史条件下安全生产工作,牢固树立安全发展理念,切实抓好安全生产各项工作,确保安全生产形势持续好转。要建立健全安全生产责任体系,切实做到党政同责、一岗双责、齐抓共管、失职追责,落实行业安全监管责任和企业安全生产主体责任,层层压实责任。要认真落实安全生产规划,加强顶层设计,扎实推进公共安全体系建设,为全面建成小康社会提供坚实安全保障。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　李群表示,将利用这次巡查的机会,全面掌握、深入检查本市安全生产工作,把各项工作做得更深入、更扎实、更有成效。强化认识,充分认识这次巡查的重要意义,坚决把思想和行动统一到中央部署要求上来,全力配合巡查工作,不折不扣落实巡查各项要求。摆出实情,用真实的情况迎接巡查,如实反映工作,不掩盖、不掩饰、不隐瞒,诚恳接受监督意见,营造良好监督氛围。狠抓整改,对巡查出的问题,建立工作台账,制定整改清单,压实责任、挂牌督办、限期整改,并做好“回头看”,切实做到件件有着落、事事有回音。<span class="Apple-converted-space">&nbsp;</span></span><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><br style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;"/><span style="font: 14px/25px 宋体, sans-serif; text-align: left; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-stroke-width: 0px;">　　在青期间,巡查组将综合运用听取汇报、座谈交流、查阅资料、实地检查等形式,全面巡查本市安全生产工作情况。<span class="Apple-converted-space">&nbsp;</span></span></p>');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_draft`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_favorite`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_flag`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_hits`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `dr_1_news_hits`
--

INSERT INTO `dr_1_news_hits` VALUES(1, 6, 6, 7, 7, 1);
INSERT INTO `dr_1_news_hits` VALUES(2, 1, 1, 1, 2, 1);
INSERT INTO `dr_1_news_hits` VALUES(3, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_news_hits` VALUES(10, 2, 1, 1, 1, 1);
INSERT INTO `dr_1_news_hits` VALUES(4, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_news_hits` VALUES(19, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_news_hits` VALUES(34, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_news_hits` VALUES(24, 2, 1, 3, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_html`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `dr_1_news_index`
--

INSERT INTO `dr_1_news_index` VALUES(1, 1, 7, 9, 1478252937);
INSERT INTO `dr_1_news_index` VALUES(2, 1, 7, 9, 1478252937);
INSERT INTO `dr_1_news_index` VALUES(3, 1, 7, 9, 1478482588);
INSERT INTO `dr_1_news_index` VALUES(4, 1, 7, 9, 1478482710);
INSERT INTO `dr_1_news_index` VALUES(5, 1, 7, 9, 1478482992);
INSERT INTO `dr_1_news_index` VALUES(6, 1, 7, 9, 1478483021);
INSERT INTO `dr_1_news_index` VALUES(7, 1, 7, 9, 1478483047);
INSERT INTO `dr_1_news_index` VALUES(8, 1, 7, 9, 1478483070);
INSERT INTO `dr_1_news_index` VALUES(9, 1, 7, 9, 1478483098);
INSERT INTO `dr_1_news_index` VALUES(10, 1, 7, 9, 1478483127);
INSERT INTO `dr_1_news_index` VALUES(11, 1, 8, 9, 1478483215);
INSERT INTO `dr_1_news_index` VALUES(12, 1, 8, 9, 1478483467);
INSERT INTO `dr_1_news_index` VALUES(13, 1, 8, 9, 1478483496);
INSERT INTO `dr_1_news_index` VALUES(14, 1, 8, 9, 1478483514);
INSERT INTO `dr_1_news_index` VALUES(15, 1, 8, 9, 1478483575);
INSERT INTO `dr_1_news_index` VALUES(16, 1, 8, 9, 1478483635);
INSERT INTO `dr_1_news_index` VALUES(17, 1, 8, 9, 1478483658);
INSERT INTO `dr_1_news_index` VALUES(18, 1, 8, 9, 1478483752);
INSERT INTO `dr_1_news_index` VALUES(19, 1, 8, 9, 1478483789);
INSERT INTO `dr_1_news_index` VALUES(20, 1, 8, 9, 1478483789);
INSERT INTO `dr_1_news_index` VALUES(21, 1, 9, 9, 1478483881);
INSERT INTO `dr_1_news_index` VALUES(22, 1, 9, 9, 1478483971);
INSERT INTO `dr_1_news_index` VALUES(23, 1, 9, 9, 1478483996);
INSERT INTO `dr_1_news_index` VALUES(24, 1, 9, 9, 1478484026);
INSERT INTO `dr_1_news_index` VALUES(25, 1, 9, 9, 1478484073);
INSERT INTO `dr_1_news_index` VALUES(26, 1, 9, 9, 1478484099);
INSERT INTO `dr_1_news_index` VALUES(27, 1, 9, 9, 1478484132);
INSERT INTO `dr_1_news_index` VALUES(28, 1, 10, 9, 1478484219);
INSERT INTO `dr_1_news_index` VALUES(29, 1, 10, 9, 1478484266);
INSERT INTO `dr_1_news_index` VALUES(30, 1, 10, 9, 1478484289);
INSERT INTO `dr_1_news_index` VALUES(31, 1, 10, 9, 1478484308);
INSERT INTO `dr_1_news_index` VALUES(32, 1, 10, 9, 1478484333);
INSERT INTO `dr_1_news_index` VALUES(33, 1, 10, 9, 1478484357);
INSERT INTO `dr_1_news_index` VALUES(34, 1, 10, 9, 1478484375);
INSERT INTO `dr_1_news_index` VALUES(35, 1, 10, 9, 1478484398);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_search`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

--
-- 转存表中的数据 `dr_1_news_search`
--

INSERT INTO `dr_1_news_search` VALUES('904d45cf9dfa3d512106418bb50b9716', 0, '{"keyword":""}', '', '35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,1,2', 1478943818);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_search_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

--
-- 转存表中的数据 `dr_1_news_search_index`
--

INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 34, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 35, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 33, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 32, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 31, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 30, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 29, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 28, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 27, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 26, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 25, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 24, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 23, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 22, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 21, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 20, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 19, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 18, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 17, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 16, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 15, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 14, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 13, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 12, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 11, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 10, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 9, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 8, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 7, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 6, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 5, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 4, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 3, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 1, 1478943818);
INSERT INTO `dr_1_news_search_index` VALUES('904d45cf9dfa3d512106418bb50b9716', 2, 1478943818);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_tag`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_news_verify`
--

CREATE TABLE IF NOT EXISTS `dr_1_news_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_page`
--

CREATE TABLE IF NOT EXISTS `dr_1_page` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL COMMENT '模块dir',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(255) NOT NULL COMMENT '单页名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有子类',
  `childids` varchar(255) NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `keywords` varchar(255) NOT NULL COMMENT 'seo关键字',
  `description` varchar(255) NOT NULL COMMENT 'seo描述',
  `content` mediumtext COMMENT '单页内容',
  `attachment` text COMMENT '附件信息',
  `template` varchar(30) NOT NULL COMMENT '模板文件',
  `urlrule` smallint(5) unsigned DEFAULT NULL COMMENT 'url规则id',
  `urllink` varchar(255) NOT NULL COMMENT 'url外链',
  `getchild` tinyint(1) unsigned NOT NULL COMMENT '将下级第一个菜单作为当前菜单',
  `show` tinyint(1) unsigned NOT NULL COMMENT '是否显示在菜单',
  `url` varchar(255) NOT NULL COMMENT 'url地址',
  `setting` mediumtext NOT NULL COMMENT '自定义内容',
  `displayorder` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`module`),
  KEY `pid` (`pid`),
  KEY `show` (`show`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(20) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=112 ;

--
-- 转存表中的数据 `dr_1_photo`
--

INSERT INTO `dr_1_photo` VALUES(56, 11, '小丸子', '49', '', '小丸子', 2, 1, 'admin', 9, '/index.php?c=show&id=56', 0, 0, '192.168.0.9', 1478487520, 1478487520, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(57, 11, '小丸子小丸子', '52', '', '小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=57', 0, 0, '192.168.0.9', 1478487586, 1478487586, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(58, 11, '小丸子小丸子', '52', '', '小丸子', 0, 1, 'admin', 9, '/index.php?c=show&id=58', 0, 0, '192.168.0.9', 1478487586, 1478487586, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(59, 11, '小丸子1', '57', '', '小丸子小丸子', 0, 1, 'admin', 9, '/index.php?c=show&id=59', 0, 0, '192.168.0.9', 1478487750, 1478487750, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(60, 11, '小丸子2', '62', '', '小丸子小丸子小丸子小丸子小丸子小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=60', 0, 0, '192.168.0.9', 1478487807, 1478487807, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(61, 11, '小丸子3', '66', '', '小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=61', 0, 0, '192.168.0.9', 1478487857, 1478487857, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(62, 11, '小丸子4', '70', '', '小丸子', 2, 1, 'admin', 9, '/index.php?c=show&id=62', 0, 0, '192.168.0.9', 1478487912, 1478487912, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(63, 11, '小丸子5', '75', '', '小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=63', 0, 0, '192.168.0.9', 1478487945, 1478487945, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(64, 12, '民风民俗1', '80', '', '民风民俗民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=64', 0, 0, '192.168.0.9', 1478488024, 1478488024, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(65, 12, '民风民俗2', '83', '', '民风民俗', 1, 1, 'admin', 9, '/index.php?c=show&id=65', 0, 0, '192.168.0.9', 1478489276, 1478489276, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(66, 12, '民风民俗3', '86', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=66', 0, 0, '192.168.0.9', 1478489331, 1478489331, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(67, 12, '民风民俗4', '89', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=67', 0, 0, '192.168.0.9', 1478489380, 1478489380, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(68, 12, '民风民俗5', '92', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=68', 0, 0, '192.168.0.9', 1478489630, 1478489630, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(69, 12, '民风民俗', '96', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=69', 0, 0, '192.168.0.9', 1478489747, 1478489747, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(70, 12, '民风民俗6', '99', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=70', 0, 0, '192.168.0.9', 1478489813, 1478489813, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(71, 12, '民风民俗7', '103', '', '民风民俗', 3, 1, 'admin', 9, '/index.php?c=show&id=71', 0, 0, '192.168.0.9', 1478489841, 1478489841, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(72, 17, '2016流行发型女', '107', '', '2016流行发型女', 1, 1, 'admin', 9, '/index.php?c=show&id=72', 0, 0, '192.168.0.9', 1478490019, 1478490019, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(73, 17, '2016流行发型女2', '109', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=73', 0, 0, '192.168.0.9', 1478490188, 1478490188, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(74, 17, '2016流行发型女3', '112', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=74', 0, 0, '192.168.0.9', 1478490213, 1478490213, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(75, 17, '2016流行发型女4', '116', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=75', 0, 0, '192.168.0.9', 1478490237, 1478490237, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(76, 17, '2016流行发型女5', '120', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=76', 0, 0, '192.168.0.9', 1478490320, 1478490320, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(77, 17, '2016流行发型女6', '124', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=77', 0, 0, '192.168.0.9', 1478490347, 1478490347, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(78, 17, '2016流行发型女7', '128', '', '2016流行发型女', 2, 1, 'admin', 9, '/index.php?c=show&id=78', 0, 0, '192.168.0.9', 1478490376, 1478490376, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(79, 17, '2016流行发型女8', '133', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=79', 0, 0, '192.168.0.9', 1478490465, 1478490465, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(80, 13, '搞笑图', '135', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=80', 0, 0, '192.168.0.9', 1478490513, 1478490513, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(81, 13, '搞笑图2', '140', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=81', 0, 0, '192.168.0.9', 1478490670, 1478490670, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(82, 13, '搞笑图3', '143', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=82', 0, 0, '192.168.0.9', 1478490738, 1478490738, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(83, 13, '搞笑图4', '147', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=83', 0, 0, '192.168.0.9', 1478490762, 1478490762, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(84, 13, '搞笑图5', '151', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=84', 0, 0, '192.168.0.9', 1478490795, 1478490795, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(85, 13, '搞笑图6', '155', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=85', 0, 0, '192.168.0.9', 1478490821, 1478490821, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(86, 13, '搞笑图7', '157', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=86', 0, 0, '192.168.0.9', 1478490842, 1478490842, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(87, 13, '搞笑图8', '160', '', '搞笑图', 1, 1, 'admin', 9, '/index.php?c=show&id=87', 0, 0, '192.168.0.9', 1478490864, 1478490864, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(88, 14, '灵感创意', '164', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=88', 0, 0, '192.168.0.9', 1478490960, 1478490960, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(89, 14, '灵感创意2', '168', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=89', 0, 0, '192.168.0.9', 1478491106, 1478491106, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(90, 14, '灵感创意3', '172', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=90', 0, 0, '192.168.0.9', 1478491129, 1478491129, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(91, 14, '灵感创意4', '175', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=91', 0, 0, '192.168.0.9', 1478491184, 1478491184, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(92, 14, '灵感创意5', '177', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=92', 0, 0, '192.168.0.9', 1478491208, 1478491208, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(93, 14, '灵感创意6', '180', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=93', 0, 0, '192.168.0.9', 1478491233, 1478491233, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(94, 14, '灵感创意7', '182', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=94', 0, 0, '192.168.0.9', 1478491268, 1478491268, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(95, 14, '灵感创意8', '184', '', '灵感创意', 1, 1, 'admin', 9, '/index.php?c=show&id=95', 0, 0, '192.168.0.9', 1478491289, 1478491289, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(96, 16, '装修效果图', '186', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=96', 0, 0, '192.168.0.9', 1478491366, 1478491366, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(97, 16, '装修效果图2', '190', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=97', 0, 0, '192.168.0.9', 1478491484, 1478491484, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(98, 16, '装修效果图2', '190', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=98', 0, 0, '192.168.0.9', 1478491484, 1478491484, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(99, 16, '装修效果图3', '191', '装修效果图', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=99', 0, 0, '192.168.0.9', 1478491539, 1478491539, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(100, 16, '装修效果图5', '195', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=100', 0, 0, '192.168.0.9', 1478491618, 1478491618, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(101, 16, '装修效果图6', '197', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=101', 0, 0, '192.168.0.9', 1478491643, 1478491643, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(102, 16, '装修效果图7', '199', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=102', 0, 0, '192.168.0.9', 1478492382, 1478492382, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(103, 16, '装修效果图8', '201', '', '装修效果图', 1, 1, 'admin', 9, '/index.php?c=show&id=103', 0, 0, '192.168.0.9', 1478492404, 1478492404, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(104, 15, '摄影作品', '203', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=104', 0, 0, '192.168.0.9', 1478492459, 1478492459, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(105, 15, '摄影作品2', '206', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=105', 0, 0, '192.168.0.9', 1478492616, 1478492616, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(106, 15, '摄影作品3', '211', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=106', 0, 0, '192.168.0.9', 1478492676, 1478492676, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(107, 15, '摄影作品4', '215', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=107', 0, 0, '192.168.0.9', 1478492698, 1478492698, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(108, 15, '摄影作品5', '221', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=108', 0, 0, '192.168.0.9', 1478492724, 1478492724, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(109, 15, '摄影作品6', '225', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=109', 0, 0, '192.168.0.9', 1478492747, 1478492747, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(110, 15, '摄影作品7', '230', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=110', 0, 0, '192.168.0.9', 1478492842, 1478492842, 0, 0, 0);
INSERT INTO `dr_1_photo` VALUES(111, 15, '摄影作品8', '236', '', '摄影作品', 1, 1, 'admin', 9, '/index.php?c=show&id=111', 0, 0, '192.168.0.9', 1478492870, 1478492870, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_buy`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_category`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_category_data`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_category_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_comment_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `dr_1_photo_comment_index`
--

INSERT INTO `dr_1_photo_comment_index` VALUES(1, 56, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(2, 57, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(3, 60, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(4, 61, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(5, 63, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(6, 65, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(7, 71, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(8, 72, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(9, 78, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(10, 87, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(11, 95, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(12, 103, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(13, 111, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);
INSERT INTO `dr_1_photo_comment_index` VALUES(14, 62, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_comment_my`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `images` text COMMENT '图片',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `dr_1_photo_data_0`
--

INSERT INTO `dr_1_photo_data_0` VALUES(56, 1, 11, '<p>小丸子</p>', '{"file":["50","51"],"title":["1-14112Q14R5","9cb5ff1f4134970a2d97468b95cad1c8a6865d17"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(57, 1, 11, '<p>小丸子</p>', '{"file":["53","54","55","56"],"title":["55de67ffa9e23209_jpg!200x200","786e6c061d950a7b4edcdb790ad162d9f3d3c90c","9cb5ff1f4134970a2d97468b95cad1c8a6865d17","55cc613d0212b816_jpg!200x200"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(58, 1, 11, '<p>小丸子</p>', '{"file":["53","54","55","56"],"title":["55de67ffa9e23209_jpg!200x200","786e6c061d950a7b4edcdb790ad162d9f3d3c90c","9cb5ff1f4134970a2d97468b95cad1c8a6865d17","55cc613d0212b816_jpg!200x200"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(59, 1, 11, '<p>小丸子</p><p>小丸子</p><p></p>', '{"file":["58","59","60","61"],"title":["55cc613d0212b816_jpg!200x200","55de67ffa9e23209_jpg!200x200","786e6c061d950a7b4edcdb790ad162d9f3d3c90c","55824602bc8d3046_jpg!200x200"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(60, 1, 11, '<p>小丸子</p><p>小丸子</p><p>小丸子</p><p>小丸子</p><p>小丸子</p><p>小丸子</p><p></p>', '{"file":["63","64","65"],"title":["20160811074413_VB4SA","e00fc878jw8erzl99mmf3j20u00u0407","20131023221024_dVS2M_thumb_200_0"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(61, 1, 11, '<p>小丸子</p><p></p>', '{"file":["67","68","69"],"title":["1-14112Q14R5","9cb5ff1f4134970a2d97468b95cad1c8a6865d17","55de67ffa9e23209_jpg!200x200"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(62, 1, 11, '<p>小丸子</p><p></p>', '{"file":["71","72","73","74"],"title":["1-14112Q14R5","4bed2e738bd4b31cf7e8017885d6277f9f2ff819","9cb5ff1f4134970a2d97468b95cad1c8a6865d17","55de67ffa9e23209_jpg!200x200"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(63, 1, 11, '<p>小丸子</p><p></p>', '{"file":["76","77","78","79"],"title":["23-075730_845","55de67ffa9e23209_jpg!200x200","59c932d3d539b600f5160d2fef50352ac75cb751","531c66a6754ce602_jpg!200x200"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(64, 1, 12, '<p>民风民俗</p><p>民风民俗</p><p><br/></p>', '{"file":["81","82"],"title":["16772285_16772285_1356060253515_mthumb","1252374344215_mthumb"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(65, 1, 12, '<p>民风民俗</p>', '{"file":["84","85"],"title":["16772285_16772285_1356060252515_mthumb","16772285_16772285_1356060253515_mthumb"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(66, 1, 12, '<p>民风民俗</p>', '{"file":["87","88"],"title":["16772285_16772285_1356060253515_mthumb","1252374344215_mthumb"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(67, 1, 12, '<p>民风民俗</p>', '{"file":["90","91"],"title":["1252374344215_mthumb","20131212110511-1194663692"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(68, 1, 12, '<p>民风民俗</p>', '{"file":["93","94","95"],"title":["1252374344215_mthumb","20131212110511-1194663692","20150321000120-20333"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(69, 1, 12, '<p>民风民俗</p>', '{"file":["97","98"],"title":["20080727164228892","201204261554489254"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(70, 1, 12, '<p>民风民俗</p>', '{"file":["100","101","102"],"title":["201204261554489254","t018d061b5e655053da","u=2669148020"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(71, 1, 12, '<p>民风民俗</p>', '{"file":["104","105","106"],"title":["20080727164228892","201204261554489254","psj"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(72, 1, 17, '<p>2016流行发型女</p>', '{"file":["108"],"title":["_34423869907715406921904914816295740474"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(73, 1, 17, '<p>2016流行发型女</p>', '{"file":["110","111"],"title":["_34423869907715406921904914816295740474","28U593Z4L292"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(74, 1, 17, '<p>2016流行发型女</p>', '{"file":["113","114"],"title":["28U593Z4L292","728da9773912b31bee2452f68718367adbb4e1a1"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(75, 1, 17, '<p>2016流行发型女</p>', '{"file":["117","118","119"],"title":["28U593Z4L292","59c932d3d539b600f5160d2fef50352ac75cb751","728da9773912b31bee2452f68718367adbb4e1a1"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(76, 1, 17, '<p>2016流行发型女</p>', '{"file":["121","122","123"],"title":["728da9773912b31bee2452f68718367adbb4e1a1","576689_012358067_2","576689_191655002_2"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(77, 1, 17, '<p>2016流行发型女</p>', '{"file":["125","126","127"],"title":["576689_191655002_2","1960886_162120011328_2","1960886_163150036171_2"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(78, 1, 17, '<p>2016流行发型女</p>', '{"file":["129","130","131","132"],"title":["1960886_162120011328_2","1960886_163150036171_2","4049717_153408072905_2","c12835d92dabd5725a828521cd15e712"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(79, 1, 17, '<p>2016流行发型女</p>', '{"file":["134"],"title":["28U593Z4L292"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(80, 1, 13, '<p>搞笑图</p>', '{"file":["136","137","138"],"title":["1-150QH0260E08","02a98e89a082494e965d71f25ddf8224","03d5a1c379310a55595de454b74543a98326107c"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(81, 1, 13, '<p>搞笑图</p>', '{"file":["141","142"],"title":["02a98e89a082494e965d71f25ddf8224","03d5a1c379310a55595de454b74543a98326107c"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(82, 1, 13, '<p>搞笑图</p>', '{"file":["144","145","146"],"title":["1-150QH0260E08","02a98e89a082494e965d71f25ddf8224","03d5a1c379310a55595de454b74543a98326107c"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(83, 1, 13, '<p>搞笑图</p>', '{"file":["148","149","150"],"title":["1-150QH0260E08 - \\u526f\\u672c","659-1512011A952 - \\u526f\\u672c","02a98e89a082494e965d71f25ddf8224 - \\u526f\\u672c"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(84, 1, 13, '<p>搞笑图</p>', '{"file":["152","153","154"],"title":["03d5a1c379310a55595de454b74543a98326107c","659-1512011A952 - \\u526f\\u672c","201212281546"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(85, 1, 13, '<p>搞笑图</p>', '{"file":["156"],"title":["17200771510301532192"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(86, 1, 13, '<p>搞笑图</p>', '{"file":["158","159"],"title":["201212281546","20120702022248177"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(87, 1, 13, '<p>搞笑图</p>', '{"file":["161","162","163"],"title":["659-1512011A952","20120702022248177","p34814031"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(88, 1, 14, '<p>灵感创意</p>', '{"file":["165","166","167"],"title":["965359bd6e504f0d5218d9b2ec804d00","6821646_420524","8713157EACFE5D2707B70B689855F947"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(89, 1, 14, '<p>灵感创意</p>', '{"file":["169","170"],"title":["965359bd6e504f0d5218d9b2ec804d00","6821646_420524"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(90, 1, 14, '<p>灵感创意</p>', '{"file":["173","174"],"title":["6821646_420524","8713157EACFE5D2707B70B689855F947"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(91, 1, 14, '<p>灵感创意</p>', '{"file":["176"],"title":["163145166"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(92, 1, 14, '<p>灵感创意</p>', '{"file":["178","179"],"title":["163145166","1112094956_14080837523431n"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(93, 1, 14, '<p>灵感创意</p>', '{"file":["181"],"title":["004aeuItty6Qptp5f6kcc"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(94, 1, 14, '<p>灵感创意</p>', '{"file":["183"],"title":["03d5a1c379310a55595de454b74543a98326107c"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(95, 1, 14, '<p>灵感创意</p>', '{"file":["185"],"title":["1439783039664_000"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(96, 1, 16, '<p>装修效果图</p>', '{"file":["187","188"],"title":["9-160F6111A40-L","659-1512011A952 - \\u526f\\u672c"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(97, 1, 16, '<p>装修效果图</p>', '{"file":["189"],"title":["20110825_8a045c986f5a386ce066sJs1TdOC6QMu"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(98, 1, 16, '<p>装修效果图</p>', '{"file":["189"],"title":["20110825_8a045c986f5a386ce066sJs1TdOC6QMu"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(99, 1, 16, '<p>装修效果图</p>', '{"file":["194"],"title":["37499813_1408175629456"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(100, 1, 16, '<p>装修效果图</p>', '{"file":["196"],"title":["37499813_1408175642286"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(101, 1, 16, '<p>装修效果图</p>', '{"file":["198"],"title":["37499938_1408175869631"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(102, 1, 16, '<p>装修效果图</p>', '{"file":["200"],"title":["37499813_1408175642286"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(103, 1, 16, '<p>装修效果图</p>', '{"file":["202"],"title":["37499813_1408175642286"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(104, 1, 15, '<p>摄影作品</p>', '{"file":["204"],"title":["235113-1403260QZ056"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(105, 1, 15, '<p>摄影作品</p>', '{"file":["207","208","209","210"],"title":["330457-14031320362254","330487-14091606235982","11914137_165343253157_2","32491235_1024"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(106, 1, 15, '<p>摄影作品</p>', '{"file":["212","213","214"],"title":["15","235113-1403260QZ056","330457-14031320362254"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(107, 1, 15, '<p>摄影作品</p>', '{"file":["216","217","218","219","220"],"title":["15","39","235113-1403260QZ056","330457-14031320362254","330487-14091606235982"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(108, 1, 15, '<p>摄影作品</p>', '{"file":["222","223","224"],"title":["15","39","235113-1403260QZ056"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(109, 1, 15, '<p>摄影作品</p>', '{"file":["226","227","228","229"],"title":["15","39","97b58PICEn4_1024","715B9962452A"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(110, 1, 15, '<p>摄影作品</p>', '{"file":["231","232","233","234","235"],"title":["235113-1403260QZ056","330457-14031320362254","330487-14091606235982","11914137_165343253157_2","32491235_1024"]}');
INSERT INTO `dr_1_photo_data_0` VALUES(111, 1, 15, '<p>摄影作品</p>', '{"file":["237","238","239","240","241"],"title":["235113-1403260QZ056","330457-14031320362254","330487-14091606235982","11914137_165343253157_2","32491235_1024"]}');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_draft`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_favorite`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_flag`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_hits`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `dr_1_photo_hits`
--

INSERT INTO `dr_1_photo_hits` VALUES(56, 2, 2, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES(57, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(60, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(61, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(63, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(65, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(71, 3, 3, 4, 4, 1);
INSERT INTO `dr_1_photo_hits` VALUES(72, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(78, 2, 2, 3, 3, 1);
INSERT INTO `dr_1_photo_hits` VALUES(87, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(95, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(103, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(111, 1, 1, 2, 2, 1);
INSERT INTO `dr_1_photo_hits` VALUES(62, 2, 1, 3, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_html`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=112 ;

--
-- 转存表中的数据 `dr_1_photo_index`
--

INSERT INTO `dr_1_photo_index` VALUES(56, 1, 11, 9, 1478487520);
INSERT INTO `dr_1_photo_index` VALUES(57, 1, 11, 9, 1478487586);
INSERT INTO `dr_1_photo_index` VALUES(58, 1, 11, 9, 1478487586);
INSERT INTO `dr_1_photo_index` VALUES(59, 1, 11, 9, 1478487750);
INSERT INTO `dr_1_photo_index` VALUES(60, 1, 11, 9, 1478487807);
INSERT INTO `dr_1_photo_index` VALUES(61, 1, 11, 9, 1478487857);
INSERT INTO `dr_1_photo_index` VALUES(62, 1, 11, 9, 1478487912);
INSERT INTO `dr_1_photo_index` VALUES(63, 1, 11, 9, 1478487945);
INSERT INTO `dr_1_photo_index` VALUES(64, 1, 12, 9, 1478488024);
INSERT INTO `dr_1_photo_index` VALUES(65, 1, 12, 9, 1478489276);
INSERT INTO `dr_1_photo_index` VALUES(66, 1, 12, 9, 1478489331);
INSERT INTO `dr_1_photo_index` VALUES(67, 1, 12, 9, 1478489380);
INSERT INTO `dr_1_photo_index` VALUES(68, 1, 12, 9, 1478489630);
INSERT INTO `dr_1_photo_index` VALUES(69, 1, 12, 9, 1478489747);
INSERT INTO `dr_1_photo_index` VALUES(70, 1, 12, 9, 1478489813);
INSERT INTO `dr_1_photo_index` VALUES(71, 1, 12, 9, 1478489841);
INSERT INTO `dr_1_photo_index` VALUES(72, 1, 17, 9, 1478490019);
INSERT INTO `dr_1_photo_index` VALUES(73, 1, 17, 9, 1478490188);
INSERT INTO `dr_1_photo_index` VALUES(74, 1, 17, 9, 1478490213);
INSERT INTO `dr_1_photo_index` VALUES(75, 1, 17, 9, 1478490237);
INSERT INTO `dr_1_photo_index` VALUES(76, 1, 17, 9, 1478490320);
INSERT INTO `dr_1_photo_index` VALUES(77, 1, 17, 9, 1478490347);
INSERT INTO `dr_1_photo_index` VALUES(78, 1, 17, 9, 1478490376);
INSERT INTO `dr_1_photo_index` VALUES(79, 1, 17, 9, 1478490465);
INSERT INTO `dr_1_photo_index` VALUES(80, 1, 13, 9, 1478490513);
INSERT INTO `dr_1_photo_index` VALUES(81, 1, 13, 9, 1478490670);
INSERT INTO `dr_1_photo_index` VALUES(82, 1, 13, 9, 1478490738);
INSERT INTO `dr_1_photo_index` VALUES(83, 1, 13, 9, 1478490762);
INSERT INTO `dr_1_photo_index` VALUES(84, 1, 13, 9, 1478490795);
INSERT INTO `dr_1_photo_index` VALUES(85, 1, 13, 9, 1478490821);
INSERT INTO `dr_1_photo_index` VALUES(86, 1, 13, 9, 1478490842);
INSERT INTO `dr_1_photo_index` VALUES(87, 1, 13, 9, 1478490864);
INSERT INTO `dr_1_photo_index` VALUES(88, 1, 14, 9, 1478490960);
INSERT INTO `dr_1_photo_index` VALUES(89, 1, 14, 9, 1478491106);
INSERT INTO `dr_1_photo_index` VALUES(90, 1, 14, 9, 1478491129);
INSERT INTO `dr_1_photo_index` VALUES(91, 1, 14, 9, 1478491184);
INSERT INTO `dr_1_photo_index` VALUES(92, 1, 14, 9, 1478491208);
INSERT INTO `dr_1_photo_index` VALUES(93, 1, 14, 9, 1478491233);
INSERT INTO `dr_1_photo_index` VALUES(94, 1, 14, 9, 1478491268);
INSERT INTO `dr_1_photo_index` VALUES(95, 1, 14, 9, 1478491289);
INSERT INTO `dr_1_photo_index` VALUES(96, 1, 16, 9, 1478491366);
INSERT INTO `dr_1_photo_index` VALUES(97, 1, 16, 9, 1478491484);
INSERT INTO `dr_1_photo_index` VALUES(98, 1, 16, 9, 1478491484);
INSERT INTO `dr_1_photo_index` VALUES(99, 1, 16, 9, 1478491539);
INSERT INTO `dr_1_photo_index` VALUES(100, 1, 16, 9, 1478491618);
INSERT INTO `dr_1_photo_index` VALUES(101, 1, 16, 9, 1478491643);
INSERT INTO `dr_1_photo_index` VALUES(102, 1, 16, 9, 1478492382);
INSERT INTO `dr_1_photo_index` VALUES(103, 1, 16, 9, 1478492404);
INSERT INTO `dr_1_photo_index` VALUES(104, 1, 15, 9, 1478492459);
INSERT INTO `dr_1_photo_index` VALUES(105, 1, 15, 9, 1478492616);
INSERT INTO `dr_1_photo_index` VALUES(106, 1, 15, 9, 1478492676);
INSERT INTO `dr_1_photo_index` VALUES(107, 1, 15, 9, 1478492698);
INSERT INTO `dr_1_photo_index` VALUES(108, 1, 15, 9, 1478492724);
INSERT INTO `dr_1_photo_index` VALUES(109, 1, 15, 9, 1478492747);
INSERT INTO `dr_1_photo_index` VALUES(110, 1, 15, 9, 1478492842);
INSERT INTO `dr_1_photo_index` VALUES(111, 1, 15, 9, 1478492870);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_search`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_search_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_tag`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_photo_tag`
--

INSERT INTO `dr_1_photo_tag` VALUES(1, '装修效果图', 'zhuangxiuxiaoguotu', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_photo_verify`
--

CREATE TABLE IF NOT EXISTS `dr_1_photo_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_remote`
--

CREATE TABLE IF NOT EXISTS `dr_1_remote` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '远程附件类型',
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `exts` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='远程附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_share`
--

CREATE TABLE IF NOT EXISTS `dr_1_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `link_id` (`link_id`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='共享模块主表' AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `dr_1_share`
--

INSERT INTO `dr_1_share` VALUES(1, 'news', 7, '载能力也达到了14吨。在目前现役的大型', '10', 'e', '11月3日晚成功发射的长征五号运载火箭的近地轨道(LEO)运载能力高达25吨，地球同步转移轨道(GTO)运载能力也达到了14吨。在目前现役的大型运载火箭中，其运载能力已经可以比肩美俄欧等国航天巨头的现役主力运载火箭。...', 6, 1, 'admin', 9, '/index.php?c=show&id=1', 0, 0, '192.168.0.10', 1478252937, 1478256172, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(2, 'news', 7, '中国长五比肩全球现役最强火箭 还将研更强型号', '10', '', '11月3日晚成功发射的长征五号运载火箭的近地轨道(LEO)运载能力高达25吨，地球同步转移轨道(GTO)运载能力也达到了14吨。在目前现役的大型运载火箭中，其运载能力已经可以比肩美俄欧等国航天巨头的现役主力运载火箭。...', 1, 1, 'admin', 9, '/index.php?c=show&id=2', 0, 0, '192.168.0.10', 1478252937, 1478255296, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(3, 'news', 7, '美媒称美南海战略受创：“北京玩一手聪明外交牌”', '', '', '资料图：美国海军军舰在南海参考消息网11月7日报道 美媒称，多年来，美国及其盟国一直在努力遏制中国在南海的行动，同时中国也在稳步地在这个水域建设人工设施。美国《纽约时报》网站11月3日刊登题为《菲律宾渔民重...', 1, 1, 'admin', 9, '/index.php?c=show&id=3', 0, 0, '192.168.0.9', 1478482588, 1478482588, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(4, 'news', 7, '日美军演首增加新安保法内容 将练“离岛夺还”', '', '', '资料图：日美军演中新网11月7日电 (吴倩)本月7日，作为正在举行的“利剑”军演的一部分，日美将首次实施反映新安保法内容的联合演习。尽管战场上日本自卫队员伤亡的危险广遭诟病，但对于一直致力于推进该法乃至修改...', 1, 1, 'admin', 9, '/index.php?c=show&id=4', 0, 0, '192.168.0.9', 1478482710, 1478482710, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(5, 'news', 7, '韩称因韩执意部署萨德 中韩高层国防对话面临搁浅', '', '', '资料图：萨德反导系统“韩中国防高层对话全面停止”，韩联社6日称，受到“萨德”部署影响，韩国防长韩民求的访华计划和韩中国防战略对话，都因没有得到中方积极回应面临搁浅。韩联社6日称，去年在首尔举行的韩中防长...', 0, 1, 'admin', 9, '/index.php?c=show&id=5', 0, 0, '192.168.0.9', 1478482992, 1478482992, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(6, 'news', 7, '传美军黑客已待命网袭俄罗斯 俄专家：虚张声势', '', '', '资料图：美网络司令部内部工作场景“美国军事黑客已做好对俄罗斯发动网络战的准备。”5日，美国NBC新闻电视台援引情报部门的消息称：“美国军事黑客已经进入俄罗斯电网和电信部门，以及克里姆林宫指挥系统。美国政府...', 0, 1, 'admin', 9, '/index.php?c=show&id=6', 0, 0, '192.168.0.9', 1478483021, 1478483021, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(7, 'news', 7, '美媒评歼20：隐形能力不足为惧从一开始就输给F22', '', '', '资料图：歼20战机歼20战机在珠海航展首秀后，台湾《中时电子报》引述一篇刊登在CNN的评论文章称，军事专家贾斯汀·布朗克（Justin Bronk）表示歼-20的隐形能力并无法与F-22与F-35等美军战机相提并论。布朗克是英国皇...', 0, 1, 'admin', 9, '/index.php?c=show&id=7', 0, 0, '192.168.0.9', 1478483047, 1478483047, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(8, 'news', 7, '美前防长为何曾放言中国搞不出4代机：或被局座忽悠了', '', '', '资料图：歼20战机首飞发生在当时的美国防长盖茨访华之际珠海航展，J20 亮相大家都有心理准备，当时虽然没有百分百的确切消息，但三个方面可以表明 J20 将大概率亮相：一是因为早先就传出了J20将亮相的消息，且有两架...', 0, 1, 'admin', 9, '/index.php?c=show&id=8', 0, 0, '192.168.0.9', 1478483070, 1478483070, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(9, 'news', 7, '伊拉克政府军缩小对摩苏尔包围圈 将迎来与IS巷战', '', '', '资料图：伊拉克特种部队挺进摩苏尔伊拉克特种部队4日宣布夺取摩苏尔市的东部6个区，进一步缩小对极端组织“伊斯兰国”势力的包围圈。随着攻势深入，伊拉克特种部队正遭遇更顽强的抵抗。另一方面，“伊斯兰国”为拖延...', 0, 1, 'admin', 9, '/index.php?c=show&id=9', 0, 0, '192.168.0.9', 1478483098, 1478483098, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(10, 'news', 7, '印称巴军“违反停火协议”在克什米尔地区开火', '', '', '资料图：印巴边境哨兵据印度媒体Times Now11月5日报道，巴基斯坦违反停火协议，凌晨2点在克什米尔地区的krishna Ghati边境线附近开火。印度方面进行了回击...', 2, 1, 'admin', 9, '/index.php?c=show&id=10', 0, 0, '192.168.0.9', 1478483127, 1478483127, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(11, 'news', 8, '关于素颜、女儿、丈夫…杨幂在这篇专访全说了', '', '', '连续三周，杨幂每周六早上都能霸占微博热搜的第一名，即使作为明星这也很罕见，第一周上榜词是“杨幂素颜”，第二周是“杨幂吃西瓜”，第三周是“小糯米声音 杨幂”。无不与她参加的《真正男子汉2》有关。杨幂在节目...', 0, 1, 'admin', 9, '/index.php?c=show&id=11', 0, 0, '192.168.0.9', 1478483215, 1478483215, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(12, 'news', 8, '被批没保护家人不像男人 霍建华19字霸气回应', '', '', '11月6日报道，霍建华、林心如7月恋情修成正果，尽管夫妻俩对私生活低调，小俩口一举一动依旧备受瞩目，不过林心如近期屡遭酸民攻击，从逼婚、到咒她孕肚，霍建华懒理网友抹黑，却被酸不像男人，对此他也做出回应。霍...', 0, 1, 'admin', 9, '/index.php?c=show&id=12', 0, 0, '192.168.0.9', 1478483467, 1478483467, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(13, 'news', 8, '《中场战事》观影 120帧让肉体不由自主的哭了', '', '', '11月6日的中国电影圈是被“比利·林恩”刷屏的一天。早上10点，李安的新片《比利·林恩的中场战事》在北京悠唐博纳影城2号厅进行了首场4K/3D/120帧最高规格的媒体场放映。目前，全世界只有纽约、洛杉矶、北京、上海...', 0, 1, 'admin', 9, '/index.php?c=show&id=13', 0, 0, '192.168.0.9', 1478483496, 1478483496, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(14, 'news', 8, '杨紫24岁生日这天，张一山说愿意为她背叛全世界', '', '', '张一山更新微博上传了一段视频为杨紫庆24岁的生日。视频中，张一山先是为杨紫唱了一段生日歌，之后他说因为自己在拍戏所以没办法到现场为杨紫庆生。张一山还表示两人从12岁的彼此相识到12年后的现在彼此相知，他知道...', 0, 1, 'admin', 9, '/index.php?c=show&id=14', 0, 0, '192.168.0.9', 1478483514, 1478483514, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(15, 'news', 8, '太强了！蔡依林做“梦露”翻糖蛋糕英国夺金奖', '', '', '蔡依林近年迷上翻糖蛋糕，早前曾组“皇后陛下”翻糖团队，年初参加Cake international比赛已取得成绩夺下银牌，今次再接再厉以偶像“梦露”为范本的作品，再下一城获得金奖。蔡依林做的翻糖蛋糕得奖...', 0, 1, 'admin', 9, '/index.php?c=show&id=15', 0, 0, '192.168.0.9', 1478483575, 1478483575, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(16, 'news', 8, '叶璇晒证据怒斥保姆：上班第一天就洗坏白毛衣', '', '', '叶璇微博截图叶璇和保姆的纠纷闹得沸沸扬扬。一方称被拖欠工资，另一方称保姆盗抢财物、毁坏物品。叶璇昨日（11月6日）发文让保姆坐等法院传票，今日又晒出证据，称保姆倒打一耙。今日（11月7日），叶璇晒出一件有明...', 0, 1, 'admin', 9, '/index.php?c=show&id=16', 0, 0, '192.168.0.9', 1478483635, 1478483635, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(17, 'news', 8, '沙溢晒儿子照片：一生最好的作品是安吉和鱼儿', '', '', '沙溢晒两个儿子的照片沙溢晒一双儿子坐在一起的照片，并得意地称：“我这一生最好的作品就是安吉和鱼儿！”此照片曝光后，网友纷纷围观并留言表示羡慕沙溢的一对儿子，称：“你的福气，你两口子的福气，真的羡慕！”...', 0, 1, 'admin', 9, '/index.php?c=show&id=17', 0, 0, '192.168.0.9', 1478483658, 1478483658, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(18, 'news', 8, '徐若瑄儿子男友力爆表 为咘咘推学步车超萌', '', '', '徐若瑄5日凌晨在脸书分享儿子和咘咘的玩乐影片，只见咘咘坐在学步车里，而小V宝站在身后、踩着小步伐认真推车向前行。 小V宝为咘咘推车女星贾静雯和徐若瑄同样在去年8月产下宝贝儿女咘咘、小V宝（Dalton），两萌娃因...', 0, 1, 'admin', 9, '/index.php?c=show&id=18', 0, 0, '192.168.0.9', 1478483752, 1478483752, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(19, 'news', 8, '张伦硕：我和钟丽缇一见钟情 不担心婆媳关系', '', '', '今天上午，张伦硕接受记者采访，不仅分享了婚礼前的感受，还称“太太给我打九十分” ，句句甜言蜜语都呼应着钟丽缇前几天的那句 “亲爱的们，对不起我这几天秀恩爱撒狗粮，我要结婚了！”钟丽缇和张伦硕（资料图）...', 1, 1, 'admin', 9, '/index.php?c=show&id=19', 0, 0, '192.168.0.9', 1478483789, 1478483789, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(20, 'news', 8, '张伦硕：我和钟丽缇一见钟情 不担心婆媳关系', '', '', '今天上午，张伦硕接受记者采访，不仅分享了婚礼前的感受，还称“太太给我打九十分” ，句句甜言蜜语都呼应着钟丽缇前几天的那句 “亲爱的们，对不起我这几天秀恩爱撒狗粮，我要结婚了！”钟丽缇和张伦硕（资料图）...', 0, 1, 'admin', 9, '/index.php?c=show&id=20', 0, 0, '192.168.0.9', 1478483789, 1478483789, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(21, 'news', 9, '两岸在五方面孕育巨大合作商机', '', '', '新华社金门11月6日电 2016两岸企业家峰会年会6日在金门举行开幕式。两岸企业家、专家指出，有远见的企业家已经看到两岸优势互补、融合发展的潮流浩浩荡荡，看到两岸产业合作共同发展的远大前景。在新形势下，两岸企...', 0, 1, 'admin', 9, '/index.php?c=show&id=21', 0, 0, '192.168.0.9', 1478483881, 1478483881, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(22, 'news', 9, '一石激起千层浪：起底韩国“亲信门”关键人物', '', '', '新网11月7日电 (何路曼)一波未平一波又起，韩国三星手机爆炸事件还未走出人们的视线，总统朴槿惠的“闺蜜”崔顺实干政丑闻又在韩国政坛掀起轩然大波。众所周知，崔顺实是风暴的核心，但随着韩国检方的深入调查，牵涉...', 0, 1, 'admin', 9, '/index.php?c=show&id=22', 0, 0, '192.168.0.9', 1478483971, 1478483971, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(23, 'news', 9, '国民党将启动“瘦身”计划 800名党工拟砍半', '', '', '　　据台湾《联合报》11月6日报道 台北高等行政法院周五裁定，“不当党产委员会”9月间冻结国民党4.68亿元（新台币，下同）资金的行政处分不合法，诉讼确定前国民党可动支款项。国民党昨天表示，这些都不影响党将启...', 0, 1, 'admin', 9, '/index.php?c=show&id=23', 0, 0, '192.168.0.9', 1478483996, 1478483996, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(24, 'news', 9, '台当局拟解禁日本除福岛外4县市核灾食品 蓝营痛批', '', '', '中国台湾网11月7日讯  据台湾《中国时报》报道，台当局“卫福部”及“农委会”今（7日）将向“立院卫环委员会”报告福岛5县核灾食品赴日勘查报告，未来拟比照欧美韩等地区做法，针对高风险食品进行管制，但解除对区...', 2, 1, 'admin', 9, '/index.php?c=show&id=24', 0, 0, '192.168.0.9', 1478484026, 1478484026, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(25, 'news', 9, '立冬到 厦门的冬还挺远', '', '', '　　今天迎来“立冬”节气，但厦门却仍处于“夏天模式”，冬天还挺遥远。今天的天气以多云为主，白天气温在23℃-27℃。　　不过，立冬过后，冷空气活动开始频繁，明显的降温、大风天气将常至。预计，明天晚上新一股...', 0, 1, 'admin', 9, '/index.php?c=show&id=25', 0, 0, '192.168.0.9', 1478484073, 1478484073, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(26, 'news', 9, '罗智强：绿营启动&quot;洗风向&quot;工程 追杀马英九号角响起', '', '', '　　马英九。（网络图）　　中国台湾网11月7日讯  据台湾“东森新闻云”报道，近期传出绿营浩浩荡荡地列出所谓的“八大案”，要追杀前台湾地区领导人马英九。前马英九办公室副秘书长罗智强表6日表示，追杀马英九的号...', 0, 1, 'admin', 9, '/index.php?c=show&id=26', 0, 0, '192.168.0.9', 1478484099, 1478484099, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(27, 'news', 9, '中国爆发极端大范围重污染天气 三大因素为“元凶”', '', '', '中新社北京11月6日电 (记者 阮煜琳)中国东北、华北和华东地区近日相继爆发重污染天气，从哈尔滨开始，直至山东半岛、江苏和安徽北部，影响范围波及6省区30多个城市，跨越1600多公里，多个城市空气质量爆表。中国环境...', 0, 1, 'admin', 9, '/index.php?c=show&id=27', 0, 0, '192.168.0.9', 1478484132, 1478484132, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(28, 'news', 10, '10月青岛市区&quot;气质&quot;得满分 首次同期全月优良', '', '', '半岛都市报11月6日讯　记者6日从市环保部门获悉,10月份青岛市区空气质量优良率达到了100%,同比升高9.7个百分点,为2013年实施新《环境空气质量标准》以来历史同期最好水平,首次实现同期全月优良。 　　按照空气质量综...', 0, 1, 'admin', 9, '/index.php?c=show&id=28', 0, 0, '192.168.0.9', 1478484219, 1478484219, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(29, 'news', 10, '电商的&quot;双11&quot;求变之路:单调的打折促销成历史', '', '', '井然有序的大家电仓库里,工人用机器替代手工拣货。　　拣货员人手一“枪”,轻轻一扫即可核对货物。　　为了效率,所有拣货员几乎都是一路奔跑着工作。　　□文/半岛记者　景毅　图/半岛记者　刘延珉 　　自2009年起,...', 0, 1, 'admin', 9, '/index.php?c=show&id=29', 0, 0, '192.168.0.9', 1478484266, 1478484266, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(30, 'news', 10, '&quot;免费体检&quot;做饵非法集资220万 被告人被判刑', '', '', '免费体检就能成公司会员，再投资公司其他项目，每年可以获得高达30%的高回报。被告人张某在邦家租赁青岛分公司担任部门经理期间，通过发展客户投资等方式，先后向20余人非法集资共计220万元。而他背后所属的公司，截...', 0, 1, 'admin', 9, '/index.php?c=show&id=30', 0, 0, '192.168.0.9', 1478484289, 1478484289, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(31, 'news', 10, '&quot;人人车&quot;平台购买二手车 第二天暖风冒出白气', '', '', '半岛都市报1月20日讯（记者 刘玉凡） 受益于互联网平台的迅猛发展，二手车交易增长迅速。近日，家住市北区的王先生反映，15日，他通过“人人车”平台购买了一辆长城二手车，第二天开车去胶州时暖风就开始冒出白气，...', 0, 1, 'admin', 9, '/index.php?c=show&id=31', 0, 0, '192.168.0.9', 1478484308, 1478484308, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(32, 'news', 10, '一煤难求 济宁百万吨级用户到煤矿上蹲点抢煤', '', '', '“最近煤炭价格上来了，煤场的煤炭却已经连底煤都出手了，来求煤的企业业务员仍络绎不绝，真是一煤难求。”近日，在位于济宁市兖州区的兖矿集团兴隆庄煤矿，身为煤资发运科副科长的刘寨峰对最近煤炭价格的回涨深有感...', 0, 1, 'admin', 9, '/index.php?c=show&id=32', 0, 0, '192.168.0.9', 1478484333, 1478484333, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(33, 'news', 10, '前三季十大新型工业千亿级产业规模产值近万亿', '', '', '　　为转变工业发展方式、调整工业发展结构，进一步提高发展质量和效益，我市确定重点发展轨道交通、食品、机械装备、橡胶、电子信息、服装、石化、船舶海工、汽车、家电等十大新型工业千亿级产业，为稳增长、调结构...', 0, 1, 'admin', 9, '/index.php?c=show&id=33', 0, 0, '192.168.0.9', 1478484357, 1478484357, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(34, 'news', 10, '双11大战开始 小伙一天能卖1万个纸箱月赚3万', '', '', '　　距离今年双11还有不到一周的时间，对于今年26岁的张璨来说，现在正是他最忙碌的时候。做纸箱生意的他当天刚刚发完14000个纸箱，看着满满的一车货发走，他开始准备下一单货。习惯了网购，习惯了收发快递，习惯了...', 1, 1, 'admin', 9, '/index.php?c=show&id=34', 0, 0, '192.168.0.9', 1478484375, 1478484375, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(35, 'news', 10, '国务院安委会第一巡查组进驻青岛进行巡查', '', '', '半岛都市报11月6日讯　5日上午,国务院安委会第一巡查组进驻本市进行安全生产工作延伸巡查,并听取了本市安全生产工作汇报。 　　巡查组组长、国家安全生产监督管理总局原副局长、煤矿安监局原局长赵铁锤出席工作汇报...', 0, 1, 'admin', 9, '/index.php?c=show&id=35', 0, 0, '192.168.0.9', 1478484398, 1478484398, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(36, 'down', 2, '与总理同框：里加16+1诞生了两张“全家福”', '25', '', '中国-中东欧合作机制似乎与水结缘。“16+1”领导人会晤，从最初的多瑙河畔到去年的太湖之滨，如今又来到波罗的海。似乎巧合、更像隐喻的是：中国哲学讲究“水到渠成”，16+1合作，尤其是中东欧16国对推动基础设施和...', 5, 1, 'admin', 9, '/index.php?c=show&id=36', 0, 0, '192.168.0.9', 1478484450, 1478485038, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(37, 'down', 2, '一图感知习近平制度治党有多拼', '24', '', '一图感知习近平制度治党有多拼', 1, 1, 'admin', 9, '/index.php?c=show&id=37', 0, 0, '192.168.0.9', 1478484505, 1478485025, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(38, 'down', 2, '中国和欧洲的农民起义有何区别', '23', '', '中国和欧洲的农民起义有何区别1、古典文献中有“起义”一词，但无“农民起义”一词笔者使用“诸子百家中国哲学书电子化计划”检索，查询“农民起义”词条，所得结果为0；查询“起义”词条，则结果极多。如《水经注》...', 0, 1, 'admin', 9, '/index.php?c=show&id=38', 0, 0, '192.168.0.9', 1478484540, 1478485012, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(39, 'down', 2, '中国和欧洲的农民起义有何区别', '22', '', '中国和欧洲的农民起义有何区别1、古典文献中有“起义”一词，但无“农民起义”一词笔者使用“诸子百家中国哲学书电子化计划”检索，查询“农民起义”词条，所得结果为0；查询“起义”词条，则结果极多。如《水经注》...', 0, 1, 'admin', 9, '/index.php?c=show&id=39', 0, 0, '192.168.0.9', 1478484540, 1478484997, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(40, 'down', 2, '中央派组督察15省份换届风气 严禁拉票贿选', '21', '', '可通过电话网络短信信访举报据报道，中组部有关负责同志在动员部署时强调，督察工作要坚持从严从实，突出问题导向，对责任落实、教育宣传、监督察处、制度执行、“凡提四必”等方面情况进行“五个必查”，努力做到对...', 0, 1, 'admin', 9, '/index.php?c=show&id=40', 0, 0, '192.168.0.9', 1478484587, 1478484976, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(41, 'down', 2, '全球最富的20个国家 无中国', '20', '', '全球最富的20个国家 无中国英国智库列格坦研究所(Legatum Institute)发布了2016年“全球繁荣指数”，为这个世界上最繁荣的国家进行了排名。财富是判断一个国家繁荣程度的重要因素，但是在进行国家排名时列格坦研究所...', 0, 1, 'admin', 9, '/index.php?c=show&id=41', 0, 0, '192.168.0.9', 1478484605, 1478484951, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(42, 'down', 2, '中联办主任：绝不容许“港独”分子就任议员', '19', '', '中联办主任：绝不容许“港独”分子就任议员', 1, 1, 'admin', 9, '/index.php?c=show&id=42', 0, 0, '192.168.0.9', 1478484718, 1478484938, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(43, 'down', 2, '除了崔顺实，韩亲信干政事件还涉及哪些核心人物', '18', '', '除了崔顺实，韩亲信干政事件还涉及哪些核心人物', 3, 1, 'admin', 9, '/index.php?c=show&id=43', 0, 0, '192.168.0.9', 1478484734, 1478484808, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(44, 'fang', 3, '居家装修小户型 采光好拎包即住 诚租', '26', '', '居家装修小户型 采光好拎包即住 诚租', 1, 1, 'admin', 9, '/index.php?c=show&id=44', 0, 0, '192.168.0.9', 1478485238, 1478485238, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(45, 'fang', 3, '实地拍摄 豪华装修 高区 24小时保安', '28', '', '实地拍摄 豪华装修 高区 24小时保安实地拍摄 豪华装修 高区 24小时保安实地拍摄 豪华装修 高区 24小时保安实地拍摄 豪华装修 高区 24小时保安', 1, 1, 'admin', 9, '/index.php?c=show&id=45', 0, 0, '192.168.0.9', 1478485573, 1478485573, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(46, 'fang', 3, '地铁周边 11号线 独立一室户 适宜居家 干净 清爽', '30', '', '地铁周边 11号线 独立一室户 适宜居家 干净 清爽地铁周边 11号线 独立一室户 适宜居家 干净 清爽地铁周边 11号线 独立一室户 适宜居家 干净 清爽', 2, 1, 'admin', 9, '/index.php?c=show&id=46', 0, 0, '192.168.0.9', 1478485717, 1478485717, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(47, 'fang', 3, '朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁', '31', '', '朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁朝南采光好 精装全配带厅一室户 干净舒适 多套急租 近地铁', 1, 1, 'admin', 9, '/index.php?c=show&id=47', 0, 0, '192.168.0.9', 1478485812, 1478485812, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(48, 'fang', 3, '中环一号精装 看房方便 电梯9楼 优惠出租啦', '33', '', '中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦中环一号精装 看房方便 电梯9楼 优惠出租啦...', 1, 1, 'admin', 9, '/index.php?c=show&id=48', 0, 0, '192.168.0.9', 1478485973, 1478485973, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(49, 'fang', 3, '2号线精装改一室户,独立厨卫,可以做饭,拎包入住', '35', '', '2号线精装改一室户,独立厨卫,可以做饭,拎包入住2号线精装改一室户,独立厨卫,可以做饭,拎包入住2号线精装改一室户,独立厨卫,可以做饭,拎包入住', 2, 1, 'admin', 9, '/index.php?c=show&id=49', 0, 0, '192.168.0.9', 1478486073, 1478486073, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(50, 'fang', 3, '精装修带地暖，业主出国诚意出租，之前自主', '37', '', '精装修带地暖，业主出国诚意出租，之前自主精装修带地暖，业主出国诚意出租，之前自主精装修带地暖，业主出国诚意出租，之前自主精装修带地暖，业主出国诚意出租，之前自主...', 3, 1, 'admin', 9, '/index.php?c=show&id=50', 0, 0, '192.168.0.9', 1478486625, 1478486625, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(51, 'fang', 3, '大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房', '39', '', '大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房大宅风范城 13号地铁口 精装大两房 清爽干净 随时看房...', 1, 1, 'admin', 9, '/index.php?c=show&id=51', 0, 0, '192.168.0.9', 1478486743, 1478486743, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(52, 'fang', 3, '真实图片！假的不要钱！有窗户！超低价', '41', '', '真实图片！假的不要钱！有窗户！超低价真实图片！假的不要钱！有窗户！超低价真实图片！假的不要钱！有窗户！超低价真实图片！假的不要钱！有窗户！超低价...', 1, 1, 'admin', 9, '/index.php?c=show&id=52', 0, 0, '192.168.0.9', 1478486911, 1478486911, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(53, 'fang', 3, '3号线边上 干净清爽 欢迎来看', '43', '', '3号线边上 干净清爽 欢迎来看3号线边上 干净清爽 欢迎来看3号线边上 干净清爽 欢迎来看3号线边上 干净清爽 欢迎来看', 0, 1, 'admin', 9, '/index.php?c=show&id=53', 0, 0, '192.168.0.9', 1478487070, 1478487070, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(54, 'fang', 3, '电梯一房，业主诚租，要求女孩，要爱干净，2个人行！', '45', '', '电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯一房，业主诚租，要求女孩，要爱干净，2个人行！电梯...', 0, 1, 'admin', 9, '/index.php?c=show&id=54', 0, 0, '192.168.0.9', 1478487139, 1478487139, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(55, 'fang', 3, '租放心房,住安心家 温馨宜家装修,配置齐全,可看房', '47', '', '租放心房,住安心家 温馨宜家装修,配置齐全,可看房租放心房,住安心家 温馨宜家装修,配置齐全,可看房租放心房,住安心家 温馨宜家装修,配置齐全,可看房租放心房,住安心家 温馨宜家装修,配置齐全,可看房...', 4, 1, 'admin', 9, '/index.php?c=show&id=55', 0, 0, '192.168.0.9', 1478487217, 1478487217, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(56, 'photo', 11, '小丸子', '49', '', '小丸子', 2, 1, 'admin', 9, '/index.php?c=show&id=56', 0, 0, '192.168.0.9', 1478487520, 1478487520, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(57, 'photo', 11, '小丸子小丸子', '52', '', '小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=57', 0, 0, '192.168.0.9', 1478487586, 1478487586, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(58, 'photo', 11, '小丸子小丸子', '52', '', '小丸子', 0, 1, 'admin', 9, '/index.php?c=show&id=58', 0, 0, '192.168.0.9', 1478487586, 1478487586, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(59, 'photo', 11, '小丸子1', '57', '', '小丸子小丸子', 0, 1, 'admin', 9, '/index.php?c=show&id=59', 0, 0, '192.168.0.9', 1478487750, 1478487750, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(60, 'photo', 11, '小丸子2', '62', '', '小丸子小丸子小丸子小丸子小丸子小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=60', 0, 0, '192.168.0.9', 1478487807, 1478487807, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(61, 'photo', 11, '小丸子3', '66', '', '小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=61', 0, 0, '192.168.0.9', 1478487857, 1478487857, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(62, 'photo', 11, '小丸子4', '70', '', '小丸子', 2, 1, 'admin', 9, '/index.php?c=show&id=62', 0, 0, '192.168.0.9', 1478487912, 1478487912, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(63, 'photo', 11, '小丸子5', '75', '', '小丸子', 1, 1, 'admin', 9, '/index.php?c=show&id=63', 0, 0, '192.168.0.9', 1478487945, 1478487945, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(64, 'photo', 12, '民风民俗1', '80', '', '民风民俗民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=64', 0, 0, '192.168.0.9', 1478488024, 1478488024, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(65, 'photo', 12, '民风民俗2', '83', '', '民风民俗', 1, 1, 'admin', 9, '/index.php?c=show&id=65', 0, 0, '192.168.0.9', 1478489276, 1478489276, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(66, 'photo', 12, '民风民俗3', '86', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=66', 0, 0, '192.168.0.9', 1478489331, 1478489331, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(67, 'photo', 12, '民风民俗4', '89', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=67', 0, 0, '192.168.0.9', 1478489380, 1478489380, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(68, 'photo', 12, '民风民俗5', '92', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=68', 0, 0, '192.168.0.9', 1478489630, 1478489630, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(69, 'photo', 12, '民风民俗', '96', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=69', 0, 0, '192.168.0.9', 1478489747, 1478489747, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(70, 'photo', 12, '民风民俗6', '99', '', '民风民俗', 0, 1, 'admin', 9, '/index.php?c=show&id=70', 0, 0, '192.168.0.9', 1478489813, 1478489813, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(71, 'photo', 12, '民风民俗7', '103', '', '民风民俗', 3, 1, 'admin', 9, '/index.php?c=show&id=71', 0, 0, '192.168.0.9', 1478489841, 1478489841, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(72, 'photo', 17, '2016流行发型女', '107', '', '2016流行发型女', 1, 1, 'admin', 9, '/index.php?c=show&id=72', 0, 0, '192.168.0.9', 1478490019, 1478490019, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(73, 'photo', 17, '2016流行发型女2', '109', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=73', 0, 0, '192.168.0.9', 1478490188, 1478490188, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(74, 'photo', 17, '2016流行发型女3', '112', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=74', 0, 0, '192.168.0.9', 1478490213, 1478490213, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(75, 'photo', 17, '2016流行发型女4', '116', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=75', 0, 0, '192.168.0.9', 1478490237, 1478490237, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(76, 'photo', 17, '2016流行发型女5', '120', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=76', 0, 0, '192.168.0.9', 1478490320, 1478490320, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(77, 'photo', 17, '2016流行发型女6', '124', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=77', 0, 0, '192.168.0.9', 1478490347, 1478490347, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(78, 'photo', 17, '2016流行发型女7', '128', '', '2016流行发型女', 2, 1, 'admin', 9, '/index.php?c=show&id=78', 0, 0, '192.168.0.9', 1478490376, 1478490376, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(79, 'photo', 17, '2016流行发型女8', '133', '', '2016流行发型女', 0, 1, 'admin', 9, '/index.php?c=show&id=79', 0, 0, '192.168.0.9', 1478490465, 1478490465, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(80, 'photo', 13, '搞笑图', '135', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=80', 0, 0, '192.168.0.9', 1478490513, 1478490513, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(81, 'photo', 13, '搞笑图2', '140', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=81', 0, 0, '192.168.0.9', 1478490670, 1478490670, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(82, 'photo', 13, '搞笑图3', '143', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=82', 0, 0, '192.168.0.9', 1478490738, 1478490738, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(83, 'photo', 13, '搞笑图4', '147', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=83', 0, 0, '192.168.0.9', 1478490762, 1478490762, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(84, 'photo', 13, '搞笑图5', '151', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=84', 0, 0, '192.168.0.9', 1478490795, 1478490795, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(85, 'photo', 13, '搞笑图6', '155', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=85', 0, 0, '192.168.0.9', 1478490821, 1478490821, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(86, 'photo', 13, '搞笑图7', '157', '', '搞笑图', 0, 1, 'admin', 9, '/index.php?c=show&id=86', 0, 0, '192.168.0.9', 1478490842, 1478490842, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(87, 'photo', 13, '搞笑图8', '160', '', '搞笑图', 1, 1, 'admin', 9, '/index.php?c=show&id=87', 0, 0, '192.168.0.9', 1478490864, 1478490864, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(88, 'photo', 14, '灵感创意', '164', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=88', 0, 0, '192.168.0.9', 1478490960, 1478490960, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(89, 'photo', 14, '灵感创意2', '168', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=89', 0, 0, '192.168.0.9', 1478491106, 1478491106, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(90, 'photo', 14, '灵感创意3', '172', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=90', 0, 0, '192.168.0.9', 1478491129, 1478491129, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(91, 'photo', 14, '灵感创意4', '175', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=91', 0, 0, '192.168.0.9', 1478491184, 1478491184, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(92, 'photo', 14, '灵感创意5', '177', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=92', 0, 0, '192.168.0.9', 1478491208, 1478491208, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(93, 'photo', 14, '灵感创意6', '180', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=93', 0, 0, '192.168.0.9', 1478491233, 1478491233, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(94, 'photo', 14, '灵感创意7', '182', '', '灵感创意', 0, 1, 'admin', 9, '/index.php?c=show&id=94', 0, 0, '192.168.0.9', 1478491268, 1478491268, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(95, 'photo', 14, '灵感创意8', '184', '', '灵感创意', 1, 1, 'admin', 9, '/index.php?c=show&id=95', 0, 0, '192.168.0.9', 1478491289, 1478491289, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(96, 'photo', 16, '装修效果图', '186', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=96', 0, 0, '192.168.0.9', 1478491366, 1478491366, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(97, 'photo', 16, '装修效果图2', '190', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=97', 0, 0, '192.168.0.9', 1478491484, 1478491484, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(98, 'photo', 16, '装修效果图2', '190', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=98', 0, 0, '192.168.0.9', 1478491484, 1478491484, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(99, 'photo', 16, '装修效果图3', '191', '装修效果图', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=99', 0, 0, '192.168.0.9', 1478491539, 1478491539, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(100, 'photo', 16, '装修效果图5', '195', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=100', 0, 0, '192.168.0.9', 1478491618, 1478491618, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(101, 'photo', 16, '装修效果图6', '197', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=101', 0, 0, '192.168.0.9', 1478491643, 1478491643, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(102, 'photo', 16, '装修效果图7', '199', '', '装修效果图', 0, 1, 'admin', 9, '/index.php?c=show&id=102', 0, 0, '192.168.0.9', 1478492382, 1478492382, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(103, 'photo', 16, '装修效果图8', '201', '', '装修效果图', 1, 1, 'admin', 9, '/index.php?c=show&id=103', 0, 0, '192.168.0.9', 1478492404, 1478492404, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(104, 'photo', 15, '摄影作品', '203', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=104', 0, 0, '192.168.0.9', 1478492459, 1478492459, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(105, 'photo', 15, '摄影作品2', '206', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=105', 0, 0, '192.168.0.9', 1478492616, 1478492616, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(106, 'photo', 15, '摄影作品3', '211', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=106', 0, 0, '192.168.0.9', 1478492676, 1478492676, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(107, 'photo', 15, '摄影作品4', '215', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=107', 0, 0, '192.168.0.9', 1478492698, 1478492698, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(108, 'photo', 15, '摄影作品5', '221', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=108', 0, 0, '192.168.0.9', 1478492724, 1478492724, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(109, 'photo', 15, '摄影作品6', '225', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=109', 0, 0, '192.168.0.9', 1478492747, 1478492747, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(110, 'photo', 15, '摄影作品7', '230', '', '摄影作品', 0, 1, 'admin', 9, '/index.php?c=show&id=110', 0, 0, '192.168.0.9', 1478492842, 1478492842, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(111, 'photo', 15, '摄影作品8', '236', '', '摄影作品', 1, 1, 'admin', 9, '/index.php?c=show&id=111', 0, 0, '192.168.0.9', 1478492870, 1478492870, 0, 0, 0);
INSERT INTO `dr_1_share` VALUES(112, 'special', 5, '测试专题', '', '', '...', 5, 1, 'admin', 9, '/index.php?c=show&id=112', 0, 0, '127.0.0.1', 1479116141, 1479116141, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_share_category`
--

CREATE TABLE IF NOT EXISTS `dr_1_share_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `domain` varchar(50) NOT NULL COMMENT '绑定域名',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `pcatpost` tinyint(1) NOT NULL COMMENT '是否父栏目发布',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `benner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='共享模块栏目表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `dr_1_share_category`
--

INSERT INTO `dr_1_share_category` VALUES(1, 1, 0, 'news', '0', '新闻', '', 'x', 'xinwen', '', 1, '1,7,8,9,10', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"},"html":0}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(2, 1, 0, 'down', '0', '下载', '', 'x', 'xiazai', '', 0, '2', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(3, 1, 0, 'fang', '0', '租房', '', 'z', 'zufang', '', 0, '3', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(4, 1, 0, 'photo', '0', '图片', '', 't', 'tupian', '', 1, '4,11,12,13,14,15,16,17', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(5, 1, 0, 'special', '0', '专题', '', 'z', 'zhuanti', '', 0, '5', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(6, 0, 0, '', '0', '关于我们', '', 'g', 'guanyuwomen', '', 0, '6', 0, '', 1, '<p><br/></p><p>FineCMS采用PHP+MYSQL+CodeIgniter做为技术基础进行开发，模块化开发方式做为功能开发形式，CI框架易于功能扩展，代码维护，优秀的二次开发能力，可满足所有网站的应用需求。</p><p><br/></p>', '', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"},"admin":[],"member":[],"html":0}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(7, 1, 1, 'news', '0,1', '军事', '', 'j', 'junshi', 'xinwen/', 0, '7', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(8, 1, 1, 'news', '0,1', '娱乐', '', 'y', 'yule', 'xinwen/', 0, '8', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(9, 1, 1, 'news', '0,1', '台海', '', 't', 'taihai', 'xinwen/', 0, '9', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(10, 1, 1, 'news', '0,1', '半岛', '', 'b', 'bandao', 'xinwen/', 0, '10', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(11, 1, 4, 'photo', '0,4', '美女图', '', 'm', 'meinutu', 'tupian/', 0, '11', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(12, 1, 4, 'photo', '0,4', '社会图', '', 's', 'shehuitu', 'tupian/', 0, '12', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(13, 1, 4, 'photo', '0,4', '娱乐图', '', 'y', 'yuletu', 'tupian/', 0, '13', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(14, 1, 4, 'photo', '0,4', '创意图', '', 'c', 'chuangyitu', 'tupian/', 0, '14', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(15, 1, 4, 'photo', '0,4', '摄影图', '', 's', 'sheyingtu', 'tupian/', 0, '15', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(16, 1, 4, 'photo', '0,4', '装修图', '', 'z', 'zhuangxiutu', 'tupian/', 0, '16', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(17, 1, 4, 'photo', '0,4', '发型图', '', 'f', 'faxingtu', 'tupian/', 0, '17', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);
INSERT INTO `dr_1_share_category` VALUES(18, 2, 0, '', '0', '用户留言', '', 'y', 'yonghuliuyan', '', 0, '18', 0, '', 1, '', NULL, '{"edit":"0","linkurl":"\\/index.php?c=form_liuyan","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_share_extend`
--

CREATE TABLE IF NOT EXISTS `dr_1_share_extend` (
  `id` int(10) unsigned NOT NULL,
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `hits` (`hits`),
  KEY `comments` (`comments`),
  KEY `favorites` (`favorites`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_share_extend_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_share_extend_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(22) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块扩展索引表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_share_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_share_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='共享模块内容索引表' AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `dr_1_share_index`
--

INSERT INTO `dr_1_share_index` VALUES(1, 1, 'news', 7, 9, 1478252937);
INSERT INTO `dr_1_share_index` VALUES(2, 1, 'news', 7, 9, 1478252937);
INSERT INTO `dr_1_share_index` VALUES(3, 1, 'news', 7, 9, 1478482588);
INSERT INTO `dr_1_share_index` VALUES(4, 1, 'news', 7, 9, 1478482710);
INSERT INTO `dr_1_share_index` VALUES(5, 1, 'news', 7, 9, 1478482992);
INSERT INTO `dr_1_share_index` VALUES(6, 1, 'news', 7, 9, 1478483021);
INSERT INTO `dr_1_share_index` VALUES(7, 1, 'news', 7, 9, 1478483047);
INSERT INTO `dr_1_share_index` VALUES(8, 1, 'news', 7, 9, 1478483070);
INSERT INTO `dr_1_share_index` VALUES(9, 1, 'news', 7, 9, 1478483098);
INSERT INTO `dr_1_share_index` VALUES(10, 1, 'news', 7, 9, 1478483127);
INSERT INTO `dr_1_share_index` VALUES(11, 1, 'news', 8, 9, 1478483215);
INSERT INTO `dr_1_share_index` VALUES(12, 1, 'news', 8, 9, 1478483467);
INSERT INTO `dr_1_share_index` VALUES(13, 1, 'news', 8, 9, 1478483496);
INSERT INTO `dr_1_share_index` VALUES(14, 1, 'news', 8, 9, 1478483514);
INSERT INTO `dr_1_share_index` VALUES(15, 1, 'news', 8, 9, 1478483575);
INSERT INTO `dr_1_share_index` VALUES(16, 1, 'news', 8, 9, 1478483635);
INSERT INTO `dr_1_share_index` VALUES(17, 1, 'news', 8, 9, 1478483658);
INSERT INTO `dr_1_share_index` VALUES(18, 1, 'news', 8, 9, 1478483752);
INSERT INTO `dr_1_share_index` VALUES(19, 1, 'news', 8, 9, 1478483789);
INSERT INTO `dr_1_share_index` VALUES(20, 1, 'news', 8, 9, 1478483789);
INSERT INTO `dr_1_share_index` VALUES(21, 1, 'news', 9, 9, 1478483881);
INSERT INTO `dr_1_share_index` VALUES(22, 1, 'news', 9, 9, 1478483971);
INSERT INTO `dr_1_share_index` VALUES(23, 1, 'news', 9, 9, 1478483996);
INSERT INTO `dr_1_share_index` VALUES(24, 1, 'news', 9, 9, 1478484026);
INSERT INTO `dr_1_share_index` VALUES(25, 1, 'news', 9, 9, 1478484073);
INSERT INTO `dr_1_share_index` VALUES(26, 1, 'news', 9, 9, 1478484099);
INSERT INTO `dr_1_share_index` VALUES(27, 1, 'news', 9, 9, 1478484132);
INSERT INTO `dr_1_share_index` VALUES(28, 1, 'news', 10, 9, 1478484219);
INSERT INTO `dr_1_share_index` VALUES(29, 1, 'news', 10, 9, 1478484266);
INSERT INTO `dr_1_share_index` VALUES(30, 1, 'news', 10, 9, 1478484289);
INSERT INTO `dr_1_share_index` VALUES(31, 1, 'news', 10, 9, 1478484308);
INSERT INTO `dr_1_share_index` VALUES(32, 1, 'news', 10, 9, 1478484333);
INSERT INTO `dr_1_share_index` VALUES(33, 1, 'news', 10, 9, 1478484357);
INSERT INTO `dr_1_share_index` VALUES(34, 1, 'news', 10, 9, 1478484375);
INSERT INTO `dr_1_share_index` VALUES(35, 1, 'news', 10, 9, 1478484398);
INSERT INTO `dr_1_share_index` VALUES(36, 1, 'down', 2, 9, 1478484450);
INSERT INTO `dr_1_share_index` VALUES(37, 1, 'down', 2, 9, 1478484505);
INSERT INTO `dr_1_share_index` VALUES(38, 1, 'down', 2, 9, 1478484540);
INSERT INTO `dr_1_share_index` VALUES(39, 1, 'down', 2, 9, 1478484540);
INSERT INTO `dr_1_share_index` VALUES(40, 1, 'down', 2, 9, 1478484587);
INSERT INTO `dr_1_share_index` VALUES(41, 1, 'down', 2, 9, 1478484605);
INSERT INTO `dr_1_share_index` VALUES(42, 1, 'down', 2, 9, 1478484718);
INSERT INTO `dr_1_share_index` VALUES(43, 1, 'down', 2, 9, 1478484734);
INSERT INTO `dr_1_share_index` VALUES(44, 1, 'fang', 3, 9, 1478485238);
INSERT INTO `dr_1_share_index` VALUES(45, 1, 'fang', 3, 9, 1478485573);
INSERT INTO `dr_1_share_index` VALUES(46, 1, 'fang', 3, 9, 1478485717);
INSERT INTO `dr_1_share_index` VALUES(47, 1, 'fang', 3, 9, 1478485812);
INSERT INTO `dr_1_share_index` VALUES(48, 1, 'fang', 3, 9, 1478485973);
INSERT INTO `dr_1_share_index` VALUES(49, 1, 'fang', 3, 9, 1478486073);
INSERT INTO `dr_1_share_index` VALUES(50, 1, 'fang', 3, 9, 1478486625);
INSERT INTO `dr_1_share_index` VALUES(51, 1, 'fang', 3, 9, 1478486743);
INSERT INTO `dr_1_share_index` VALUES(52, 1, 'fang', 3, 9, 1478486911);
INSERT INTO `dr_1_share_index` VALUES(53, 1, 'fang', 3, 9, 1478487070);
INSERT INTO `dr_1_share_index` VALUES(54, 1, 'fang', 3, 9, 1478487139);
INSERT INTO `dr_1_share_index` VALUES(55, 1, 'fang', 3, 9, 1478487217);
INSERT INTO `dr_1_share_index` VALUES(56, 1, 'photo', 11, 9, 1478487520);
INSERT INTO `dr_1_share_index` VALUES(57, 1, 'photo', 11, 9, 1478487586);
INSERT INTO `dr_1_share_index` VALUES(58, 1, 'photo', 11, 9, 1478487586);
INSERT INTO `dr_1_share_index` VALUES(59, 1, 'photo', 11, 9, 1478487750);
INSERT INTO `dr_1_share_index` VALUES(60, 1, 'photo', 11, 9, 1478487807);
INSERT INTO `dr_1_share_index` VALUES(61, 1, 'photo', 11, 9, 1478487857);
INSERT INTO `dr_1_share_index` VALUES(62, 1, 'photo', 11, 9, 1478487912);
INSERT INTO `dr_1_share_index` VALUES(63, 1, 'photo', 11, 9, 1478487945);
INSERT INTO `dr_1_share_index` VALUES(64, 1, 'photo', 12, 9, 1478488024);
INSERT INTO `dr_1_share_index` VALUES(65, 1, 'photo', 12, 9, 1478489276);
INSERT INTO `dr_1_share_index` VALUES(66, 1, 'photo', 12, 9, 1478489331);
INSERT INTO `dr_1_share_index` VALUES(67, 1, 'photo', 12, 9, 1478489380);
INSERT INTO `dr_1_share_index` VALUES(68, 1, 'photo', 12, 9, 1478489630);
INSERT INTO `dr_1_share_index` VALUES(69, 1, 'photo', 12, 9, 1478489747);
INSERT INTO `dr_1_share_index` VALUES(70, 1, 'photo', 12, 9, 1478489813);
INSERT INTO `dr_1_share_index` VALUES(71, 1, 'photo', 12, 9, 1478489841);
INSERT INTO `dr_1_share_index` VALUES(72, 1, 'photo', 17, 9, 1478490019);
INSERT INTO `dr_1_share_index` VALUES(73, 1, 'photo', 17, 9, 1478490188);
INSERT INTO `dr_1_share_index` VALUES(74, 1, 'photo', 17, 9, 1478490213);
INSERT INTO `dr_1_share_index` VALUES(75, 1, 'photo', 17, 9, 1478490237);
INSERT INTO `dr_1_share_index` VALUES(76, 1, 'photo', 17, 9, 1478490320);
INSERT INTO `dr_1_share_index` VALUES(77, 1, 'photo', 17, 9, 1478490347);
INSERT INTO `dr_1_share_index` VALUES(78, 1, 'photo', 17, 9, 1478490376);
INSERT INTO `dr_1_share_index` VALUES(79, 1, 'photo', 17, 9, 1478490465);
INSERT INTO `dr_1_share_index` VALUES(80, 1, 'photo', 13, 9, 1478490513);
INSERT INTO `dr_1_share_index` VALUES(81, 1, 'photo', 13, 9, 1478490670);
INSERT INTO `dr_1_share_index` VALUES(82, 1, 'photo', 13, 9, 1478490738);
INSERT INTO `dr_1_share_index` VALUES(83, 1, 'photo', 13, 9, 1478490762);
INSERT INTO `dr_1_share_index` VALUES(84, 1, 'photo', 13, 9, 1478490795);
INSERT INTO `dr_1_share_index` VALUES(85, 1, 'photo', 13, 9, 1478490821);
INSERT INTO `dr_1_share_index` VALUES(86, 1, 'photo', 13, 9, 1478490842);
INSERT INTO `dr_1_share_index` VALUES(87, 1, 'photo', 13, 9, 1478490864);
INSERT INTO `dr_1_share_index` VALUES(88, 1, 'photo', 14, 9, 1478490960);
INSERT INTO `dr_1_share_index` VALUES(89, 1, 'photo', 14, 9, 1478491106);
INSERT INTO `dr_1_share_index` VALUES(90, 1, 'photo', 14, 9, 1478491129);
INSERT INTO `dr_1_share_index` VALUES(91, 1, 'photo', 14, 9, 1478491184);
INSERT INTO `dr_1_share_index` VALUES(92, 1, 'photo', 14, 9, 1478491208);
INSERT INTO `dr_1_share_index` VALUES(93, 1, 'photo', 14, 9, 1478491233);
INSERT INTO `dr_1_share_index` VALUES(94, 1, 'photo', 14, 9, 1478491268);
INSERT INTO `dr_1_share_index` VALUES(95, 1, 'photo', 14, 9, 1478491289);
INSERT INTO `dr_1_share_index` VALUES(96, 1, 'photo', 16, 9, 1478491366);
INSERT INTO `dr_1_share_index` VALUES(97, 1, 'photo', 16, 9, 1478491484);
INSERT INTO `dr_1_share_index` VALUES(98, 1, 'photo', 16, 9, 1478491484);
INSERT INTO `dr_1_share_index` VALUES(99, 1, 'photo', 16, 9, 1478491539);
INSERT INTO `dr_1_share_index` VALUES(100, 1, 'photo', 16, 9, 1478491618);
INSERT INTO `dr_1_share_index` VALUES(101, 1, 'photo', 16, 9, 1478491643);
INSERT INTO `dr_1_share_index` VALUES(102, 1, 'photo', 16, 9, 1478492382);
INSERT INTO `dr_1_share_index` VALUES(103, 1, 'photo', 16, 9, 1478492404);
INSERT INTO `dr_1_share_index` VALUES(104, 1, 'photo', 15, 9, 1478492459);
INSERT INTO `dr_1_share_index` VALUES(105, 1, 'photo', 15, 9, 1478492616);
INSERT INTO `dr_1_share_index` VALUES(106, 1, 'photo', 15, 9, 1478492676);
INSERT INTO `dr_1_share_index` VALUES(107, 1, 'photo', 15, 9, 1478492698);
INSERT INTO `dr_1_share_index` VALUES(108, 1, 'photo', 15, 9, 1478492724);
INSERT INTO `dr_1_share_index` VALUES(109, 1, 'photo', 15, 9, 1478492747);
INSERT INTO `dr_1_share_index` VALUES(110, 1, 'photo', 15, 9, 1478492842);
INSERT INTO `dr_1_share_index` VALUES(111, 1, 'photo', 15, 9, 1478492870);
INSERT INTO `dr_1_share_index` VALUES(112, 1, 'special', 5, 9, 1479116141);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_share_search`
--

CREATE TABLE IF NOT EXISTS `dr_1_share_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_share_search_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_share_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='共享模块搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special`
--

CREATE TABLE IF NOT EXISTS `dr_1_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`,`updatetime`),
  KEY `status` (`status`),
  KEY `favorites` (`favorites`),
  KEY `comments` (`comments`),
  KEY `hits` (`hits`),
  KEY `link_id` (`link_id`),
  KEY `displayorder` (`displayorder`,`updatetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='主表' AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `dr_1_special`
--

INSERT INTO `dr_1_special` VALUES(112, 5, '测试专题', '', '', 'FineCMS采用PHP+MYSQL+CodeIgniter做为技术基础进行开发，模块化开发方式做为功能开发形...', 5, 1, 'admin', 9, '/index.php?c=show&id=112', 0, 0, '127.0.0.1', 1479116141, 1479116141, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_buy`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`,`uid`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_category`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_category_data`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_category_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_category_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_category_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_comment_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_comment_data_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `reply` (`reply`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `avgsort` (`avgsort`),
  KEY `status` (`status`),
  KEY `aa` (`cid`,`status`,`inputtime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_comment_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_comment_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `support` (`support`),
  KEY `oppose` (`oppose`),
  KEY `comments` (`comments`),
  KEY `avgsort` (`avgsort`),
  KEY `tableid` (`tableid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论索引表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_1_special_comment_index`
--

INSERT INTO `dr_1_special_comment_index` VALUES(1, 112, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_comment_my`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_comment_my` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_data_0`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `banner` text,
  `guanlian` text,
  `template` varchar(250) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

--
-- 转存表中的数据 `dr_1_special_data_0`
--

INSERT INTO `dr_1_special_data_0` VALUES(112, 1, 5, '<p><br/></p><p><br/></p><p>FineCMS采用PHP+MYSQL+CodeIgniter做为技术基础进行开发，模块化开发方式做为功能开发形式，CI框架易于功能扩展，代码维护，优秀的二次开发能力，可满足所有网站的应用需求。</p><p><br/></p>', '', '35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,19,20,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,1,2', 'show.html');

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_draft`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_favorite`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_flag`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_hits`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

--
-- 转存表中的数据 `dr_1_special_hits`
--

INSERT INTO `dr_1_special_hits` VALUES(112, 5, 1, 1, 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_html`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_html` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`),
  KEY `type` (`type`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容索引表' AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `dr_1_special_index`
--

INSERT INTO `dr_1_special_index` VALUES(112, 1, 5, 9, 1479116141);

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_search`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_search` (
  `id` varchar(32) NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_search_index`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间',
  KEY `id` (`id`),
  KEY `cid` (`cid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_tag`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_1_special_verify`
--

CREATE TABLE IF NOT EXISTS `dr_1_special_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

-- --------------------------------------------------------

--
-- 表的结构 `dr_admin`
--

CREATE TABLE IF NOT EXISTS `dr_admin` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  `color` varchar(50) DEFAULT NULL COMMENT '后台主题',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_admin`
--

INSERT INTO `dr_admin` VALUES(1, '网站创始人', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dr_admin_login`
--

CREATE TABLE IF NOT EXISTS `dr_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='登录日志记录' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `dr_admin_login`
--

INSERT INTO `dr_admin_login` VALUES(9, 1, '127.0.0.1', 1480917467, 'Unknown Platform  ');

-- --------------------------------------------------------

--
-- 表的结构 `dr_admin_menu`
--

CREATE TABLE IF NOT EXISTS `dr_admin_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(20) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单表' AUTO_INCREMENT=269 ;

--
-- 转存表中的数据 `dr_admin_menu`
--

INSERT INTO `dr_admin_menu` VALUES(1, 0, '首页', '/', NULL, '', 0, 0, 'icon-home');
INSERT INTO `dr_admin_menu` VALUES(2, 0, '系统', '/', NULL, 'top_system', 0, 0, 'icon-cog');
INSERT INTO `dr_admin_menu` VALUES(3, 0, '网站', '/', NULL, 'top_site', 0, 0, 'icon-globe');
INSERT INTO `dr_admin_menu` VALUES(6, 1, '我的面板', '/', NULL, '', 0, 0, 'icon-home');
INSERT INTO `dr_admin_menu` VALUES(7, 6, '后台首页', 'admin/home/main', '', '', 0, 0, 'icon-home');
INSERT INTO `dr_admin_menu` VALUES(8, 2, '系统功能', '/', NULL, '', 0, 0, 'fa fa-cog');
INSERT INTO `dr_admin_menu` VALUES(9, 2, '系统维护', '/', NULL, '', 0, 0, 'fa fa-database');
INSERT INTO `dr_admin_menu` VALUES(10, 2, '角色权限', '/', NULL, '', 0, 0, 'fa fa-users');
INSERT INTO `dr_admin_menu` VALUES(11, 8, '后台菜单', 'admin/menu/index', '', '', 0, 4, 'icon-list-alt');
INSERT INTO `dr_admin_menu` VALUES(12, 9, '数据结构', 'admin/db/index', '', '', 0, 0, 'icon-hdd');
INSERT INTO `dr_admin_menu` VALUES(13, 10, '角色管理', 'admin/role/index', '', '', 0, 0, 'icon-group');
INSERT INTO `dr_admin_menu` VALUES(14, 10, '管理员管理', 'admin/root/index', '', '', 0, 0, 'icon-user');
INSERT INTO `dr_admin_menu` VALUES(15, 3, '网站功能', '/', NULL, '', 0, 0, 'fa fa-cog');
INSERT INTO `dr_admin_menu` VALUES(40, 24, '单页管理', 'admin/page/index', '', '', 0, 0, 'icon-adn');
INSERT INTO `dr_admin_menu` VALUES(18, 15, '网站配置', 'admin/site/config', '', '', 0, 0, 'icon-cog');
INSERT INTO `dr_admin_menu` VALUES(19, 8, '网站管理', 'admin/site/index', '', '', 0, 8, 'icon-globe');
INSERT INTO `dr_admin_menu` VALUES(20, 15, '网站导航', 'admin/navigator/index', '', '', 0, 0, 'icon-map-marker');
INSERT INTO `dr_admin_menu` VALUES(21, 8, '模块管理', 'admin/module/index', '', '', 0, 9, 'icon-cogs');
INSERT INTO `dr_admin_menu` VALUES(22, 15, '附件管理', 'admin/attachment/index', '', '', 0, 9, 'icon-folder-close');
INSERT INTO `dr_admin_menu` VALUES(24, 3, '内容相关', '/', NULL, '', 0, 3, 'fa fa-list-alt');
INSERT INTO `dr_admin_menu` VALUES(35, 15, '下载镜像', 'admin/downservers/index', '', '', 0, 8, 'icon-thumbs-down');
INSERT INTO `dr_admin_menu` VALUES(38, 10, '审核流程', 'admin/verify/index', '', '', 0, 0, 'icon-stop');
INSERT INTO `dr_admin_menu` VALUES(60, 24, '联动菜单', 'admin/linkage/index', '', '', 0, 0, 'icon-windows');
INSERT INTO `dr_admin_menu` VALUES(61, 8, '邮件系统', 'admin/mail/index', '', '', 0, 2, 'icon-envelope');
INSERT INTO `dr_admin_menu` VALUES(63, 8, '系统配置', 'admin/system/index', '', '', 0, 1, 'icon-cog');
INSERT INTO `dr_admin_menu` VALUES(65, 9, '系统体检', 'admin/check/index', '', '', 0, 98, 'icon-undo');
INSERT INTO `dr_admin_menu` VALUES(66, 8, '操作日志', 'admin/system/oplog', '', '', 0, 4, 'icon-save');
INSERT INTO `dr_admin_menu` VALUES(73, 80, '空间模板', 'space/admin/spacetpl/index', '', '', 0, 99, 'icon-folder-close');
INSERT INTO `dr_admin_menu` VALUES(74, 80, '空间管理', 'space/admin/space/index', '', '', 0, 1, 'icon-trello');
INSERT INTO `dr_admin_menu` VALUES(77, 24, '资料块管理', 'admin/block/index', '', '', 0, 99, 'icon-copy');
INSERT INTO `dr_admin_menu` VALUES(79, 6, '资料修改', 'admin/root/my', '', '', 0, 0, 'icon-user-md');
INSERT INTO `dr_admin_menu` VALUES(80, 5, '空间黄页', '', '', '', 0, 1, 'fa fa-list-alt');
INSERT INTO `dr_admin_menu` VALUES(81, 80, '空间模型', 'space/admin/model/index', '', '', 0, 2, 'icon-certificate');
INSERT INTO `dr_admin_menu` VALUES(88, 80, '空间设置', 'space/admin/setting/space', '', '', 0, 199, 'icon-cog');
INSERT INTO `dr_admin_menu` VALUES(89, 8, '任务队列', 'admin/cron/index', '', '', 0, 3, 'icon-forward');
INSERT INTO `dr_admin_menu` VALUES(90, 8, '短信系统', 'admin/sms/index', '', '', 0, 2, 'icon-envelope-alt');
INSERT INTO `dr_admin_menu` VALUES(91, 15, 'URL规则', 'admin/urlrule/index', '', '', 0, 2, 'icon-magnet');
INSERT INTO `dr_admin_menu` VALUES(92, 80, '自定义字段', 'admin/field/index/rname/spacetable/rid/0', '', '', 0, 200, 'icon-plus-sign-alt');
INSERT INTO `dr_admin_menu` VALUES(93, 6, '登录日志', 'admin/root/log', '', '', 0, 0, 'icon-save');
INSERT INTO `dr_admin_menu` VALUES(97, 6, '模块管理', 'admin/module/index', '', '', 0, 0, 'icon-cogs');
INSERT INTO `dr_admin_menu` VALUES(98, 6, '更新数据', 'admin/home/clear', '', '', 0, 0, 'icon-trash');
INSERT INTO `dr_admin_menu` VALUES(99, 6, '更新全站', 'admin/home/cache', '', '', 0, 0, 'icon-refresh');
INSERT INTO `dr_admin_menu` VALUES(100, 6, '系统体检', 'admin/check/index', '', '', 0, 0, 'icon-zoom-out');
INSERT INTO `dr_admin_menu` VALUES(101, 6, '生成伪静态', 'admin/route/index', '', '', 0, 0, 'icon-compass');
INSERT INTO `dr_admin_menu` VALUES(102, 80, '默认栏目', 'space/admin/space/init', '', '', 0, 198, 'icon-th');
INSERT INTO `dr_admin_menu` VALUES(104, 80, '空间互动', 'space/admin/sns/index', '', '', 0, 3, 'icon-weibo');
INSERT INTO `dr_admin_menu` VALUES(106, 9, '执行SQL', 'admin/db/sql', '', '', 0, 50, 'icon-magic');
INSERT INTO `dr_admin_menu` VALUES(107, 15, '远程附件', 'admin/attachment2/index', '', '', 0, 1, 'icon-upload-alt');
INSERT INTO `dr_admin_menu` VALUES(108, 2, '高级开发', '/', NULL, '', 0, 0, 'fa fa-user-md');
INSERT INTO `dr_admin_menu` VALUES(109, 108, '全局变量', 'admin/sysvar/index', '', '', 0, 1, 'icon-tumblr');
INSERT INTO `dr_admin_menu` VALUES(110, 108, '定义控制器', 'admin/syscontroller/index', '', '', 0, 1, 'icon-linux');
INSERT INTO `dr_admin_menu` VALUES(268, 267, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(266, 265, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(124, 15, '生成静态', 'admin/html/index', '', '', 0, 1, 'fa fa-file');
INSERT INTO `dr_admin_menu` VALUES(125, 8, '系统提醒', 'admin/notice/index', '', '', 0, 1, 'fa fa-volume-down');
INSERT INTO `dr_admin_menu` VALUES(254, 253, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(150, 0, '内容', '/', NULL, 'share', 0, 0, 'fa fa-th-large');
INSERT INTO `dr_admin_menu` VALUES(151, 150, '内容管理', '/', NULL, 'share-content', 0, 0, 'fa fa-th-large');
INSERT INTO `dr_admin_menu` VALUES(152, 151, '栏目管理', 'admin/category_share/index', '', '', 0, 0, 'fa fa-list');
INSERT INTO `dr_admin_menu` VALUES(153, 151, '生成静态', 'admin/html/index', '', '', 0, 0, 'fa fa-file');
INSERT INTO `dr_admin_menu` VALUES(160, 0, '表单', '/', NULL, '', 0, 0, 'fa fa-table');
INSERT INTO `dr_admin_menu` VALUES(161, 160, '表单管理', '/', NULL, '', 0, 0, 'fa fa-table');
INSERT INTO `dr_admin_menu` VALUES(162, 161, '表单管理', 'admin/form/index', '', '', 0, 0, 'icon-tasks');
INSERT INTO `dr_admin_menu` VALUES(171, 160, '内容管理', '/', NULL, 'myform', 0, 0, 'fa fa-th-large');
INSERT INTO `dr_admin_menu` VALUES(172, 150, '新闻管理', '', NULL, 'module-news', 0, 0, 'icon-tasks');
INSERT INTO `dr_admin_menu` VALUES(173, 172, '已通过文档', 'news/admin/home/index', NULL, 'module-news', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(174, 172, '待审核文档', 'news/admin/home/verify', NULL, 'module-news', 0, 0, 'icon-retweet');
INSERT INTO `dr_admin_menu` VALUES(175, 172, '我的草稿箱', 'news/admin/home/draft', NULL, 'module-news', 0, 0, 'icon-edit');
INSERT INTO `dr_admin_menu` VALUES(176, 172, 'Tag标签', 'news/admin/tag/index', NULL, 'module-news', 0, 0, 'icon-tags');
INSERT INTO `dr_admin_menu` VALUES(177, 172, '评论管理', 'news/admin/comment/index', NULL, 'module-news', 0, 0, 'icon-comments');
INSERT INTO `dr_admin_menu` VALUES(178, 172, '内容维护', 'news/admin/content/index', NULL, 'module-news', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(179, 150, '下载管理', '', NULL, 'module-down', 0, 0, 'icon-circle-arrow-down');
INSERT INTO `dr_admin_menu` VALUES(180, 179, '已通过软件', 'down/admin/home/index', NULL, 'module-down', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(181, 179, '待审核软件', 'down/admin/home/verify', NULL, 'module-down', 0, 0, 'icon-retweet');
INSERT INTO `dr_admin_menu` VALUES(182, 179, '我的草稿箱', 'down/admin/home/draft', NULL, 'module-down', 0, 0, 'icon-edit');
INSERT INTO `dr_admin_menu` VALUES(183, 179, 'Tag标签', 'down/admin/tag/index', NULL, 'module-down', 0, 0, 'icon-tags');
INSERT INTO `dr_admin_menu` VALUES(184, 179, '评论管理', 'down/admin/comment/index', NULL, 'module-down', 0, 0, 'icon-comments');
INSERT INTO `dr_admin_menu` VALUES(185, 179, '内容维护', 'down/admin/home/content', NULL, 'module-down', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(186, 150, '租房管理', '', NULL, 'module-fang', 0, 0, 'icon-reorder');
INSERT INTO `dr_admin_menu` VALUES(187, 186, '已通过房源', 'fang/admin/home/index', NULL, 'module-fang', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(188, 186, '待审核房源', 'fang/admin/home/verify', NULL, 'module-fang', 0, 0, 'icon-retweet');
INSERT INTO `dr_admin_menu` VALUES(189, 186, '我的草稿箱', 'fang/admin/home/draft', NULL, 'module-fang', 0, 0, 'icon-edit');
INSERT INTO `dr_admin_menu` VALUES(190, 186, 'Tag标签', 'fang/admin/tag/index', NULL, 'module-fang', 0, 0, 'icon-tags');
INSERT INTO `dr_admin_menu` VALUES(191, 186, '评论管理', 'fang/admin/comment/index', NULL, 'module-fang', 0, 0, 'icon-comments');
INSERT INTO `dr_admin_menu` VALUES(192, 186, '内容维护', 'fang/admin/home/content', NULL, 'module-fang', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(193, 150, '图片管理', '', NULL, 'module-photo', 0, 0, 'icon-picture');
INSERT INTO `dr_admin_menu` VALUES(194, 193, '已通过图片', 'photo/admin/home/index', NULL, 'module-photo', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(195, 193, '待审核图片', 'photo/admin/home/verify', NULL, 'module-photo', 0, 0, 'icon-retweet');
INSERT INTO `dr_admin_menu` VALUES(196, 193, '我的草稿箱', 'photo/admin/home/draft', NULL, 'module-photo', 0, 0, 'icon-edit');
INSERT INTO `dr_admin_menu` VALUES(197, 193, 'Tag标签', 'photo/admin/tag/index', NULL, 'module-photo', 0, 0, 'icon-tags');
INSERT INTO `dr_admin_menu` VALUES(198, 193, '内容维护', 'photo/admin/content/index', NULL, 'module-photo', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(199, 193, '评论管理', 'photo/admin/comment/index', NULL, 'module-photo', 0, 0, 'icon-comments');
INSERT INTO `dr_admin_menu` VALUES(200, 150, '专题管理', '', NULL, 'module-special', 0, 0, 'icon-table');
INSERT INTO `dr_admin_menu` VALUES(201, 200, '已通过专题', 'special/admin/home/index', NULL, 'module-special', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(202, 200, '待审核专题', 'special/admin/home/verify', NULL, 'module-special', 0, 0, 'icon-retweet');
INSERT INTO `dr_admin_menu` VALUES(203, 200, 'Tag标签', 'special/admin/tag/index', NULL, 'module-special', 0, 0, 'icon-tags');
INSERT INTO `dr_admin_menu` VALUES(204, 200, '内容维护', 'special/admin/home/content', NULL, 'module-special', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(205, 200, '评论管理', 'special/admin/comment/index', NULL, 'module-special', 0, 0, 'icon-comments');
INSERT INTO `dr_admin_menu` VALUES(206, 171, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(264, 263, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(262, 261, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(267, 3, '表单内容', '', NULL, 'form', 0, 4, 'fa fa-table');
INSERT INTO `dr_admin_menu` VALUES(211, 210, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(213, 212, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(214, 0, '功能演示', '', NULL, 'module-demo', 0, 0, 'icon-table');
INSERT INTO `dr_admin_menu` VALUES(215, 214, '文档管理', '', NULL, 'module-demo', 0, 0, 'icon-table');
INSERT INTO `dr_admin_menu` VALUES(216, 215, '已通过文档', 'demo/admin/home/index', NULL, 'module-demo', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(217, 215, '待审核文档', 'demo/admin/home/verify', NULL, 'module-demo', 0, 0, 'icon-retweet');
INSERT INTO `dr_admin_menu` VALUES(218, 215, '我的草稿箱', 'demo/admin/home/draft', NULL, 'module-demo', 0, 0, 'icon-edit');
INSERT INTO `dr_admin_menu` VALUES(219, 215, '栏目分类', 'demo/admin/category/index', NULL, 'module-demo', 0, 0, 'icon-list');
INSERT INTO `dr_admin_menu` VALUES(220, 215, 'Tag标签', 'demo/admin/tag/index', NULL, 'module-demo', 0, 0, 'icon-tags');
INSERT INTO `dr_admin_menu` VALUES(221, 215, '单页管理', 'demo/admin/page/index', NULL, 'module-demo', 0, 0, 'icon-adn');
INSERT INTO `dr_admin_menu` VALUES(222, 214, '新闻评论', '', NULL, 'module-demo', 0, 0, 'icon-tasks');
INSERT INTO `dr_admin_menu` VALUES(223, 222, '评论设置', 'demo/admin/comment/config', NULL, 'module-demo', 0, 0, 'icon-cogs');
INSERT INTO `dr_admin_menu` VALUES(224, 222, '评论管理', 'demo/admin/comment/index', NULL, 'module-demo', 0, 0, 'icon-comments');
INSERT INTO `dr_admin_menu` VALUES(225, 222, '自定义字段', 'admin/field/index/rname/comment-module-demo/rid/0', NULL, 'module-demo', 0, 0, 'icon-plus-sign-alt');
INSERT INTO `dr_admin_menu` VALUES(226, 214, '相关功能', '', NULL, 'module-demo', 0, 0, 'fa fa-cog');
INSERT INTO `dr_admin_menu` VALUES(227, 226, '内容维护', 'demo/admin/content/index', NULL, 'module-demo', 0, 0, 'icon-th-large');
INSERT INTO `dr_admin_menu` VALUES(228, 226, '生成静态', 'demo/admin/home/html', NULL, 'module-demo', 0, 0, 'icon-html5');
INSERT INTO `dr_admin_menu` VALUES(229, 226, '自定义字段', 'admin/field/index/rname/module/rid/6', NULL, 'module-demo', 0, 0, 'icon-plus-sign-alt');
INSERT INTO `dr_admin_menu` VALUES(230, 226, '模块属性配置', 'admin/module/config/id/6', NULL, 'module-demo', 0, 0, 'icon-cogs');
INSERT INTO `dr_admin_menu` VALUES(260, 259, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(258, 257, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(256, 255, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(236, 235, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(238, 237, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(240, 239, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(242, 241, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(244, 243, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(246, 245, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(248, 247, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(250, 249, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');
INSERT INTO `dr_admin_menu` VALUES(252, 251, '网站留言', 'admin/form_liuyan/index', NULL, 'site-from', 0, 0, 'fa fa-user');

-- --------------------------------------------------------

--
-- 表的结构 `dr_admin_notice`
--

CREATE TABLE IF NOT EXISTS `dr_admin_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` varchar(20) NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) NOT NULL COMMENT '对应的URI',
  `to_rid` smallint(5) NOT NULL COMMENT '指定角色组',
  `to_uid` int(10) NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int(10) NOT NULL COMMENT '处理人',
  `username` varchar(100) NOT NULL COMMENT '处理人',
  `updatetime` int(10) NOT NULL COMMENT '处理时间',
  `inputtime` int(10) NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `status` (`status`),
  KEY `to_uid` (`to_uid`),
  KEY `to_rid` (`to_rid`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_admin_role`
--

CREATE TABLE IF NOT EXISTS `dr_admin_role` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `site` text NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text NOT NULL COMMENT '角色组语言名称',
  `system` text NOT NULL COMMENT '系统权限',
  `module` text NOT NULL COMMENT '模块权限',
  `application` text NOT NULL COMMENT '应用权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台角色权限表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dr_admin_role`
--

INSERT INTO `dr_admin_role` VALUES(1, '', '超级管理员', '', '', '');
INSERT INTO `dr_admin_role` VALUES(2, '', '网站编辑员', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `dr_admin_verify`
--

CREATE TABLE IF NOT EXISTS `dr_admin_verify` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '名称',
  `verify` text NOT NULL COMMENT '审核部署',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='审核管理表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_admin_verify`
--

INSERT INTO `dr_admin_verify` VALUES(1, '审核一次', 'a:1:{i:1;a:2:{i:0;s:1:\\"2\\";i:1;s:1:\\"3\\";}}');

-- --------------------------------------------------------

--
-- 表的结构 `dr_application`
--

CREATE TABLE IF NOT EXISTS `dr_application` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` text COMMENT '模块划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `dr_application`
--

INSERT INTO `dr_application` VALUES(2, '', 'mcaiji', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_app_caiji_content`
--

CREATE TABLE IF NOT EXISTS `dr_app_caiji_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `catid` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `inputtime` int(10) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `xiazai` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='采集工具数据库' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_app_caiji_rule`
--

CREATE TABLE IF NOT EXISTS `dr_app_caiji_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mokuai` varchar(255) DEFAULT NULL,
  `yuming` varchar(255) DEFAULT NULL,
  `bianma` varchar(255) DEFAULT NULL,
  `urls` text,
  `yuansu` text,
  `kuai` text,
  `tihuan` text,
  `guolv` text,
  `yumingbuquan` varchar(255) DEFAULT NULL,
  `content` text,
  `postcatid` int(5) DEFAULT NULL,
  `shijian` int(10) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '内容状态',
  `xiazai` varchar(1) NOT NULL DEFAULT '0' COMMENT '下载设置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='采集工具配置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_app_caiji_url`
--

CREATE TABLE IF NOT EXISTS `dr_app_caiji_url` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='采集工具地址库' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment`
--

CREATE TABLE IF NOT EXISTS `dr_attachment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=259 ;

--
-- 转存表中的数据 `dr_attachment`
--

INSERT INTO `dr_attachment` VALUES(1, 1, 'admin', 1, '', 1, 0, 1153649, 'png', 'c5d755d1565f62e1dd181ce7aebb81e5');
INSERT INTO `dr_attachment` VALUES(2, 1, 'admin', 1, '', 1, 0, 451430, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `dr_attachment` VALUES(3, 1, 'admin', 1, '', 1, 0, 915333, 'png', '597fc5f436d85839b0f43197a98db212');
INSERT INTO `dr_attachment` VALUES(4, 1, 'admin', 1, '', 1, 0, 1153649, 'png', 'c5d755d1565f62e1dd181ce7aebb81e5');
INSERT INTO `dr_attachment` VALUES(5, 1, 'admin', 1, '', 1, 0, 451430, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `dr_attachment` VALUES(6, 1, 'admin', 1, '', 1, 0, 915333, 'png', '597fc5f436d85839b0f43197a98db212');
INSERT INTO `dr_attachment` VALUES(7, 1, 'admin', 1, 'dr_1_block-1', 1, 0, 1153649, 'png', 'c5d755d1565f62e1dd181ce7aebb81e5');
INSERT INTO `dr_attachment` VALUES(8, 1, 'admin', 1, 'dr_1_block-1', 1, 0, 451430, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `dr_attachment` VALUES(9, 1, 'admin', 1, 'dr_1_block-1', 1, 0, 915333, 'png', '597fc5f436d85839b0f43197a98db212');
INSERT INTO `dr_attachment` VALUES(10, 1, 'admin', 1, 'dr_1_news-1', 1, 0, 36680, 'jpg', 'b8cc14df47e80917b0e2d8881c644afd');
INSERT INTO `dr_attachment` VALUES(11, 1, 'admin', 1, '', 1, 0, 36678, 'jpg', 'b8cc14df47e80917b0e2d8881c644afd');
INSERT INTO `dr_attachment` VALUES(12, 1, 'admin', 1, '', 1, 0, 20045, 'png', '8e88d2266b8e7ba9691e78624d1e7bfe');
INSERT INTO `dr_attachment` VALUES(13, 1, 'admin', 1, '', 1, 0, 20045, 'png', '8e88d2266b8e7ba9691e78624d1e7bfe');
INSERT INTO `dr_attachment` VALUES(14, 1, 'admin', 1, '', 1, 0, 11818, 'png', '60e1a05c226332cc64107694f3d309e6');
INSERT INTO `dr_attachment` VALUES(15, 1, 'admin', 1, '', 1, 0, 21364, 'png', 'db76ef886b26581b0b7f77e707c893e7');
INSERT INTO `dr_attachment` VALUES(16, 1, 'admin', 1, '', 1, 0, 21364, 'png', 'db76ef886b26581b0b7f77e707c893e7');
INSERT INTO `dr_attachment` VALUES(17, 1, 'admin', 1, '', 1, 0, 451426, 'png', 'f978e94a25914f0c13d05fba065d26ec');
INSERT INTO `dr_attachment` VALUES(18, 1, 'admin', 1, 'dr_1_down-43', 1, 0, 23470, 'jpg', 'd30cd3768ef2b2cde02eb6b9e1390cd7');
INSERT INTO `dr_attachment` VALUES(19, 1, 'admin', 1, 'dr_1_down-42', 1, 0, 23470, 'jpg', 'd30cd3768ef2b2cde02eb6b9e1390cd7');
INSERT INTO `dr_attachment` VALUES(20, 1, 'admin', 1, 'dr_1_down-41', 1, 0, 100413, 'png', '6716ff6f5128fe0abd0c5b0ba6abca22');
INSERT INTO `dr_attachment` VALUES(21, 1, 'admin', 1, 'dr_1_down-40', 1, 0, 8980, 'jpg', '9bea1e2489849e298b460901c8fe304e');
INSERT INTO `dr_attachment` VALUES(22, 1, 'admin', 1, 'dr_1_down-39', 1, 0, 7608, 'jpg', 'd1df768a9fe31f4709ab3e5e8842de4f');
INSERT INTO `dr_attachment` VALUES(23, 1, 'admin', 1, 'dr_1_down-38', 1, 0, 72673, 'png', 'a233071d9431e2b5cb9a7c18510896d2');
INSERT INTO `dr_attachment` VALUES(24, 1, 'admin', 1, 'dr_1_down-37', 1, 0, 7485, 'jpg', '8ee9662cb419d28a7677e2f253e15ef6');
INSERT INTO `dr_attachment` VALUES(25, 1, 'admin', 1, 'dr_1_down-36', 1, 0, 72673, 'png', 'a233071d9431e2b5cb9a7c18510896d2');
INSERT INTO `dr_attachment` VALUES(26, 1, 'admin', 1, 'dr_1_fang-44', 1, 0, 126659, 'jpg', '18475974d020d39e3ec7b649f2679aed');
INSERT INTO `dr_attachment` VALUES(27, 1, 'admin', 1, 'dr_1_fang-44', 1, 0, 126659, 'jpg', '18475974d020d39e3ec7b649f2679aed');
INSERT INTO `dr_attachment` VALUES(28, 1, 'admin', 1, 'dr_1_fang-45', 1, 0, 798351, 'jpg', 'bce66614e2033c9c684f39ed9f352dc8');
INSERT INTO `dr_attachment` VALUES(29, 1, 'admin', 1, 'dr_1_fang-45', 1, 0, 798351, 'jpg', 'bce66614e2033c9c684f39ed9f352dc8');
INSERT INTO `dr_attachment` VALUES(30, 1, 'admin', 1, 'dr_1_fang-46', 1, 0, 225618, 'jpg', '20a0f26899979ac61af0c57d33d5c01e');
INSERT INTO `dr_attachment` VALUES(31, 1, 'admin', 1, 'dr_1_fang-47', 1, 0, 401807, 'jpg', '60f25ec6e84308b2cf50ef45ab006390');
INSERT INTO `dr_attachment` VALUES(32, 1, 'admin', 1, 'dr_1_fang-47', 1, 0, 401807, 'jpg', '60f25ec6e84308b2cf50ef45ab006390');
INSERT INTO `dr_attachment` VALUES(33, 1, 'admin', 1, 'dr_1_fang-48', 1, 0, 452905, 'jpg', 'effe5143633fe09215697ef023a67475');
INSERT INTO `dr_attachment` VALUES(34, 1, 'admin', 1, 'dr_1_fang-48', 1, 0, 452905, 'jpg', 'effe5143633fe09215697ef023a67475');
INSERT INTO `dr_attachment` VALUES(35, 1, 'admin', 1, 'dr_1_fang-49', 1, 0, 279060, 'jpg', 'af294bb48e2d6e9603d86c1ffdfc31b4');
INSERT INTO `dr_attachment` VALUES(36, 1, 'admin', 1, 'dr_1_fang-49', 1, 0, 279060, 'jpg', 'af294bb48e2d6e9603d86c1ffdfc31b4');
INSERT INTO `dr_attachment` VALUES(37, 1, 'admin', 1, 'dr_1_fang-50', 1, 0, 260393, 'jpg', '8864e6d476e93ab8291eced5a5273e24');
INSERT INTO `dr_attachment` VALUES(38, 1, 'admin', 1, 'dr_1_fang-50', 1, 0, 260393, 'jpg', '8864e6d476e93ab8291eced5a5273e24');
INSERT INTO `dr_attachment` VALUES(39, 1, 'admin', 1, 'dr_1_fang-51', 1, 0, 277228, 'jpg', '494f7c02e027dd3c54b78c001e9a4dd1');
INSERT INTO `dr_attachment` VALUES(40, 1, 'admin', 1, 'dr_1_fang-51', 1, 0, 277228, 'jpg', '494f7c02e027dd3c54b78c001e9a4dd1');
INSERT INTO `dr_attachment` VALUES(41, 1, 'admin', 1, 'dr_1_fang-52', 1, 0, 78131, 'jpg', 'f8c1c96a05af9fbbc6b2fac632263527');
INSERT INTO `dr_attachment` VALUES(42, 1, 'admin', 1, 'dr_1_fang-52', 1, 0, 78131, 'jpg', 'f8c1c96a05af9fbbc6b2fac632263527');
INSERT INTO `dr_attachment` VALUES(43, 1, 'admin', 1, 'dr_1_fang-53', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `dr_attachment` VALUES(44, 1, 'admin', 1, 'dr_1_fang-53', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `dr_attachment` VALUES(45, 1, 'admin', 1, 'dr_1_fang-54', 1, 0, 85729, 'jpg', 'e11456df5faecf5e12928a95f5760250');
INSERT INTO `dr_attachment` VALUES(46, 1, 'admin', 1, 'dr_1_fang-54', 1, 0, 85729, 'jpg', 'e11456df5faecf5e12928a95f5760250');
INSERT INTO `dr_attachment` VALUES(47, 1, 'admin', 1, 'dr_1_fang-55', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `dr_attachment` VALUES(48, 1, 'admin', 1, 'dr_1_fang-55', 1, 0, 221522, 'jpg', 'a0be2befc5f365929f1817f089a3be20');
INSERT INTO `dr_attachment` VALUES(49, 1, 'admin', 1, 'dr_1_photo-56', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `dr_attachment` VALUES(50, 1, 'admin', 1, 'dr_1_photo-56', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `dr_attachment` VALUES(51, 1, 'admin', 1, 'dr_1_photo-56', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `dr_attachment` VALUES(52, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `dr_attachment` VALUES(53, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `dr_attachment` VALUES(54, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 117371, 'png', '8ea4a4a15b4b720f048eeaeb63249582');
INSERT INTO `dr_attachment` VALUES(55, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `dr_attachment` VALUES(56, 1, 'admin', 1, 'dr_1_photo-57', 1, 0, 8018, 'jpg', '13db464df6bcdb7ef53b705ebcd3674b');
INSERT INTO `dr_attachment` VALUES(57, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 63396, 'jpg', '70404a87a11b664295174c1bc55cd4a2');
INSERT INTO `dr_attachment` VALUES(58, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 8018, 'jpg', '13db464df6bcdb7ef53b705ebcd3674b');
INSERT INTO `dr_attachment` VALUES(59, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `dr_attachment` VALUES(60, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 117371, 'png', '8ea4a4a15b4b720f048eeaeb63249582');
INSERT INTO `dr_attachment` VALUES(61, 1, 'admin', 1, 'dr_1_photo-59', 1, 0, 9247, 'jpg', '48fada93e110dfc5c9856ff9e53f8bb6');
INSERT INTO `dr_attachment` VALUES(62, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 11018, 'jpg', '1d539e14a771749416d51fbdb7b775ad');
INSERT INTO `dr_attachment` VALUES(63, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 72673, 'png', 'a233071d9431e2b5cb9a7c18510896d2');
INSERT INTO `dr_attachment` VALUES(64, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 63396, 'jpg', '70404a87a11b664295174c1bc55cd4a2');
INSERT INTO `dr_attachment` VALUES(65, 1, 'admin', 1, 'dr_1_photo-60', 1, 0, 16660, 'gif', 'ee8b14d86268c2ab19eb520d8a669ddb');
INSERT INTO `dr_attachment` VALUES(66, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 16660, 'gif', 'ee8b14d86268c2ab19eb520d8a669ddb');
INSERT INTO `dr_attachment` VALUES(67, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `dr_attachment` VALUES(68, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `dr_attachment` VALUES(69, 1, 'admin', 1, 'dr_1_photo-61', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `dr_attachment` VALUES(70, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 9247, 'jpg', '48fada93e110dfc5c9856ff9e53f8bb6');
INSERT INTO `dr_attachment` VALUES(71, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 7209, 'jpg', 'e1112dcaae512f5c519a097e19b970d8');
INSERT INTO `dr_attachment` VALUES(72, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 23470, 'jpg', 'd30cd3768ef2b2cde02eb6b9e1390cd7');
INSERT INTO `dr_attachment` VALUES(73, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 23798, 'jpg', 'd6e5dc7d9a6500e0507d1415686d2f43');
INSERT INTO `dr_attachment` VALUES(74, 1, 'admin', 1, 'dr_1_photo-62', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `dr_attachment` VALUES(75, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 63396, 'jpg', '70404a87a11b664295174c1bc55cd4a2');
INSERT INTO `dr_attachment` VALUES(76, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 18596, 'jpg', '9ce127f51672d64ce7e010a8c61daca7');
INSERT INTO `dr_attachment` VALUES(77, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 8817, 'jpg', '47cef6330fb6697aaa26f3438a8c1b2a');
INSERT INTO `dr_attachment` VALUES(78, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 8980, 'jpg', '9bea1e2489849e298b460901c8fe304e');
INSERT INTO `dr_attachment` VALUES(79, 1, 'admin', 1, 'dr_1_photo-63', 1, 0, 8612, 'jpg', '802cad7073daac033c1cb0ea24685ad0');
INSERT INTO `dr_attachment` VALUES(80, 1, 'admin', 1, 'dr_1_photo-64', 1, 0, 177132, 'jpg', 'd127418c7b20705487565e333cad320a');
INSERT INTO `dr_attachment` VALUES(81, 1, 'admin', 1, 'dr_1_photo-64', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `dr_attachment` VALUES(82, 1, 'admin', 1, 'dr_1_photo-64', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `dr_attachment` VALUES(83, 1, 'admin', 1, 'dr_1_photo-65', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `dr_attachment` VALUES(84, 1, 'admin', 1, 'dr_1_photo-65', 1, 0, 177132, 'jpg', 'd127418c7b20705487565e333cad320a');
INSERT INTO `dr_attachment` VALUES(85, 1, 'admin', 1, 'dr_1_photo-65', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `dr_attachment` VALUES(86, 1, 'admin', 1, 'dr_1_photo-66', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `dr_attachment` VALUES(87, 1, 'admin', 1, 'dr_1_photo-66', 1, 0, 156006, 'jpg', '5eb53498b1bb65c717a38c38f64ee33e');
INSERT INTO `dr_attachment` VALUES(88, 1, 'admin', 1, 'dr_1_photo-66', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `dr_attachment` VALUES(89, 1, 'admin', 1, 'dr_1_photo-67', 1, 0, 478894, 'png', 'fc04f6021b14782cc128f0c1e6c44a6c');
INSERT INTO `dr_attachment` VALUES(90, 1, 'admin', 1, 'dr_1_photo-67', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `dr_attachment` VALUES(91, 1, 'admin', 1, 'dr_1_photo-67', 1, 0, 478894, 'png', 'fc04f6021b14782cc128f0c1e6c44a6c');
INSERT INTO `dr_attachment` VALUES(92, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 187054, 'jpg', '4cd2bf4fea1325f95f71a4e6db78771b');
INSERT INTO `dr_attachment` VALUES(93, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 195738, 'jpg', '8ee4cb61406ced7a96d2068d270db88e');
INSERT INTO `dr_attachment` VALUES(94, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 478894, 'png', 'fc04f6021b14782cc128f0c1e6c44a6c');
INSERT INTO `dr_attachment` VALUES(95, 1, 'admin', 1, 'dr_1_photo-68', 1, 0, 187054, 'jpg', '4cd2bf4fea1325f95f71a4e6db78771b');
INSERT INTO `dr_attachment` VALUES(96, 1, 'admin', 1, 'dr_1_photo-69', 1, 0, 22323, 'jpg', '02343298b1ef25be261238324827a467');
INSERT INTO `dr_attachment` VALUES(97, 1, 'admin', 1, 'dr_1_photo-69', 1, 0, 99308, 'jpg', '2d5ac77b9a4d4d18af3f29e0fd889471');
INSERT INTO `dr_attachment` VALUES(98, 1, 'admin', 1, 'dr_1_photo-69', 1, 0, 102380, 'jpg', '433f0be9ede65eaa162cdd0b9a034c5c');
INSERT INTO `dr_attachment` VALUES(99, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 358052, 'png', '45aa9aa2c45938aefd9b9fc358543b79');
INSERT INTO `dr_attachment` VALUES(100, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 102380, 'jpg', '433f0be9ede65eaa162cdd0b9a034c5c');
INSERT INTO `dr_attachment` VALUES(101, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 358052, 'png', '45aa9aa2c45938aefd9b9fc358543b79');
INSERT INTO `dr_attachment` VALUES(102, 1, 'admin', 1, 'dr_1_photo-70', 1, 0, 22323, 'jpg', '02343298b1ef25be261238324827a467');
INSERT INTO `dr_attachment` VALUES(103, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 22323, 'jpg', '02343298b1ef25be261238324827a467');
INSERT INTO `dr_attachment` VALUES(104, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 99308, 'jpg', '2d5ac77b9a4d4d18af3f29e0fd889471');
INSERT INTO `dr_attachment` VALUES(105, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 102380, 'jpg', '433f0be9ede65eaa162cdd0b9a034c5c');
INSERT INTO `dr_attachment` VALUES(106, 1, 'admin', 1, 'dr_1_photo-71', 1, 0, 392950, 'jpg', '79ad4a9cf6cb611c8908806b5e42e684');
INSERT INTO `dr_attachment` VALUES(107, 1, 'admin', 1, 'dr_1_photo-72', 1, 0, 53248, 'jpg', 'e61a342d2c9a3bc313655754b3305bc6');
INSERT INTO `dr_attachment` VALUES(108, 1, 'admin', 1, 'dr_1_photo-72', 1, 0, 53248, 'jpg', 'e61a342d2c9a3bc313655754b3305bc6');
INSERT INTO `dr_attachment` VALUES(109, 1, 'admin', 1, 'dr_1_photo-73', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `dr_attachment` VALUES(110, 1, 'admin', 1, 'dr_1_photo-73', 1, 0, 53248, 'jpg', 'e61a342d2c9a3bc313655754b3305bc6');
INSERT INTO `dr_attachment` VALUES(111, 1, 'admin', 1, 'dr_1_photo-73', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `dr_attachment` VALUES(112, 1, 'admin', 1, 'dr_1_photo-74', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `dr_attachment` VALUES(113, 1, 'admin', 1, 'dr_1_photo-74', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `dr_attachment` VALUES(114, 1, 'admin', 1, 'dr_1_photo-74', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `dr_attachment` VALUES(115, 1, 'admin', 1, '', 1, 0, 125716, 'jpg', '47e7e5cf32b118a40e745c7de3109cc2');
INSERT INTO `dr_attachment` VALUES(116, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 125716, 'jpg', '47e7e5cf32b118a40e745c7de3109cc2');
INSERT INTO `dr_attachment` VALUES(117, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `dr_attachment` VALUES(118, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 8980, 'jpg', '9bea1e2489849e298b460901c8fe304e');
INSERT INTO `dr_attachment` VALUES(119, 1, 'admin', 1, 'dr_1_photo-75', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `dr_attachment` VALUES(120, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 128174, 'jpg', 'd8fe60006254dd3454c5208b6699ade0');
INSERT INTO `dr_attachment` VALUES(121, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 202230, 'jpg', '9560386db3b666895e2767a744f08589');
INSERT INTO `dr_attachment` VALUES(122, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 125716, 'jpg', '47e7e5cf32b118a40e745c7de3109cc2');
INSERT INTO `dr_attachment` VALUES(123, 1, 'admin', 1, 'dr_1_photo-76', 1, 0, 128174, 'jpg', 'd8fe60006254dd3454c5208b6699ade0');
INSERT INTO `dr_attachment` VALUES(124, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 210975, 'jpg', '1251973e6ec28c1538b2376d87080184');
INSERT INTO `dr_attachment` VALUES(125, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 128174, 'jpg', 'd8fe60006254dd3454c5208b6699ade0');
INSERT INTO `dr_attachment` VALUES(126, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 210975, 'jpg', '1251973e6ec28c1538b2376d87080184');
INSERT INTO `dr_attachment` VALUES(127, 1, 'admin', 1, 'dr_1_photo-77', 1, 0, 176568, 'jpg', '3ff581ad3a611e71e7ab02175bdf4ac4');
INSERT INTO `dr_attachment` VALUES(128, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 422195, 'jpg', '0539d62a19328fa13e83812999df850b');
INSERT INTO `dr_attachment` VALUES(129, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 210975, 'jpg', '1251973e6ec28c1538b2376d87080184');
INSERT INTO `dr_attachment` VALUES(130, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 176568, 'jpg', '3ff581ad3a611e71e7ab02175bdf4ac4');
INSERT INTO `dr_attachment` VALUES(131, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 119398, 'jpg', 'ac23ac15bc7b016e6fcfd6012297b8d9');
INSERT INTO `dr_attachment` VALUES(132, 1, 'admin', 1, 'dr_1_photo-78', 1, 0, 422195, 'jpg', '0539d62a19328fa13e83812999df850b');
INSERT INTO `dr_attachment` VALUES(133, 1, 'admin', 1, 'dr_1_photo-79', 1, 0, 119398, 'jpg', 'ac23ac15bc7b016e6fcfd6012297b8d9');
INSERT INTO `dr_attachment` VALUES(134, 1, 'admin', 1, 'dr_1_photo-79', 1, 0, 131625, 'jpg', '34e8448e9c40009d4c540085f9af7986');
INSERT INTO `dr_attachment` VALUES(135, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `dr_attachment` VALUES(136, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `dr_attachment` VALUES(137, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `dr_attachment` VALUES(138, 1, 'admin', 1, 'dr_1_photo-80', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `dr_attachment` VALUES(139, 1, 'admin', 1, '', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `dr_attachment` VALUES(140, 1, 'admin', 1, 'dr_1_photo-81', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `dr_attachment` VALUES(141, 1, 'admin', 1, 'dr_1_photo-81', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `dr_attachment` VALUES(142, 1, 'admin', 1, 'dr_1_photo-81', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `dr_attachment` VALUES(143, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `dr_attachment` VALUES(144, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `dr_attachment` VALUES(145, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `dr_attachment` VALUES(146, 1, 'admin', 1, 'dr_1_photo-82', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `dr_attachment` VALUES(147, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `dr_attachment` VALUES(148, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 51661, 'jpg', 'bb9511b91d7555aa4967877a391e27be');
INSERT INTO `dr_attachment` VALUES(149, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `dr_attachment` VALUES(150, 1, 'admin', 1, 'dr_1_photo-83', 1, 0, 51937, 'jpg', '912204e7b39bd03660030d4208d7fa04');
INSERT INTO `dr_attachment` VALUES(151, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `dr_attachment` VALUES(152, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `dr_attachment` VALUES(153, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `dr_attachment` VALUES(154, 1, 'admin', 1, 'dr_1_photo-84', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `dr_attachment` VALUES(155, 1, 'admin', 1, 'dr_1_photo-85', 1, 0, 26092, 'jpg', '3369a37d1f1c579a4284b5ef97e6882b');
INSERT INTO `dr_attachment` VALUES(156, 1, 'admin', 1, 'dr_1_photo-85', 1, 0, 35912, 'jpg', '1fbdfe2f856a9dfbe8543629e77598a2');
INSERT INTO `dr_attachment` VALUES(157, 1, 'admin', 1, 'dr_1_photo-86', 1, 0, 26880, 'jpg', '9d89e2b27de9ce105f475944616117e3');
INSERT INTO `dr_attachment` VALUES(158, 1, 'admin', 1, 'dr_1_photo-86', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `dr_attachment` VALUES(159, 1, 'admin', 1, 'dr_1_photo-86', 1, 0, 26092, 'jpg', '3369a37d1f1c579a4284b5ef97e6882b');
INSERT INTO `dr_attachment` VALUES(160, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 93870, 'jpg', '102d4e6614c0f8ae0d13ae7b0f94f416');
INSERT INTO `dr_attachment` VALUES(161, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `dr_attachment` VALUES(162, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 26092, 'jpg', '3369a37d1f1c579a4284b5ef97e6882b');
INSERT INTO `dr_attachment` VALUES(163, 1, 'admin', 1, 'dr_1_photo-87', 1, 0, 93870, 'jpg', '102d4e6614c0f8ae0d13ae7b0f94f416');
INSERT INTO `dr_attachment` VALUES(164, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 36465, 'jpg', '188a0587090bc8790a664b550b0c7521');
INSERT INTO `dr_attachment` VALUES(165, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 36465, 'jpg', '188a0587090bc8790a664b550b0c7521');
INSERT INTO `dr_attachment` VALUES(166, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `dr_attachment` VALUES(167, 1, 'admin', 1, 'dr_1_photo-88', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `dr_attachment` VALUES(168, 1, 'admin', 1, 'dr_1_photo-89', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `dr_attachment` VALUES(169, 1, 'admin', 1, 'dr_1_photo-89', 1, 0, 36465, 'jpg', '188a0587090bc8790a664b550b0c7521');
INSERT INTO `dr_attachment` VALUES(170, 1, 'admin', 1, 'dr_1_photo-89', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `dr_attachment` VALUES(171, 1, 'admin', 1, '', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `dr_attachment` VALUES(172, 1, 'admin', 1, 'dr_1_photo-90', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `dr_attachment` VALUES(173, 1, 'admin', 1, 'dr_1_photo-90', 1, 0, 102144, 'jpg', '729f18525b04ec5688c0f46cf68c8ead');
INSERT INTO `dr_attachment` VALUES(174, 1, 'admin', 1, 'dr_1_photo-90', 1, 0, 57672, 'jpg', 'd4c2c185e46597f2e4046a36b91cbd9a');
INSERT INTO `dr_attachment` VALUES(175, 1, 'admin', 1, 'dr_1_photo-91', 1, 0, 136847, 'jpg', 'ba92fd3695ab9671f1215689f11dd418');
INSERT INTO `dr_attachment` VALUES(176, 1, 'admin', 1, 'dr_1_photo-91', 1, 0, 136847, 'jpg', 'ba92fd3695ab9671f1215689f11dd418');
INSERT INTO `dr_attachment` VALUES(177, 1, 'admin', 1, 'dr_1_photo-92', 1, 0, 22764, 'jpg', 'eab7599c2b7830c48a8ace7b440dca52');
INSERT INTO `dr_attachment` VALUES(178, 1, 'admin', 1, 'dr_1_photo-92', 1, 0, 136847, 'jpg', 'ba92fd3695ab9671f1215689f11dd418');
INSERT INTO `dr_attachment` VALUES(179, 1, 'admin', 1, 'dr_1_photo-92', 1, 0, 22764, 'jpg', 'eab7599c2b7830c48a8ace7b440dca52');
INSERT INTO `dr_attachment` VALUES(180, 1, 'admin', 1, 'dr_1_photo-93', 1, 0, 70482, 'jpg', 'c09798c0093f1ea004858f4258bc1260');
INSERT INTO `dr_attachment` VALUES(181, 1, 'admin', 1, 'dr_1_photo-93', 1, 0, 86600, 'jpg', '8f764f35b5fbb1455e9fdc4dfb868848');
INSERT INTO `dr_attachment` VALUES(182, 1, 'admin', 1, 'dr_1_photo-94', 1, 0, 86600, 'jpg', '8f764f35b5fbb1455e9fdc4dfb868848');
INSERT INTO `dr_attachment` VALUES(183, 1, 'admin', 1, 'dr_1_photo-94', 1, 0, 59750, 'jpg', '86ce7d0995e3fe09088579ded42e710f');
INSERT INTO `dr_attachment` VALUES(184, 1, 'admin', 1, 'dr_1_photo-95', 1, 0, 50196, 'jpg', '605b07ce1894ef18145d7838e072f256');
INSERT INTO `dr_attachment` VALUES(185, 1, 'admin', 1, 'dr_1_photo-95', 1, 0, 70482, 'jpg', 'c09798c0093f1ea004858f4258bc1260');
INSERT INTO `dr_attachment` VALUES(186, 1, 'admin', 1, 'dr_1_photo-96', 1, 0, 66806, 'jpg', '59d0d30c418eb8a138c0976420aebc32');
INSERT INTO `dr_attachment` VALUES(187, 1, 'admin', 1, 'dr_1_photo-96', 1, 0, 66806, 'jpg', '59d0d30c418eb8a138c0976420aebc32');
INSERT INTO `dr_attachment` VALUES(188, 1, 'admin', 1, 'dr_1_photo-96', 1, 0, 188099, 'jpg', '863ba42902bcffdddb1592774fa385aa');
INSERT INTO `dr_attachment` VALUES(189, 1, 'admin', 1, 'dr_1_photo-97', 1, 0, 110019, 'jpg', 'a0f6f3f2b6e838bfe0c31fb83eb96da9');
INSERT INTO `dr_attachment` VALUES(190, 1, 'admin', 1, 'dr_1_photo-97', 1, 0, 512563, 'jpg', '9e05b03de844e3c6027e0a2f46529c86');
INSERT INTO `dr_attachment` VALUES(191, 1, 'admin', 1, 'dr_1_photo-99', 1, 0, 645366, 'jpg', '7592c0cd21649ddd894651f3e3e84826');
INSERT INTO `dr_attachment` VALUES(192, 1, 'admin', 1, '', 1, 0, 110019, 'jpg', 'a0f6f3f2b6e838bfe0c31fb83eb96da9');
INSERT INTO `dr_attachment` VALUES(193, 1, 'admin', 1, '', 1, 0, 512563, 'jpg', '9e05b03de844e3c6027e0a2f46529c86');
INSERT INTO `dr_attachment` VALUES(194, 1, 'admin', 1, 'dr_1_photo-99', 1, 0, 645366, 'jpg', '7592c0cd21649ddd894651f3e3e84826');
INSERT INTO `dr_attachment` VALUES(195, 1, 'admin', 1, 'dr_1_photo-100', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `dr_attachment` VALUES(196, 1, 'admin', 1, 'dr_1_photo-100', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `dr_attachment` VALUES(197, 1, 'admin', 1, 'dr_1_photo-101', 1, 0, 619459, 'jpg', 'f911adea0cebef6367d7469d34da4222');
INSERT INTO `dr_attachment` VALUES(198, 1, 'admin', 1, 'dr_1_photo-101', 1, 0, 619459, 'jpg', 'f911adea0cebef6367d7469d34da4222');
INSERT INTO `dr_attachment` VALUES(199, 1, 'admin', 1, 'dr_1_photo-102', 1, 0, 15626, 'jpg', 'b6940921426b1a43b55d65ed27d8bddb');
INSERT INTO `dr_attachment` VALUES(200, 1, 'admin', 1, 'dr_1_photo-102', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `dr_attachment` VALUES(201, 1, 'admin', 1, 'dr_1_photo-103', 1, 0, 619459, 'jpg', 'f911adea0cebef6367d7469d34da4222');
INSERT INTO `dr_attachment` VALUES(202, 1, 'admin', 1, 'dr_1_photo-103', 1, 0, 360387, 'jpg', '022fe1d3baad2ccf284791aa68a6a78e');
INSERT INTO `dr_attachment` VALUES(203, 1, 'admin', 1, 'dr_1_photo-104', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `dr_attachment` VALUES(204, 1, 'admin', 1, 'dr_1_photo-104', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `dr_attachment` VALUES(205, 1, 'admin', 1, '', 1, 0, 3098952, 'jpg', 'e9c63db2311a12fdaacd4c6ca922c5d7');
INSERT INTO `dr_attachment` VALUES(206, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `dr_attachment` VALUES(207, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `dr_attachment` VALUES(208, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `dr_attachment` VALUES(209, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 403988, 'jpg', 'c14bbb808a06457c3eca13d93f1e7220');
INSERT INTO `dr_attachment` VALUES(210, 1, 'admin', 1, 'dr_1_photo-105', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `dr_attachment` VALUES(211, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `dr_attachment` VALUES(212, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `dr_attachment` VALUES(213, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `dr_attachment` VALUES(214, 1, 'admin', 1, 'dr_1_photo-106', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `dr_attachment` VALUES(215, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `dr_attachment` VALUES(216, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `dr_attachment` VALUES(217, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `dr_attachment` VALUES(218, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `dr_attachment` VALUES(219, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `dr_attachment` VALUES(220, 1, 'admin', 1, 'dr_1_photo-107', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `dr_attachment` VALUES(221, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 163594, 'jpg', '5f3707be82358736e3f708f01c9ae3b8');
INSERT INTO `dr_attachment` VALUES(222, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `dr_attachment` VALUES(223, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `dr_attachment` VALUES(224, 1, 'admin', 1, 'dr_1_photo-108', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `dr_attachment` VALUES(225, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 275005, 'jpg', '1d19685dfe5aa9d646cdac89088748c7');
INSERT INTO `dr_attachment` VALUES(226, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 86313, 'jpg', 'bf419a3c0bde2670fc4bbb71315bca1e');
INSERT INTO `dr_attachment` VALUES(227, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 1569188, 'jpg', '7f8d6ad679c04b07efd4941f6ebf289e');
INSERT INTO `dr_attachment` VALUES(228, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 163594, 'jpg', '5f3707be82358736e3f708f01c9ae3b8');
INSERT INTO `dr_attachment` VALUES(229, 1, 'admin', 1, 'dr_1_photo-109', 1, 0, 275005, 'jpg', '1d19685dfe5aa9d646cdac89088748c7');
INSERT INTO `dr_attachment` VALUES(230, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `dr_attachment` VALUES(231, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `dr_attachment` VALUES(232, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `dr_attachment` VALUES(233, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `dr_attachment` VALUES(234, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 403988, 'jpg', 'c14bbb808a06457c3eca13d93f1e7220');
INSERT INTO `dr_attachment` VALUES(235, 1, 'admin', 1, 'dr_1_photo-110', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `dr_attachment` VALUES(236, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `dr_attachment` VALUES(237, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 121989, 'jpg', '190bde516ef70c8356f4ab0fbbec8d41');
INSERT INTO `dr_attachment` VALUES(238, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 197356, 'jpg', 'f2af63f62b3d11debfb5eebfcf679bce');
INSERT INTO `dr_attachment` VALUES(239, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 129024, 'jpg', '8eb8cb70faa227aefced9970ebd0f17b');
INSERT INTO `dr_attachment` VALUES(240, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 403988, 'jpg', 'c14bbb808a06457c3eca13d93f1e7220');
INSERT INTO `dr_attachment` VALUES(241, 1, 'admin', 1, 'dr_1_photo-111', 1, 0, 341135, 'jpg', 'be54e8c92c2d32fe4ab10d5ddaf9647e');
INSERT INTO `dr_attachment` VALUES(242, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `dr_attachment` VALUES(243, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `dr_attachment` VALUES(244, 1, 'admin', 1, '', 1, 0, 585011200, 'png', '0');
INSERT INTO `dr_attachment` VALUES(245, 1, 'admin', 1, '', 1, 0, 374559744, 'png', '0');
INSERT INTO `dr_attachment` VALUES(246, 1, 'admin', 1, '', 1, 0, 549230592, 'png', '0');
INSERT INTO `dr_attachment` VALUES(247, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `dr_attachment` VALUES(248, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `dr_attachment` VALUES(249, 1, 'admin', 1, '', 1, 0, 392546304, 'png', '0');
INSERT INTO `dr_attachment` VALUES(250, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 383345, 'png', '66fbe770f1a89aada704c8c1f91e8589');
INSERT INTO `dr_attachment` VALUES(251, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 383345, 'png', '66fbe770f1a89aada704c8c1f91e8589');
INSERT INTO `dr_attachment` VALUES(252, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 571300, 'png', 'a75486308d4caab3ce93b55e46d6cdcf');
INSERT INTO `dr_attachment` VALUES(253, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 365783, 'png', '33288e44914b8140e3a0a6c9fcbddd5b');
INSERT INTO `dr_attachment` VALUES(254, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 536361, 'png', '392ee02eb19136fedffbb38728507346');
INSERT INTO `dr_attachment` VALUES(255, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 529715, 'png', '6d5cccfcf22a3c5ea858e4cd6b571b2c');
INSERT INTO `dr_attachment` VALUES(256, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 383345, 'png', '66fbe770f1a89aada704c8c1f91e8589');
INSERT INTO `dr_attachment` VALUES(257, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 571300, 'png', 'a75486308d4caab3ce93b55e46d6cdcf');
INSERT INTO `dr_attachment` VALUES(258, 1, 'admin', 1, 'dr_1_demo-1', 1, 0, 529715, 'png', '6d5cccfcf22a3c5ea858e4cd6b571b2c');

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_0`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_0` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表0';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_1`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_1` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表1';

--
-- 转存表中的数据 `dr_attachment_1`
--

INSERT INTO `dr_attachment_1` VALUES(7, 1, 'admin', 'dr_1_block-1', 'QQ20161104-4@2x', 'png', 1153649, '201611/09436dd6c4.png', 0, '{"width":1140,"height":664}', 1478252466);
INSERT INTO `dr_attachment_1` VALUES(8, 1, 'admin', 'dr_1_block-1', 'QQ20161104-3@2x', 'png', 451430, '201611/b309436dd6.png', 0, '{"width":726,"height":468}', 1478252467);
INSERT INTO `dr_attachment_1` VALUES(9, 1, 'admin', 'dr_1_block-1', 'QQ20161104-2@2x', 'png', 915333, '201611/6dd6c48f2b.png', 0, '{"width":914,"height":628}', 1478252467);
INSERT INTO `dr_attachment_1` VALUES(10, 1, 'admin', 'dr_1_news-1', '139854478', 'jpg', 36680, '201611/47ac5e8a71.jpg', 0, '{"width":640,"height":429}', 1478253027);
INSERT INTO `dr_attachment_1` VALUES(18, 1, 'admin', 'dr_1_down-43', '4bed2e738bd4b31cf7e8017885d6277f9f2ff819', 'jpg', 23470, '201611/e2fcfed12b.jpg', 0, '{"width":250,"height":250}', 1478484927);
INSERT INTO `dr_attachment_1` VALUES(19, 1, 'admin', 'dr_1_down-42', '4bed2e738bd4b31cf7e8017885d6277f9f2ff819', 'jpg', 23470, '201611/c4bdd8befe.jpg', 0, '{"width":250,"height":250}', 1478484945);
INSERT INTO `dr_attachment_1` VALUES(20, 1, 'admin', 'dr_1_down-41', '8ad4b31c8701a18b291947f2982f07082938fe99', 'png', 100413, '201611/a76fe8358b.png', 0, '{"width":300,"height":300}', 1478484958);
INSERT INTO `dr_attachment_1` VALUES(21, 1, 'admin', 'dr_1_down-40', '59c932d3d539b600f5160d2fef50352ac75cb751', 'jpg', 8980, '201611/6d3654bd0a.jpg', 0, '{"width":300,"height":300}', 1478484989);
INSERT INTO `dr_attachment_1` VALUES(22, 1, 'admin', 'dr_1_down-39', 'rBACFFOLHk2i34HeAAAd0wGPTTw022_200x200_3', 'jpg', 7608, '201611/f476e48a04.jpg', 0, '{"width":200,"height":200}', 1478485004);
INSERT INTO `dr_attachment_1` VALUES(23, 1, 'admin', 'dr_1_down-38', '20160811074413_VB4SA', 'png', 72673, '201611/ce0f4a9e86.png', 0, '{"width":220,"height":220}', 1478485018);
INSERT INTO `dr_attachment_1` VALUES(24, 1, 'admin', 'dr_1_down-37', '8644ebf81a4c510f51dd68546659252dd42aa567', 'jpg', 7485, '201611/727fbbb410.jpg', 0, '{"width":200,"height":200}', 1478485031);
INSERT INTO `dr_attachment_1` VALUES(25, 1, 'admin', 'dr_1_down-36', '20160811074413_VB4SA', 'png', 72673, '201611/515b02a64f.png', 0, '{"width":220,"height":220}', 1478485046);
INSERT INTO `dr_attachment_1` VALUES(26, 1, 'admin', 'dr_1_fang-44', '06t58PICncZ_1024', 'jpg', 126659, '201611/de07a079d6.jpg', 0, '{"width":1024,"height":790}', 1478485409);
INSERT INTO `dr_attachment_1` VALUES(27, 1, 'admin', 'dr_1_fang-44', '06t58PICncZ_1024', 'jpg', 126659, '201611/ffc408ca46.jpg', 0, '{"width":1024,"height":790}', 1478485464);
INSERT INTO `dr_attachment_1` VALUES(28, 1, 'admin', 'dr_1_fang-45', '56e7751ed6533', 'jpg', 798351, '201611/69384faa8b.jpg', 0, '{"width":3888,"height":2592}', 1478485618);
INSERT INTO `dr_attachment_1` VALUES(29, 1, 'admin', 'dr_1_fang-45', '56e7751ed6533', 'jpg', 798351, '201611/0fdebad5b1.jpg', 0, '{"width":3888,"height":2592}', 1478485635);
INSERT INTO `dr_attachment_1` VALUES(30, 1, 'admin', 'dr_1_fang-46', '738b4710b912c8fc2ce014bfff039245d68821b5', 'jpg', 225618, '201611/554b860512.jpg', 0, '{"width":1004,"height":699}', 1478485742);
INSERT INTO `dr_attachment_1` VALUES(31, 1, 'admin', 'dr_1_fang-47', '914109_163208469000_2', 'jpg', 401807, '201611/0389987153.jpg', 0, '{"width":1024,"height":780}', 1478485840);
INSERT INTO `dr_attachment_1` VALUES(32, 1, 'admin', 'dr_1_fang-47', '914109_163208469000_2', 'jpg', 401807, '201611/d1ba167ba6.jpg', 0, '{"width":1024,"height":780}', 1478485851);
INSERT INTO `dr_attachment_1` VALUES(33, 1, 'admin', 'dr_1_fang-48', '914109_210757456000_2', 'jpg', 452905, '201611/021a979c88.jpg', 0, '{"width":1024,"height":683}', 1478486000);
INSERT INTO `dr_attachment_1` VALUES(34, 1, 'admin', 'dr_1_fang-48', '914109_210757456000_2', 'jpg', 452905, '201611/ba7428b862.jpg', 0, '{"width":1024,"height":683}', 1478486011);
INSERT INTO `dr_attachment_1` VALUES(35, 1, 'admin', 'dr_1_fang-49', '4114512_084432034885_2', 'jpg', 279060, '201611/b68cffdaf8.jpg', 0, '{"width":1024,"height":688}', 1478486399);
INSERT INTO `dr_attachment_1` VALUES(36, 1, 'admin', 'dr_1_fang-49', '4114512_084432034885_2', 'jpg', 279060, '201611/55f3a9e212.jpg', 0, '{"width":1024,"height":688}', 1478486413);
INSERT INTO `dr_attachment_1` VALUES(37, 1, 'admin', 'dr_1_fang-50', '4915200_114049531110_2', 'jpg', 260393, '201611/8489e23e91.jpg', 0, '{"width":768,"height":1024}', 1478486650);
INSERT INTO `dr_attachment_1` VALUES(38, 1, 'admin', 'dr_1_fang-50', '4915200_114049531110_2', 'jpg', 260393, '201611/d026557b41.jpg', 0, '{"width":768,"height":1024}', 1478486658);
INSERT INTO `dr_attachment_1` VALUES(39, 1, 'admin', 'dr_1_fang-51', '9880981_201646746168_2', 'jpg', 277228, '201611/bcdef6cf97.jpg', 0, '{"width":1024,"height":684}', 1478486768);
INSERT INTO `dr_attachment_1` VALUES(40, 1, 'admin', 'dr_1_fang-51', '9880981_201646746168_2', 'jpg', 277228, '201611/33a4054f53.jpg', 0, '{"width":1024,"height":684}', 1478486775);
INSERT INTO `dr_attachment_1` VALUES(41, 1, 'admin', 'dr_1_fang-52', '12993780_125123492000_2', 'jpg', 78131, '201611/fc29f170a6.jpg', 0, '{"width":1024,"height":695}', 1478486976);
INSERT INTO `dr_attachment_1` VALUES(42, 1, 'admin', 'dr_1_fang-52', '12993780_125123492000_2', 'jpg', 78131, '201611/e1fa3bf454.jpg', 0, '{"width":1024,"height":695}', 1478486983);
INSERT INTO `dr_attachment_1` VALUES(43, 1, 'admin', 'dr_1_fang-53', '20150318102238_4008', 'jpg', 221522, '201611/1adf6f1c36.jpg', 0, '{"width":1131,"height":707}', 1478487096);
INSERT INTO `dr_attachment_1` VALUES(44, 1, 'admin', 'dr_1_fang-53', '20150318102238_4008', 'jpg', 221522, '201611/73e868e958.jpg', 0, '{"width":1131,"height":707}', 1478487105);
INSERT INTO `dr_attachment_1` VALUES(45, 1, 'admin', 'dr_1_fang-54', 'b74e53a67d4511e6aae400163e00254c', 'jpg', 85729, '201611/029695adc4.jpg', 0, '{"width":557,"height":372}', 1478487162);
INSERT INTO `dr_attachment_1` VALUES(46, 1, 'admin', 'dr_1_fang-54', 'b74e53a67d4511e6aae400163e00254c', 'jpg', 85729, '201611/73ac62d39b.jpg', 0, '{"width":557,"height":372}', 1478487170);
INSERT INTO `dr_attachment_1` VALUES(47, 1, 'admin', 'dr_1_fang-55', '20150318102238_4008', 'jpg', 221522, '201611/08e1327c34.jpg', 0, '{"width":1131,"height":707}', 1478487232);
INSERT INTO `dr_attachment_1` VALUES(48, 1, 'admin', 'dr_1_fang-55', '20150318102238_4008', 'jpg', 221522, '201611/f71d086848.jpg', 0, '{"width":1131,"height":707}', 1478487242);
INSERT INTO `dr_attachment_1` VALUES(50, 1, 'admin', 'dr_1_photo-56', '1-14112Q14R5', 'jpg', 7209, '201611/f55bf01b79.jpg', 0, '{"width":200,"height":200}', 1478487541);
INSERT INTO `dr_attachment_1` VALUES(49, 1, 'admin', 'dr_1_photo-56', '1-14112Q14R5', 'jpg', 7209, '201611/6d032d3916.jpg', 0, '{"width":200,"height":200}', 1478487533);
INSERT INTO `dr_attachment_1` VALUES(51, 1, 'admin', 'dr_1_photo-56', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/b17fcabdca.jpg', 0, '{"width":300,"height":300}', 1478487553);
INSERT INTO `dr_attachment_1` VALUES(54, 1, 'admin', 'dr_1_photo-57', '786e6c061d950a7b4edcdb790ad162d9f3d3c90c', 'png', 117371, '201611/118fc82c86.png', 0, '{"width":300,"height":300}', 1478487615);
INSERT INTO `dr_attachment_1` VALUES(53, 1, 'admin', 'dr_1_photo-57', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/822c6a0304.jpg', 0, '{"width":200,"height":200}', 1478487603);
INSERT INTO `dr_attachment_1` VALUES(52, 1, 'admin', 'dr_1_photo-57', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/8964c5924f.jpg', 0, '{"width":200,"height":200}', 1478487597);
INSERT INTO `dr_attachment_1` VALUES(55, 1, 'admin', 'dr_1_photo-57', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/cf2955ebeb.jpg', 0, '{"width":300,"height":300}', 1478487615);
INSERT INTO `dr_attachment_1` VALUES(56, 1, 'admin', 'dr_1_photo-57', '55cc613d0212b816_jpg!200x200', 'jpg', 8018, '201611/acf2955ebe.jpg', 0, '{"width":200,"height":200}', 1478487616);
INSERT INTO `dr_attachment_1` VALUES(61, 1, 'admin', 'dr_1_photo-59', '55824602bc8d3046_jpg!200x200', 'jpg', 9247, '201611/ebd5b75e4c1.jpg', 0, '{"width":200,"height":200}', 1478487792);
INSERT INTO `dr_attachment_1` VALUES(60, 1, 'admin', 'dr_1_photo-59', '786e6c061d950a7b4edcdb790ad162d9f3d3c90c', 'png', 117371, '201611/6c0cfd9ebd.png', 0, '{"width":300,"height":300}', 1478487792);
INSERT INTO `dr_attachment_1` VALUES(59, 1, 'admin', 'dr_1_photo-59', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/d9ebd5b75e.jpg', 0, '{"width":200,"height":200}', 1478487792);
INSERT INTO `dr_attachment_1` VALUES(58, 1, 'admin', 'dr_1_photo-59', '55cc613d0212b816_jpg!200x200', 'jpg', 8018, '201611/ebd5b75e4c.jpg', 0, '{"width":200,"height":200}', 1478487791);
INSERT INTO `dr_attachment_1` VALUES(57, 1, 'admin', 'dr_1_photo-59', 'e00fc878jw8erzl99mmf3j20u00u0407', 'jpg', 63396, '201611/188dec66d9.jpg', 0, '{"width":1024,"height":1024}', 1478487777);
INSERT INTO `dr_attachment_1` VALUES(65, 1, 'admin', 'dr_1_photo-60', '20131023221024_dVS2M_thumb_200_0', 'gif', 16660, '201611/15785ab952.gif', 0, '{"width":200,"height":200}', 1478487831);
INSERT INTO `dr_attachment_1` VALUES(62, 1, 'admin', 'dr_1_photo-60', '20131023220851_Wf3cM_thumb_224_0', 'jpg', 11018, '201611/348f37d0bf.jpg', 0, '{"width":224,"height":224}', 1478487818);
INSERT INTO `dr_attachment_1` VALUES(63, 1, 'admin', 'dr_1_photo-60', '20160811074413_VB4SA', 'png', 72673, '201611/5785ab9528.png', 0, '{"width":220,"height":220}', 1478487831);
INSERT INTO `dr_attachment_1` VALUES(64, 1, 'admin', 'dr_1_photo-60', 'e00fc878jw8erzl99mmf3j20u00u0407', 'jpg', 63396, '201611/92fececdd4.jpg', 0, '{"width":1024,"height":1024}', 1478487831);
INSERT INTO `dr_attachment_1` VALUES(66, 1, 'admin', 'dr_1_photo-61', '20131023221024_dVS2M_thumb_200_0', 'gif', 16660, '201611/ac379cb995.gif', 0, '{"width":200,"height":200}', 1478487872);
INSERT INTO `dr_attachment_1` VALUES(69, 1, 'admin', 'dr_1_photo-61', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/35582753a6.jpg', 0, '{"width":200,"height":200}', 1478487880);
INSERT INTO `dr_attachment_1` VALUES(68, 1, 'admin', 'dr_1_photo-61', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/4e52fd4fee.jpg', 0, '{"width":300,"height":300}', 1478487880);
INSERT INTO `dr_attachment_1` VALUES(67, 1, 'admin', 'dr_1_photo-61', '1-14112Q14R5', 'jpg', 7209, '201611/fee2f6be66.jpg', 0, '{"width":200,"height":200}', 1478487880);
INSERT INTO `dr_attachment_1` VALUES(73, 1, 'admin', 'dr_1_photo-62', '9cb5ff1f4134970a2d97468b95cad1c8a6865d17', 'jpg', 23798, '201611/81d94ba023.jpg', 0, '{"width":300,"height":300}', 1478487937);
INSERT INTO `dr_attachment_1` VALUES(74, 1, 'admin', 'dr_1_photo-62', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/4ba0239b30.jpg', 0, '{"width":200,"height":200}', 1478487937);
INSERT INTO `dr_attachment_1` VALUES(72, 1, 'admin', 'dr_1_photo-62', '4bed2e738bd4b31cf7e8017885d6277f9f2ff819', 'jpg', 23470, '201611/da30981d94.jpg', 0, '{"width":250,"height":250}', 1478487937);
INSERT INTO `dr_attachment_1` VALUES(70, 1, 'admin', 'dr_1_photo-62', '55824602bc8d3046_jpg!200x200', 'jpg', 9247, '201611/bc8c6b75e4.jpg', 0, '{"width":200,"height":200}', 1478487927);
INSERT INTO `dr_attachment_1` VALUES(71, 1, 'admin', 'dr_1_photo-62', '1-14112Q14R5', 'jpg', 7209, '201611/0981d94ba0.jpg', 0, '{"width":200,"height":200}', 1478487937);
INSERT INTO `dr_attachment_1` VALUES(78, 1, 'admin', 'dr_1_photo-63', '59c932d3d539b600f5160d2fef50352ac75cb751', 'jpg', 8980, '201611/b63e6d68f0.jpg', 0, '{"width":300,"height":300}', 1478487967);
INSERT INTO `dr_attachment_1` VALUES(79, 1, 'admin', 'dr_1_photo-63', '531c66a6754ce602_jpg!200x200', 'jpg', 8612, '201611/a97b67547c.jpg', 0, '{"width":200,"height":200}', 1478487967);
INSERT INTO `dr_attachment_1` VALUES(75, 1, 'admin', 'dr_1_photo-63', 'e00fc878jw8erzl99mmf3j20u00u0407', 'jpg', 63396, '201611/f554897c50.jpg', 0, '{"width":1024,"height":1024}', 1478487957);
INSERT INTO `dr_attachment_1` VALUES(77, 1, 'admin', 'dr_1_photo-63', '55de67ffa9e23209_jpg!200x200', 'jpg', 8817, '201611/174f062b63.jpg', 0, '{"width":200,"height":200}', 1478487967);
INSERT INTO `dr_attachment_1` VALUES(76, 1, 'admin', 'dr_1_photo-63', '23-075730_845', 'jpg', 18596, '201611/f04fcbea9e.jpg', 0, '{"width":200,"height":200}', 1478487967);
INSERT INTO `dr_attachment_1` VALUES(82, 1, 'admin', 'dr_1_photo-64', '1252374344215_mthumb', 'jpg', 195738, '201611/0476247769.jpg', 0, '{"width":700,"height":467}', 1478489263);
INSERT INTO `dr_attachment_1` VALUES(80, 1, 'admin', 'dr_1_photo-64', '16772285_16772285_1356060252515_mthumb', 'jpg', 177132, '201611/41a581a555.jpg', 0, '{"width":600,"height":399}', 1478489245);
INSERT INTO `dr_attachment_1` VALUES(81, 1, 'admin', 'dr_1_photo-64', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/c7d986262f.jpg', 0, '{"width":600,"height":337}', 1478489262);
INSERT INTO `dr_attachment_1` VALUES(83, 1, 'admin', 'dr_1_photo-65', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/2b3c6ea12c.jpg', 0, '{"width":600,"height":337}', 1478489288);
INSERT INTO `dr_attachment_1` VALUES(84, 1, 'admin', 'dr_1_photo-65', '16772285_16772285_1356060252515_mthumb', 'jpg', 177132, '201611/36ecf1d321.jpg', 0, '{"width":600,"height":399}', 1478489300);
INSERT INTO `dr_attachment_1` VALUES(85, 1, 'admin', 'dr_1_photo-65', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/c80759ade3.jpg', 0, '{"width":600,"height":337}', 1478489300);
INSERT INTO `dr_attachment_1` VALUES(86, 1, 'admin', 'dr_1_photo-66', '1252374344215_mthumb', 'jpg', 195738, '201611/451928a4bb.jpg', 0, '{"width":700,"height":467}', 1478489342);
INSERT INTO `dr_attachment_1` VALUES(87, 1, 'admin', 'dr_1_photo-66', '16772285_16772285_1356060253515_mthumb', 'jpg', 156006, '201611/b8a8ba6103.jpg', 0, '{"width":600,"height":337}', 1478489364);
INSERT INTO `dr_attachment_1` VALUES(88, 1, 'admin', 'dr_1_photo-66', '1252374344215_mthumb', 'jpg', 195738, '201611/a8ba6103bd.jpg', 0, '{"width":700,"height":467}', 1478489365);
INSERT INTO `dr_attachment_1` VALUES(89, 1, 'admin', 'dr_1_photo-67', '20131212110511-1194663692', 'png', 478894, '201611/24cec67b86.png', 0, '{"width":703,"height":438}', 1478489571);
INSERT INTO `dr_attachment_1` VALUES(91, 1, 'admin', 'dr_1_photo-67', '20131212110511-1194663692', 'png', 478894, '201611/b84c8cbf87.png', 0, '{"width":703,"height":438}', 1478489617);
INSERT INTO `dr_attachment_1` VALUES(90, 1, 'admin', 'dr_1_photo-67', '1252374344215_mthumb', 'jpg', 195738, '201611/584d0485bc.jpg', 0, '{"width":700,"height":467}', 1478489616);
INSERT INTO `dr_attachment_1` VALUES(95, 1, 'admin', 'dr_1_photo-68', '20150321000120-20333', 'jpg', 187054, '201611/649269fa94.jpg', 0, '{"width":750,"height":398}', 1478489670);
INSERT INTO `dr_attachment_1` VALUES(94, 1, 'admin', 'dr_1_photo-68', '20131212110511-1194663692', 'png', 478894, '201611/49269fa945.png', 0, '{"width":703,"height":438}', 1478489669);
INSERT INTO `dr_attachment_1` VALUES(92, 1, 'admin', 'dr_1_photo-68', '20150321000120-20333', 'jpg', 187054, '201611/15547886f7.jpg', 0, '{"width":750,"height":398}', 1478489652);
INSERT INTO `dr_attachment_1` VALUES(93, 1, 'admin', 'dr_1_photo-68', '1252374344215_mthumb', 'jpg', 195738, '201611/61aa6d25a8.jpg', 0, '{"width":700,"height":467}', 1478489669);
INSERT INTO `dr_attachment_1` VALUES(96, 1, 'admin', 'dr_1_photo-69', 'u=2669148020,976207079&fm=21&gp=0', 'jpg', 22323, '201611/f8abd276f8.jpg', 0, '{"width":334,"height":220}', 1478489792);
INSERT INTO `dr_attachment_1` VALUES(98, 1, 'admin', 'dr_1_photo-69', '201204261554489254', 'jpg', 102380, '201611/051919a181.jpg', 0, '{"width":500,"height":334}', 1478489803);
INSERT INTO `dr_attachment_1` VALUES(97, 1, 'admin', 'dr_1_photo-69', '20080727164228892', 'jpg', 99308, '201611/6b9da2bd8b.jpg', 0, '{"width":500,"height":320}', 1478489803);
INSERT INTO `dr_attachment_1` VALUES(101, 1, 'admin', 'dr_1_photo-70', 't018d061b5e655053da', 'png', 358052, '201611/2faec7aff2.png', 0, '{"width":548,"height":326}', 1478489832);
INSERT INTO `dr_attachment_1` VALUES(102, 1, 'admin', 'dr_1_photo-70', 'u=2669148020,976207079&fm=21&gp=0', 'jpg', 22323, '201611/3f2faec7af.jpg', 0, '{"width":334,"height":220}', 1478489833);
INSERT INTO `dr_attachment_1` VALUES(99, 1, 'admin', 'dr_1_photo-70', 't018d061b5e655053da', 'png', 358052, '201611/acbcc29cf7.png', 0, '{"width":548,"height":326}', 1478489822);
INSERT INTO `dr_attachment_1` VALUES(100, 1, 'admin', 'dr_1_photo-70', '201204261554489254', 'jpg', 102380, '201611/ce746723f2.jpg', 0, '{"width":500,"height":334}', 1478489832);
INSERT INTO `dr_attachment_1` VALUES(103, 1, 'admin', 'dr_1_photo-71', 'u=2669148020,976207079&fm=21&gp=0', 'jpg', 22323, '201611/d0e33522df.jpg', 0, '{"width":334,"height":220}', 1478489851);
INSERT INTO `dr_attachment_1` VALUES(104, 1, 'admin', 'dr_1_photo-71', '20080727164228892', 'jpg', 99308, '201611/0f1ba1e5c4.jpg', 0, '{"width":500,"height":320}', 1478489863);
INSERT INTO `dr_attachment_1` VALUES(106, 1, 'admin', 'dr_1_photo-71', 'psj', 'jpg', 392950, '201611/d9cb50f1ba.jpg', 0, '{"width":700,"height":522}', 1478489864);
INSERT INTO `dr_attachment_1` VALUES(105, 1, 'admin', 'dr_1_photo-71', '201204261554489254', 'jpg', 102380, '201611/4700f75d9c.jpg', 0, '{"width":500,"height":334}', 1478489864);
INSERT INTO `dr_attachment_1` VALUES(107, 1, 'admin', 'dr_1_photo-72', '_34423869907715406921904914816295740474', 'jpg', 53248, '201611/eac333381d.jpg', 0, '{"width":481,"height":550}', 1478490159);
INSERT INTO `dr_attachment_1` VALUES(108, 1, 'admin', 'dr_1_photo-72', '_34423869907715406921904914816295740474', 'jpg', 53248, '201611/aefc54470c.jpg', 0, '{"width":481,"height":550}', 1478490165);
INSERT INTO `dr_attachment_1` VALUES(109, 1, 'admin', 'dr_1_photo-73', '28U593Z4L292', 'jpg', 131625, '201611/eae467ed05.jpg', 0, '{"width":500,"height":682}', 1478490198);
INSERT INTO `dr_attachment_1` VALUES(110, 1, 'admin', 'dr_1_photo-73', '_34423869907715406921904914816295740474', 'jpg', 53248, '201611/fc280e8f53.jpg', 0, '{"width":481,"height":550}', 1478490209);
INSERT INTO `dr_attachment_1` VALUES(111, 1, 'admin', 'dr_1_photo-73', '28U593Z4L292', 'jpg', 131625, '201611/82c794def4.jpg', 0, '{"width":500,"height":682}', 1478490209);
INSERT INTO `dr_attachment_1` VALUES(112, 1, 'admin', 'dr_1_photo-74', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/66f68a27d6.jpg', 0, '{"width":954,"height":1024}', 1478490224);
INSERT INTO `dr_attachment_1` VALUES(113, 1, 'admin', 'dr_1_photo-74', '28U593Z4L292', 'jpg', 131625, '201611/1d5c035afe.jpg', 0, '{"width":500,"height":682}', 1478490232);
INSERT INTO `dr_attachment_1` VALUES(114, 1, 'admin', 'dr_1_photo-74', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/819d2d341f.jpg', 0, '{"width":954,"height":1024}', 1478490232);
INSERT INTO `dr_attachment_1` VALUES(119, 1, 'admin', 'dr_1_photo-75', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/d20e22a90d.jpg', 0, '{"width":954,"height":1024}', 1478490311);
INSERT INTO `dr_attachment_1` VALUES(118, 1, 'admin', 'dr_1_photo-75', '59c932d3d539b600f5160d2fef50352ac75cb751', 'jpg', 8980, '201611/0d20e22a90.jpg', 0, '{"width":300,"height":300}', 1478490311);
INSERT INTO `dr_attachment_1` VALUES(117, 1, 'admin', 'dr_1_photo-75', '28U593Z4L292', 'jpg', 131625, '201611/c62bc4cca5.jpg', 0, '{"width":500,"height":682}', 1478490310);
INSERT INTO `dr_attachment_1` VALUES(116, 1, 'admin', 'dr_1_photo-75', '576689_012358067_2', 'jpg', 125716, '201611/351d92e537.jpg', 0, '{"width":769,"height":1024}', 1478490301);
INSERT INTO `dr_attachment_1` VALUES(123, 1, 'admin', 'dr_1_photo-76', '576689_191655002_2', 'jpg', 128174, '201611/45956956bc.jpg', 0, '{"width":1024,"height":1024}', 1478490341);
INSERT INTO `dr_attachment_1` VALUES(122, 1, 'admin', 'dr_1_photo-76', '576689_012358067_2', 'jpg', 125716, '201611/bc109ae493.jpg', 0, '{"width":769,"height":1024}', 1478490340);
INSERT INTO `dr_attachment_1` VALUES(120, 1, 'admin', 'dr_1_photo-76', '576689_191655002_2', 'jpg', 128174, '201611/771f0a3258.jpg', 0, '{"width":1024,"height":1024}', 1478490329);
INSERT INTO `dr_attachment_1` VALUES(121, 1, 'admin', 'dr_1_photo-76', '728da9773912b31bee2452f68718367adbb4e1a1', 'jpg', 202230, '201611/39d3d31046.jpg', 0, '{"width":954,"height":1024}', 1478490340);
INSERT INTO `dr_attachment_1` VALUES(127, 1, 'admin', 'dr_1_photo-77', '1960886_163150036171_2', 'jpg', 176568, '201611/26ed1b6dc1.jpg', 0, '{"width":762,"height":1024}', 1478490369);
INSERT INTO `dr_attachment_1` VALUES(124, 1, 'admin', 'dr_1_photo-77', '1960886_162120011328_2', 'jpg', 210975, '201611/b21df26504.jpg', 0, '{"width":822,"height":1024}', 1478490358);
INSERT INTO `dr_attachment_1` VALUES(126, 1, 'admin', 'dr_1_photo-77', '1960886_162120011328_2', 'jpg', 210975, '201611/1b6dc1082c.jpg', 0, '{"width":822,"height":1024}', 1478490369);
INSERT INTO `dr_attachment_1` VALUES(125, 1, 'admin', 'dr_1_photo-77', '576689_191655002_2', 'jpg', 128174, '201611/c1082cdce8.jpg', 0, '{"width":1024,"height":1024}', 1478490369);
INSERT INTO `dr_attachment_1` VALUES(131, 1, 'admin', 'dr_1_photo-78', '4049717_153408072905_2', 'jpg', 119398, '201611/901e3c7323.jpg', 0, '{"width":667,"height":1024}', 1478490401);
INSERT INTO `dr_attachment_1` VALUES(130, 1, 'admin', 'dr_1_photo-78', '1960886_163150036171_2', 'jpg', 176568, '201611/99c44b20b7.jpg', 0, '{"width":762,"height":1024}', 1478490401);
INSERT INTO `dr_attachment_1` VALUES(128, 1, 'admin', 'dr_1_photo-78', 'c12835d92dabd5725a828521cd15e712', 'jpg', 422195, '201611/c4c816eeaf.jpg', 0, '{"width":1100,"height":1650}', 1478490386);
INSERT INTO `dr_attachment_1` VALUES(129, 1, 'admin', 'dr_1_photo-78', '1960886_162120011328_2', 'jpg', 210975, '201611/099c44b20b.jpg', 0, '{"width":822,"height":1024}', 1478490401);
INSERT INTO `dr_attachment_1` VALUES(132, 1, 'admin', 'dr_1_photo-78', 'c12835d92dabd5725a828521cd15e712', 'jpg', 422195, '201611/901e3c73231.jpg', 0, '{"width":1100,"height":1650}', 1478490402);
INSERT INTO `dr_attachment_1` VALUES(133, 1, 'admin', 'dr_1_photo-79', '4049717_153408072905_2', 'jpg', 119398, '201611/25715f1f5e.jpg', 0, '{"width":667,"height":1024}', 1478490481);
INSERT INTO `dr_attachment_1` VALUES(134, 1, 'admin', 'dr_1_photo-79', '28U593Z4L292', 'jpg', 131625, '201611/1ed4da19f1.jpg', 0, '{"width":500,"height":682}', 1478490487);
INSERT INTO `dr_attachment_1` VALUES(135, 1, 'admin', 'dr_1_photo-80', '1-150QH0260E08', 'jpg', 51661, '201611/58a0cb080e.jpg', 0, '{"width":641,"height":378}', 1478490653);
INSERT INTO `dr_attachment_1` VALUES(138, 1, 'admin', 'dr_1_photo-80', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/356a680928.jpg', 0, '{"width":548,"height":410}', 1478490663);
INSERT INTO `dr_attachment_1` VALUES(137, 1, 'admin', 'dr_1_photo-80', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/fd2da32983.jpg', 0, '{"width":450,"height":343}', 1478490663);
INSERT INTO `dr_attachment_1` VALUES(136, 1, 'admin', 'dr_1_photo-80', '1-150QH0260E08', 'jpg', 51661, '201611/3a685acaab.jpg', 0, '{"width":641,"height":378}', 1478490663);
INSERT INTO `dr_attachment_1` VALUES(140, 1, 'admin', 'dr_1_photo-81', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/4df0e81b3c.jpg', 0, '{"width":450,"height":343}', 1478490721);
INSERT INTO `dr_attachment_1` VALUES(141, 1, 'admin', 'dr_1_photo-81', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/3fbce4bb05.jpg', 0, '{"width":450,"height":343}', 1478490731);
INSERT INTO `dr_attachment_1` VALUES(142, 1, 'admin', 'dr_1_photo-81', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/c861319274.jpg', 0, '{"width":548,"height":410}', 1478490731);
INSERT INTO `dr_attachment_1` VALUES(143, 1, 'admin', 'dr_1_photo-82', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/d44d674858.jpg', 0, '{"width":548,"height":410}', 1478490746);
INSERT INTO `dr_attachment_1` VALUES(146, 1, 'admin', 'dr_1_photo-82', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/953949e49e.jpg', 0, '{"width":548,"height":410}', 1478490755);
INSERT INTO `dr_attachment_1` VALUES(144, 1, 'admin', 'dr_1_photo-82', '1-150QH0260E08', 'jpg', 51661, '201611/49e593ce6d.jpg', 0, '{"width":641,"height":378}', 1478490755);
INSERT INTO `dr_attachment_1` VALUES(145, 1, 'admin', 'dr_1_photo-82', '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/3d1583e953.jpg', 0, '{"width":450,"height":343}', 1478490755);
INSERT INTO `dr_attachment_1` VALUES(150, 1, 'admin', 'dr_1_photo-83', '02a98e89a082494e965d71f25ddf8224 - 副本', 'jpg', 51937, '201611/bc7d12a6d5.jpg', 0, '{"width":450,"height":343}', 1478490787);
INSERT INTO `dr_attachment_1` VALUES(147, 1, 'admin', 'dr_1_photo-83', '659-1512011A952', 'jpg', 188099, '201611/068a3a725f.jpg', 0, '{"width":500,"height":386}', 1478490771);
INSERT INTO `dr_attachment_1` VALUES(149, 1, 'admin', 'dr_1_photo-83', '659-1512011A952 - 副本', 'jpg', 188099, '201611/6d5307a169.jpg', 0, '{"width":500,"height":386}', 1478490787);
INSERT INTO `dr_attachment_1` VALUES(148, 1, 'admin', 'dr_1_photo-83', '1-150QH0260E08 - 副本', 'jpg', 51661, '201611/151904e138.jpg', 0, '{"width":641,"height":378}', 1478490786);
INSERT INTO `dr_attachment_1` VALUES(153, 1, 'admin', 'dr_1_photo-84', '659-1512011A952 - 副本', 'jpg', 188099, '201611/be74f23226.jpg', 0, '{"width":500,"height":386}', 1478490815);
INSERT INTO `dr_attachment_1` VALUES(154, 1, 'admin', 'dr_1_photo-84', '201212281546', 'jpg', 50196, '201611/34c696f6be.jpg', 0, '{"width":389,"height":489}', 1478490815);
INSERT INTO `dr_attachment_1` VALUES(151, 1, 'admin', 'dr_1_photo-84', '201212281546', 'jpg', 50196, '201611/4003070568.jpg', 0, '{"width":389,"height":489}', 1478490803);
INSERT INTO `dr_attachment_1` VALUES(152, 1, 'admin', 'dr_1_photo-84', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/e74f232262.jpg', 0, '{"width":548,"height":410}', 1478490815);
INSERT INTO `dr_attachment_1` VALUES(155, 1, 'admin', 'dr_1_photo-85', '20120702022248177', 'jpg', 26092, '201611/3f0e94a7e6.jpg', 0, '{"width":454,"height":550}', 1478490829);
INSERT INTO `dr_attachment_1` VALUES(156, 1, 'admin', 'dr_1_photo-85', '17200771510301532192', 'jpg', 35912, '201611/33a6cc201b.jpg', 0, '{"width":500,"height":421}', 1478490836);
INSERT INTO `dr_attachment_1` VALUES(157, 1, 'admin', 'dr_1_photo-86', 'o0peTHD9', 'jpg', 26880, '201611/14d5d631b5.jpg', 0, '{"width":533,"height":399}', 1478490850);
INSERT INTO `dr_attachment_1` VALUES(158, 1, 'admin', 'dr_1_photo-86', '201212281546', 'jpg', 50196, '201611/7f62c08634.jpg', 0, '{"width":389,"height":489}', 1478490857);
INSERT INTO `dr_attachment_1` VALUES(159, 1, 'admin', 'dr_1_photo-86', '20120702022248177', 'jpg', 26092, '201611/aac2a8a7bb.jpg', 0, '{"width":454,"height":550}', 1478490857);
INSERT INTO `dr_attachment_1` VALUES(162, 1, 'admin', 'dr_1_photo-87', '20120702022248177', 'jpg', 26092, '201611/e7c3cdc827.jpg', 0, '{"width":454,"height":550}', 1478490881);
INSERT INTO `dr_attachment_1` VALUES(163, 1, 'admin', 'dr_1_photo-87', 'p34814031', 'jpg', 93870, '201611/5f522b93fa.jpg', 0, '{"width":440,"height":536}', 1478490881);
INSERT INTO `dr_attachment_1` VALUES(160, 1, 'admin', 'dr_1_photo-87', 'p34814031', 'jpg', 93870, '201611/10d442478b.jpg', 0, '{"width":440,"height":536}', 1478490871);
INSERT INTO `dr_attachment_1` VALUES(161, 1, 'admin', 'dr_1_photo-87', '659-1512011A952', 'jpg', 188099, '201611/f522b93fa5.jpg', 0, '{"width":500,"height":386}', 1478490881);
INSERT INTO `dr_attachment_1` VALUES(164, 1, 'admin', 'dr_1_photo-88', '965359bd6e504f0d5218d9b2ec804d00', 'jpg', 36465, '201611/c7200bb49a.jpg', 0, '{"width":600,"height":597}', 1478491066);
INSERT INTO `dr_attachment_1` VALUES(167, 1, 'admin', 'dr_1_photo-88', '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/878ee1f330.jpg', 0, '{"width":550,"height":542}', 1478491095);
INSERT INTO `dr_attachment_1` VALUES(166, 1, 'admin', 'dr_1_photo-88', '6821646_420524', 'jpg', 102144, '201611/6b7ea2878e.jpg', 0, '{"width":345,"height":260}', 1478491095);
INSERT INTO `dr_attachment_1` VALUES(165, 1, 'admin', 'dr_1_photo-88', '965359bd6e504f0d5218d9b2ec804d00', 'jpg', 36465, '201611/79d1bdb1c4.jpg', 0, '{"width":600,"height":597}', 1478491095);
INSERT INTO `dr_attachment_1` VALUES(168, 1, 'admin', 'dr_1_photo-89', '6821646_420524', 'jpg', 102144, '201611/6c6fa142fb.jpg', 0, '{"width":345,"height":260}', 1478491114);
INSERT INTO `dr_attachment_1` VALUES(169, 1, 'admin', 'dr_1_photo-89', '965359bd6e504f0d5218d9b2ec804d00', 'jpg', 36465, '201611/c2caf62c3c.jpg', 0, '{"width":600,"height":597}', 1478491121);
INSERT INTO `dr_attachment_1` VALUES(170, 1, 'admin', 'dr_1_photo-89', '6821646_420524', 'jpg', 102144, '201611/c2caf62c3c1.jpg', 0, '{"width":345,"height":260}', 1478491122);
INSERT INTO `dr_attachment_1` VALUES(172, 1, 'admin', 'dr_1_photo-90', '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/3c54e439cd.jpg', 0, '{"width":550,"height":542}', 1478491170);
INSERT INTO `dr_attachment_1` VALUES(173, 1, 'admin', 'dr_1_photo-90', '6821646_420524', 'jpg', 102144, '201611/ac4da9facb.jpg', 0, '{"width":345,"height":260}', 1478491177);
INSERT INTO `dr_attachment_1` VALUES(174, 1, 'admin', 'dr_1_photo-90', '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/6a39a305bb.jpg', 0, '{"width":550,"height":542}', 1478491177);
INSERT INTO `dr_attachment_1` VALUES(175, 1, 'admin', 'dr_1_photo-91', '163145166', 'jpg', 136847, '201611/13ab4bef93.jpg', 0, '{"width":550,"height":680}', 1478491192);
INSERT INTO `dr_attachment_1` VALUES(176, 1, 'admin', 'dr_1_photo-91', '163145166', 'jpg', 136847, '201611/81930e6c27.jpg', 0, '{"width":550,"height":680}', 1478491203);
INSERT INTO `dr_attachment_1` VALUES(177, 1, 'admin', 'dr_1_photo-92', '1112094956_14080837523431n', 'jpg', 22764, '201611/70a6448bb8.jpg', 0, '{"width":500,"height":444}', 1478491218);
INSERT INTO `dr_attachment_1` VALUES(178, 1, 'admin', 'dr_1_photo-92', '163145166', 'jpg', 136847, '201611/6df422b3f3.jpg', 0, '{"width":550,"height":680}', 1478491226);
INSERT INTO `dr_attachment_1` VALUES(179, 1, 'admin', 'dr_1_photo-92', '1112094956_14080837523431n', 'jpg', 22764, '201611/f422b3f3cf.jpg', 0, '{"width":500,"height":444}', 1478491226);
INSERT INTO `dr_attachment_1` VALUES(180, 1, 'admin', 'dr_1_photo-93', '1439783039664_000', 'jpg', 70482, '201611/e013f77292.jpg', 0, '{"width":623,"height":354}', 1478491244);
INSERT INTO `dr_attachment_1` VALUES(181, 1, 'admin', 'dr_1_photo-93', '004aeuItty6Qptp5f6kcc', 'jpg', 86600, '201611/353eb504a5.jpg', 0, '{"width":640,"height":427}', 1478491262);
INSERT INTO `dr_attachment_1` VALUES(182, 1, 'admin', 'dr_1_photo-94', '004aeuItty6Qptp5f6kcc', 'jpg', 86600, '201611/b40309c570.jpg', 0, '{"width":640,"height":427}', 1478491275);
INSERT INTO `dr_attachment_1` VALUES(183, 1, 'admin', 'dr_1_photo-94', '03d5a1c379310a55595de454b74543a98326107c', 'jpg', 59750, '201611/c20521a021.jpg', 0, '{"width":548,"height":410}', 1478491284);
INSERT INTO `dr_attachment_1` VALUES(184, 1, 'admin', 'dr_1_photo-95', '201212281546', 'jpg', 50196, '201611/e99031a467.jpg', 0, '{"width":389,"height":489}', 1478491304);
INSERT INTO `dr_attachment_1` VALUES(185, 1, 'admin', 'dr_1_photo-95', '1439783039664_000', 'jpg', 70482, '201611/4deb35bd11.jpg', 0, '{"width":623,"height":354}', 1478491310);
INSERT INTO `dr_attachment_1` VALUES(186, 1, 'admin', 'dr_1_photo-96', '9-160F6111A40-L', 'jpg', 66806, '201611/b4d72733ee.jpg', 0, '{"width":640,"height":614}', 1478491469);
INSERT INTO `dr_attachment_1` VALUES(187, 1, 'admin', 'dr_1_photo-96', '9-160F6111A40-L', 'jpg', 66806, '201611/40103f4865.jpg', 0, '{"width":640,"height":614}', 1478491477);
INSERT INTO `dr_attachment_1` VALUES(188, 1, 'admin', 'dr_1_photo-96', '659-1512011A952 - 副本', 'jpg', 188099, '201611/40103f48651.jpg', 0, '{"width":500,"height":386}', 1478491478);
INSERT INTO `dr_attachment_1` VALUES(189, 1, 'admin', 'dr_1_photo-97', '20110825_8a045c986f5a386ce066sJs1TdOC6QMu', 'jpg', 110019, '201611/52eae6638c.jpg', 0, '{"width":729,"height":515}', 1478491510);
INSERT INTO `dr_attachment_1` VALUES(190, 1, 'admin', 'dr_1_photo-97', '37499766_1408175522863', 'jpg', 512563, '201611/e1381ff96e.jpg', 0, '{"width":1504,"height":1150}', 1478491516);
INSERT INTO `dr_attachment_1` VALUES(191, 1, 'admin', 'dr_1_photo-99', '37499813_1408175629456', 'jpg', 645366, '201611/d2ae165f0a.jpg', 0, '{"width":1400,"height":1309}', 1478491548);
INSERT INTO `dr_attachment_1` VALUES(194, 1, 'admin', 'dr_1_photo-99', '37499813_1408175629456', 'jpg', 645366, '201611/2592561cfc.jpg', 0, '{"width":1400,"height":1309}', 1478491602);
INSERT INTO `dr_attachment_1` VALUES(195, 1, 'admin', 'dr_1_photo-100', '37499813_1408175642286', 'jpg', 360387, '201611/ebc55efb4f.jpg', 0, '{"width":1179,"height":839}', 1478491634);
INSERT INTO `dr_attachment_1` VALUES(196, 1, 'admin', 'dr_1_photo-100', '37499813_1408175642286', 'jpg', 360387, '201611/58ff7cc427.jpg', 0, '{"width":1179,"height":839}', 1478491640);
INSERT INTO `dr_attachment_1` VALUES(197, 1, 'admin', 'dr_1_photo-101', '37499938_1408175869631', 'jpg', 619459, '201611/7dcfcb61d2.jpg', 0, '{"width":1500,"height":1500}', 1478492363);
INSERT INTO `dr_attachment_1` VALUES(198, 1, 'admin', 'dr_1_photo-101', '37499938_1408175869631', 'jpg', 619459, '201611/09442c42ee.jpg', 0, '{"width":1500,"height":1500}', 1478492375);
INSERT INTO `dr_attachment_1` VALUES(199, 1, 'admin', 'dr_1_photo-102', 'u=673784810,1595223623&fm=21&gp=0', 'jpg', 15626, '201611/5a56e8eaa0.jpg', 0, '{"width":330,"height":220}', 1478492394);
INSERT INTO `dr_attachment_1` VALUES(200, 1, 'admin', 'dr_1_photo-102', '37499813_1408175642286', 'jpg', 360387, '201611/6752e3de12.jpg', 0, '{"width":1179,"height":839}', 1478492399);
INSERT INTO `dr_attachment_1` VALUES(201, 1, 'admin', 'dr_1_photo-103', '37499938_1408175869631', 'jpg', 619459, '201611/d970d32ccb.jpg', 0, '{"width":1500,"height":1500}', 1478492414);
INSERT INTO `dr_attachment_1` VALUES(202, 1, 'admin', 'dr_1_photo-103', '37499813_1408175642286', 'jpg', 360387, '201611/3f7f768742.jpg', 0, '{"width":1179,"height":839}', 1478492419);
INSERT INTO `dr_attachment_1` VALUES(203, 1, 'admin', 'dr_1_photo-104', '235113-1403260QZ056', 'jpg', 121989, '201611/4889281b6e.jpg', 0, '{"width":1000,"height":625}', 1478492604);
INSERT INTO `dr_attachment_1` VALUES(204, 1, 'admin', 'dr_1_photo-104', '235113-1403260QZ056', 'jpg', 121989, '201611/0bd329b89d.jpg', 0, '{"width":1000,"height":625}', 1478492609);
INSERT INTO `dr_attachment_1` VALUES(206, 1, 'admin', 'dr_1_photo-105', '330457-14031320362254', 'jpg', 197356, '201611/e09a149eaa.jpg', 0, '{"width":1000,"height":750}', 1478492653);
INSERT INTO `dr_attachment_1` VALUES(207, 1, 'admin', 'dr_1_photo-105', '330457-14031320362254', 'jpg', 197356, '201611/8d91473af7.jpg', 0, '{"width":1000,"height":750}', 1478492658);
INSERT INTO `dr_attachment_1` VALUES(208, 1, 'admin', 'dr_1_photo-105', '330487-14091606235982', 'jpg', 129024, '201611/70898d047c.jpg', 0, '{"width":1000,"height":667}', 1478492668);
INSERT INTO `dr_attachment_1` VALUES(209, 1, 'admin', 'dr_1_photo-105', '11914137_165343253157_2', 'jpg', 403988, '201611/24690e84d0.jpg', 0, '{"width":1024,"height":768}', 1478492668);
INSERT INTO `dr_attachment_1` VALUES(210, 1, 'admin', 'dr_1_photo-105', '32491235_1024', 'jpg', 341135, '201611/6c682c4c3f.jpg', 0, '{"width":1024,"height":700}', 1478492669);
INSERT INTO `dr_attachment_1` VALUES(214, 1, 'admin', 'dr_1_photo-106', '330457-14031320362254', 'jpg', 197356, '201611/0f253f2847.jpg', 0, '{"width":1000,"height":750}', 1478492693);
INSERT INTO `dr_attachment_1` VALUES(213, 1, 'admin', 'dr_1_photo-106', '235113-1403260QZ056', 'jpg', 121989, '201611/ef43e22a56.jpg', 0, '{"width":1000,"height":625}', 1478492693);
INSERT INTO `dr_attachment_1` VALUES(212, 1, 'admin', 'dr_1_photo-106', '15', 'jpg', 86313, '201611/5654595aa2.jpg', 0, '{"width":640,"height":426}', 1478492693);
INSERT INTO `dr_attachment_1` VALUES(211, 1, 'admin', 'dr_1_photo-106', '15', 'jpg', 86313, '201611/5c100d6cf1.jpg', 0, '{"width":640,"height":426}', 1478492685);
INSERT INTO `dr_attachment_1` VALUES(220, 1, 'admin', 'dr_1_photo-107', '330487-14091606235982', 'jpg', 129024, '201611/0a58a67083.jpg', 0, '{"width":1000,"height":667}', 1478492717);
INSERT INTO `dr_attachment_1` VALUES(219, 1, 'admin', 'dr_1_photo-107', '330457-14031320362254', 'jpg', 197356, '201611/7ee78a68fe.jpg', 0, '{"width":1000,"height":750}', 1478492716);
INSERT INTO `dr_attachment_1` VALUES(218, 1, 'admin', 'dr_1_photo-107', '235113-1403260QZ056', 'jpg', 121989, '201611/b5ba8662711.jpg', 0, '{"width":1000,"height":625}', 1478492716);
INSERT INTO `dr_attachment_1` VALUES(217, 1, 'admin', 'dr_1_photo-107', '39', 'jpg', 1569188, '201611/b5ba866271.jpg', 0, '{"width":1920,"height":1080}', 1478492715);
INSERT INTO `dr_attachment_1` VALUES(216, 1, 'admin', 'dr_1_photo-107', '15', 'jpg', 86313, '201611/2578421b83.jpg', 0, '{"width":640,"height":426}', 1478492715);
INSERT INTO `dr_attachment_1` VALUES(215, 1, 'admin', 'dr_1_photo-107', '39', 'jpg', 1569188, '201611/05d7944399.jpg', 0, '{"width":1920,"height":1080}', 1478492706);
INSERT INTO `dr_attachment_1` VALUES(224, 1, 'admin', 'dr_1_photo-108', '235113-1403260QZ056', 'jpg', 121989, '201611/9fba022472.jpg', 0, '{"width":1000,"height":625}', 1478492740);
INSERT INTO `dr_attachment_1` VALUES(223, 1, 'admin', 'dr_1_photo-108', '39', 'jpg', 1569188, '201611/33773264c1.jpg', 0, '{"width":1920,"height":1080}', 1478492739);
INSERT INTO `dr_attachment_1` VALUES(221, 1, 'admin', 'dr_1_photo-108', '97b58PICEn4_1024', 'jpg', 163594, '201611/e878d2ea10.jpg', 0, '{"width":1024,"height":631}', 1478492732);
INSERT INTO `dr_attachment_1` VALUES(222, 1, 'admin', 'dr_1_photo-108', '15', 'jpg', 86313, '201611/d322ff4281.jpg', 0, '{"width":640,"height":426}', 1478492739);
INSERT INTO `dr_attachment_1` VALUES(229, 1, 'admin', 'dr_1_photo-109', '715B9962452A', 'jpg', 275005, '201611/23d4516d20.jpg', 0, '{"width":900,"height":729}', 1478492765);
INSERT INTO `dr_attachment_1` VALUES(228, 1, 'admin', 'dr_1_photo-109', '97b58PICEn4_1024', 'jpg', 163594, '201611/889da30532.jpg', 0, '{"width":1024,"height":631}', 1478492765);
INSERT INTO `dr_attachment_1` VALUES(225, 1, 'admin', 'dr_1_photo-109', '715B9962452A', 'jpg', 275005, '201611/43a57c168e.jpg', 0, '{"width":900,"height":729}', 1478492754);
INSERT INTO `dr_attachment_1` VALUES(227, 1, 'admin', 'dr_1_photo-109', '39', 'jpg', 1569188, '201611/59b8889da3.jpg', 0, '{"width":1920,"height":1080}', 1478492764);
INSERT INTO `dr_attachment_1` VALUES(226, 1, 'admin', 'dr_1_photo-109', '15', 'jpg', 86313, '201611/f433fdbdc0.jpg', 0, '{"width":640,"height":426}', 1478492764);
INSERT INTO `dr_attachment_1` VALUES(235, 1, 'admin', 'dr_1_photo-110', '32491235_1024', 'jpg', 341135, '201611/37650afb79.jpg', 0, '{"width":1024,"height":700}', 1478492862);
INSERT INTO `dr_attachment_1` VALUES(234, 1, 'admin', 'dr_1_photo-110', '11914137_165343253157_2', 'jpg', 403988, '201611/032a01cae8.jpg', 0, '{"width":1024,"height":768}', 1478492861);
INSERT INTO `dr_attachment_1` VALUES(233, 1, 'admin', 'dr_1_photo-110', '330487-14091606235982', 'jpg', 129024, '201611/a5032a01ca.jpg', 0, '{"width":1000,"height":667}', 1478492861);
INSERT INTO `dr_attachment_1` VALUES(232, 1, 'admin', 'dr_1_photo-110', '330457-14031320362254', 'jpg', 197356, '201611/49e8c58357.jpg', 0, '{"width":1000,"height":750}', 1478492860);
INSERT INTO `dr_attachment_1` VALUES(230, 1, 'admin', 'dr_1_photo-110', '330487-14091606235982', 'jpg', 129024, '201611/1d5b848272.jpg', 0, '{"width":1000,"height":667}', 1478492852);
INSERT INTO `dr_attachment_1` VALUES(231, 1, 'admin', 'dr_1_photo-110', '235113-1403260QZ056', 'jpg', 121989, '201611/8357a8a94c.jpg', 0, '{"width":1000,"height":625}', 1478492860);
INSERT INTO `dr_attachment_1` VALUES(241, 1, 'admin', 'dr_1_photo-111', '32491235_1024', 'jpg', 341135, '201611/a5c39b96fe.jpg', 0, '{"width":1024,"height":700}', 1478492898);
INSERT INTO `dr_attachment_1` VALUES(240, 1, 'admin', 'dr_1_photo-111', '11914137_165343253157_2', 'jpg', 403988, '201611/b9b84b2ef0.jpg', 0, '{"width":1024,"height":768}', 1478492898);
INSERT INTO `dr_attachment_1` VALUES(236, 1, 'admin', 'dr_1_photo-111', '32491235_1024', 'jpg', 341135, '201611/8cacae4ea1.jpg', 0, '{"width":1024,"height":700}', 1478492887);
INSERT INTO `dr_attachment_1` VALUES(237, 1, 'admin', 'dr_1_photo-111', '235113-1403260QZ056', 'jpg', 121989, '201611/f3684e47fd.jpg', 0, '{"width":1000,"height":625}', 1478492897);
INSERT INTO `dr_attachment_1` VALUES(238, 1, 'admin', 'dr_1_photo-111', '330457-14031320362254', 'jpg', 197356, '201611/28a46b4daf.jpg', 0, '{"width":1000,"height":750}', 1478492897);
INSERT INTO `dr_attachment_1` VALUES(239, 1, 'admin', 'dr_1_photo-111', '330487-14091606235982', 'jpg', 129024, '201611/f020f6aa12.jpg', 0, '{"width":1000,"height":667}', 1478492897);
INSERT INTO `dr_attachment_1` VALUES(250, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-2@2x', 'png', 383345, '201612/3c702e9f16.png', 0, '{"width":2316,"height":1258}', 1480921899);
INSERT INTO `dr_attachment_1` VALUES(251, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-2@2x', 'png', 383345, '201612/23d6d9e87c.png', 0, '{"width":2316,"height":1258}', 1480921940);
INSERT INTO `dr_attachment_1` VALUES(252, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-1@2x', 'png', 571300, '201612/e623d6d9e8.png', 0, '{"width":2442,"height":1282}', 1480921940);
INSERT INTO `dr_attachment_1` VALUES(253, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-0@2x', 'png', 365783, '201612/e623d6d9e81.png', 0, '{"width":2238,"height":1240}', 1480921940);
INSERT INTO `dr_attachment_1` VALUES(254, 1, 'admin', 'dr_1_demo-1', 'QQ20161130-3@2x', 'png', 536361, '201612/2e38e9a4b2.png', 0, '{"width":2318,"height":1432}', 1480921941);
INSERT INTO `dr_attachment_1` VALUES(255, 1, 'admin', 'dr_1_demo-1', 'QQ20161130-2@2x', 'png', 529715, '201612/9a4b24f26d.png', 0, '{"width":2294,"height":1428}', 1480921941);
INSERT INTO `dr_attachment_1` VALUES(256, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-2@2x', 'png', 383345, '201612/21d73ece67.png', 0, '{"width":2316,"height":1258}', 1480921949);
INSERT INTO `dr_attachment_1` VALUES(257, 1, 'admin', 'dr_1_demo-1', 'QQ20161201-1@2x', 'png', 571300, '201612/030489205d.png', 0, '{"width":2442,"height":1282}', 1480921953);
INSERT INTO `dr_attachment_1` VALUES(258, 1, 'admin', 'dr_1_demo-1', 'QQ20161130-2@2x', 'png', 529715, '201612/d434993133.png', 0, '{"width":2294,"height":1428}', 1480921985);

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_2`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_2` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表2';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_3`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_3` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表3';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_4`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_4` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表4';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_5`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_5` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表5';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_6`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_6` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表6';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_7`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_7` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表7';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_8`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_8` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表8';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_9`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_9` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表9';

-- --------------------------------------------------------

--
-- 表的结构 `dr_attachment_unused`
--

CREATE TABLE IF NOT EXISTS `dr_attachment_unused` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='未使用的附件表';

--
-- 转存表中的数据 `dr_attachment_unused`
--

INSERT INTO `dr_attachment_unused` VALUES(12, 1, 'admin', 1, 'blob', 'png', 20045, 'ueditor/image/20161104/1478253106.png', 0, '{"width":153,"height":100}', 1478253106);
INSERT INTO `dr_attachment_unused` VALUES(11, 1, 'admin', 1, '139854478', 'jpg', 36678, 'ueditor/image/20161104/1478253041.jpg', 0, '{"width":640,"height":429}', 1478253041);
INSERT INTO `dr_attachment_unused` VALUES(13, 1, 'admin', 1, 'blob', 'png', 20045, 'ueditor/image/20161104/1478253191.png', 0, '{"width":153,"height":100}', 1478253191);
INSERT INTO `dr_attachment_unused` VALUES(14, 1, 'admin', 1, 'blob', 'png', 11818, 'ueditor/image/20161104/1478254275.png', 0, '{"width":457,"height":85}', 1478254275);
INSERT INTO `dr_attachment_unused` VALUES(15, 1, 'admin', 1, 'blob', 'png', 21364, 'ueditor/image/20161104/1478254719.png', 0, '{"width":300,"height":259}', 1478254719);
INSERT INTO `dr_attachment_unused` VALUES(16, 1, 'admin', 1, 'blob', 'png', 21364, 'ueditor/image/20161104/1478254720.png', 0, '{"width":300,"height":259}', 1478254720);
INSERT INTO `dr_attachment_unused` VALUES(17, 1, 'admin', 1, 'QQ20161104-3@2x', 'png', 451426, 'ueditor/image/20161104/1478255094.png', 0, '{"width":726,"height":468}', 1478255094);
INSERT INTO `dr_attachment_unused` VALUES(192, 1, 'admin', 1, '20110825_8a045c986f5a386ce066sJs1TdOC6QMu', 'jpg', 110019, '201611/0aaa60b8a8.jpg', 0, '{"width":729,"height":515}', 1478491556);
INSERT INTO `dr_attachment_unused` VALUES(171, 1, 'admin', 1, '8713157EACFE5D2707B70B689855F947', 'jpg', 57672, '201611/f9dfed44e5.jpg', 0, '{"width":550,"height":542}', 1478491138);
INSERT INTO `dr_attachment_unused` VALUES(115, 1, 'admin', 1, '576689_012358067_2', 'jpg', 125716, '201611/0fba191afb.jpg', 0, '{"width":769,"height":1024}', 1478490250);
INSERT INTO `dr_attachment_unused` VALUES(193, 1, 'admin', 1, '37499766_1408175522863', 'jpg', 512563, '201611/0b8a88b46a.jpg', 0, '{"width":1504,"height":1150}', 1478491557);
INSERT INTO `dr_attachment_unused` VALUES(205, 1, 'admin', 1, 'fjtu (22)', 'jpg', 3098952, '201611/8e3cd325e5.jpg', 0, '{"width":1920,"height":1200}', 1478492623);
INSERT INTO `dr_attachment_unused` VALUES(139, 1, 'admin', 1, '02a98e89a082494e965d71f25ddf8224', 'jpg', 51937, '201611/8e0995980f.jpg', 0, '{"width":450,"height":343}', 1478490680);
INSERT INTO `dr_attachment_unused` VALUES(242, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920547);
INSERT INTO `dr_attachment_unused` VALUES(243, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `dr_attachment_unused` VALUES(244, 1, 'admin', 1, 'QQ20161201-1@2x', 'png', 585011200, '201612/QQ20161201-1@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `dr_attachment_unused` VALUES(245, 1, 'admin', 1, 'QQ20161201-0@2x', 'png', 374559744, '201612/QQ20161201-0@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `dr_attachment_unused` VALUES(246, 1, 'admin', 1, 'QQ20161130-3@2x', 'png', 549230592, '201612/QQ20161130-3@2x.png', 0, '{"width":null,"height":null}', 1480920565);
INSERT INTO `dr_attachment_unused` VALUES(247, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920687);
INSERT INTO `dr_attachment_unused` VALUES(248, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480920776);
INSERT INTO `dr_attachment_unused` VALUES(249, 1, 'admin', 1, 'QQ20161201-2@2x', 'png', 392546304, '201612/QQ20161201-2@2x.png', 0, '{"width":null,"height":null}', 1480921138);

-- --------------------------------------------------------

--
-- 表的结构 `dr_comment`
--

CREATE TABLE IF NOT EXISTS `dr_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '配置信息',
  `field` text COMMENT '自定义字段信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论配置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_controller`
--

CREATE TABLE IF NOT EXISTS `dr_controller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `app` varchar(100) NOT NULL COMMENT '网站,会员,后台',
  `type` tinyint(1) unsigned NOT NULL COMMENT '前台0会员1后台2',
  `cname` varchar(100) NOT NULL COMMENT '控制器名称',
  `file` varchar(100) NOT NULL COMMENT '文件路径',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `meta_title` varchar(255) NOT NULL COMMENT '网页标题',
  `meta_keywords` varchar(255) NOT NULL COMMENT '网页关键字',
  `meta_description` varchar(255) NOT NULL COMMENT '网页描述',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义控制器表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_cron_queue`
--

CREATE TABLE IF NOT EXISTS `dr_cron_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) unsigned NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '值',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `error` varchar(255) NOT NULL COMMENT '错误信息',
  `updatetime` int(10) unsigned NOT NULL COMMENT '执行时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '写入时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务队列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_downservers`
--

CREATE TABLE IF NOT EXISTS `dr_downservers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '服务器名',
  `server` varchar(255) NOT NULL COMMENT '服务器地址',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载镜像服务器' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_field`
--

CREATE TABLE IF NOT EXISTS `dr_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint(1) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='字段表' AUTO_INCREMENT=82 ;

--
-- 转存表中的数据 `dr_field`
--

INSERT INTO `dr_field` VALUES(1, '相关附件', 'attachment', 'Files', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:5:{s:5:"width";s:3:"80%";s:4:"size";s:1:"2";s:5:"count";s:2:"10";s:3:"ext";s:31:"jpg,gif,png,ppt,doc,xls,rar,zip";s:10:"uploadpath";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"0";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"0";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0);
INSERT INTO `dr_field` VALUES(2, '单页内容', 'content', 'Ueditor', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:7:{s:5:"width";s:3:"90%";s:6:"height";s:3:"400";s:4:"mode";s:1:"1";s:4:"tool";s:0:"";s:5:"mode2";s:1:"1";s:5:"tool2";s:0:"";s:5:"value";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"1";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"1";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0);
INSERT INTO `dr_field` VALUES(3, '主题', 'title', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
INSERT INTO `dr_field` VALUES(4, '缩略图', 'thumb', 'File', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
INSERT INTO `dr_field` VALUES(5, '关键字', 'keywords', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
INSERT INTO `dr_field` VALUES(6, '描述', 'description', 'Textarea', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 0);
INSERT INTO `dr_field` VALUES(7, '内容', 'content', 'Ueditor', 1, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"1","tool":"''bold'', ''italic'', ''underline''","mode2":"1","tool2":"''bold'', ''italic'', ''underline''","mode3":"1","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(8, '软件名称', 'title', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\"","required":1}}', 1);
INSERT INTO `dr_field` VALUES(9, '缩略图', 'thumb', 'File', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 97);
INSERT INTO `dr_field` VALUES(10, '关键字', 'keywords', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 4);
INSERT INTO `dr_field` VALUES(11, '描述', 'description', 'Textarea', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 5);
INSERT INTO `dr_field` VALUES(12, '软件版本', 'version', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1}}', 2);
INSERT INTO `dr_field` VALUES(13, '软件语言', 'language', 'Select', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"\\u7b80\\u4f53\\u4e2d\\u6587\\n\\u7e41\\u4f53\\u4e2d\\u6587\\n\\u82f1\\u6587\\n\\u591a\\u56fd\\u8bed\\u8a00"},"validate":{"xss":1}}', 7);
INSERT INTO `dr_field` VALUES(14, '软件授权', 'license', 'Select', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"\\u5171\\u4eab\\u7248\\n\\u514d\\u8d39\\u7248\\n\\u5546\\u4e1a\\u7248\\n\\u8bd5\\u7528\\u7248\\n\\u5f00\\u6e90\\u8f6f\\u4ef6"},"validate":{"xss":1}}', 8);
INSERT INTO `dr_field` VALUES(15, '适用环境', 'os', 'Checkbox', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"WinXp\\nWin7\\nWin8\\nLinux\\nMac"},"validate":{"xss":1}}', 9);
INSERT INTO `dr_field` VALUES(16, '演示地址', 'demo', 'Text', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":300,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"prep_url"}}', 11);
INSERT INTO `dr_field` VALUES(17, '官方网站', 'siteurl', 'Text', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":300,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"prep_url"}}', 10);
INSERT INTO `dr_field` VALUES(18, '上传文件', 'file', 'File', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"zip,rar,7z,tar,gz","size":10,"count":1}}', 3);
INSERT INTO `dr_field` VALUES(19, '更多图片', 'images', 'Files', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"gif,png,jpg","size":10,"count":10}}', 98);
INSERT INTO `dr_field` VALUES(20, '软件简介', 'content', 'Ueditor', 2, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"2","tool":"''bold'', ''italic'', ''underline''","mode2":"2","tool2":"''bold'', ''italic'', ''underline''","mode3":"2","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 99);
INSERT INTO `dr_field` VALUES(21, '租金类型', 'zujinleixing', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u62bc\\u4e00\\u4ed8\\u4e09\\n\\u62bc\\u4e00\\u4ed8\\u4e8c\\n\\u62bc\\u4e00\\u4ed8\\u4e00\\n\\u534a\\u5e74\\u4ed8\\n\\u5e74\\u4ed8\\n\\u9762\\u8bae","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(22, '租金', 'zujin', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(23, '所在层', 'suozaiceng', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(24, '总层', 'zongceng', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(25, '朝向', 'chaoxiang', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u5357\\u5317\\u901a\\u900f\\n\\u4e1c\\u897f\\u5411\\n\\u671d\\u5357\\n\\u671d\\u5317\\n\\u671d\\u4e1c\\n\\u671d\\u897f","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(26, '装修', 'zhuangxiu', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u6bdb\\u576f\\n\\u7b80\\u88c5\\u4fee\\n\\u4e2d\\u7b49\\u88c5\\u4fee\\n\\u7cbe\\u88c5\\u4fee\\n\\u8c6a\\u534e\\u88c5\\u4fee","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(27, '面积', 'mianji', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(28, '卫', 'wei', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(29, '厅', 'ting', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(30, '室', 'shi', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":"20"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(31, '户型', 'huxing', 'Select', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u4e00\\u5c45\\n\\u4e8c\\u5c45\\n\\u4e09\\u5c45\\n\\u56db\\u5c45\\n\\u56db\\u5c45\\u4ee5\\u4e0a","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
INSERT INTO `dr_field` VALUES(32, '位置', 'weizhi', 'Baidumap', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"700","height":"430","level":"15","city":"\\u6210\\u90fd"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 8);
INSERT INTO `dr_field` VALUES(33, '小区名称', 'xiaoqumingcheng', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 6);
INSERT INTO `dr_field` VALUES(34, '地址', 'dizhi', 'Text', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"500","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 7);
INSERT INTO `dr_field` VALUES(35, '区域', 'area', 'Linkage', 3, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"linkage":"address","value":""},"validate":{"xss":"0","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 5);
INSERT INTO `dr_field` VALUES(36, '主题', 'title', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":"400","value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":"1","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 1);
INSERT INTO `dr_field` VALUES(37, '缩略图', 'thumb', 'File', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"size":"10","ext":"jpg,gif,png","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 3);
INSERT INTO `dr_field` VALUES(38, '关键字', 'keywords', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":"400","value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":"1","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","formattr":" data-role=\\"tagsinput\\""}}', 2);
INSERT INTO `dr_field` VALUES(39, '描述', 'description', 'Textarea', 3, 'module', 1, 1, 1, 1, 1, 1, '{"option":{"width":"500","height":"60","value":""},"validate":{"xss":"1","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"dr_clearhtml","tips":"","formattr":""}}', 99);
INSERT INTO `dr_field` VALUES(40, '联系人', 'lianxiren', 'Text', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 13);
INSERT INTO `dr_field` VALUES(41, '房屋图片', 'images', 'Files', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"80%","size":"5","count":"5","ext":"gif,png,jpg","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
INSERT INTO `dr_field` VALUES(42, '租金', 'zujin2', 'Group', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"value":"<label>{zujin}<\\/label><label>\\u5143\\/\\u6708\\uff0c<\\/label><label>{zujinleixing}<\\/label>"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 11);
INSERT INTO `dr_field` VALUES(43, '房屋状况', 'fangwuzhuangkuang', 'Group', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"value":"<label>\\u5ba4<\\/label><label>{shi}<\\/label><label>\\uff0c\\u5385<\\/label><label>{ting}<\\/label><label> \\uff0c\\u536b<\\/label><label>{wei}<\\/label><label>\\uff0c<\\/label><label>{mianji}<\\/label><label>\\u5e73\\u7c73\\uff0c\\u7b2c<\\/label><label>{suozaiceng}<\\/label><label>\\u5c42\\uff0c\\u5171<\\/label><label>{zongceng}<\\/label><label>\\u5c42\\uff0c<\\/label><label>{huxing}<\\/label><label> {zhuangxiu}<\\/label><label> {chaoxiang}<\\/label>"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 9);
INSERT INTO `dr_field` VALUES(44, '配套', 'peitao', 'Checkbox', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"options":"\\u62ce\\u5305\\u5165\\u4f4f\\n\\u5bb6\\u7535\\u9f50\\u5168\\n\\u53ef\\u4e0a\\u7f51\\n\\u53ef\\u505a\\u996d\\n\\u53ef\\u6d17\\u6fa1\\n\\u7a7a\\u8c03\\u623f\\n\\u53ef\\u770b\\u7535\\u89c6\\n\\u6709\\u6696\\u6c14\\n\\u6709\\u8f66\\u4f4d","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 10);
INSERT INTO `dr_field` VALUES(45, '联系电话', 'lianxidianhua', 'Text', 3, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"300","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 14);
INSERT INTO `dr_field` VALUES(46, '内容', 'content', 'Ueditor', 3, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"100%","height":"400","mode":"2","tool":"''bold'', ''italic'', ''underline''","value":""},"validate":{"xss":"1","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 99);
INSERT INTO `dr_field` VALUES(47, '主题', 'title', 'Text', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
INSERT INTO `dr_field` VALUES(48, '缩略图', 'thumb', 'File', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
INSERT INTO `dr_field` VALUES(49, '关键字', 'keywords', 'Text', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
INSERT INTO `dr_field` VALUES(50, '描述', 'description', 'Textarea', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 0);
INSERT INTO `dr_field` VALUES(51, '图片', 'images', 'Files', 4, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"gif,png,jpg","size":10,"count":10}}', 0);
INSERT INTO `dr_field` VALUES(52, '详情', 'content', 'Ueditor', 4, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"2","tool":"''bold'', ''italic'', ''underline''","mode2":"2","tool2":"''bold'', ''italic'', ''underline''","mode3":"2","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(53, '主题', 'title', 'Text', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 1);
INSERT INTO `dr_field` VALUES(54, '缩略图', 'thumb', 'File', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 3);
INSERT INTO `dr_field` VALUES(55, '关键字', 'keywords', 'Text', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 2);
INSERT INTO `dr_field` VALUES(56, '描述', 'description', 'Textarea', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 98);
INSERT INTO `dr_field` VALUES(57, '模板文件', 'template', 'Text', 5, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"157","value":"show.html","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"\\u4e5f\\u53ef\\u4ee5\\u5728\\u8fd9\\u91cc\\u6307\\u5b9a\\u6a21\\u677f\\u6587\\u4ef6","formattr":""}}', 100);
INSERT INTO `dr_field` VALUES(58, '新闻关联', 'guanlian', 'Related', 5, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"module":"news","width":"80%"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
INSERT INTO `dr_field` VALUES(59, '封面图', 'banner', 'Files', 5, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"80%","size":"2","count":"10","ext":"gif,png,jpg","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
INSERT INTO `dr_field` VALUES(60, '简介', 'content', 'Ueditor', 5, 'module', 1, 0, 1, 1, 0, 0, '{"option":{"width":"100%","height":"400","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"2","tool":"''bold'', ''italic'', ''underline''","mode2":"2","tool2":"''bold'', ''italic'', ''underline''","mode3":"2","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"1","pattern":"","errortips":"","xss":"1","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 99);
INSERT INTO `dr_field` VALUES(61, '主题', 'title', 'Text', 1, 'form-1', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1}}', 0);
INSERT INTO `dr_field` VALUES(62, '留言内容', 'liuyanneirong', 'Ueditor', 1, 'form-1', 1, 0, 0, 1, 0, 0, '{"option":{"width":"100%","height":"300","autofloat":"0","autoheight":"0","autodown":"0","divtop":"0","page":"0","mode":"1","tool":"''bold'', ''italic'', ''underline''","mode2":"1","tool2":"''bold'', ''italic'', ''underline''","mode3":"1","tool3":"''bold'', ''italic'', ''underline''","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":"","xss":1},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(64, '复选框', 'fuxuankuang', 'Checkbox', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(65, '颜色选取（放右边）', 'ysxqfyb', 'Color', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"field":"title","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"1"}', 0);
INSERT INTO `dr_field` VALUES(66, '阅读收费', 'yuedushoufei', 'Fees', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"80%"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(67, '单个文件', 'dangewenjian', 'File', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"size":"12","ext":"zip","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(68, '多个文件或图片', 'dgwjhtp', 'Files', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"90%","size":"10","count":"10","ext":"jpg,gif,png,exe,rar,zip","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(69, '图片专用', 'tpzy', 'Image', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"80%","size":"10","count":"5","autodown":"0","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(70, '联动菜单', 'ldcd', 'Linkage', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"linkage":"address","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(71, '商品属性', 'spsx', 'Property', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"100%"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(72, '内容关联（新闻）', 'nrglxw', 'Related', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"module":"news","width":"90%","limit":"22"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(73, '视频文件', 'spwj', 'Video', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"90%","size":"10","ext":"mp4","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(74, '单选按钮', 'danxuananniu', 'Radio', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":"","fieldtype":"","fieldlength":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(75, '下拉选择', 'xialaxuanze', 'Select', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":"","fieldtype":"","fieldlength":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(76, '百度地图', 'baiduditu', 'Baidumap', 6, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"700","height":"430","level":"15","city":"\\u5317\\u4eac"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
INSERT INTO `dr_field` VALUES(77, '主题', 'title', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
INSERT INTO `dr_field` VALUES(78, '缩略图', 'thumb', 'File', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
INSERT INTO `dr_field` VALUES(79, '关键字', 'keywords', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
INSERT INTO `dr_field` VALUES(80, '描述', 'description', 'Textarea', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"dr_clearhtml"}}', 0);
INSERT INTO `dr_field` VALUES(81, '内容', 'content', 'Ueditor', 6, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":1,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_linkage`
--

CREATE TABLE IF NOT EXISTS `dr_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_linkage`
--

INSERT INTO `dr_linkage` VALUES(1, '中国地区', 0, 'address');

-- --------------------------------------------------------

--
-- 表的结构 `dr_linkage_data_1`
--

CREATE TABLE IF NOT EXISTS `dr_linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表' AUTO_INCREMENT=1150 ;

--
-- 转存表中的数据 `dr_linkage_data_1`
--

INSERT INTO `dr_linkage_data_1` VALUES(1, 1, 0, '0', '北京市', 'beijing', 0, 0, '1', 1);
INSERT INTO `dr_linkage_data_1` VALUES(2, 1, 0, '0', '天津市', 'tianjin', 0, 0, '2', 2);
INSERT INTO `dr_linkage_data_1` VALUES(3, 1, 0, '0', '河北省', 'hebei', 1, 0, '3,65,66,67,68,69,70,71,72,73,74,75', 3);
INSERT INTO `dr_linkage_data_1` VALUES(4, 1, 0, '0', '山西省', 'shanxi', 1, 0, '4,248,259,271,277,291,298,305,317,331,346,364', 4);
INSERT INTO `dr_linkage_data_1` VALUES(5, 1, 0, '0', '辽宁省', 'liaoning', 1, 0, '5,491,505,516,524,532,539,546,554,561,569,577,582,590,598', 5);
INSERT INTO `dr_linkage_data_1` VALUES(6, 1, 0, '0', '吉林省', 'jilin', 1, 0, '6,605,616,626,633,638,646,653,659,665', 6);
INSERT INTO `dr_linkage_data_1` VALUES(7, 1, 0, '0', '黑龙江省', 'heilongjiang', 1, 0, '7,674,693,710,720,729,738,748,766,777,782,793,800,811', 7);
INSERT INTO `dr_linkage_data_1` VALUES(8, 1, 0, '0', '江苏省', 'jiangsu', 1, 0, '8,833,834,835,836,837,838,839,840,841,842,843,844,845', 9);
INSERT INTO `dr_linkage_data_1` VALUES(9, 1, 0, '0', '浙江省', 'zhejiang', 1, 0, '9,846,847,848,849,850,851,852,853,854,855,856', 10);
INSERT INTO `dr_linkage_data_1` VALUES(10, 1, 0, '0', '安徽省', 'anhui', 1, 0, '10,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872', 11);
INSERT INTO `dr_linkage_data_1` VALUES(11, 1, 0, '0', '福建省', 'fujian', 1, 0, '11,873,874,875,876,877,878,879,880,881', 12);
INSERT INTO `dr_linkage_data_1` VALUES(12, 1, 0, '0', '江西省', 'jiangxi', 1, 0, '12,882,883,884,885,886,887,888,889,890,891,892', 13);
INSERT INTO `dr_linkage_data_1` VALUES(13, 1, 0, '0', '山东省', 'shandong', 1, 0, '13,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909', 14);
INSERT INTO `dr_linkage_data_1` VALUES(14, 1, 0, '0', '河南省', 'henan', 1, 0, '14,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926', 15);
INSERT INTO `dr_linkage_data_1` VALUES(15, 1, 0, '0', '湖北省', 'hubei', 1, 0, '15,927,928,929,930,931,932,933,934,935,936,937,938,939', 16);
INSERT INTO `dr_linkage_data_1` VALUES(16, 1, 0, '0', '湖南省', 'hunan', 1, 0, '16,940,941,942,943,944,945,946,947,948,949,950,951,952,953', 17);
INSERT INTO `dr_linkage_data_1` VALUES(17, 1, 0, '0', '广东省', 'guangdong', 1, 0, '17,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,972,973,974,1149', 18);
INSERT INTO `dr_linkage_data_1` VALUES(18, 1, 0, '0', '海南省', 'hainan', 1, 0, '18,990', 19);
INSERT INTO `dr_linkage_data_1` VALUES(19, 1, 0, '0', '重庆市', 'zhongqing', 0, 0, '19', 20);
INSERT INTO `dr_linkage_data_1` VALUES(20, 1, 0, '0', '四川省', 'sichuan', 1, 0, '20,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066', 21);
INSERT INTO `dr_linkage_data_1` VALUES(21, 1, 0, '0', '贵州省', 'guizhou', 1, 0, '21,1067,1068,1069,1070,1071,1072,1073,1074,1075', 22);
INSERT INTO `dr_linkage_data_1` VALUES(22, 1, 0, '0', '云南省', 'yunnan', 1, 0, '22,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091', 23);
INSERT INTO `dr_linkage_data_1` VALUES(23, 1, 0, '0', '陕西省', 'shanxi1', 1, 0, '23,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108', 24);
INSERT INTO `dr_linkage_data_1` VALUES(24, 1, 0, '0', '甘肃省', 'gansu', 1, 0, '24,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121', 25);
INSERT INTO `dr_linkage_data_1` VALUES(25, 1, 0, '0', '青海省', 'qinghai', 1, 0, '25,1122,1123,1124,1125,1126,1127,1128,1129', 26);
INSERT INTO `dr_linkage_data_1` VALUES(26, 1, 0, '0', '宁夏', 'ningxia', 1, 0, '26,1130,1131,1132,1133,1134', 27);
INSERT INTO `dr_linkage_data_1` VALUES(27, 1, 0, '0', '西藏', 'xicang', 1, 0, '27,1092,1093,1094,1095,1096,1097,1098', 28);
INSERT INTO `dr_linkage_data_1` VALUES(28, 1, 0, '0', '新疆', 'xinjiang', 1, 0, '28,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148', 29);
INSERT INTO `dr_linkage_data_1` VALUES(29, 1, 0, '0', '内蒙古', 'neimenggu', 1, 0, '29,378,388,398,402,415,424,433,447,455,467,474,487', 30);
INSERT INTO `dr_linkage_data_1` VALUES(30, 1, 0, '0', '香港', 'xianggang', 0, 0, '30', 31);
INSERT INTO `dr_linkage_data_1` VALUES(31, 1, 0, '0', '澳门', 'aomen', 0, 0, '31', 32);
INSERT INTO `dr_linkage_data_1` VALUES(32, 1, 0, '0', '台湾', 'taiwan', 0, 0, '32', 33);
INSERT INTO `dr_linkage_data_1` VALUES(65, 1, 3, '0,3', '石家庄市', 'shijiazhuang', 0, 0, '65', 0);
INSERT INTO `dr_linkage_data_1` VALUES(66, 1, 3, '0,3', '唐山市', 'tangshan', 0, 0, '66', 0);
INSERT INTO `dr_linkage_data_1` VALUES(67, 1, 3, '0,3', '秦皇岛市', 'qinhuangdao', 0, 0, '67', 0);
INSERT INTO `dr_linkage_data_1` VALUES(68, 1, 3, '0,3', '邯郸市', 'handan', 0, 0, '68', 0);
INSERT INTO `dr_linkage_data_1` VALUES(69, 1, 3, '0,3', '邢台市', 'xingtai', 0, 0, '69', 0);
INSERT INTO `dr_linkage_data_1` VALUES(70, 1, 3, '0,3', '保定市', 'baoding', 0, 0, '70', 0);
INSERT INTO `dr_linkage_data_1` VALUES(71, 1, 3, '0,3', '张家口市', 'zhangjiakou', 0, 0, '71', 0);
INSERT INTO `dr_linkage_data_1` VALUES(72, 1, 3, '0,3', '承德市', 'chengde', 0, 0, '72', 0);
INSERT INTO `dr_linkage_data_1` VALUES(73, 1, 3, '0,3', '沧州市', 'cangzhou', 0, 0, '73', 0);
INSERT INTO `dr_linkage_data_1` VALUES(74, 1, 3, '0,3', '廊坊市', 'langfang', 0, 0, '74', 0);
INSERT INTO `dr_linkage_data_1` VALUES(75, 1, 3, '0,3', '衡水市', 'hengshui', 0, 0, '75', 0);
INSERT INTO `dr_linkage_data_1` VALUES(248, 1, 4, '0,4', '太原市', 'taiyuan', 0, 0, '248', 0);
INSERT INTO `dr_linkage_data_1` VALUES(259, 1, 4, '0,4', '大同市', 'datong', 0, 0, '259', 0);
INSERT INTO `dr_linkage_data_1` VALUES(271, 1, 4, '0,4', '阳泉市', 'yangquan', 0, 0, '271', 0);
INSERT INTO `dr_linkage_data_1` VALUES(277, 1, 4, '0,4', '长治市', 'changzhi', 0, 0, '277', 0);
INSERT INTO `dr_linkage_data_1` VALUES(291, 1, 4, '0,4', '晋城市', 'jincheng', 0, 0, '291', 0);
INSERT INTO `dr_linkage_data_1` VALUES(298, 1, 4, '0,4', '朔州市', 'shuozhou', 0, 0, '298', 0);
INSERT INTO `dr_linkage_data_1` VALUES(305, 1, 4, '0,4', '晋中市', 'jinzhong', 0, 0, '305', 0);
INSERT INTO `dr_linkage_data_1` VALUES(317, 1, 4, '0,4', '运城市', 'yuncheng', 0, 0, '317', 0);
INSERT INTO `dr_linkage_data_1` VALUES(331, 1, 4, '0,4', '忻州市', 'xinzhou', 0, 0, '331', 0);
INSERT INTO `dr_linkage_data_1` VALUES(346, 1, 4, '0,4', '临汾市', 'linfen', 0, 0, '346', 0);
INSERT INTO `dr_linkage_data_1` VALUES(364, 1, 4, '0,4', '吕梁市', 'luliang', 0, 0, '364', 0);
INSERT INTO `dr_linkage_data_1` VALUES(378, 1, 29, '0,29', '呼和浩特市', 'huhehaote', 0, 0, '378', 0);
INSERT INTO `dr_linkage_data_1` VALUES(388, 1, 29, '0,29', '包头市', 'baotou', 0, 0, '388', 0);
INSERT INTO `dr_linkage_data_1` VALUES(398, 1, 29, '0,29', '乌海市', 'wuhai', 0, 0, '398', 0);
INSERT INTO `dr_linkage_data_1` VALUES(402, 1, 29, '0,29', '赤峰市', 'chifeng', 0, 0, '402', 0);
INSERT INTO `dr_linkage_data_1` VALUES(415, 1, 29, '0,29', '通辽市', 'tongliao', 0, 0, '415', 0);
INSERT INTO `dr_linkage_data_1` VALUES(424, 1, 29, '0,29', '鄂尔多斯市', 'eerduosi', 0, 0, '424', 0);
INSERT INTO `dr_linkage_data_1` VALUES(433, 1, 29, '0,29', '呼伦贝尔市', 'hulunbeier', 0, 0, '433', 0);
INSERT INTO `dr_linkage_data_1` VALUES(447, 1, 29, '0,29', '巴彦淖尔市', 'bayannaoer', 0, 0, '447', 0);
INSERT INTO `dr_linkage_data_1` VALUES(455, 1, 29, '0,29', '乌兰察布市', 'wulanchabu', 0, 0, '455', 0);
INSERT INTO `dr_linkage_data_1` VALUES(467, 1, 29, '0,29', '兴安盟', 'xinganmeng', 0, 0, '467', 0);
INSERT INTO `dr_linkage_data_1` VALUES(474, 1, 29, '0,29', '锡林郭勒盟', 'xilinguolemeng', 0, 0, '474', 0);
INSERT INTO `dr_linkage_data_1` VALUES(487, 1, 29, '0,29', '阿拉善盟', 'alashanmeng', 0, 0, '487', 0);
INSERT INTO `dr_linkage_data_1` VALUES(491, 1, 5, '0,5', '沈阳市', 'shenyang', 0, 0, '491', 0);
INSERT INTO `dr_linkage_data_1` VALUES(505, 1, 5, '0,5', '大连市', 'dalian', 0, 0, '505', 0);
INSERT INTO `dr_linkage_data_1` VALUES(516, 1, 5, '0,5', '鞍山市', 'anshan', 0, 0, '516', 0);
INSERT INTO `dr_linkage_data_1` VALUES(524, 1, 5, '0,5', '抚顺市', 'fushun', 0, 0, '524', 0);
INSERT INTO `dr_linkage_data_1` VALUES(532, 1, 5, '0,5', '本溪市', 'benxi', 0, 0, '532', 0);
INSERT INTO `dr_linkage_data_1` VALUES(539, 1, 5, '0,5', '丹东市', 'dandong', 0, 0, '539', 0);
INSERT INTO `dr_linkage_data_1` VALUES(546, 1, 5, '0,5', '锦州市', 'jinzhou', 0, 0, '546', 0);
INSERT INTO `dr_linkage_data_1` VALUES(554, 1, 5, '0,5', '营口市', 'yingkou', 0, 0, '554', 0);
INSERT INTO `dr_linkage_data_1` VALUES(561, 1, 5, '0,5', '阜新市', 'fuxin', 0, 0, '561', 0);
INSERT INTO `dr_linkage_data_1` VALUES(569, 1, 5, '0,5', '辽阳市', 'liaoyang', 0, 0, '569', 0);
INSERT INTO `dr_linkage_data_1` VALUES(577, 1, 5, '0,5', '盘锦市', 'panjin', 0, 0, '577', 0);
INSERT INTO `dr_linkage_data_1` VALUES(582, 1, 5, '0,5', '铁岭市', 'tieling', 0, 0, '582', 0);
INSERT INTO `dr_linkage_data_1` VALUES(590, 1, 5, '0,5', '朝阳市', 'chaoyang', 0, 0, '590', 0);
INSERT INTO `dr_linkage_data_1` VALUES(598, 1, 5, '0,5', '葫芦岛市', 'huludao', 0, 0, '598', 0);
INSERT INTO `dr_linkage_data_1` VALUES(605, 1, 6, '0,6', '长春市', 'changchun', 0, 0, '605', 0);
INSERT INTO `dr_linkage_data_1` VALUES(616, 1, 6, '0,6', '吉林市', 'jilin1', 0, 0, '616', 0);
INSERT INTO `dr_linkage_data_1` VALUES(626, 1, 6, '0,6', '四平市', 'siping', 0, 0, '626', 0);
INSERT INTO `dr_linkage_data_1` VALUES(633, 1, 6, '0,6', '辽源市', 'liaoyuan', 0, 0, '633', 0);
INSERT INTO `dr_linkage_data_1` VALUES(638, 1, 6, '0,6', '通化市', 'tonghua', 0, 0, '638', 0);
INSERT INTO `dr_linkage_data_1` VALUES(646, 1, 6, '0,6', '白山市', 'baishan', 0, 0, '646', 0);
INSERT INTO `dr_linkage_data_1` VALUES(653, 1, 6, '0,6', '松原市', 'songyuan', 0, 0, '653', 0);
INSERT INTO `dr_linkage_data_1` VALUES(659, 1, 6, '0,6', '白城市', 'baicheng', 0, 0, '659', 0);
INSERT INTO `dr_linkage_data_1` VALUES(665, 1, 6, '0,6', '延边自治州', 'yanbianzhou', 0, 0, '665', 0);
INSERT INTO `dr_linkage_data_1` VALUES(674, 1, 7, '0,7', '哈尔滨市', 'haerbin', 0, 0, '674', 0);
INSERT INTO `dr_linkage_data_1` VALUES(693, 1, 7, '0,7', '齐齐哈尔市', 'qiqihaer', 0, 0, '693', 0);
INSERT INTO `dr_linkage_data_1` VALUES(710, 1, 7, '0,7', '鸡西市', 'jixi', 0, 0, '710', 0);
INSERT INTO `dr_linkage_data_1` VALUES(720, 1, 7, '0,7', '鹤岗市', 'hegang', 0, 0, '720', 0);
INSERT INTO `dr_linkage_data_1` VALUES(729, 1, 7, '0,7', '双鸭山市', 'shuangyashan', 0, 0, '729', 0);
INSERT INTO `dr_linkage_data_1` VALUES(738, 1, 7, '0,7', '大庆市', 'daqing', 0, 0, '738', 0);
INSERT INTO `dr_linkage_data_1` VALUES(748, 1, 7, '0,7', '伊春市', 'yichun', 0, 0, '748', 0);
INSERT INTO `dr_linkage_data_1` VALUES(766, 1, 7, '0,7', '佳木斯市', 'jiamusi', 0, 0, '766', 0);
INSERT INTO `dr_linkage_data_1` VALUES(777, 1, 7, '0,7', '七台河市', 'qitaihe', 0, 0, '777', 0);
INSERT INTO `dr_linkage_data_1` VALUES(782, 1, 7, '0,7', '牡丹江市', 'mudanjiang', 0, 0, '782', 0);
INSERT INTO `dr_linkage_data_1` VALUES(793, 1, 7, '0,7', '黑河市', 'heihe', 0, 0, '793', 0);
INSERT INTO `dr_linkage_data_1` VALUES(800, 1, 7, '0,7', '绥化市', 'suihua', 0, 0, '800', 0);
INSERT INTO `dr_linkage_data_1` VALUES(811, 1, 7, '0,7', '大兴安岭地区', 'daxinganling', 0, 0, '811', 0);
INSERT INTO `dr_linkage_data_1` VALUES(815, 1, 0, '0', '上海市', 'shanghai', 0, 0, '815', 8);
INSERT INTO `dr_linkage_data_1` VALUES(833, 1, 8, '0,8', '南京市', 'nanjing', 0, 0, '833', 0);
INSERT INTO `dr_linkage_data_1` VALUES(834, 1, 8, '0,8', '无锡市', 'wuxi', 0, 0, '834', 0);
INSERT INTO `dr_linkage_data_1` VALUES(835, 1, 8, '0,8', '徐州市', 'xuzhou', 0, 0, '835', 0);
INSERT INTO `dr_linkage_data_1` VALUES(836, 1, 8, '0,8', '常州市', 'changzhou', 0, 0, '836', 0);
INSERT INTO `dr_linkage_data_1` VALUES(837, 1, 8, '0,8', '苏州市', 'suzhou', 0, 0, '837', 0);
INSERT INTO `dr_linkage_data_1` VALUES(838, 1, 8, '0,8', '南通市', 'nantong', 0, 0, '838', 0);
INSERT INTO `dr_linkage_data_1` VALUES(839, 1, 8, '0,8', '连云港市', 'lianyungang', 0, 0, '839', 0);
INSERT INTO `dr_linkage_data_1` VALUES(840, 1, 8, '0,8', '淮安市', 'huaian', 0, 0, '840', 0);
INSERT INTO `dr_linkage_data_1` VALUES(841, 1, 8, '0,8', '盐城市', 'yancheng', 0, 0, '841', 0);
INSERT INTO `dr_linkage_data_1` VALUES(842, 1, 8, '0,8', '扬州市', 'yangzhou', 0, 0, '842', 0);
INSERT INTO `dr_linkage_data_1` VALUES(843, 1, 8, '0,8', '镇江市', 'zhenjiang', 0, 0, '843', 0);
INSERT INTO `dr_linkage_data_1` VALUES(844, 1, 8, '0,8', '泰州市', 'taizhou', 0, 0, '844', 0);
INSERT INTO `dr_linkage_data_1` VALUES(845, 1, 8, '0,8', '宿迁市', 'xiuqian', 0, 0, '845', 0);
INSERT INTO `dr_linkage_data_1` VALUES(846, 1, 9, '0,9', '杭州市', 'hangzhou', 0, 0, '846', 0);
INSERT INTO `dr_linkage_data_1` VALUES(847, 1, 9, '0,9', '宁波市', 'ningbo', 0, 0, '847', 0);
INSERT INTO `dr_linkage_data_1` VALUES(848, 1, 9, '0,9', '温州市', 'wenzhou', 0, 0, '848', 0);
INSERT INTO `dr_linkage_data_1` VALUES(849, 1, 9, '0,9', '嘉兴市', 'jiaxing', 0, 0, '849', 0);
INSERT INTO `dr_linkage_data_1` VALUES(850, 1, 9, '0,9', '湖州市', 'huzhou', 0, 0, '850', 0);
INSERT INTO `dr_linkage_data_1` VALUES(851, 1, 9, '0,9', '绍兴市', 'shaoxing', 0, 0, '851', 0);
INSERT INTO `dr_linkage_data_1` VALUES(852, 1, 9, '0,9', '金华市', 'jinhua', 0, 0, '852', 0);
INSERT INTO `dr_linkage_data_1` VALUES(853, 1, 9, '0,9', '衢州市', 'quzhou', 0, 0, '853', 0);
INSERT INTO `dr_linkage_data_1` VALUES(854, 1, 9, '0,9', '舟山市', 'zhoushan', 0, 0, '854', 0);
INSERT INTO `dr_linkage_data_1` VALUES(855, 1, 9, '0,9', '台州市', 'taizhou1', 0, 0, '855', 0);
INSERT INTO `dr_linkage_data_1` VALUES(856, 1, 9, '0,9', '丽水市', 'lishui', 0, 0, '856', 0);
INSERT INTO `dr_linkage_data_1` VALUES(857, 1, 10, '0,10', '合肥市', 'hefei', 0, 0, '857', 0);
INSERT INTO `dr_linkage_data_1` VALUES(858, 1, 10, '0,10', '芜湖市', 'wuhu', 0, 0, '858', 0);
INSERT INTO `dr_linkage_data_1` VALUES(859, 1, 10, '0,10', '蚌埠市', 'bangbu', 0, 0, '859', 0);
INSERT INTO `dr_linkage_data_1` VALUES(860, 1, 10, '0,10', '淮南市', 'huainan', 0, 0, '860', 0);
INSERT INTO `dr_linkage_data_1` VALUES(861, 1, 10, '0,10', '马鞍山市', 'maanshan', 0, 0, '861', 0);
INSERT INTO `dr_linkage_data_1` VALUES(862, 1, 10, '0,10', '淮北市', 'huaibei', 0, 0, '862', 0);
INSERT INTO `dr_linkage_data_1` VALUES(863, 1, 10, '0,10', '铜陵市', 'tongling', 0, 0, '863', 0);
INSERT INTO `dr_linkage_data_1` VALUES(864, 1, 10, '0,10', '安庆市', 'anqing', 0, 0, '864', 0);
INSERT INTO `dr_linkage_data_1` VALUES(865, 1, 10, '0,10', '黄山市', 'huangshan', 0, 0, '865', 0);
INSERT INTO `dr_linkage_data_1` VALUES(866, 1, 10, '0,10', '滁州市', 'chuzhou', 0, 0, '866', 0);
INSERT INTO `dr_linkage_data_1` VALUES(867, 1, 10, '0,10', '阜阳市', 'fuyang', 0, 0, '867', 0);
INSERT INTO `dr_linkage_data_1` VALUES(868, 1, 10, '0,10', '宿州市', 'xiuzhou', 0, 0, '868', 0);
INSERT INTO `dr_linkage_data_1` VALUES(869, 1, 10, '0,10', '六安市', 'liuan', 0, 0, '869', 0);
INSERT INTO `dr_linkage_data_1` VALUES(870, 1, 10, '0,10', '亳州市', 'bozhou', 0, 0, '870', 0);
INSERT INTO `dr_linkage_data_1` VALUES(871, 1, 10, '0,10', '池州市', 'shizhou', 0, 0, '871', 0);
INSERT INTO `dr_linkage_data_1` VALUES(872, 1, 10, '0,10', '宣城市', 'xuancheng', 0, 0, '872', 0);
INSERT INTO `dr_linkage_data_1` VALUES(873, 1, 11, '0,11', '福州市', 'fuzhou', 0, 0, '873', 0);
INSERT INTO `dr_linkage_data_1` VALUES(874, 1, 11, '0,11', '厦门市', 'shamen', 0, 0, '874', 0);
INSERT INTO `dr_linkage_data_1` VALUES(875, 1, 11, '0,11', '莆田市', 'putian', 0, 0, '875', 0);
INSERT INTO `dr_linkage_data_1` VALUES(876, 1, 11, '0,11', '三明市', 'sanming', 0, 0, '876', 0);
INSERT INTO `dr_linkage_data_1` VALUES(877, 1, 11, '0,11', '泉州市', 'quanzhou', 0, 0, '877', 0);
INSERT INTO `dr_linkage_data_1` VALUES(878, 1, 11, '0,11', '漳州市', 'zhangzhou', 0, 0, '878', 0);
INSERT INTO `dr_linkage_data_1` VALUES(879, 1, 11, '0,11', '南平市', 'nanping', 0, 0, '879', 0);
INSERT INTO `dr_linkage_data_1` VALUES(880, 1, 11, '0,11', '龙岩市', 'longyan', 0, 0, '880', 0);
INSERT INTO `dr_linkage_data_1` VALUES(881, 1, 11, '0,11', '宁德市', 'ningde', 0, 0, '881', 0);
INSERT INTO `dr_linkage_data_1` VALUES(882, 1, 12, '0,12', '南昌市', 'nanchang', 0, 0, '882', 0);
INSERT INTO `dr_linkage_data_1` VALUES(883, 1, 12, '0,12', '景德镇市', 'jingdezhen', 0, 0, '883', 0);
INSERT INTO `dr_linkage_data_1` VALUES(884, 1, 12, '0,12', '萍乡市', 'pingxiang', 0, 0, '884', 0);
INSERT INTO `dr_linkage_data_1` VALUES(885, 1, 12, '0,12', '九江市', 'jiujiang', 0, 0, '885', 0);
INSERT INTO `dr_linkage_data_1` VALUES(886, 1, 12, '0,12', '新余市', 'xinyu', 0, 0, '886', 0);
INSERT INTO `dr_linkage_data_1` VALUES(887, 1, 12, '0,12', '鹰潭市', 'yingtan', 0, 0, '887', 0);
INSERT INTO `dr_linkage_data_1` VALUES(888, 1, 12, '0,12', '赣州市', 'ganzhou', 0, 0, '888', 0);
INSERT INTO `dr_linkage_data_1` VALUES(889, 1, 12, '0,12', '吉安市', 'jian', 0, 0, '889', 0);
INSERT INTO `dr_linkage_data_1` VALUES(890, 1, 12, '0,12', '宜春市', 'yichun1', 0, 0, '890', 0);
INSERT INTO `dr_linkage_data_1` VALUES(891, 1, 12, '0,12', '抚州市', 'fuzhou1', 0, 0, '891', 0);
INSERT INTO `dr_linkage_data_1` VALUES(892, 1, 12, '0,12', '上饶市', 'shangrao', 0, 0, '892', 0);
INSERT INTO `dr_linkage_data_1` VALUES(893, 1, 13, '0,13', '济南市', 'jinan', 0, 0, '893', 0);
INSERT INTO `dr_linkage_data_1` VALUES(894, 1, 13, '0,13', '青岛市', 'qingdao', 0, 0, '894', 0);
INSERT INTO `dr_linkage_data_1` VALUES(895, 1, 13, '0,13', '淄博市', 'zibo', 0, 0, '895', 0);
INSERT INTO `dr_linkage_data_1` VALUES(896, 1, 13, '0,13', '枣庄市', 'zaozhuang', 0, 0, '896', 0);
INSERT INTO `dr_linkage_data_1` VALUES(897, 1, 13, '0,13', '东营市', 'dongying', 0, 0, '897', 0);
INSERT INTO `dr_linkage_data_1` VALUES(898, 1, 13, '0,13', '烟台市', 'yantai', 0, 0, '898', 0);
INSERT INTO `dr_linkage_data_1` VALUES(899, 1, 13, '0,13', '潍坊市', 'weifang', 0, 0, '899', 0);
INSERT INTO `dr_linkage_data_1` VALUES(900, 1, 13, '0,13', '济宁市', 'jining', 0, 0, '900', 0);
INSERT INTO `dr_linkage_data_1` VALUES(901, 1, 13, '0,13', '泰安市', 'taian', 0, 0, '901', 0);
INSERT INTO `dr_linkage_data_1` VALUES(902, 1, 13, '0,13', '威海市', 'weihai', 0, 0, '902', 0);
INSERT INTO `dr_linkage_data_1` VALUES(903, 1, 13, '0,13', '日照市', 'rizhao', 0, 0, '903', 0);
INSERT INTO `dr_linkage_data_1` VALUES(904, 1, 13, '0,13', '莱芜市', 'laiwu', 0, 0, '904', 0);
INSERT INTO `dr_linkage_data_1` VALUES(905, 1, 13, '0,13', '临沂市', 'linyi', 0, 0, '905', 0);
INSERT INTO `dr_linkage_data_1` VALUES(906, 1, 13, '0,13', '德州市', 'dezhou', 0, 0, '906', 0);
INSERT INTO `dr_linkage_data_1` VALUES(907, 1, 13, '0,13', '聊城市', 'liaocheng', 0, 0, '907', 0);
INSERT INTO `dr_linkage_data_1` VALUES(908, 1, 13, '0,13', '滨州市', 'binzhou', 0, 0, '908', 0);
INSERT INTO `dr_linkage_data_1` VALUES(909, 1, 13, '0,13', '菏泽市', 'heze', 0, 0, '909', 0);
INSERT INTO `dr_linkage_data_1` VALUES(910, 1, 14, '0,14', '郑州市', 'zhengzhou', 0, 0, '910', 0);
INSERT INTO `dr_linkage_data_1` VALUES(911, 1, 14, '0,14', '开封市', 'kaifeng', 0, 0, '911', 0);
INSERT INTO `dr_linkage_data_1` VALUES(912, 1, 14, '0,14', '洛阳市', 'luoyang', 0, 0, '912', 0);
INSERT INTO `dr_linkage_data_1` VALUES(913, 1, 14, '0,14', '平顶山市', 'pingdingshan', 0, 0, '913', 0);
INSERT INTO `dr_linkage_data_1` VALUES(914, 1, 14, '0,14', '安阳市', 'anyang', 0, 0, '914', 0);
INSERT INTO `dr_linkage_data_1` VALUES(915, 1, 14, '0,14', '鹤壁市', 'hebi', 0, 0, '915', 0);
INSERT INTO `dr_linkage_data_1` VALUES(916, 1, 14, '0,14', '新乡市', 'xinxiang', 0, 0, '916', 0);
INSERT INTO `dr_linkage_data_1` VALUES(917, 1, 14, '0,14', '焦作市', 'jiaozuo', 0, 0, '917', 0);
INSERT INTO `dr_linkage_data_1` VALUES(918, 1, 14, '0,14', '濮阳市', 'puyang', 0, 0, '918', 0);
INSERT INTO `dr_linkage_data_1` VALUES(919, 1, 14, '0,14', '许昌市', 'xuchang', 0, 0, '919', 0);
INSERT INTO `dr_linkage_data_1` VALUES(920, 1, 14, '0,14', '漯河市', 'leihe', 0, 0, '920', 0);
INSERT INTO `dr_linkage_data_1` VALUES(921, 1, 14, '0,14', '三门峡市', 'sanmenxia', 0, 0, '921', 0);
INSERT INTO `dr_linkage_data_1` VALUES(922, 1, 14, '0,14', '南阳市', 'nanyang', 0, 0, '922', 0);
INSERT INTO `dr_linkage_data_1` VALUES(923, 1, 14, '0,14', '商丘市', 'shangqiu', 0, 0, '923', 0);
INSERT INTO `dr_linkage_data_1` VALUES(924, 1, 14, '0,14', '信阳市', 'xinyang', 0, 0, '924', 0);
INSERT INTO `dr_linkage_data_1` VALUES(925, 1, 14, '0,14', '周口市', 'zhoukou', 0, 0, '925', 0);
INSERT INTO `dr_linkage_data_1` VALUES(926, 1, 14, '0,14', '驻马店市', 'zhumadian', 0, 0, '926', 0);
INSERT INTO `dr_linkage_data_1` VALUES(927, 1, 15, '0,15', '武汉市', 'wuhan', 0, 0, '927', 0);
INSERT INTO `dr_linkage_data_1` VALUES(928, 1, 15, '0,15', '黄石市', 'huangshi', 0, 0, '928', 0);
INSERT INTO `dr_linkage_data_1` VALUES(929, 1, 15, '0,15', '十堰市', 'shiyan', 0, 0, '929', 0);
INSERT INTO `dr_linkage_data_1` VALUES(930, 1, 15, '0,15', '宜昌市', 'yichang', 0, 0, '930', 0);
INSERT INTO `dr_linkage_data_1` VALUES(931, 1, 15, '0,15', '襄阳市', 'xiangyang', 0, 0, '931', 0);
INSERT INTO `dr_linkage_data_1` VALUES(932, 1, 15, '0,15', '鄂州市', 'ezhou', 0, 0, '932', 0);
INSERT INTO `dr_linkage_data_1` VALUES(933, 1, 15, '0,15', '荆门市', 'jingmen', 0, 0, '933', 0);
INSERT INTO `dr_linkage_data_1` VALUES(934, 1, 15, '0,15', '孝感市', 'xiaogan', 0, 0, '934', 0);
INSERT INTO `dr_linkage_data_1` VALUES(935, 1, 15, '0,15', '荆州市', 'jingzhou', 0, 0, '935', 0);
INSERT INTO `dr_linkage_data_1` VALUES(936, 1, 15, '0,15', '黄冈市', 'huanggang', 0, 0, '936', 0);
INSERT INTO `dr_linkage_data_1` VALUES(937, 1, 15, '0,15', '咸宁市', 'xianning', 0, 0, '937', 0);
INSERT INTO `dr_linkage_data_1` VALUES(938, 1, 15, '0,15', '随州市', 'suizhou', 0, 0, '938', 0);
INSERT INTO `dr_linkage_data_1` VALUES(939, 1, 15, '0,15', '恩施自治州', 'enshizhou', 0, 0, '939', 0);
INSERT INTO `dr_linkage_data_1` VALUES(940, 1, 16, '0,16', '长沙市', 'changsha', 0, 0, '940', 0);
INSERT INTO `dr_linkage_data_1` VALUES(941, 1, 16, '0,16', '株洲市', 'zhuzhou', 0, 0, '941', 0);
INSERT INTO `dr_linkage_data_1` VALUES(942, 1, 16, '0,16', '湘潭市', 'xiangtan', 0, 0, '942', 0);
INSERT INTO `dr_linkage_data_1` VALUES(943, 1, 16, '0,16', '衡阳市', 'hengyang', 0, 0, '943', 0);
INSERT INTO `dr_linkage_data_1` VALUES(944, 1, 16, '0,16', '邵阳市', 'shaoyang', 0, 0, '944', 0);
INSERT INTO `dr_linkage_data_1` VALUES(945, 1, 16, '0,16', '岳阳市', 'yueyang', 0, 0, '945', 0);
INSERT INTO `dr_linkage_data_1` VALUES(946, 1, 16, '0,16', '常德市', 'changde', 0, 0, '946', 0);
INSERT INTO `dr_linkage_data_1` VALUES(947, 1, 16, '0,16', '张家界市', 'zhangjiajie', 0, 0, '947', 0);
INSERT INTO `dr_linkage_data_1` VALUES(948, 1, 16, '0,16', '益阳市', 'yiyang', 0, 0, '948', 0);
INSERT INTO `dr_linkage_data_1` VALUES(949, 1, 16, '0,16', '郴州市', 'chenzhou', 0, 0, '949', 0);
INSERT INTO `dr_linkage_data_1` VALUES(950, 1, 16, '0,16', '永州市', 'yongzhou', 0, 0, '950', 0);
INSERT INTO `dr_linkage_data_1` VALUES(951, 1, 16, '0,16', '怀化市', 'huaihua', 0, 0, '951', 0);
INSERT INTO `dr_linkage_data_1` VALUES(952, 1, 16, '0,16', '娄底市', 'loudi', 0, 0, '952', 0);
INSERT INTO `dr_linkage_data_1` VALUES(953, 1, 16, '0,16', '湘西自治州', 'xiangxizhou', 0, 0, '953', 0);
INSERT INTO `dr_linkage_data_1` VALUES(954, 1, 17, '0,17', '广州市', 'guangzhou', 0, 0, '954', 0);
INSERT INTO `dr_linkage_data_1` VALUES(955, 1, 17, '0,17', '韶关市', 'shaoguan', 0, 0, '955', 0);
INSERT INTO `dr_linkage_data_1` VALUES(956, 1, 17, '0,17', '深圳市', 'shenchou', 0, 0, '956', 0);
INSERT INTO `dr_linkage_data_1` VALUES(957, 1, 17, '0,17', '珠海市', 'zhuhai', 0, 0, '957', 0);
INSERT INTO `dr_linkage_data_1` VALUES(958, 1, 17, '0,17', '汕头市', 'shantou', 0, 0, '958', 0);
INSERT INTO `dr_linkage_data_1` VALUES(959, 1, 17, '0,17', '佛山市', 'foshan', 0, 0, '959', 0);
INSERT INTO `dr_linkage_data_1` VALUES(960, 1, 17, '0,17', '江门市', 'jiangmen', 0, 0, '960', 0);
INSERT INTO `dr_linkage_data_1` VALUES(961, 1, 17, '0,17', '湛江市', 'zhanjiang', 0, 0, '961', 0);
INSERT INTO `dr_linkage_data_1` VALUES(962, 1, 17, '0,17', '茂名市', 'maoming', 0, 0, '962', 0);
INSERT INTO `dr_linkage_data_1` VALUES(963, 1, 17, '0,17', '肇庆市', 'zhaoqing', 0, 0, '963', 0);
INSERT INTO `dr_linkage_data_1` VALUES(964, 1, 17, '0,17', '惠州市', 'huizhou', 0, 0, '964', 0);
INSERT INTO `dr_linkage_data_1` VALUES(965, 1, 17, '0,17', '梅州市', 'meizhou', 0, 0, '965', 0);
INSERT INTO `dr_linkage_data_1` VALUES(966, 1, 17, '0,17', '汕尾市', 'shanwei', 0, 0, '966', 0);
INSERT INTO `dr_linkage_data_1` VALUES(967, 1, 17, '0,17', '河源市', 'heyuan', 0, 0, '967', 0);
INSERT INTO `dr_linkage_data_1` VALUES(968, 1, 17, '0,17', '阳江市', 'yangjiang', 0, 0, '968', 0);
INSERT INTO `dr_linkage_data_1` VALUES(969, 1, 17, '0,17', '清远市', 'qingyuan', 0, 0, '969', 0);
INSERT INTO `dr_linkage_data_1` VALUES(972, 1, 17, '0,17', '潮州市', 'chaozhou', 0, 0, '972', 0);
INSERT INTO `dr_linkage_data_1` VALUES(973, 1, 17, '0,17', '揭阳市', 'jieyang', 0, 0, '973', 0);
INSERT INTO `dr_linkage_data_1` VALUES(974, 1, 17, '0,17', '云浮市', 'yunfu', 0, 0, '974', 0);
INSERT INTO `dr_linkage_data_1` VALUES(975, 1, 0, '0', '广西', 'guangxi', 1, 0, '975,976,977,978,979,980,981,982,983,984,985,986,987,988,989', 18);
INSERT INTO `dr_linkage_data_1` VALUES(976, 1, 975, '0,975', '南宁市', 'nanning', 0, 0, '976', 0);
INSERT INTO `dr_linkage_data_1` VALUES(977, 1, 975, '0,975', '柳州市', 'liuzhou', 0, 0, '977', 0);
INSERT INTO `dr_linkage_data_1` VALUES(978, 1, 975, '0,975', '桂林市', 'guilin', 0, 0, '978', 0);
INSERT INTO `dr_linkage_data_1` VALUES(979, 1, 975, '0,975', '梧州市', 'wuzhou', 0, 0, '979', 0);
INSERT INTO `dr_linkage_data_1` VALUES(980, 1, 975, '0,975', '北海市', 'beihai', 0, 0, '980', 0);
INSERT INTO `dr_linkage_data_1` VALUES(981, 1, 975, '0,975', '防城港市', 'fangchenggang', 0, 0, '981', 0);
INSERT INTO `dr_linkage_data_1` VALUES(982, 1, 975, '0,975', '钦州市', 'qinzhou', 0, 0, '982', 0);
INSERT INTO `dr_linkage_data_1` VALUES(983, 1, 975, '0,975', '贵港市', 'guigang', 0, 0, '983', 0);
INSERT INTO `dr_linkage_data_1` VALUES(984, 1, 975, '0,975', '玉林市', 'yulin', 0, 0, '984', 0);
INSERT INTO `dr_linkage_data_1` VALUES(985, 1, 975, '0,975', '百色市', 'baise', 0, 0, '985', 0);
INSERT INTO `dr_linkage_data_1` VALUES(986, 1, 975, '0,975', '贺州市', 'hezhou', 0, 0, '986', 0);
INSERT INTO `dr_linkage_data_1` VALUES(987, 1, 975, '0,975', '河池市', 'heshi', 0, 0, '987', 0);
INSERT INTO `dr_linkage_data_1` VALUES(988, 1, 975, '0,975', '来宾市', 'laibin', 0, 0, '988', 0);
INSERT INTO `dr_linkage_data_1` VALUES(989, 1, 975, '0,975', '崇左市', 'chongzuo', 0, 0, '989', 0);
INSERT INTO `dr_linkage_data_1` VALUES(990, 1, 18, '0,18', '海口市', 'haikou', 0, 0, '990', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1046, 1, 20, '0,20', '成都市', 'chengdou', 0, 0, '1046', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1047, 1, 20, '0,20', '自贡市', 'zigong', 0, 0, '1047', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1048, 1, 20, '0,20', '攀枝花市', 'panzhihua', 0, 0, '1048', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1049, 1, 20, '0,20', '泸州市', 'luzhou', 0, 0, '1049', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1050, 1, 20, '0,20', '德阳市', 'deyang', 0, 0, '1050', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1051, 1, 20, '0,20', '绵阳市', 'mianyang', 0, 0, '1051', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1052, 1, 20, '0,20', '广元市', 'guangyuan', 0, 0, '1052', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1053, 1, 20, '0,20', '遂宁市', 'suining', 0, 0, '1053', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1054, 1, 20, '0,20', '内江市', 'neijiang', 0, 0, '1054', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1055, 1, 20, '0,20', '乐山市', 'leshan', 0, 0, '1055', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1056, 1, 20, '0,20', '南充市', 'nanchong', 0, 0, '1056', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1057, 1, 20, '0,20', '眉山市', 'meishan', 0, 0, '1057', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1058, 1, 20, '0,20', '宜宾市', 'yibin', 0, 0, '1058', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1059, 1, 20, '0,20', '广安市', 'guangan', 0, 0, '1059', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1060, 1, 20, '0,20', '达州市', 'dazhou', 0, 0, '1060', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1061, 1, 20, '0,20', '雅安市', 'yaan', 0, 0, '1061', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1062, 1, 20, '0,20', '巴中市', 'bazhong', 0, 0, '1062', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1063, 1, 20, '0,20', '资阳市', 'ziyang', 0, 0, '1063', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1064, 1, 20, '0,20', '阿坝自治州', 'abazhou', 0, 0, '1064', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1065, 1, 20, '0,20', '甘孜自治州', 'ganzizhou', 0, 0, '1065', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1066, 1, 20, '0,20', '凉山自治州', 'liangshanzhou', 0, 0, '1066', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1067, 1, 21, '0,21', '贵阳市', 'guiyang', 0, 0, '1067', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1068, 1, 21, '0,21', '六盘水市', 'liupanshui', 0, 0, '1068', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1069, 1, 21, '0,21', '遵义市', 'zunyi', 0, 0, '1069', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1070, 1, 21, '0,21', '安顺市', 'anshun', 0, 0, '1070', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1071, 1, 21, '0,21', '毕节市', 'bijie', 0, 0, '1071', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1072, 1, 21, '0,21', '铜仁市', 'tongren', 0, 0, '1072', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1073, 1, 21, '0,21', '黔西南自治州', 'qianxinanzhou', 0, 0, '1073', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1074, 1, 21, '0,21', '黔东南自治州', 'qiandongnanzhou', 0, 0, '1074', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1075, 1, 21, '0,21', '黔南自治州', 'qiannanzhou', 0, 0, '1075', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1076, 1, 22, '0,22', '昆明市', 'kunming', 0, 0, '1076', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1077, 1, 22, '0,22', '曲靖市', 'qujing', 0, 0, '1077', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1078, 1, 22, '0,22', '玉溪市', 'yuxi', 0, 0, '1078', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1079, 1, 22, '0,22', '保山市', 'baoshan', 0, 0, '1079', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1080, 1, 22, '0,22', '昭通市', 'zhaotong', 0, 0, '1080', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1081, 1, 22, '0,22', '丽江市', 'lijiang', 0, 0, '1081', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1082, 1, 22, '0,22', '普洱市', 'puer', 0, 0, '1082', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1083, 1, 22, '0,22', '临沧市', 'lincang', 0, 0, '1083', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1084, 1, 22, '0,22', '楚雄自治州', 'chuxiongzhou', 0, 0, '1084', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1085, 1, 22, '0,22', '红河自治州', 'honghezhou', 0, 0, '1085', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1086, 1, 22, '0,22', '文山自治州', 'wenshanzhou', 0, 0, '1086', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1087, 1, 22, '0,22', '西双版纳自治州', 'xishuangbannazhou', 0, 0, '1087', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1088, 1, 22, '0,22', '大理自治州', 'dalizhou', 0, 0, '1088', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1089, 1, 22, '0,22', '德宏自治州', 'dehongzhou', 0, 0, '1089', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1090, 1, 22, '0,22', '怒江自治州', 'nujiangzhou', 0, 0, '1090', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1091, 1, 22, '0,22', '迪庆自治州', 'diqingzhou', 0, 0, '1091', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1092, 1, 27, '0,27', '拉萨市', 'lasa', 0, 0, '1092', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1093, 1, 27, '0,27', '昌都地区', 'changdou', 0, 0, '1093', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1094, 1, 27, '0,27', '山南地区', 'shannan', 0, 0, '1094', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1095, 1, 27, '0,27', '日喀则地区', 'rikaze', 0, 0, '1095', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1096, 1, 27, '0,27', '那曲地区', 'naqu', 0, 0, '1096', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1097, 1, 27, '0,27', '阿里地区', 'ali', 0, 0, '1097', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1098, 1, 27, '0,27', '林芝地区', 'linzhi', 0, 0, '1098', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1099, 1, 23, '0,23', '西安市', 'xian', 0, 0, '1099', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1100, 1, 23, '0,23', '铜川市', 'tongchuan', 0, 0, '1100', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1101, 1, 23, '0,23', '宝鸡市', 'baoji', 0, 0, '1101', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1102, 1, 23, '0,23', '咸阳市', 'xianyang', 0, 0, '1102', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1103, 1, 23, '0,23', '渭南市', 'weinan', 0, 0, '1103', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1104, 1, 23, '0,23', '延安市', 'yanan', 0, 0, '1104', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1105, 1, 23, '0,23', '汉中市', 'hanzhong', 0, 0, '1105', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1106, 1, 23, '0,23', '榆林市', 'yulin1', 0, 0, '1106', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1107, 1, 23, '0,23', '安康市', 'ankang', 0, 0, '1107', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1108, 1, 23, '0,23', '商洛市', 'shangluo', 0, 0, '1108', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1109, 1, 24, '0,24', '兰州市', 'lanzhou', 0, 0, '1109', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1110, 1, 24, '0,24', '嘉峪关市', 'jiayuguan', 0, 0, '1110', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1111, 1, 24, '0,24', '白银市', 'baiyin', 0, 0, '1111', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1112, 1, 24, '0,24', '天水市', 'tianshui', 0, 0, '1112', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1113, 1, 24, '0,24', '武威市', 'wuwei', 0, 0, '1113', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1114, 1, 24, '0,24', '张掖市', 'zhangye', 0, 0, '1114', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1115, 1, 24, '0,24', '平凉市', 'pingliang', 0, 0, '1115', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1116, 1, 24, '0,24', '酒泉市', 'jiuquan', 0, 0, '1116', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1117, 1, 24, '0,24', '庆阳市', 'qingyang', 0, 0, '1117', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1118, 1, 24, '0,24', '定西市', 'dingxi', 0, 0, '1118', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1119, 1, 24, '0,24', '陇南市', 'longnan', 0, 0, '1119', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1120, 1, 24, '0,24', '临夏自治州', 'linxiazhou', 0, 0, '1120', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1121, 1, 24, '0,24', '甘南自治州', 'gannanzhou', 0, 0, '1121', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1122, 1, 25, '0,25', '西宁市', 'xining', 0, 0, '1122', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1123, 1, 25, '0,25', '海东地区', 'haidong', 0, 0, '1123', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1124, 1, 25, '0,25', '海北自治州', 'haibeizhou', 0, 0, '1124', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1125, 1, 25, '0,25', '黄南自治州', 'huangnanzhou', 0, 0, '1125', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1126, 1, 25, '0,25', '海南自治州', 'hainanzhou', 0, 0, '1126', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1127, 1, 25, '0,25', '果洛自治州', 'guoluozhou', 0, 0, '1127', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1128, 1, 25, '0,25', '玉树自治州', 'yushuzhou', 0, 0, '1128', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1129, 1, 25, '0,25', '海西自治州', 'haixizhou', 0, 0, '1129', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1130, 1, 26, '0,26', '银川市', 'yinchuan', 0, 0, '1130', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1131, 1, 26, '0,26', '石嘴山市', 'shizuishan', 0, 0, '1131', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1132, 1, 26, '0,26', '吴忠市', 'wuzhong', 0, 0, '1132', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1133, 1, 26, '0,26', '固原市', 'guyuan', 0, 0, '1133', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1134, 1, 26, '0,26', '中卫市', 'zhongwei', 0, 0, '1134', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1135, 1, 28, '0,28', '乌鲁木齐市', 'wulumuqi', 0, 0, '1135', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1136, 1, 28, '0,28', '克拉玛依市', 'kelamayi', 0, 0, '1136', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1137, 1, 28, '0,28', '吐鲁番地区', 'tulufan', 0, 0, '1137', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1138, 1, 28, '0,28', '哈密地区', 'hami', 0, 0, '1138', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1139, 1, 28, '0,28', '昌吉自治州', 'changjizhou', 0, 0, '1139', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1140, 1, 28, '0,28', '博尔塔拉自治州', 'boertalazhou', 0, 0, '1140', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1141, 1, 28, '0,28', '巴音郭楞自治州', 'bayinguolengzhou', 0, 0, '1141', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1142, 1, 28, '0,28', '阿克苏地区', 'akesu', 0, 0, '1142', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1143, 1, 28, '0,28', '克孜勒自治州', 'kezilezhou', 0, 0, '1143', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1144, 1, 28, '0,28', '喀什地区', 'kashi', 0, 0, '1144', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1145, 1, 28, '0,28', '和田地区', 'hetian', 0, 0, '1145', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1146, 1, 28, '0,28', '伊犁自治州', 'yilizhou', 0, 0, '1146', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1147, 1, 28, '0,28', '塔城地区', 'tacheng', 0, 0, '1147', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1148, 1, 28, '0,28', '阿勒泰地区', 'aletai', 0, 0, '1148', 0);
INSERT INTO `dr_linkage_data_1` VALUES(1149, 1, 17, '0,17', '东莞市', 'dongguan', 0, 0, '1149', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_mail_queue`
--

CREATE TABLE IF NOT EXISTS `dr_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL COMMENT '邮件地址',
  `subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `message` text NOT NULL COMMENT '邮件内容',
  `status` tinyint(1) unsigned NOT NULL COMMENT '发送状态',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件队列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_mail_smtp`
--

CREATE TABLE IF NOT EXISTS `dr_mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member`
--

CREATE TABLE IF NOT EXISTS `dr_member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(40) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` char(10) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL COMMENT '头像地址',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '虚拟币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `adminid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `levelid` smallint(5) unsigned NOT NULL COMMENT '会员级别',
  `overdue` int(10) unsigned NOT NULL COMMENT '到期时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) unsigned NOT NULL COMMENT '随机验证码',
  `ismobile` tinyint(1) unsigned DEFAULT NULL COMMENT '手机认证标识',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `adminid` (`adminid`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_member`
--

INSERT INTO `dr_member` VALUES(1, 'dfasdf2@fas.com', 'admin', '62e69b828c74c50a1f6e93227cdf7e77', '8d6dc35e50', '', '', '', '9999.00', '0.00', '0.00', 9995, 10020, 1, 3, 4, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_address`
--

CREATE TABLE IF NOT EXISTS `dr_member_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `city` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `default` tinyint(1) unsigned NOT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`default`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员收货地址表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_data`
--

CREATE TABLE IF NOT EXISTS `dr_member_data` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) unsigned NOT NULL COMMENT '完善资料标识',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证标识',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_group`
--

CREATE TABLE IF NOT EXISTS `dr_member_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '会员组名称',
  `theme` varchar(255) NOT NULL COMMENT '风格目录',
  `template` varchar(50) NOT NULL COMMENT '模板目录',
  `price` decimal(10,2) NOT NULL COMMENT '售价',
  `unit` tinyint(1) unsigned NOT NULL COMMENT '价格单位:1虚拟卡，2金钱',
  `limit` tinyint(1) unsigned NOT NULL COMMENT '售价限制：1月，2半年，3年',
  `overdue` smallint(5) unsigned NOT NULL COMMENT '过期后变成的组',
  `allowregister` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员注册',
  `allowapply` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请',
  `allowapply_orther` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请其他组',
  `allowspace` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员空间',
  `allowfield` text NOT NULL COMMENT '可用字段，序列化数组格式',
  `spacefield` text NOT NULL COMMENT '空间字段，序列化数组格式',
  `spacedomain` tinyint(1) unsigned DEFAULT NULL COMMENT '是否启用空间域名',
  `spacetemplate` varchar(50) DEFAULT NULL COMMENT '空间默认模板',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员组表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dr_member_group`
--

INSERT INTO `dr_member_group` VALUES(1, '待审核会员', 'default', 'default', '0.00', 1, 1, 0, 0, 0, 0, 0, '', '', 1, 'default', 0);
INSERT INTO `dr_member_group` VALUES(2, '快捷登录', 'default', 'default', '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', 1, 'default', 0);
INSERT INTO `dr_member_group` VALUES(3, '普通会员', 'default', 'default', '0.00', 1, 1, 3, 0, 1, 0, 1, '', '', 1, 'default', 0);
INSERT INTO `dr_member_group` VALUES(4, '商业会员', 'default', 'default', '10.00', 2, 1, 3, 1, 0, 0, 1, '', '', 1, 'default', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_level`
--

CREATE TABLE IF NOT EXISTS `dr_member_level` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '会员级别名称',
  `stars` tinyint(2) NOT NULL COMMENT '星星数量',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值要求',
  `allowupgrade` tinyint(1) NOT NULL COMMENT '允许自动升级',
  PRIMARY KEY (`id`),
  KEY `experience` (`experience`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员级别表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `dr_member_level`
--

INSERT INTO `dr_member_level` VALUES(1, 3, '初级', 1, 0, 0);
INSERT INTO `dr_member_level` VALUES(2, 3, '中级', 5, 200, 0);
INSERT INTO `dr_member_level` VALUES(3, 3, '高级', 10, 500, 0);
INSERT INTO `dr_member_level` VALUES(4, 3, '元老', 15, 1000, 0);
INSERT INTO `dr_member_level` VALUES(5, 4, '普通', 16, 0, 0);
INSERT INTO `dr_member_level` VALUES(6, 4, '银牌', 23, 500, 0);
INSERT INTO `dr_member_level` VALUES(7, 4, '金牌', 35, 1000, 0);
INSERT INTO `dr_member_level` VALUES(8, 4, '钻石', 55, 2000, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_login`
--

CREATE TABLE IF NOT EXISTS `dr_member_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `oauthid` varchar(30) NOT NULL COMMENT '快捷登录方式',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登录日志记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_menu`
--

CREATE TABLE IF NOT EXISTS `dr_member_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `mark` varchar(50) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `target` tinyint(3) unsigned DEFAULT NULL COMMENT '新窗口',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员菜单表' AUTO_INCREMENT=63 ;

--
-- 转存表中的数据 `dr_member_menu`
--

INSERT INTO `dr_member_menu` VALUES(1, 0, '账号', '', '', '', 0, 0, 0, 'icon-user');
INSERT INTO `dr_member_menu` VALUES(2, 0, '财务', '', '', '', 0, 0, 0, 'fa fa-rmb');
INSERT INTO `dr_member_menu` VALUES(4, 0, '应用', '', '', 'm_app', 0, 0, 0, 'fa fa-cloud');
INSERT INTO `dr_member_menu` VALUES(43, 16, '转账服务', 'pay/transfer', '', '', 0, 0, 0, 'fa fa-rmb');
INSERT INTO `dr_member_menu` VALUES(5, 1, '基本管理', '', '', '', 0, 0, 0, 'fa fa-cogs');
INSERT INTO `dr_member_menu` VALUES(6, 5, '基本资料', 'account/index', '', '', 0, 0, 0, 'fa fa-cog');
INSERT INTO `dr_member_menu` VALUES(10, 1, '会员相关', '', '', '', 0, 0, 0, 'fa fa-user');
INSERT INTO `dr_member_menu` VALUES(11, 5, '修改密码', 'account/password', '', '', 0, 0, 0, 'icon-lock');
INSERT INTO `dr_member_menu` VALUES(12, 10, '快捷登录', 'account/oauth', '', '', 0, 0, 0, 'fa fa-weibo');
INSERT INTO `dr_member_menu` VALUES(13, 10, '登录记录', 'account/login', '', '', 0, 0, 0, 'fa fa-calendar-o');
INSERT INTO `dr_member_menu` VALUES(14, 10, '会员升级', 'account/upgrade', '', '', 0, 0, 0, 'fa fa-user-plus');
INSERT INTO `dr_member_menu` VALUES(15, 10, '会员权限', 'account/permission', '', '', 0, 0, 0, 'fa fa-users');
INSERT INTO `dr_member_menu` VALUES(16, 2, '充值付款', '', '', '', 0, 0, 0, 'fa fa-rmb');
INSERT INTO `dr_member_menu` VALUES(17, 2, '财务记录', '', '', '', 0, 0, 0, 'fa fa-calendar-o');
INSERT INTO `dr_member_menu` VALUES(18, 16, '在线充值', 'pay/add', '', '', 0, 0, 0, 'fa fa-rmb');
INSERT INTO `dr_member_menu` VALUES(20, 16, '兑换服务', 'pay/convert', '', '', 0, 0, 0, 'fa fa-exchange');
INSERT INTO `dr_member_menu` VALUES(21, 17, '收入记录', 'pay/index', '', '', 0, 0, 0, 'fa fa-calendar-plus-o');
INSERT INTO `dr_member_menu` VALUES(22, 17, '消费记录', 'pay/spend', '', '', 0, 0, 0, 'fa fa-calendar-minus-o');
INSERT INTO `dr_member_menu` VALUES(23, 17, '经验值记录', 'pay/experience', '', '', 0, 0, 0, 'fa fa-compass');
INSERT INTO `dr_member_menu` VALUES(24, 17, '虚拟币记录', 'pay/score', '', '', 0, 0, 0, 'fa fa-diamond');
INSERT INTO `dr_member_menu` VALUES(25, 3, '基本设置', '', '', '', 0, 0, 0, 'fa fa-cog');
INSERT INTO `dr_member_menu` VALUES(30, 4, '我的应用', '', '', '', 0, 0, 99, 'fa fa-cloud');
INSERT INTO `dr_member_menu` VALUES(45, 5, '上传头像', 'account/avatar', '', '', 0, 0, 0, 'icon-picture');
INSERT INTO `dr_member_menu` VALUES(46, 5, '收货地址', 'address/index', '', '', 0, 0, 0, 'icon-home');
INSERT INTO `dr_member_menu` VALUES(47, 5, '附件管理', 'account/attachment', '', '', 0, 0, 0, 'fa fa-folder');
INSERT INTO `dr_member_menu` VALUES(48, 1, '通知提醒', '', '', '', 0, 0, 0, 'fa fa-bell-o');
INSERT INTO `dr_member_menu` VALUES(50, 48, '系统提醒', 'notice/index', '', '', 0, 0, 0, 'fa fa-bell');
INSERT INTO `dr_member_menu` VALUES(51, 48, '互动提醒', 'notice/member', '', '', 0, 0, 0, 'fa fa-at');
INSERT INTO `dr_member_menu` VALUES(52, 48, '模块提醒', 'notice/module', '', '', 0, 0, 0, 'fa fa-whatsapp');
INSERT INTO `dr_member_menu` VALUES(53, 48, '应用提醒', 'notice/app', '', '', 0, 0, 0, 'fa fa-volume-up');
INSERT INTO `dr_member_menu` VALUES(54, 0, '内容', '', '', 'm_mod', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(55, 54, '文档管理', '', '', 'left-demo', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(56, 55, '已通过的文档', 'demo/home/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(57, 55, '待审核的文档', 'demo/verify/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(58, 55, '被退回的文档', 'demo/back/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(59, 55, '我推荐的文档', 'demo/home/flag', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(60, 55, '我收藏的文档', 'demo/home/favorite', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(61, 55, '我购买的文档', 'demo/home/buy', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
INSERT INTO `dr_member_menu` VALUES(62, 55, '我评论的文档', 'demo/comment/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_new_notice`
--

CREATE TABLE IF NOT EXISTS `dr_member_new_notice` (
  `uid` smallint(8) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新通知提醒表';

--
-- 转存表中的数据 `dr_member_new_notice`
--

INSERT INTO `dr_member_new_notice` VALUES(1);

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_0`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_1`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_member_notice_1`
--

INSERT INTO `dr_member_notice_1` VALUES(1, 2, 1, 1, '您有新的评论，<a href="/index.php?c=show&id=1" target="_blank">查看详情</a>', 1478262274);

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_2`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_3`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_4`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_5`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_6`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_6` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_7`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_7` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_8`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_8` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_notice_9`
--

CREATE TABLE IF NOT EXISTS `dr_member_notice_9` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`),
  KEY `type` (`type`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_oauth`
--

CREATE TABLE IF NOT EXISTS `dr_member_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `expire_at` int(10) unsigned NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员OAuth2授权表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_online`
--

CREATE TABLE IF NOT EXISTS `dr_member_online` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL COMMENT '在线时间',
  PRIMARY KEY (`uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员在线情况表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_member_online`
--

INSERT INTO `dr_member_online` VALUES(1, 1480923435);

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_paylog`
--

CREATE TABLE IF NOT EXISTS `dr_member_paylog` (
  `id` bigint(15) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `value` decimal(10,2) NOT NULL COMMENT '价格',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `order` varchar(200) DEFAULT NULL COMMENT '订单号集合',
  `module` varchar(30) NOT NULL COMMENT '应用或模块目录',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `order` (`order`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_scorelog`
--

CREATE TABLE IF NOT EXISTS `dr_member_scorelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL COMMENT '积分0,虚拟币1',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `mark` (`mark`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='得分日志' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dr_member_scorelog`
--

INSERT INTO `dr_member_scorelog` VALUES(1, 1, 0, 5, 'login', '每日登陆', 1478944853);
INSERT INTO `dr_member_scorelog` VALUES(2, 1, 0, 5, 'login', '每日登陆', 1479116132);
INSERT INTO `dr_member_scorelog` VALUES(3, 1, 0, 5, 'login', '每日登陆', 1479735676);
INSERT INTO `dr_member_scorelog` VALUES(4, 1, 0, 5, 'login', '每日登陆', 1480918740);
INSERT INTO `dr_member_scorelog` VALUES(5, 1, 1, -5, '', '购买', 1480922018);

-- --------------------------------------------------------

--
-- 表的结构 `dr_member_setting`
--

CREATE TABLE IF NOT EXISTS `dr_member_setting` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员属性参数表';

--
-- 转存表中的数据 `dr_member_setting`
--

INSERT INTO `dr_member_setting` VALUES('member', '{"avatar":"1","complete":"1","pagesize":"","domain":{"1":""},"urlrule":"0","regfield":["username","phone"],"regverify":"0","regiptime":"","regnamerule":"","regnotallow":"","loginexpire":"86400","ucenter":"0","ucentercfg":"","field":"","mbfield":"","mergefield":"\\t\\t\\t\\t\\t<\\/div>\\r\\n\\t\\t\\t\\t<\\/div>\\r\\n<div class=\\"portlet light\\" id=\\"dr_{name}\\">\\r\\n\\t\\t\\t\\t\\t<div class=\\"portlet-title mytitle\\">\\r\\n\\t\\t\\t\\t\\t\\t{text}\\r\\n\\t\\t\\t\\t\\t<\\/div>\\r\\n<div class=\\"portlet-body\\">\\r\\n{value}","mbmergefield":"\\t\\t\\t\\t\\t<\\/div>\\r\\n\\t\\t\\t\\t<\\/div>\\r\\n<div class=\\"portlet light\\" id=\\"dr_{name}\\">\\r\\n\\t\\t\\t\\t\\t<div class=\\"portlet-title mytitle\\">\\r\\n\\t\\t\\t\\t\\t\\t{text}\\r\\n\\t\\t\\t\\t\\t<\\/div>\\r\\n<div class=\\"portlet-body\\">\\r\\n{value}"}');
INSERT INTO `dr_member_setting` VALUES('permission', 'a:10:{i:1;a:13:{s:16:\\"login_experience\\";s:1:\\"1\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:10:\\"attachsize\\";s:1:\\"0\\";}i:2;a:14:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:1:\\"5\\";}s:3:\\"3_1\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"10\\";}s:3:\\"3_2\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"10\\";}s:3:\\"3_3\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:2:\\"10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"20\\";}s:3:\\"3_4\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"3\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"30\\";}s:3:\\"4_5\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:2:\\"10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"50\\";}s:3:\\"4_6\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"70\\";}s:3:\\"4_7\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:3:\\"100\\";}s:3:\\"4_8\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:1:\\"0\\";}}');
INSERT INTO `dr_member_setting` VALUES('pay', 'a:2:{s:6:\\"tenpay\\";a:3:{s:4:\\"name\\";s:9:\\"财付通\\";s:2:\\"id\\";s:0:\\"\\";s:3:\\"key\\";s:0:\\"\\";}s:6:\\"alipay\\";a:4:{s:4:\\"name\\";s:9:\\"支付宝\\";s:8:\\"username\\";s:0:\\"\\";s:2:\\"id\\";s:0:\\"\\";s:3:\\"key\\";s:0:\\"\\";}}');
INSERT INTO `dr_member_setting` VALUES('space', 'a:9:{s:6:\\"domain\\";s:0:\\"\\";s:4:\\"edit\\";s:1:\\"1\\";s:6:\\"verify\\";s:1:\\"0\\";s:7:\\"rewrite\\";s:1:\\"0\\";s:7:\\"seojoin\\";s:1:\\"_\\";s:5:\\"title\\";s:41:\\"会员空间_FineCMS自助建站平台！\\";s:8:\\"keywords\\";s:0:\\"\\";s:11:\\"description\\";s:0:\\"\\";s:4:\\"flag\\";a:9:{i:1;a:1:{s:4:\\"name\\";s:12:\\"达人空间\\";}i:2;a:1:{s:4:\\"name\\";s:12:\\"推荐空间\\";}i:3;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:4;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:5;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:6;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:7;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:8;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:9;a:1:{s:4:\\"name\\";s:0:\\"\\";}}}');

-- --------------------------------------------------------

--
-- 表的结构 `dr_module`
--

CREATE TABLE IF NOT EXISTS `dr_module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` text COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(1) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是扩展模块',
  `sitemap` tinyint(1) unsigned DEFAULT NULL COMMENT '是否生成地图',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模块表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `dr_module`
--

INSERT INTO `dr_module` VALUES(1, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'news', 1, 0, 1, '', 0, 0);
INSERT INTO `dr_module` VALUES(2, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'down', 1, 0, 1, '', 0, 0);
INSERT INTO `dr_module` VALUES(3, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'fang', 1, 0, 1, '', 0, 0);
INSERT INTO `dr_module` VALUES(4, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'photo', 1, 0, 1, '', 0, 0);
INSERT INTO `dr_module` VALUES(5, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'special', 1, 0, 1, '', 0, 0);
INSERT INTO `dr_module` VALUES(6, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'demo', 0, 0, 1, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dr_module_form`
--

CREATE TABLE IF NOT EXISTS `dr_module_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL COMMENT '模块目录',
  `name` varchar(50) NOT NULL COMMENT '表单名称',
  `table` varchar(50) NOT NULL COMMENT '表单表名称',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '是否禁用',
  `permission` text NOT NULL COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '表单配置',
  PRIMARY KEY (`id`),
  KEY `table` (`table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表单表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dr_site`
--

CREATE TABLE IF NOT EXISTS `dr_site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='站点表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_site`
--

INSERT INTO `dr_site` VALUES(1, 'FineCMS体验网站', '', '{"SITE_CLOSE":"0","SITE_CLOSE_MSG":"\\u7f51\\u7ad9\\u5347\\u7ea7\\u4e2d....","SITE_NAME":"FineCMS\\u4f53\\u9a8c\\u7f51\\u7ad9","SITE_TIME_FORMAT":"Y-m-d H:i","SITE_LANGUAGE":"zh-cn","SITE_THEME":"default","SITE_TEMPLATE":"default","SITE_TIMEZONE":"8","SITE_REWRITE":"0","SITE_WWW":"","SITE_MOBILE":"","SITE_SEOJOIN":"_","SITE_TITLE":"FineCMS\\u4f53\\u9a8c\\u7f51\\u7ad9","SITE_KEYWORDS":"","SITE_DESCRIPTION":"","SITE_IMAGE_WATERMARK":"0","SITE_IMAGE_VRTALIGN":"top","SITE_IMAGE_HORALIGN":"left","SITE_IMAGE_VRTOFFSET":"","SITE_IMAGE_HOROFFSET":"","SITE_IMAGE_TYPE":"0","SITE_IMAGE_OVERLAY":"default.png","SITE_IMAGE_OPACITY":"","SITE_IMAGE_FONT":"default.ttf","SITE_IMAGE_COLOR":"","SITE_IMAGE_SIZE":"","SITE_IMAGE_TEXT":"","image":{"1":{"width":"","height":""},"2":{"width":"","height":""},"3":{"width":"","height":""},"4":{"width":"","height":""},"5":{"width":"","height":""},"6":{"width":"","height":""},"7":{"width":"","height":""},"8":{"width":"","height":""},"9":{"width":"","height":""}},"SITE_DOMAIN":null,"SITE_DOMAINS":"","SITE_NAVIGATOR":"\\u4e3b\\u5bfc\\u822a,\\u9996\\u9875\\u5e7b\\u706f,\\u9996\\u9875\\u5934\\u6761,\\u5e95\\u90e8\\u5bfc\\u822a,\\u53cb\\u60c5\\u94fe\\u63a5,,,,,","SITE_IMAGE_CONTENT":0}');

-- --------------------------------------------------------

--
-- 表的结构 `dr_urlrule`
--

CREATE TABLE IF NOT EXISTS `dr_urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='URL规则表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `dr_urlrule`
--

INSERT INTO `dr_urlrule` VALUES(1, 0, '', '{"share_tag":"","share_tag_page":"","share_search":"","share_search_page":"","share_list":"","share_list_page":"","share_show":"","share_show_page":""}');

-- --------------------------------------------------------

--
-- 表的结构 `dr_var`
--

CREATE TABLE IF NOT EXISTS `dr_var` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(100) NOT NULL COMMENT '变量描述名称',
  `cname` varchar(100) NOT NULL COMMENT '变量名称',
  `type` tinyint(2) NOT NULL COMMENT '变量类型',
  `value` text NOT NULL COMMENT '变量值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义变量表' AUTO_INCREMENT=1 ;

