DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-05-04 16:42:42.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-05-30 17:35:13.0');
DROP TABLE IF EXISTS `teacher_users`;
CREATE TABLE `teacher_users`(teacher_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '教师用户ID',
`teachers_name` varchar(64) comment '教师姓名',
`gender_of_teachers` varchar(64) comment '教师性别',
`age_of_teachers` varchar(64) comment '教师年龄',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (teacher_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教师用户';

DROP TABLE IF EXISTS `student_users`;
CREATE TABLE `student_users`(student_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '学生用户ID',
`student_name` varchar(64) comment '学生姓名',
`student_gender` varchar(64) comment '学生性别',
`student_age` varchar(64) comment '学生年龄',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (student_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生用户';

DROP TABLE IF EXISTS `research_group`;
CREATE TABLE `research_group`(research_group_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课题小组ID',
`group_name` varchar(64) comment '小组名称',
`group_type` varchar(64) comment '小组类型',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`group_description` text comment '小组描述',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (research_group_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课题小组';
insert into `research_group` values (1,'小组名称1','小组类型1',0,'教师姓名1','小组描述1',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `research_group` values (2,'小组名称2','小组类型2',0,'教师姓名2','小组描述2',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `research_group` values (3,'小组名称3','小组类型3',0,'教师姓名3','小组描述3',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `research_group` values (4,'小组名称4','小组类型4',0,'教师姓名4','小组描述4',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `research_group` values (5,'小组名称5','小组类型5',0,'教师姓名5','小组描述5',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `research_group` values (6,'小组名称6','小组类型6',0,'教师姓名6','小组描述6',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `research_group` values (7,'小组名称7','小组类型7',0,'教师姓名7','小组描述7',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `research_group` values (8,'小组名称8','小组类型8',0,'教师姓名8','小组描述8',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `group_students`;
CREATE TABLE `group_students`(group_students_id int(11) NOT NULL AUTO_INCREMENT COMMENT '小组学生ID',
`group_name` varchar(64) comment '小组名称',
`group_type` varchar(64) comment '小组类型',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (group_students_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '小组学生';
insert into `group_students` values (1,'小组名称1','小组类型1',0,'教师姓名1',0,'学生姓名1',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `group_students` values (2,'小组名称2','小组类型2',0,'教师姓名2',0,'学生姓名2',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `group_students` values (3,'小组名称3','小组类型3',0,'教师姓名3',0,'学生姓名3',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `group_students` values (4,'小组名称4','小组类型4',0,'教师姓名4',0,'学生姓名4',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `group_students` values (5,'小组名称5','小组类型5',0,'教师姓名5',0,'学生姓名5',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `group_students` values (6,'小组名称6','小组类型6',0,'教师姓名6',0,'学生姓名6',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `group_students` values (7,'小组名称7','小组类型7',0,'教师姓名7',0,'学生姓名7',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `group_students` values (8,'小组名称8','小组类型8',0,'教师姓名8',0,'学生姓名8',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `project_tasks`;
CREATE TABLE `project_tasks`(project_tasks_id int(11) NOT NULL AUTO_INCREMENT COMMENT '项目任务ID',
`group_name` varchar(64) comment '小组名称',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`entry_name` varchar(64) comment '项目名称',
`project_level` varchar(64) comment '项目级别',
`affiliated_college` varchar(64) comment '所属学院',
`discipline_name` varchar(64) comment '学科名称',
`task_attachment` varchar(255) comment '任务附件',
`project_status` varchar(64) comment '项目状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (project_tasks_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '项目任务';
insert into `project_tasks` values (1,'小组名称1',0,'教师姓名1',0,'学生姓名1','项目名称1','项目级别1','所属学院1','学科名称1','','项目状态1',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_tasks` values (2,'小组名称2',0,'教师姓名2',0,'学生姓名2','项目名称2','项目级别2','所属学院2','学科名称2','','项目状态2',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_tasks` values (3,'小组名称3',0,'教师姓名3',0,'学生姓名3','项目名称3','项目级别3','所属学院3','学科名称3','','项目状态3',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_tasks` values (4,'小组名称4',0,'教师姓名4',0,'学生姓名4','项目名称4','项目级别4','所属学院4','学科名称4','','项目状态4',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_tasks` values (5,'小组名称5',0,'教师姓名5',0,'学生姓名5','项目名称5','项目级别5','所属学院5','学科名称5','','项目状态5',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_tasks` values (6,'小组名称6',0,'教师姓名6',0,'学生姓名6','项目名称6','项目级别6','所属学院6','学科名称6','','项目状态6',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_tasks` values (7,'小组名称7',0,'教师姓名7',0,'学生姓名7','项目名称7','项目级别7','所属学院7','学科名称7','','项目状态7',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_tasks` values (8,'小组名称8',0,'教师姓名8',0,'学生姓名8','项目名称8','项目级别8','所属学院8','学科名称8','','项目状态8',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `project_approval`;
CREATE TABLE `project_approval`(project_approval_id int(11) NOT NULL AUTO_INCREMENT COMMENT '立项审批ID',
`group_name` varchar(64) comment '小组名称',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`entry_name` varchar(64) comment '项目名称',
`project_level` varchar(64) comment '项目级别',
`affiliated_college` varchar(64) comment '所属学院',
`discipline_name` varchar(64) comment '学科名称',
`project_approval_attachment` varchar(255) comment '立项附件',
`project_approval_time` date comment '立项时间',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (project_approval_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '立项审批';
insert into `project_approval` values (1,'小组名称1',0,'教师姓名1',0,'学生姓名1','项目名称1','项目级别1','所属学院1','学科名称1','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_approval` values (2,'小组名称2',0,'教师姓名2',0,'学生姓名2','项目名称2','项目级别2','所属学院2','学科名称2','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_approval` values (3,'小组名称3',0,'教师姓名3',0,'学生姓名3','项目名称3','项目级别3','所属学院3','学科名称3','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_approval` values (4,'小组名称4',0,'教师姓名4',0,'学生姓名4','项目名称4','项目级别4','所属学院4','学科名称4','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_approval` values (5,'小组名称5',0,'教师姓名5',0,'学生姓名5','项目名称5','项目级别5','所属学院5','学科名称5','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_approval` values (6,'小组名称6',0,'教师姓名6',0,'学生姓名6','项目名称6','项目级别6','所属学院6','学科名称6','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_approval` values (7,'小组名称7',0,'教师姓名7',0,'学生姓名7','项目名称7','项目级别7','所属学院7','学科名称7','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_approval` values (8,'小组名称8',0,'教师姓名8',0,'学生姓名8','项目名称8','项目级别8','所属学院8','学科名称8','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `project_proposal_defense`;
CREATE TABLE `project_proposal_defense`(project_proposal_defense_id int(11) NOT NULL AUTO_INCREMENT COMMENT '立项答辩ID',
`group_name` varchar(64) comment '小组名称',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`entry_name` varchar(64) comment '项目名称',
`project_level` varchar(64) comment '项目级别',
`affiliated_college` varchar(64) comment '所属学院',
`discipline_name` varchar(64) comment '学科名称',
`defense_attachment` varchar(255) comment '答辩附件',
`defense_time` date comment '答辩时间',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (project_proposal_defense_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '立项答辩';
insert into `project_proposal_defense` values (1,'小组名称1',0,'教师姓名1',0,'学生姓名1','项目名称1','项目级别1','所属学院1','学科名称1','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_proposal_defense` values (2,'小组名称2',0,'教师姓名2',0,'学生姓名2','项目名称2','项目级别2','所属学院2','学科名称2','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_proposal_defense` values (3,'小组名称3',0,'教师姓名3',0,'学生姓名3','项目名称3','项目级别3','所属学院3','学科名称3','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_proposal_defense` values (4,'小组名称4',0,'教师姓名4',0,'学生姓名4','项目名称4','项目级别4','所属学院4','学科名称4','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_proposal_defense` values (5,'小组名称5',0,'教师姓名5',0,'学生姓名5','项目名称5','项目级别5','所属学院5','学科名称5','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_proposal_defense` values (6,'小组名称6',0,'教师姓名6',0,'学生姓名6','项目名称6','项目级别6','所属学院6','学科名称6','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_proposal_defense` values (7,'小组名称7',0,'教师姓名7',0,'学生姓名7','项目名称7','项目级别7','所属学院7','学科名称7','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `project_proposal_defense` values (8,'小组名称8',0,'教师姓名8',0,'学生姓名8','项目名称8','项目级别8','所属学院8','学科名称8','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `intermediate_testing`;
CREATE TABLE `intermediate_testing`(intermediate_testing_id int(11) NOT NULL AUTO_INCREMENT COMMENT '中期检测ID',
`group_name` varchar(64) comment '小组名称',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`entry_name` varchar(64) comment '项目名称',
`project_level` varchar(64) comment '项目级别',
`affiliated_college` varchar(64) comment '所属学院',
`discipline_name` varchar(64) comment '学科名称',
`testing_attachments` varchar(255) comment '检测附件',
`detection_time` date comment '检测时间',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (intermediate_testing_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '中期检测';
insert into `intermediate_testing` values (1,'小组名称1',0,'教师姓名1',0,'学生姓名1','项目名称1','项目级别1','所属学院1','学科名称1','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `intermediate_testing` values (2,'小组名称2',0,'教师姓名2',0,'学生姓名2','项目名称2','项目级别2','所属学院2','学科名称2','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `intermediate_testing` values (3,'小组名称3',0,'教师姓名3',0,'学生姓名3','项目名称3','项目级别3','所属学院3','学科名称3','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `intermediate_testing` values (4,'小组名称4',0,'教师姓名4',0,'学生姓名4','项目名称4','项目级别4','所属学院4','学科名称4','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `intermediate_testing` values (5,'小组名称5',0,'教师姓名5',0,'学生姓名5','项目名称5','项目级别5','所属学院5','学科名称5','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `intermediate_testing` values (6,'小组名称6',0,'教师姓名6',0,'学生姓名6','项目名称6','项目级别6','所属学院6','学科名称6','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `intermediate_testing` values (7,'小组名称7',0,'教师姓名7',0,'学生姓名7','项目名称7','项目级别7','所属学院7','学科名称7','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `intermediate_testing` values (8,'小组名称8',0,'教师姓名8',0,'学生姓名8','项目名称8','项目级别8','所属学院8','学科名称8','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `acceptance_inspection`;
CREATE TABLE `acceptance_inspection`(acceptance_inspection_id int(11) NOT NULL AUTO_INCREMENT COMMENT '验收检验ID',
`group_name` varchar(64) comment '小组名称',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`entry_name` varchar(64) comment '项目名称',
`project_level` varchar(64) comment '项目级别',
`affiliated_college` varchar(64) comment '所属学院',
`discipline_name` varchar(64) comment '学科名称',
`inspection_attachments` varchar(255) comment '检验附件',
`inspection_time` date comment '检验时间',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (acceptance_inspection_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '验收检验';
insert into `acceptance_inspection` values (1,'小组名称1',0,'教师姓名1',0,'学生姓名1','项目名称1','项目级别1','所属学院1','学科名称1','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `acceptance_inspection` values (2,'小组名称2',0,'教师姓名2',0,'学生姓名2','项目名称2','项目级别2','所属学院2','学科名称2','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `acceptance_inspection` values (3,'小组名称3',0,'教师姓名3',0,'学生姓名3','项目名称3','项目级别3','所属学院3','学科名称3','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `acceptance_inspection` values (4,'小组名称4',0,'教师姓名4',0,'学生姓名4','项目名称4','项目级别4','所属学院4','学科名称4','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `acceptance_inspection` values (5,'小组名称5',0,'教师姓名5',0,'学生姓名5','项目名称5','项目级别5','所属学院5','学科名称5','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `acceptance_inspection` values (6,'小组名称6',0,'教师姓名6',0,'学生姓名6','项目名称6','项目级别6','所属学院6','学科名称6','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `acceptance_inspection` values (7,'小组名称7',0,'教师姓名7',0,'学生姓名7','项目名称7','项目级别7','所属学院7','学科名称7','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `acceptance_inspection` values (8,'小组名称8',0,'教师姓名8',0,'学生姓名8','项目名称8','项目级别8','所属学院8','学科名称8','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `closing_approval`;
CREATE TABLE `closing_approval`(closing_approval_id int(11) NOT NULL AUTO_INCREMENT COMMENT '结项审批ID',
`group_name` varchar(64) comment '小组名称',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`entry_name` varchar(64) comment '项目名称',
`project_level` varchar(64) comment '项目级别',
`affiliated_college` varchar(64) comment '所属学院',
`discipline_name` varchar(64) comment '学科名称',
`closing_attachment` varchar(255) comment '结项附件',
`closing_time` date comment '结项时间',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (closing_approval_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '结项审批';
insert into `closing_approval` values (1,'小组名称1',0,'教师姓名1',0,'学生姓名1','项目名称1','项目级别1','所属学院1','学科名称1','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `closing_approval` values (2,'小组名称2',0,'教师姓名2',0,'学生姓名2','项目名称2','项目级别2','所属学院2','学科名称2','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `closing_approval` values (3,'小组名称3',0,'教师姓名3',0,'学生姓名3','项目名称3','项目级别3','所属学院3','学科名称3','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `closing_approval` values (4,'小组名称4',0,'教师姓名4',0,'学生姓名4','项目名称4','项目级别4','所属学院4','学科名称4','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `closing_approval` values (5,'小组名称5',0,'教师姓名5',0,'学生姓名5','项目名称5','项目级别5','所属学院5','学科名称5','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `closing_approval` values (6,'小组名称6',0,'教师姓名6',0,'学生姓名6','项目名称6','项目级别6','所属学院6','学科名称6','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `closing_approval` values (7,'小组名称7',0,'教师姓名7',0,'学生姓名7','项目名称7','项目级别7','所属学院7','学科名称7','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `closing_approval` values (8,'小组名称8',0,'教师姓名8',0,'学生姓名8','项目名称8','项目级别8','所属学院8','学科名称8','','2023-05-06','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `achievement_certification`;
CREATE TABLE `achievement_certification`(achievement_certification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '成果认证ID',
`group_name` varchar(64) comment '小组名称',
`group_type` varchar(64) comment '小组类型',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`result_name` varchar(64) comment '成果名称',
`result_type` varchar(64) comment '成果类型',
`achievement_attachment` varchar(255) comment '成果附件',
`certification_time` date comment '认证时间',
`content_of_achievements` text comment '成果内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (achievement_certification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '成果认证';
insert into `achievement_certification` values (1,'小组名称1','小组类型1',0,'教师姓名1',0,'学生姓名1','成果名称1','成果类型1','','2023-05-06','成果内容1','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `achievement_certification` values (2,'小组名称2','小组类型2',0,'教师姓名2',0,'学生姓名2','成果名称2','成果类型2','','2023-05-06','成果内容2','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `achievement_certification` values (3,'小组名称3','小组类型3',0,'教师姓名3',0,'学生姓名3','成果名称3','成果类型3','','2023-05-06','成果内容3','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `achievement_certification` values (4,'小组名称4','小组类型4',0,'教师姓名4',0,'学生姓名4','成果名称4','成果类型4','','2023-05-06','成果内容4','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `achievement_certification` values (5,'小组名称5','小组类型5',0,'教师姓名5',0,'学生姓名5','成果名称5','成果类型5','','2023-05-06','成果内容5','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `achievement_certification` values (6,'小组名称6','小组类型6',0,'教师姓名6',0,'学生姓名6','成果名称6','成果类型6','','2023-05-06','成果内容6','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `achievement_certification` values (7,'小组名称7','小组类型7',0,'教师姓名7',0,'学生姓名7','成果名称7','成果类型7','','2023-05-06','成果内容7','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `achievement_certification` values (8,'小组名称8','小组类型8',0,'教师姓名8',0,'学生姓名8','成果名称8','成果类型8','','2023-05-06','成果内容8','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `paper_proposal`;
CREATE TABLE `paper_proposal`(paper_proposal_id int(11) NOT NULL AUTO_INCREMENT COMMENT '论文开题ID',
`group_name` varchar(64) comment '小组名称',
`group_type` varchar(64) comment '小组类型',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`paper_title` varchar(64) comment '论文名称',
`paper_type` varchar(64) comment '论文类型',
`paper_attachment` varchar(255) comment '论文附件',
`question_opening_time` date comment '开题时间',
`remarks` text comment '备注信息',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (paper_proposal_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '论文开题';
insert into `paper_proposal` values (1,'小组名称1','小组类型1',0,'教师姓名1',0,'学生姓名1','论文名称1','论文类型1','','2023-05-06','备注信息1','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_proposal` values (2,'小组名称2','小组类型2',0,'教师姓名2',0,'学生姓名2','论文名称2','论文类型2','','2023-05-06','备注信息2','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_proposal` values (3,'小组名称3','小组类型3',0,'教师姓名3',0,'学生姓名3','论文名称3','论文类型3','','2023-05-06','备注信息3','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_proposal` values (4,'小组名称4','小组类型4',0,'教师姓名4',0,'学生姓名4','论文名称4','论文类型4','','2023-05-06','备注信息4','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_proposal` values (5,'小组名称5','小组类型5',0,'教师姓名5',0,'学生姓名5','论文名称5','论文类型5','','2023-05-06','备注信息5','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_proposal` values (6,'小组名称6','小组类型6',0,'教师姓名6',0,'学生姓名6','论文名称6','论文类型6','','2023-05-06','备注信息6','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_proposal` values (7,'小组名称7','小组类型7',0,'教师姓名7',0,'学生姓名7','论文名称7','论文类型7','','2023-05-06','备注信息7','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_proposal` values (8,'小组名称8','小组类型8',0,'教师姓名8',0,'学生姓名8','论文名称8','论文类型8','','2023-05-06','备注信息8','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `paper_verification`;
CREATE TABLE `paper_verification`(paper_verification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '论文检验ID',
`group_name` varchar(64) comment '小组名称',
`group_type` varchar(64) comment '小组类型',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`paper_title` varchar(64) comment '论文名称',
`paper_type` varchar(64) comment '论文类型',
`inspection_attachments` varchar(255) comment '检验附件',
`inspection_time` date comment '检验时间',
`inspection_remarks` text comment '检验备注',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (paper_verification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '论文检验';
insert into `paper_verification` values (1,'小组名称1','小组类型1',0,'教师姓名1',0,'学生姓名1','论文名称1','论文类型1','','2023-05-06','检验备注1','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_verification` values (2,'小组名称2','小组类型2',0,'教师姓名2',0,'学生姓名2','论文名称2','论文类型2','','2023-05-06','检验备注2','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_verification` values (3,'小组名称3','小组类型3',0,'教师姓名3',0,'学生姓名3','论文名称3','论文类型3','','2023-05-06','检验备注3','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_verification` values (4,'小组名称4','小组类型4',0,'教师姓名4',0,'学生姓名4','论文名称4','论文类型4','','2023-05-06','检验备注4','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_verification` values (5,'小组名称5','小组类型5',0,'教师姓名5',0,'学生姓名5','论文名称5','论文类型5','','2023-05-06','检验备注5','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_verification` values (6,'小组名称6','小组类型6',0,'教师姓名6',0,'学生姓名6','论文名称6','论文类型6','','2023-05-06','检验备注6','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_verification` values (7,'小组名称7','小组类型7',0,'教师姓名7',0,'学生姓名7','论文名称7','论文类型7','','2023-05-06','检验备注7','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `paper_verification` values (8,'小组名称8','小组类型8',0,'教师姓名8',0,'学生姓名8','论文名称8','论文类型8','','2023-05-06','检验备注8','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `final_acceptance`;
CREATE TABLE `final_acceptance`(final_acceptance_id int(11) NOT NULL AUTO_INCREMENT COMMENT '结题验收ID',
`group_name` varchar(64) comment '小组名称',
`group_type` varchar(64) comment '小组类型',
`group_teacher` int(11) DEFAULT 0 comment '小组教师',
`teachers_name` varchar(64) comment '教师姓名',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`paper_title` varchar(64) comment '论文名称',
`paper_type` varchar(64) comment '论文类型',
`closing_attachment` varchar(255) comment '结题附件',
`closing_time` date comment '结题时间',
`closing_information` text comment '结题信息',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (final_acceptance_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '结题验收';
insert into `final_acceptance` values (1,'小组名称1','小组类型1',0,'教师姓名1',0,'学生姓名1','论文名称1','论文类型1','','2023-05-06','结题信息1','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `final_acceptance` values (2,'小组名称2','小组类型2',0,'教师姓名2',0,'学生姓名2','论文名称2','论文类型2','','2023-05-06','结题信息2','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `final_acceptance` values (3,'小组名称3','小组类型3',0,'教师姓名3',0,'学生姓名3','论文名称3','论文类型3','','2023-05-06','结题信息3','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `final_acceptance` values (4,'小组名称4','小组类型4',0,'教师姓名4',0,'学生姓名4','论文名称4','论文类型4','','2023-05-06','结题信息4','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `final_acceptance` values (5,'小组名称5','小组类型5',0,'教师姓名5',0,'学生姓名5','论文名称5','论文类型5','','2023-05-06','结题信息5','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `final_acceptance` values (6,'小组名称6','小组类型6',0,'教师姓名6',0,'学生姓名6','论文名称6','论文类型6','','2023-05-06','结题信息6','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `final_acceptance` values (7,'小组名称7','小组类型7',0,'教师姓名7',0,'学生姓名7','论文名称7','论文类型7','','2023-05-06','结题信息7','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');
insert into `final_acceptance` values (8,'小组名称8','小组类型8',0,'教师姓名8',0,'学生姓名8','论文名称8','论文类型8','','2023-05-06','结题信息8','未审核',0,'2023-05-06 22:31:48','2023-05-06 22:31:48');

DROP TABLE IF EXISTS `experimental_data`;
CREATE TABLE `experimental_data`(experimental_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '实验数据ID',
`experiment_name` varchar(64) comment '实验名称',
`experiment_type` varchar(64) comment '实验类型',
`experimental_time` date comment '实验时间',
`experimental_attachments` varchar(255) comment '实验附件',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`experimental_description` text comment '实验描述',
`experimental_content` text comment '实验内容',
`teachers_comments` text comment '教师评语',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (experimental_data_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '实验数据';
insert into `experimental_data` values (1,'实验名称1','实验类型1','2023-05-06','',0,'实验描述1','实验内容1','教师评语1',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experimental_data` values (2,'实验名称2','实验类型2','2023-05-06','',0,'实验描述2','实验内容2','教师评语2',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experimental_data` values (3,'实验名称3','实验类型3','2023-05-06','',0,'实验描述3','实验内容3','教师评语3',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experimental_data` values (4,'实验名称4','实验类型4','2023-05-06','',0,'实验描述4','实验内容4','教师评语4',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experimental_data` values (5,'实验名称5','实验类型5','2023-05-06','',0,'实验描述5','实验内容5','教师评语5',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experimental_data` values (6,'实验名称6','实验类型6','2023-05-06','',0,'实验描述6','实验内容6','教师评语6',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experimental_data` values (7,'实验名称7','实验类型7','2023-05-06','',0,'实验描述7','实验内容7','教师评语7',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experimental_data` values (8,'实验名称8','实验类型8','2023-05-06','',0,'实验描述8','实验内容8','教师评语8',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');

DROP TABLE IF EXISTS `experiment_type`;
CREATE TABLE `experiment_type`(experiment_type_id int(11) NOT NULL AUTO_INCREMENT COMMENT '实验类型ID',
`experiment_type` varchar(64) comment '实验类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (experiment_type_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '实验类型';
insert into `experiment_type` values (1,'实验类型1',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experiment_type` values (2,'实验类型2',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experiment_type` values (3,'实验类型3',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experiment_type` values (4,'实验类型4',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experiment_type` values (5,'实验类型5',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experiment_type` values (6,'实验类型6',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experiment_type` values (7,'实验类型7',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `experiment_type` values (8,'实验类型8',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');

DROP TABLE IF EXISTS `paper_type`;
CREATE TABLE `paper_type`(paper_type_id int(11) NOT NULL AUTO_INCREMENT COMMENT '论文类型ID',
`paper_type` varchar(64) comment '论文类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (paper_type_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '论文类型';
insert into `paper_type` values (1,'论文类型1',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `paper_type` values (2,'论文类型2',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `paper_type` values (3,'论文类型3',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `paper_type` values (4,'论文类型4',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `paper_type` values (5,'论文类型5',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `paper_type` values (6,'论文类型6',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `paper_type` values (7,'论文类型7',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');
insert into `paper_type` values (8,'论文类型8',0,'2023-05-06 22:31:49','2023-05-06 22:31:49');

insert into `auth` values ('1','管理员','教师用户','teacher_users','教师用户','/teacher_users/table','','_blank','1','1','1','1','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('2','管理员','教师用户','teacher_users','教师用户详情','/teacher_users/view','','_blank','1','1','1','1','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('3','管理员','学生用户','student_users','学生用户','/student_users/table','','_blank','1','1','1','1','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('4','管理员','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','1','1','1','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('5','管理员','课题小组','research_group','课题小组','/research_group/table','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('6','管理员','课题小组','research_group','课题小组详情','/research_group/view','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('7','管理员','小组学生','group_students','小组学生','/group_students/table','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('8','管理员','小组学生','group_students','小组学生详情','/group_students/view','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('9','管理员','项目任务','project_tasks','项目任务','/project_tasks/table','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('10','管理员','项目任务','project_tasks','项目任务详情','/project_tasks/view','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('11','管理员','立项审批','project_approval','立项审批','/project_approval/table','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('12','管理员','立项审批','project_approval','立项审批详情','/project_approval/view','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('13','管理员','立项答辩','project_proposal_defense','立项答辩','/project_proposal_defense/table','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('14','管理员','立项答辩','project_proposal_defense','立项答辩详情','/project_proposal_defense/view','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('15','管理员','中期检测','intermediate_testing','中期检测','/intermediate_testing/table','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('16','管理员','中期检测','intermediate_testing','中期检测详情','/intermediate_testing/view','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('17','管理员','验收检验','acceptance_inspection','验收检验','/acceptance_inspection/table','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('18','管理员','验收检验','acceptance_inspection','验收检验详情','/acceptance_inspection/view','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('19','管理员','结项审批','closing_approval','结项审批','/closing_approval/table','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('20','管理员','结项审批','closing_approval','结项审批详情','/closing_approval/view','','_blank','1','1','1','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('21','管理员','成果认证','achievement_certification','成果认证','/achievement_certification/table','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('22','管理员','成果认证','achievement_certification','成果认证详情','/achievement_certification/view','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('23','管理员','论文开题','paper_proposal','论文开题','/paper_proposal/table','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('24','管理员','论文开题','paper_proposal','论文开题详情','/paper_proposal/view','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('25','管理员','论文检验','paper_verification','论文检验','/paper_verification/table','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('26','管理员','论文检验','paper_verification','论文检验详情','/paper_verification/view','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('27','管理员','结题验收','final_acceptance','结题验收','/final_acceptance/table','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('28','管理员','结题验收','final_acceptance','结题验收详情','/final_acceptance/view','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('29','管理员','实验数据','experimental_data','实验数据','/experimental_data/table','','_blank','1','1','1','1','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('30','管理员','实验数据','experimental_data','实验数据详情','/experimental_data/view','','_blank','1','1','1','1','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('31','管理员','实验类型','experiment_type','实验类型','/experiment_type/table','','_blank','1','1','1','1','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('32','管理员','实验类型','experiment_type','实验类型详情','/experiment_type/view','','_blank','1','1','1','1','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('33','管理员','论文类型','paper_type','论文类型','/paper_type/table','','_blank','1','1','1','1','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('34','管理员','论文类型','paper_type','论文类型详情','/paper_type/view','','_blank','1','1','1','1','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('35','管理员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('36','管理员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('37','管理员','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('38','管理员','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('39','游客','教师用户','teacher_users','教师用户','/teacher_users/table','','_blank','1','0','0','0','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('40','游客','教师用户','teacher_users','教师用户详情','/teacher_users/view','','_blank','1','0','0','0','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('41','游客','学生用户','student_users','学生用户','/student_users/table','','_blank','1','0','0','0','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('42','游客','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','0','0','0','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('43','游客','课题小组','research_group','课题小组','/research_group/table','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('44','游客','课题小组','research_group','课题小组详情','/research_group/view','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('45','游客','小组学生','group_students','小组学生','/group_students/table','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('46','游客','小组学生','group_students','小组学生详情','/group_students/view','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('47','游客','项目任务','project_tasks','项目任务','/project_tasks/table','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('48','游客','项目任务','project_tasks','项目任务详情','/project_tasks/view','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('49','游客','立项审批','project_approval','立项审批','/project_approval/table','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('50','游客','立项审批','project_approval','立项审批详情','/project_approval/view','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('51','游客','立项答辩','project_proposal_defense','立项答辩','/project_proposal_defense/table','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('52','游客','立项答辩','project_proposal_defense','立项答辩详情','/project_proposal_defense/view','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('53','游客','中期检测','intermediate_testing','中期检测','/intermediate_testing/table','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('54','游客','中期检测','intermediate_testing','中期检测详情','/intermediate_testing/view','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('55','游客','验收检验','acceptance_inspection','验收检验','/acceptance_inspection/table','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('56','游客','验收检验','acceptance_inspection','验收检验详情','/acceptance_inspection/view','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('57','游客','结项审批','closing_approval','结项审批','/closing_approval/table','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('58','游客','结项审批','closing_approval','结项审批详情','/closing_approval/view','','_blank','0','0','0','0','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('59','游客','成果认证','achievement_certification','成果认证','/achievement_certification/table','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('60','游客','成果认证','achievement_certification','成果认证详情','/achievement_certification/view','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('61','游客','论文开题','paper_proposal','论文开题','/paper_proposal/table','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('62','游客','论文开题','paper_proposal','论文开题详情','/paper_proposal/view','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('63','游客','论文检验','paper_verification','论文检验','/paper_verification/table','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('64','游客','论文检验','paper_verification','论文检验详情','/paper_verification/view','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('65','游客','结题验收','final_acceptance','结题验收','/final_acceptance/table','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('66','游客','结题验收','final_acceptance','结题验收详情','/final_acceptance/view','','_blank','0','0','0','0','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('67','游客','实验数据','experimental_data','实验数据','/experimental_data/table','','_blank','0','0','0','0','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('68','游客','实验数据','experimental_data','实验数据详情','/experimental_data/view','','_blank','0','0','0','0','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('69','游客','实验类型','experiment_type','实验类型','/experiment_type/table','','_blank','0','0','0','0','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('70','游客','实验类型','experiment_type','实验类型详情','/experiment_type/view','','_blank','0','0','0','0','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('71','游客','论文类型','paper_type','论文类型','/paper_type/table','','_blank','0','0','0','0','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('72','游客','论文类型','paper_type','论文类型详情','/paper_type/view','','_blank','0','0','0','0','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('73','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('74','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('75','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('76','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('77','教师用户','教师用户','teacher_users','教师用户','/teacher_users/table','','_blank','0','0','0','0','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('78','教师用户','教师用户','teacher_users','教师用户详情','/teacher_users/view','','_blank','0','0','0','0','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('79','教师用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('80','教师用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('81','教师用户','课题小组','research_group','课题小组','/research_group/table','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('82','教师用户','课题小组','research_group','课题小组详情','/research_group/view','','_blank','1','1','1','1','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('83','教师用户','小组学生','group_students','小组学生','/group_students/table','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('84','教师用户','小组学生','group_students','小组学生详情','/group_students/view','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('85','教师用户','项目任务','project_tasks','项目任务','/project_tasks/table','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('86','教师用户','项目任务','project_tasks','项目任务详情','/project_tasks/view','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('87','教师用户','立项审批','project_approval','立项审批','/project_approval/table','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('88','教师用户','立项审批','project_approval','立项审批详情','/project_approval/view','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('89','教师用户','立项答辩','project_proposal_defense','立项答辩','/project_proposal_defense/table','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('90','教师用户','立项答辩','project_proposal_defense','立项答辩详情','/project_proposal_defense/view','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('91','教师用户','中期检测','intermediate_testing','中期检测','/intermediate_testing/table','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('92','教师用户','中期检测','intermediate_testing','中期检测详情','/intermediate_testing/view','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('93','教师用户','验收检验','acceptance_inspection','验收检验','/acceptance_inspection/table','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('94','教师用户','验收检验','acceptance_inspection','验收检验详情','/acceptance_inspection/view','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('95','教师用户','结项审批','closing_approval','结项审批','/closing_approval/table','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('96','教师用户','结项审批','closing_approval','结项审批详情','/closing_approval/view','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('97','教师用户','成果认证','achievement_certification','成果认证','/achievement_certification/table','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('98','教师用户','成果认证','achievement_certification','成果认证详情','/achievement_certification/view','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('99','教师用户','论文开题','paper_proposal','论文开题','/paper_proposal/table','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('100','教师用户','论文开题','paper_proposal','论文开题详情','/paper_proposal/view','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('101','教师用户','论文检验','paper_verification','论文检验','/paper_verification/table','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('102','教师用户','论文检验','paper_verification','论文检验详情','/paper_verification/view','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('103','教师用户','结题验收','final_acceptance','结题验收','/final_acceptance/table','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{"examine":true}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('104','教师用户','结题验收','final_acceptance','结题验收详情','/final_acceptance/view','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('105','教师用户','实验数据','experimental_data','实验数据','/experimental_data/table','','_blank','0','0','1','1','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('106','教师用户','实验数据','experimental_data','实验数据详情','/experimental_data/view','','_blank','0','0','1','1','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('107','教师用户','实验类型','experiment_type','实验类型','/experiment_type/table','','_blank','0','0','0','0','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('108','教师用户','实验类型','experiment_type','实验类型详情','/experiment_type/view','','_blank','0','0','0','0','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('109','教师用户','论文类型','paper_type','论文类型','/paper_type/table','','_blank','0','0','0','0','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('110','教师用户','论文类型','paper_type','论文类型详情','/paper_type/view','','_blank','0','0','0','0','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('111','教师用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('112','教师用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('113','教师用户','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('114','教师用户','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('115','学生用户','教师用户','teacher_users','教师用户','/teacher_users/table','','_blank','0','0','0','0','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('116','学生用户','教师用户','teacher_users','教师用户详情','/teacher_users/view','','_blank','0','0','0','0','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers','teachers_name,gender_of_teachers,age_of_teachers',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('117','学生用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('118','学生用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_name,student_gender,student_age','student_name,student_gender,student_age','student_name,student_gender,student_age',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('119','学生用户','课题小组','research_group','课题小组','/research_group/table','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('120','学生用户','课题小组','research_group','课题小组详情','/research_group/view','','_blank','0','0','0','1','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description','group_name,group_type,group_teacher,teachers_name,group_description',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('121','学生用户','小组学生','group_students','小组学生','/group_students/table','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('122','学生用户','小组学生','group_students','小组学生详情','/group_students/view','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name','group_name,group_type,group_teacher,teachers_name,student_users,student_name',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('123','学生用户','项目任务','project_tasks','项目任务','/project_tasks/table','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('124','学生用户','项目任务','project_tasks','项目任务详情','/project_tasks/view','','_blank','0','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,task_attachment,project_status',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('125','学生用户','立项审批','project_approval','立项审批','/project_approval/table','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('126','学生用户','立项审批','project_approval','立项审批详情','/project_approval/view','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,project_approval_attachment,project_approval_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('127','学生用户','立项答辩','project_proposal_defense','立项答辩','/project_proposal_defense/table','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('128','学生用户','立项答辩','project_proposal_defense','立项答辩详情','/project_proposal_defense/view','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,defense_attachment,defense_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('129','学生用户','中期检测','intermediate_testing','中期检测','/intermediate_testing/table','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('130','学生用户','中期检测','intermediate_testing','中期检测详情','/intermediate_testing/view','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,testing_attachments,detection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('131','学生用户','验收检验','acceptance_inspection','验收检验','/acceptance_inspection/table','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('132','学生用户','验收检验','acceptance_inspection','验收检验详情','/acceptance_inspection/view','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,inspection_attachments,inspection_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('133','学生用户','结项审批','closing_approval','结项审批','/closing_approval/table','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('134','学生用户','结项审批','closing_approval','结项审批详情','/closing_approval/view','','_blank','1','0','0','1','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time','group_name,group_teacher,teachers_name,student_users,student_name,entry_name,project_level,affiliated_college,discipline_name,closing_attachment,closing_time',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('135','学生用户','成果认证','achievement_certification','成果认证','/achievement_certification/table','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('136','学生用户','成果认证','achievement_certification','成果认证详情','/achievement_certification/view','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements','group_name,group_type,group_teacher,teachers_name,student_users,student_name,result_name,result_type,achievement_attachment,certification_time,content_of_achievements',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('137','学生用户','论文开题','paper_proposal','论文开题','/paper_proposal/table','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('138','学生用户','论文开题','paper_proposal','论文开题详情','/paper_proposal/view','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,paper_attachment,question_opening_time,remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('139','学生用户','论文检验','paper_verification','论文检验','/paper_verification/table','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('140','学生用户','论文检验','paper_verification','论文检验详情','/paper_verification/view','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,inspection_attachments,inspection_time,inspection_remarks',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('141','学生用户','结题验收','final_acceptance','结题验收','/final_acceptance/table','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{"examine":false}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('142','学生用户','结题验收','final_acceptance','结题验收详情','/final_acceptance/view','','_blank','1','0','0','1','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information','group_name,group_type,group_teacher,teachers_name,student_users,student_name,paper_title,paper_type,closing_attachment,closing_time,closing_information',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('143','学生用户','实验数据','experimental_data','实验数据','/experimental_data/table','','_blank','1','0','0','1','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('144','学生用户','实验数据','experimental_data','实验数据详情','/experimental_data/view','','_blank','1','0','0','1','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments','experiment_name,experiment_type,experimental_time,experimental_attachments,student_users,experimental_description,experimental_content,teachers_comments',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('145','学生用户','实验类型','experiment_type','实验类型','/experiment_type/table','','_blank','0','0','0','0','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('146','学生用户','实验类型','experiment_type','实验类型详情','/experiment_type/view','','_blank','0','0','0','0','experiment_type','experiment_type','experiment_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('147','学生用户','论文类型','paper_type','论文类型','/paper_type/table','','_blank','0','0','0','0','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('148','学生用户','论文类型','paper_type','论文类型详情','/paper_type/view','','_blank','0','0','0','0','paper_type','paper_type','paper_type',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('149','学生用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('150','学生用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('151','学生用户','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `auth` values ('152','学生用户','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `user_group` values ('3','100','教师用户',null,'teacher_users','teacher_users_id','0','1','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
insert into `user_group` values ('4','100','学生用户',null,'student_users','student_users_id','0','1','2023-05-06 22:31:49.0','2023-05-06 22:31:49.0');
