-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-04-03 10:52:31
-- 服务器版本： 5.5.53
-- PHP 版本： 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `shop`
--

-- --------------------------------------------------------

--
-- 表的结构 `sp_addresss`
--

CREATE TABLE `sp_addresss` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '收货人手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `status` int(1) NOT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收货地址';

--
-- 转存表中的数据 `sp_addresss`
--

INSERT INTO `sp_addresss` (`id`, `user_id`, `name`, `phone`, `address`, `status`, `create_time`) VALUES
(2, 1, '收货地址', '17630968036', '收货地址收货地址收货地址收货地址', 1, '2019-03-20 16:39:57');

-- --------------------------------------------------------

--
-- 表的结构 `sp_admins`
--

CREATE TABLE `sp_admins` (
  `id` int(5) NOT NULL,
  `username` varchar(10) NOT NULL COMMENT '店铺管理员姓名',
  `password` varchar(100) NOT NULL COMMENT '店铺管理员密码',
  `name` varchar(50) NOT NULL COMMENT '店铺名称',
  `img` varchar(200) DEFAULT NULL COMMENT '店铺头像',
  `phone` varchar(12) DEFAULT NULL COMMENT '店铺联系手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '店铺联系地址',
  `content` text COMMENT '店铺简介',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型1管理员 0普通店铺',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态1启用 2禁用',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺/后台管理员';

--
-- 转存表中的数据 `sp_admins`
--

INSERT INTO `sp_admins` (`id`, `username`, `password`, `name`, `img`, `phone`, `address`, `content`, `type`, `status`, `create_time`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin店铺1', '/index/img/slider/home1-slider1.jpg', '17630968036', 'admin店铺admin店铺admin店铺', '<p>admin店铺admin店铺admin店铺admin店铺1123</p>', 1, 1, '2019-03-14 00:00:00'),
(2, '123456', 'e10adc3949ba59abbe56e057f20f883e', '店铺1店', '/index/img/slider/home1-slider2.jpg', '17612345698', '河南省, 南阳市, 内乡县, , ', '<p><span style=\"font-size: 1px;\">河南省, 南阳市, 内乡县, ,&nbsp;</span><span style=\"font-size: 1px;\">河南省, 南阳市, 内乡县, ,&nbsp;</span><span style=\"font-size: 1px;\">河南省, 南阳市, 内乡县, ,&nbsp;</span><span style=\"font-size: 1px;\">河南省, 南阳市, 内乡县, , 1</span><br></p>', 0, 1, '2019-03-15 20:57:54');

-- --------------------------------------------------------

--
-- 表的结构 `sp_blogs`
--

CREATE TABLE `sp_blogs` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '资讯标题',
  `content` text NOT NULL COMMENT '资讯内容',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '资讯状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯';

--
-- 转存表中的数据 `sp_blogs`
--

INSERT INTO `sp_blogs` (`id`, `title`, `content`, `status`, `create_time`) VALUES
(2, '佳人购上线了', '<p><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><br></p>', 1, '2019-03-15 19:57:18'),
(3, '佳人购上线了', '<p><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><span style=\"font-size: 1px;\">佳人购上线了</span><br></p>', 1, '2019-03-15 19:57:18');

-- --------------------------------------------------------

--
-- 表的结构 `sp_comments`
--

CREATE TABLE `sp_comments` (
  `id` int(8) NOT NULL,
  `user_id` int(5) NOT NULL COMMENT '评论用户id',
  `good_id` int(5) NOT NULL COMMENT '评论商品id',
  `grade` int(1) DEFAULT '5' COMMENT '评价星数',
  `content` text COMMENT '评论内容',
  `status` int(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

--
-- 转存表中的数据 `sp_comments`
--

INSERT INTO `sp_comments` (`id`, `user_id`, `good_id`, `grade`, `content`, `status`, `create_time`) VALUES
(1, 1, 2, 2, '阿斯顿发生', 1, '2019-03-16 21:01:58'),
(2, 1, 2, 4, 'dfsdfd', 1, '2019-03-20 15:43:57'),
(3, 1, 2, 5, '<p><b>qweqwwe</b></p>', 1, '2019-03-20 17:45:31');

-- --------------------------------------------------------

--
-- 表的结构 `sp_goods`
--

CREATE TABLE `sp_goods` (
  `id` int(11) NOT NULL,
  `admin_id` int(5) NOT NULL COMMENT '发布商家',
  `good_type_id` int(5) NOT NULL COMMENT '商品类型id',
  `name` varchar(50) NOT NULL COMMENT '商品名',
  `imgs` varchar(500) NOT NULL COMMENT '上坪图片',
  `price` int(6) NOT NULL COMMENT '价格',
  `a_price` int(6) DEFAULT NULL COMMENT '优惠后价格，0为不优惠',
  `content` text COMMENT '商品简介',
  `stock` int(6) NOT NULL DEFAULT '0' COMMENT '库存',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `sp_goods`
--

INSERT INTO `sp_goods` (`id`, `admin_id`, `good_type_id`, `name`, `imgs`, `price`, `a_price`, `content`, `stock`, `status`, `create_time`) VALUES
(1, 2, 1, 'BOOM美妆 韩国HEELAA荷拉女神唇釉唇膏口红 保湿易上色', '/upload/20190324/feb67af9af81c9604bfb9afd82d51b0a.jpg,/upload/20190324/a651dcc0da45b8cbae37e9150987fb9a.jpg,/upload/20190324/832e5d8877fbf6ea8725896aa6cbe907.jpg,/upload/20190324/a0032d7fed6c2bbf7b9e9e55929c726e.jpg,/upload/20190324/40f69346a601ed1007ae1aa77a8e107c.jpg,', 120, 88, '<ul><li>产品名称:&nbsp;HEELAA/荷拉 缪斯女神唇釉</li><li>品牌:&nbsp;HEELAA/荷拉</li><li>品名:&nbsp;缪斯女神唇釉</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>规格类型:&nbsp;正常规格</li><li>产地:&nbsp;韩国</li><li>适合肤质:&nbsp;任何肤质</li><li>颜色分类:&nbsp;800鎏金色 801焦糖色 802橘橙色 803猩红色 804玫瑰粉 805土棕色 806深豆沙 807玫瑰红 809枫叶红</li><li>功效:&nbsp;提升气色 持久保湿 易上色</li></ul><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01ljycr31FT5NTULyGh_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN011FT5MFr5XGpKOE4_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01hIeFgj1FT5ME9wlIf_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01i0rgSP1FT5MFgjG6N_!!292070487.jpg\" width=\"750\" height=\"965\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN011FT5MByqmPHSJrr_!!292070487.jpg\" width=\"660\" height=\"11052\"></p>', 230, 1, '2019-03-15 19:09:37'),
(2, 1, 1, 'BOOM美妆 用多少转多少韩国unny旋转口红 滋润持久保湿防水不脱色', '/index/img/shop/1-6.jpg,/index/img/shop/1-7.jpg,/index/img/shop/1-8.jpg,/index/img/shop/1-9.jpg,/index/img/shop/1-10.jpg,', 200, 100, '<ul><li>产品名称:&nbsp;unny（美妆） 旋转口红</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>颜色分类:&nbsp;M01 chili色-哑光 M02 西柚色-哑光 M03 豆沙红-哑光 M04 魅力橘-哑光 M05 豆沙色-哑光 G06 珊瑚色-半哑光 M07 南瓜红-哑光 M08 南瓜橘 -哑光</li><li>规格类型:&nbsp;正常规格</li><li>品牌:&nbsp;unny（美妆）</li><li>品名:&nbsp;旋转口红</li><li>功效:&nbsp;提升气色 易上色</li><li>产地:&nbsp;韩国</li><li>适合肤质:&nbsp;任何肤质</li><li>保质期:&nbsp;36个月</li></ul><p><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2wjwGarsTMeJjSsziXXcdwXXa_!!292070487.jpg\"></p><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2LNZTf46I8KJjSszfXXaZVXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2P4czbRcHL1JjSZJiXXcKcpXa_!!292070487.jpg\"></p><p><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2xV4ualP8F1Jjy1zjXXa1WVXa_!!292070487.jpg\"></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"https://img.alicdn.com/imgextra/i2/292070487/TB21Z8agNHI8KJjy1zbXXaxdpXa_!!292070487.jpg\" width=\"750\" height=\"17995\"></p>', 99, 1, '2019-03-15 19:51:16'),
(3, 2, 1, '预售韩国直邮备注姓名身份证!法国Agatha 钻石挂件口红外壳可替换', '/index/img/shop/1-11.jpg,/index/img/shop/1-12.jpg,/index/img/shop/1-13.jpg,/index/img/shop/1-14.jpg,/index/img/shop/1-15.jpg,', 500, 0, '<ul><li>产品名称:&nbsp;AGATHA 挂件口红</li><li>品牌:&nbsp;AGATHA</li><li>唇膏/口红单品:&nbsp;挂件口红</li><li>产地:&nbsp;韩国</li><li>颜色分类:&nbsp;105 Tomato Red+粉色壳 105 Tomato Red+墨蓝色壳 117 Queen Red+粉色壳 117 Queen Red+墨蓝色壳 174 Cream Rose+粉色壳 174 Cream Rose+墨蓝色壳</li><li>功效:&nbsp;易上色 持久 提升气色</li><li>规格类型:&nbsp;正常规格</li><li>是否为特殊用途化妆品:&nbsp;否</li></ul><p><img src=\"https://img.alicdn.com/tfs/TB11FXwlgMPMeJjy1XdXXasrXXa-730-616.jpg\" width=\"730\" height=\"616\"></p><p><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN01Lmtd9l1FT5OM6eehf_!!292070487.png\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01oa4eQ11FT5OMUMMbm_!!292070487.png\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01Dp9bxX1FT5OMUKUC9_!!292070487.png\"></p>', 191, 1, '2019-03-15 19:51:16'),
(4, 1, 2, '韩国悠宜UNNY氨基酸洗面奶 泡沫洁面乳温和保湿深层清洁 120g', '/index/img/shop/2-1.png,/index/img/shop/2-2.jpg,/index/img/shop/2-3.jpg,/index/img/shop/2-4.jpg,/index/img/shop/2-2.jpg,', 7000, 234, '<ul><li>规格类型:&nbsp;正常规格</li><li>化妆品净含量:&nbsp;120g/ml</li><li>适合肤质:&nbsp;任何肤质</li><li>起泡程度:&nbsp;细腻密集泡沫</li><li>洁面分类:&nbsp;洁肤乳</li><li>品牌:&nbsp;unny（美妆）</li><li>品名:&nbsp;unny氨基酸洁面乳</li><li>产地:&nbsp;韩国</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>功效:&nbsp;保湿 深层清洁 舒缓肌肤</li><li>保质期:&nbsp;3年</li></ul><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN011FT5KYnuRG8upz7_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN011FT5KYzAAj5Oc7g_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN011FT5KUBV8Qc6PEa_!!292070487.png\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN011FT5KXR5mmbzw5w_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN011FT5KZwcoPI61TQ_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN011FT5KZ9fraGotbb_!!292070487.jpg\"></p>', 234, 1, '2019-03-15 19:09:37'),
(5, 1, 2, 'BOOM美妆 西班牙BYPHASSE蓓昂斯四效合一温和保湿卸妆水500ml', '/index/img/shop/2-6.jpg,/index/img/shop/2-7.jpg,/index/img/shop/2-8.jpg,/index/img/shop/2-9.jpg,/index/img/shop/2-10.jpg,', 7000, 234, '<ul><li>产品名称:&nbsp;BYPHASSE 四效合一温和保湿卸妆水</li><li>品牌:&nbsp;BYPHASSE</li><li>卸妆单品:&nbsp;四效合一温和保湿卸妆水</li><li>产地:&nbsp;西班牙</li><li>卸妆分类:&nbsp;卸妆水/液</li><li>适合肤质:&nbsp;任何肤质</li><li>上市时间:&nbsp;2014年</li><li>月份:&nbsp;4月</li><li>适用部位:&nbsp;脸部</li><li>功效:&nbsp;保湿 卸妆 清洁</li><li>规格类型:&nbsp;正常规格</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>限期使用日期范围:&nbsp;2017-07-22至2019-07-22</li></ul><p style=\"text-align: center;\"><strong style=\"color: rgb(204, 0, 0);\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2wjwGarsTMeJjSsziXXcdwXXa_!!292070487.jpg\"></strong></p><p style=\"text-align: center;\">&nbsp;</p><p style=\"text-align: center;\"><strong style=\"color: rgb(204, 0, 0);\"><strong><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB2d8ApdnnI8KJjy0FfXXcdoVXa_!!292070487.jpg\"></strong></strong></p><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN013pKwe11FT5NaZnU52_!!292070487.jpg\"><br><strong style=\"color: rgb(204, 0, 0);\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2fT7fbwsSMeJjSspeXXa77VXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/TB2NjhxbS7PL1JjSZFHXXcciXXa_!!292070487.jpg\"></strong></p>', 229, 1, '2019-03-15 19:09:37'),
(6, 1, 2, '英国Emma Hardie EH紧致提升辣木卸妆膏100ml 带洁面巾', '/index/img/shop/2-11.jpg,/index/img/shop/2-12.jpg,/index/img/shop/2-13.jpg,/index/img/shop/2-14.jpg,/index/img/shop/2-15.jpg,', 1000, 799, '<ul><li>产品名称:&nbsp;EMMA HARDIE 辣木卸妆膏</li><li>限期使用日期范围:&nbsp;2018-05-22至2021-05-22</li><li>适用部位:&nbsp;脸部</li><li>规格类型:&nbsp;正常规格</li><li>品牌:&nbsp;EMMA HARDIE</li><li>品名:&nbsp;辣木卸妆膏</li><li>适合肤质:&nbsp;任何肤质</li><li>产地:&nbsp;英国</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>功效:&nbsp;深层清洁 卸妆 舒缓肌肤</li></ul><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2BhJ0lm8YBeNkSnb4XXaevFXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB2_HSHtuSSBuNjy0FlXXbBpVXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2X.HUtCBYBeNjy0FeXXbnmFXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2sXKVtuOSBuNjy0FdXXbDnVXa_!!292070487.jpg\" width=\"750\" height=\"447\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB2kFWZtAOWBuNjSsppXXXPgpXa_!!292070487.png\" width=\"284\" height=\"175\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB220PdtxGYBuNjy0FnXXX5lpXa_!!292070487.jpg\" width=\"750\" height=\"248\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2X2rptx9YBuNjy0FfXXXIsVXa_!!292070487.jpg\" width=\"750\" height=\"759\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB209FJlndYBeNkSmLyXXXfnVXa_!!292070487.jpg\" width=\"750\" height=\"807\"></p>', 194, 1, '2019-03-23 10:03:33'),
(10, 1, 4, '韩国FRANZ肤澜滋微电流面膜 黑科技导入2组装提亮保湿抗皱紧致', '/index/img/shop/4-1.jpg,/index/img/shop/4-2.jpg,/index/img/shop/4-3.jpg,/index/img/shop/4-4.jpg,/index/img/shop/4-5.jpg,', 100, 88, '<ul><li>产品名称:&nbsp;Franz 杰滋养面膜</li><li>品牌:&nbsp;Franz</li><li>品名:&nbsp;杰滋养面膜</li><li>产地:&nbsp;韩国</li><li>颜色分类:&nbsp;一盒两组</li><li>功效:&nbsp;长效保湿 提亮肤色 补水 收缩毛孔 损伤修复</li><li>规格类型:&nbsp;正常规格</li><li>是否为特殊用途化妆品:&nbsp;否</li></ul><p><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN01ZTYCRR1FT5NwgSWOT_!!292070487.png\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01JwaqAo1FT5Num9PE0_!!292070487.png\"></p>', 194, 1, '2019-03-23 10:03:33'),
(7, 1, 3, '韩国d\'Alba黛尔珀空姐喷雾精油赋活肌底液精华补水保湿dalba100ml', '/index/img/shop/3-1.jpg,/index/img/shop/3-2.jpg,/index/img/shop/3-3.jpg,/index/img/shop/3-4.jpg,/index/img/shop/3-5.jpg,', 1000, 799, '<ul><li>产品名称:&nbsp;d\'Alba/黛尔珀 精油赋活肌底液</li><li>品牌:&nbsp;d\'Alba/黛尔珀</li><li>品名:&nbsp;精油赋活肌底液</li><li>产地:&nbsp;韩国</li><li>化妆品品类:&nbsp;爽肤水 化妆水 柔肤水 紧致水 活肤水</li><li>保质期:&nbsp;3年</li><li>适合肤质:&nbsp;任何肌肤</li><li>功效:&nbsp;补水 保湿</li><li>规格类型:&nbsp;正常规格</li><li>是否为特殊用途化妆品:&nbsp;否</li></ul><p style=\"margin-left: 40px;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01hx6fhj1FT5Nn5s6sd_!!292070487.jpg\"></p><p>&nbsp;</p><p><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01PXqSHQ1FT5NlZCgt7_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01jYpC4g1FT5NmECLCi_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN01ZGToYF1FT5NlZDhFt_!!292070487.jpg\" width=\"750\" height=\"538\"></p><p><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01LC3YMo1FT5NmEA3s2_!!292070487.jpg\" width=\"750\" height=\"1639\"></p>', 194, 1, '2019-03-23 10:03:33'),
(8, 1, 3, '韩国Coreana高丽雅娜水乳套装 爽肤水乳液面霜', '/index/img/shop/3-6.jpg,/index/img/shop/3-7.jpg,/index/img/shop/3-8.jpg,/index/img/shop/3-9.jpg,/index/img/shop/3-10.jpg,', 1000, 799, '<ul><li>产品名称:&nbsp;Coreana/高丽雅娜 翡翠佳人宝缎3件套</li><li>品牌:&nbsp;Coreana/高丽雅娜</li><li>单品:&nbsp;翡翠佳人宝缎3件套</li><li>产地:&nbsp;韩国</li><li>保质期:&nbsp;3年</li><li>适合肤质:&nbsp;任何肤质</li><li>功效:&nbsp;抗皱 提拉紧致 舒缓肌肤</li><li>规格类型:&nbsp;正常规格</li><li>是否为特殊用途化妆品:&nbsp;否</li></ul><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN011FT5MAZUyhvmwf3_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN01drVSlJ1FT5NYWfz1E_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN01ybcHOX1FT5MIMTVok_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN01bGj0XJ1FT5MHdeGh1_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01Ap5bZR1FT5MIa01dP_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN011FT5MHKd7xFPPf3_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN01aWWX2z1FT5MFQ4PZd_!!292070487.jpg\"></p>', 194, 1, '2019-03-23 10:03:33'),
(13, 1, 5, 'VENUS MARBLE维纳斯大理石9色眼影盘九色新款复古珠哑光南瓜色', '/index/img/shop/5-1.jpg,/index/img/shop/5-2.jpg,/index/img/shop/5-3.jpg,/index/img/shop/5-4.jpg,/index/img/shop/5-5.jpg,', 100, 88, '<ul><li>产品名称:&nbsp;VENUS MARBLE 九色眼影盘</li><li>品牌:&nbsp;VENUS MARBLE</li><li>品名:&nbsp;九色眼影盘</li><li>产地:&nbsp;香港特别行政区</li><li>颜色分类:&nbsp;浪漫主义 拜金主义</li><li>功效:&nbsp;眼部修饰 提升气色</li><li>规格类型:&nbsp;正常规格</li><li>是否为特殊用途化妆品:&nbsp;否</li></ul><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01CgeB8H1FT5OOaaAee_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN012u9qOy1FT5OP8qme7_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN01sXTa0N1FT5OMIclOY_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN01lcgGqD1FT5OOdFzpq_!!292070487.jpg\" width=\"750\" height=\"1226\"></p>', 194, 1, '2019-03-23 10:03:33'),
(9, 1, 3, '韩国heelaa荷拉爽肤水乳液营养弹力水乳套装补水保湿滋润收缩毛孔', '/index/img/shop/3-11.jpg,/index/img/shop/3-12.jpg,/index/img/shop/3-13.jpg,/index/img/shop/3-14.jpg,/index/img/shop/3-15.jpg,', 1000, 799, '<ul><li>产品名称:&nbsp;HEELAA/荷拉 营养保湿水乳企划套盒</li><li>品牌:&nbsp;HEELAA/荷拉</li><li>单品:&nbsp;营养保湿水乳企划套盒</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>规格类型:&nbsp;正常规格</li><li>产地:&nbsp;韩国</li><li>颜色分类:&nbsp;爽肤水 乳液</li><li>功效:&nbsp;补水 保湿 提拉紧致 提亮肤色 滋润</li></ul><p><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB2xXURfuySBuNjy1zdXXXPxFXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2dgJWbBsmBKNjSZFFXXcT9VXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2.FeafSBYBeNjy0FeXXbnmFXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB2AIsYfv5TBuNjSspmXXaDRVXa_!!292070487.jpg\" width=\"750\" height=\"798\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2qdAnfwaTBuNjSszfXXXgfpXa_!!292070487.jpg\" width=\"750\" height=\"760\"></p>', 194, 1, '2019-03-23 10:03:33'),
(11, 1, 4, '澳洲新西兰JRS8分钟面膜极速补水保湿美颜亮白提亮肤色植物面膜', '/index/img/shop/4-6.jpg,/index/img/shop/4-7.jpg,/index/img/shop/4-8.jpg,/index/img/shop/4-9.jpg,/index/img/shop/4-10.jpg,', 200, 100, '<ul><li>产品名称:&nbsp;jema rose 8分钟面膜</li><li>面膜分类:&nbsp;贴片式</li><li>颜色分类:&nbsp;补水 亮白</li><li>规格类型:&nbsp;正常规格</li><li>适合肤质:&nbsp;任何肤质</li><li>品牌:&nbsp;jema rose</li><li>品名:&nbsp;8分钟面膜</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>功效:&nbsp;盈润透亮 补水 保湿 滋润</li><li>产地:&nbsp;澳大利亚</li></ul><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01ejjH3G1FT5NFfboGb_!!292070487.jpg\"></p><p style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 255);\"><strong><span style=\"font-size: 36px;\">一盒7片</span></strong></span></p><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN011FT5KOs0VGFSmhp_!!292070487.jpg\"></p>', 194, 1, '2019-03-23 10:03:33'),
(12, 1, 4, '澳洲EAORON水光针面膜胶原蛋白补水保湿提亮肤色白黑紫红金盒5片', '/index/img/shop/4-11.jpg,/index/img/shop/4-12.jpg,/index/img/shop/4-13.jpg,/index/img/shop/4-14.jpg,/index/img/shop/4-15.jpg,', 150, 94, '<ul><li>产品名称:&nbsp;eaoron 水光针补水胶原蛋白面膜</li><li>品牌:&nbsp;eaoron</li><li>面膜单品:&nbsp;水光针补水胶原蛋白面膜</li><li>规格类型:&nbsp;正常规格</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>产地:&nbsp;澳大利亚</li><li>保质期:&nbsp;3年</li><li>颜色分类:&nbsp;白盒，补水保湿 黑盒，美白提亮 紫盒，低敏全效 红盒，紧致V脸 金盒，嫩肤抗老</li><li>功效:&nbsp;活肤滋润 平衡水油</li><li>上市时间:&nbsp;2015年</li><li>月份:&nbsp;12月</li><li>面膜分类:&nbsp;贴片式</li><li>适合肤质:&nbsp;任何肤质</li></ul><p>&nbsp;<img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2wjwGarsTMeJjSsziXXcdwXXa_!!292070487.jpg\"></p><p style=\"text-align: center;\"><strong style=\"color: rgb(204, 0, 0);\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2CwzhggfH8KJjy1zcXXcTzpXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/TB2_XESlf1TBuNjy0FjXXajyXXa_!!292070487.jpg\"></strong></p><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2WBEfbkfb_uJkSne1XXbE4XXa_!!292070487.jpg\"></p><p style=\"text-align: center;\"><strong><span style=\"font-size: 24px;\">新的三款面膜：</span></strong></p><p style=\"text-align: center;\"><span style=\"color: rgb(153, 0, 255);\"><strong><span style=\"font-size: 24px;\">紫色：低敏全效、孕妇可用、bao湿mei白、收缩毛孔</span></strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\"><strong><span style=\"font-size: 24px;\">红色：提拉紧致、抚平细纹、打造脸庞轮廓弧度 &nbsp;&nbsp;</span></strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(191, 144, 0);\"><strong><span style=\"font-size: 24px;\">金色：深层补水、细致肌肤、延缓衰lao、抗痘抗</span><span style=\"font-size: 24px;\">zhou</span></strong></span></p><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/TB2NJPHaCRRMKJjy0FlXXXFepXa_!!292070487.jpg\" width=\"750\" height=\"2184\"></p>', 194, 1, '2019-03-23 10:03:33'),
(14, 1, 5, '韩国wlab 眼线液笔W.Lab黑色棕色持久防水不晕妆', '/index/img/shop/5-6.jpg,/index/img/shop/5-7.jpg,/index/img/shop/5-8.jpg,/index/img/shop/5-9.jpg,/index/img/shop/5-10.jpg,', 200, 100, '<ul><li>产品名称:&nbsp;W. Lab 真巧眼线液笔</li><li>是否为特殊用途化妆品:&nbsp;否</li><li>颜色分类:&nbsp;01#黑色 02#棕色</li><li>规格类型:&nbsp;正常规格</li><li>品牌:&nbsp;W. Lab</li><li>品名:&nbsp;真巧眼线液笔</li><li>功效:&nbsp;防水 浓黑 防晕染</li><li>产地:&nbsp;韩国</li></ul><p style=\"text-align: center;\">&nbsp;</p><p><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN0132ufm81FT5N3P2NyO_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01BtR8Jh1FT5N5DFD1m_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01BxCH5V1FT5N48lH8F_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN01pKiLSU1FT5N2nhmM8_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/O1CN01CRrlZz1FT5N3vyDpd_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/O1CN01SFSg9M1FT5N3P4823_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/292070487/O1CN01MNpHyk1FT5N1jDeO1_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/O1CN01ydqTDZ1FT5N14QlNv_!!292070487.jpg\"></p>', 194, 1, '2019-03-23 10:03:33'),
(15, 1, 5, '美国Physicians Formula闪光地带多效合一12色PF眼影盘裸装盘', '/index/img/shop/5-11.jpg,/index/img/shop/5-12.jpg,/index/img/shop/5-13.jpg,/index/img/shop/5-14.jpg,/index/img/shop/5-15.jpg,', 150, 94, '<ul><li>是否为特殊用途化妆品:&nbsp;否</li><li>颜色分类:&nbsp;现货</li><li>颜色数:&nbsp;8色及以上</li><li>规格类型:&nbsp;正常规格</li><li>品牌:&nbsp;physicians formula</li><li>眼影单品:&nbsp;其他/other</li><li>功效:&nbsp;修饰轮廓 眼部修饰</li><li>适合肤质:&nbsp;任何肤质</li><li>产地:&nbsp;美国</li></ul><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB27cOmbQfb_uJkSnb4XXXCrXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB2u.F_eVOWBuNjy0FiXXXFxVXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2YUXTeYGYBuNjy0FoXXciBFXa_!!292070487.png\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2tHB1e79WBuNjSspeXXaz5VXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/292070487/TB2cBRJeYSYBuNjSspiXXXNzpXa_!!292070487.jpg\"></p><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB29OPpe7CWBuNjy0FaXXXUlXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB23G9Shb5YBuNjSspoXXbeNFXa_!!292070487.jpg\"></p><p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/292070487/TB2VhlNeVmWBuNjSspdXXbugXXa_!!292070487.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/292070487/TB2LSSie1ySBuNjy1zdXXXPxFXa_!!292070487.jpg\"></p>', 194, 1, '2019-03-23 10:03:33');

-- --------------------------------------------------------

--
-- 表的结构 `sp_good_types`
--

CREATE TABLE `sp_good_types` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '商品类型名称',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '类型状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类型表';

--
-- 转存表中的数据 `sp_good_types`
--

INSERT INTO `sp_good_types` (`id`, `name`, `status`, `create_time`) VALUES
(1, '口红', 1, '2019-03-15 16:19:56'),
(2, '洁面/卸妆', 1, '2019-03-15 19:50:06'),
(3, '化妆水/彩妆水', 1, '2019-03-20 20:13:18'),
(4, '面膜', 1, '2019-03-20 20:13:24'),
(5, '眼影/眼线', 1, '2019-03-24 19:41:43');

-- --------------------------------------------------------

--
-- 表的结构 `sp_orders`
--

CREATE TABLE `sp_orders` (
  `id` int(5) NOT NULL,
  `order_num` varchar(50) NOT NULL COMMENT '订单号',
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `address_id` int(5) DEFAULT NULL COMMENT '收货地址',
  `price` int(7) NOT NULL COMMENT '实际支付价格',
  `is_pay` int(1) DEFAULT '0' COMMENT '是否支付，0未支付，1支付',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `is_ship` int(1) DEFAULT '0' COMMENT '是否收货，0未发货，1未收货，2收货',
  `ship_time` datetime DEFAULT NULL COMMENT '收货时间',
  `status` int(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表';

--
-- 转存表中的数据 `sp_orders`
--

INSERT INTO `sp_orders` (`id`, `order_num`, `user_id`, `address_id`, `price`, `is_pay`, `pay_time`, `is_ship`, `ship_time`, `status`, `create_time`) VALUES
(2, '20190319204342', 1, 2, 1600, 0, '2019-03-19 20:43:42', 0, '2019-03-19 20:43:42', 1, '2019-03-19 20:43:42'),
(3, '20190320152500', 1, 2, 468, 1, '2019-03-20 15:25:00', 0, '2019-03-20 19:51:40', 1, '2019-03-20 15:25:00'),
(5, '20190320155052', 1, 2, 600, 1, '2019-03-20 15:50:52', 0, '2019-03-20 15:50:52', 1, '2019-03-20 15:50:52'),
(8, '20190322170307', 1, 2, 600, 1, '2019-03-22 17:03:07', 2, '2019-03-22 17:07:32', 1, '2019-03-22 17:03:07');

-- --------------------------------------------------------

--
-- 表的结构 `sp_order_good`
--

CREATE TABLE `sp_order_good` (
  `id` int(5) NOT NULL,
  `order_id` int(5) NOT NULL COMMENT '订单id',
  `good_id` int(5) NOT NULL COMMENT '商品id',
  `num` int(3) NOT NULL COMMENT '商品个数',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品';

--
-- 转存表中的数据 `sp_order_good`
--

INSERT INTO `sp_order_good` (`id`, `order_id`, `good_id`, `num`, `status`, `create_time`) VALUES
(1, 2, 2, 8, 1, '2019-03-19 20:43:42'),
(2, 3, 1, 2, 1, '2019-03-20 15:25:00'),
(3, 5, 2, 3, 1, '2019-03-20 15:45:19'),
(5, 6, 1, 3, 1, '2019-03-20 17:16:25'),
(6, 7, 1, 2, 1, '2019-03-22 16:40:56'),
(7, 7, 3, 2, 1, '2019-03-22 16:40:56'),
(8, 8, 3, 1, 1, '2019-03-22 17:03:07'),
(9, 8, 2, 1, 1, '2019-03-22 17:03:07');

-- --------------------------------------------------------

--
-- 表的结构 `sp_services`
--

CREATE TABLE `sp_services` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `admin_id` int(5) NOT NULL COMMENT '店铺id',
  `content` text NOT NULL COMMENT '会话内容',
  `type` int(1) DEFAULT '1' COMMENT '类型 1用户问 2店铺回',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客服表';

--
-- 转存表中的数据 `sp_services`
--

INSERT INTO `sp_services` (`id`, `user_id`, `admin_id`, `content`, `type`, `create_time`) VALUES
(17, 1, 1, '<p>asdf</p>', 2, '2019-03-30 17:33:20'),
(16, 1, 1, '<p>adf</p>', 1, '2019-03-30 17:33:09'),
(15, 1, 1, '<p>asdf</p>', 1, '2019-03-30 17:33:07'),
(5, 1, 2, '<p>asdf</p>', 1, '2019-03-22 20:46:54'),
(14, 3, 1, '<p>asdfasd</p>', 2, '2019-03-30 16:44:38'),
(8, 1, 2, '<p>sdfsf</p>', 2, '2019-03-23 10:00:22'),
(13, 3, 1, '<p>asdd</p>', 1, '2019-03-30 16:44:31'),
(12, 3, 1, '<p>asdfa</p>', 1, '2019-03-30 16:44:29');

-- --------------------------------------------------------

--
-- 表的结构 `sp_users`
--

CREATE TABLE `sp_users` (
  `id` int(5) NOT NULL,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `money` int(6) DEFAULT '0' COMMENT '余额',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `sp_users`
--

INSERT INTO `sp_users` (`id`, `username`, `password`, `phone`, `money`, `status`, `create_time`) VALUES
(1, 'root', 'e10adc3949ba59abbe56e057f20f883e', '17365276759', 8800, 1, '2019-03-14 00:00:00'),
(2, 'root2', 'e10adc3949ba59abbe56e057f20f883e', '17365276746', 100, 1, '2019-03-14 21:31:00'),
(3, 'root1', 'e10adc3949ba59abbe56e057f20f883e', '17365276746', 1000, 1, '2019-03-15 16:03:49'),
(4, 'root3', 'e10adc3949ba59abbe56e057f20f883e', '17630968036', 0, 1, '2019-03-16 10:52:17');

-- --------------------------------------------------------

--
-- 表的结构 `sp_user_good`
--

CREATE TABLE `sp_user_good` (
  `id` int(6) NOT NULL,
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `good_id` int(5) NOT NULL COMMENT '商品id',
  `num` int(3) NOT NULL DEFAULT '0' COMMENT '商品个数',
  `type` int(1) DEFAULT '1' COMMENT '类型，1购物车，2喜欢，3对比',
  `status` int(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

--
-- 转存表中的数据 `sp_user_good`
--

INSERT INTO `sp_user_good` (`id`, `user_id`, `good_id`, `num`, `type`, `status`, `create_time`) VALUES
(20, 1, 6, 2, 1, 1, '2019-03-23 11:15:17'),
(19, 1, 5, 0, 3, 1, '2019-03-23 10:07:33'),
(4, 4, 4, 0, 3, 1, '2019-03-17 08:43:56'),
(13, 1, 1, 0, 3, 1, '2019-03-21 15:47:35'),
(18, 1, 6, 2, 3, 1, '2019-03-23 10:07:15'),
(21, 1, 5, 5, 1, 1, '2019-03-23 11:15:43'),
(22, 1, 6, 0, 2, 1, '2019-03-24 20:53:02');

--
-- 转储表的索引
--

--
-- 表的索引 `sp_addresss`
--
ALTER TABLE `sp_addresss`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_admins`
--
ALTER TABLE `sp_admins`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_blogs`
--
ALTER TABLE `sp_blogs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_comments`
--
ALTER TABLE `sp_comments`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_goods`
--
ALTER TABLE `sp_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_good_types`
--
ALTER TABLE `sp_good_types`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_orders`
--
ALTER TABLE `sp_orders`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_order_good`
--
ALTER TABLE `sp_order_good`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_services`
--
ALTER TABLE `sp_services`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_users`
--
ALTER TABLE `sp_users`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_user_good`
--
ALTER TABLE `sp_user_good`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `sp_addresss`
--
ALTER TABLE `sp_addresss`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `sp_admins`
--
ALTER TABLE `sp_admins`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `sp_blogs`
--
ALTER TABLE `sp_blogs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `sp_comments`
--
ALTER TABLE `sp_comments`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `sp_goods`
--
ALTER TABLE `sp_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `sp_good_types`
--
ALTER TABLE `sp_good_types`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `sp_orders`
--
ALTER TABLE `sp_orders`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `sp_order_good`
--
ALTER TABLE `sp_order_good`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `sp_services`
--
ALTER TABLE `sp_services`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `sp_users`
--
ALTER TABLE `sp_users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sp_user_good`
--
ALTER TABLE `sp_user_good`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
