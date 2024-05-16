-- MariaDB dump 10.19-11.2.2-MariaDB, for osx10.17 (x86_64)
--
-- Host: localhost    Database: build
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `build`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `build` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `build`;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `click_num` int(11) DEFAULT NULL COMMENT '点击数',
  `content` longtext DEFAULT NULL COMMENT '内容',
  `image` varchar(255) DEFAULT NULL COMMENT '标题图',
  `name` varchar(255) DEFAULT NULL COMMENT '标题',
  `original` bit(1) DEFAULT NULL COMMENT '是否原创',
  `publish` bit(1) DEFAULT NULL COMMENT '是否发布',
  `recommended_level` int(11) DEFAULT NULL COMMENT '推荐等级',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `blog_category_id` bigint(20) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`),
  KEY `FK1e19b3hgxj8njadninfsq3jra` (`create_user_id`),
  KEY `FKkql5hk0tc2pnawmaeu1lbw4qq` (`update_user_id`),
  KEY `FK74ctxx9batrm1ar915frybfmq` (`blog_category_id`),
  CONSTRAINT `FK1e19b3hgxj8njadninfsq3jra` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FK74ctxx9batrm1ar915frybfmq` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `FKkql5hk0tc2pnawmaeu1lbw4qq` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='博客管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` bit(1) DEFAULT NULL COMMENT '是否显示',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '分类介绍',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='博客类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_link`
--

DROP TABLE IF EXISTS `blog_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL COMMENT '站长邮箱',
  `name` varchar(255) DEFAULT NULL COMMENT '友链名',
  `remark` varchar(255) DEFAULT NULL COMMENT '友链简介',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '友链URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_link`
--

LOCK TABLES `blog_link` WRITE;
/*!40000 ALTER TABLE `blog_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_picture`
--

DROP TABLE IF EXISTS `blog_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `height` int(11) DEFAULT NULL COMMENT '高度',
  `remark` varchar(255) DEFAULT NULL COMMENT '图片备注',
  `sizes` int(11) DEFAULT NULL COMMENT '大小',
  `width` int(11) DEFAULT NULL COMMENT '宽度',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `pictures_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKem3m8nybh74e4gfg0xmyvkeax` (`create_user_id`),
  KEY `FKl9cbe3sag33xpaeblfb8vf1ml` (`update_user_id`),
  KEY `FKs5n8lg87qq92elejyjdbwt6iq` (`pictures_category_id`),
  CONSTRAINT `FKem3m8nybh74e4gfg0xmyvkeax` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKl9cbe3sag33xpaeblfb8vf1ml` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKs5n8lg87qq92elejyjdbwt6iq` FOREIGN KEY (`pictures_category_id`) REFERENCES `blog_picture_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='图片管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_picture`
--

LOCK TABLES `blog_picture` WRITE;
/*!40000 ALTER TABLE `blog_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_picture_category`
--

DROP TABLE IF EXISTS `blog_picture_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_picture_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90hls4khrum6t3q1gkdkqijr5` (`create_user_id`),
  KEY `FKk3sogcaj375aiqg1wr6c10o2h` (`update_user_id`),
  CONSTRAINT `FK90hls4khrum6t3q1gkdkqijr5` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKk3sogcaj375aiqg1wr6c10o2h` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='图床分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_picture_category`
--

LOCK TABLES `blog_picture_category` WRITE;
/*!40000 ALTER TABLE `blog_picture_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_picture_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe1wmsd60gau8s7rxiytnxvulq` (`create_user_id`),
  KEY `FKgctgb8bvmf3k40wn5ul267oio` (`update_user_id`),
  CONSTRAINT `FKe1wmsd60gau8s7rxiytnxvulq` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKgctgb8bvmf3k40wn5ul267oio` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='博客标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_article`
--

DROP TABLE IF EXISTS `demo_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `content` longtext DEFAULT NULL COMMENT '内容(UEditor)',
  `pic` varchar(255) DEFAULT NULL COMMENT '封面图',
  `publish` bit(1) DEFAULT NULL COMMENT '发布状态',
  `remark` varchar(5000) DEFAULT NULL COMMENT '备注',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `top_up` bit(1) DEFAULT NULL COMMENT '置顶',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9hr9liq52keob5o599gy0skkw` (`create_user_id`),
  KEY `FKfv1ogssebm95to9v437ttm34y` (`update_user_id`),
  CONSTRAINT `FK9hr9liq52keob5o599gy0skkw` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKfv1ogssebm95to9v437ttm34y` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文章发布';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_article`
--

LOCK TABLES `demo_article` WRITE;
/*!40000 ALTER TABLE `demo_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_complex`
--

DROP TABLE IF EXISTS `demo_complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_complex` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `choice` varchar(255) DEFAULT NULL COMMENT '通过SQL获取下拉列表',
  `code` longtext DEFAULT NULL COMMENT 'python代码编辑器',
  `from_dict` bigint(20) DEFAULT NULL COMMENT '字典值',
  `from_dict_code` varchar(255) DEFAULT NULL COMMENT '字典值',
  `article_id` bigint(20) DEFAULT NULL COMMENT '多对一表格',
  `tree_id` bigint(20) DEFAULT NULL COMMENT '多对一树',
  PRIMARY KEY (`id`),
  KEY `FKeqxb24s0q2253b1v18pdeeapx` (`article_id`),
  KEY `FKd96od49tv0uebree938gmku6p` (`tree_id`),
  CONSTRAINT `FKd96od49tv0uebree938gmku6p` FOREIGN KEY (`tree_id`) REFERENCES `demo_tree` (`id`),
  CONSTRAINT `FKeqxb24s0q2253b1v18pdeeapx` FOREIGN KEY (`article_id`) REFERENCES `demo_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='复杂示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_complex`
--

LOCK TABLES `demo_complex` WRITE;
/*!40000 ALTER TABLE `demo_complex` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_complex_tab`
--

DROP TABLE IF EXISTS `demo_complex_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_complex_tab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input` varchar(255) DEFAULT NULL COMMENT '文本',
  `number` float DEFAULT NULL COMMENT '数值',
  `complex_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKyiqlahfwo7f4xwsr67mt2eq8` (`complex_id`),
  CONSTRAINT `FKyiqlahfwo7f4xwsr67mt2eq8` FOREIGN KEY (`complex_id`) REFERENCES `demo_complex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='一对多新增';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_complex_tab`
--

LOCK TABLES `demo_complex_tab` WRITE;
/*!40000 ALTER TABLE `demo_complex_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_complex_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_component`
--

DROP TABLE IF EXISTS `demo_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auto_complete` varchar(255) DEFAULT NULL COMMENT '自动完成',
  `bool` bit(1) DEFAULT NULL COMMENT '布尔',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色选择',
  `date1` datetime DEFAULT NULL COMMENT '日期',
  `date_time` datetime DEFAULT NULL COMMENT '时间日期',
  `feature` varchar(255) DEFAULT NULL COMMENT '未来时间',
  `history` varchar(255) DEFAULT NULL COMMENT '过去时间',
  `input` varchar(255) DEFAULT NULL COMMENT '文本',
  `month` varchar(255) DEFAULT NULL COMMENT '月',
  `number1` double DEFAULT NULL COMMENT '数字',
  `slider` int(11) DEFAULT NULL COMMENT '数字滑块',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签选择',
  `time` varchar(255) DEFAULT NULL COMMENT '时间',
  `week` varchar(255) DEFAULT NULL COMMENT '周',
  `week_input` varchar(255) DEFAULT NULL COMMENT '周选择器',
  `year` varchar(255) DEFAULT NULL COMMENT '年',
  `article_id` bigint(20) DEFAULT NULL COMMENT '文章选择',
  `tree_id` bigint(20) DEFAULT NULL COMMENT '多对一树',
  PRIMARY KEY (`id`),
  KEY `FKn5uhvcvqbjf7ms7wc1ays75pb` (`article_id`),
  KEY `FK44s9a2xh33b6bxlnuy5c0k7pf` (`tree_id`),
  CONSTRAINT `FK44s9a2xh33b6bxlnuy5c0k7pf` FOREIGN KEY (`tree_id`) REFERENCES `demo_tree` (`id`),
  CONSTRAINT `FKn5uhvcvqbjf7ms7wc1ays75pb` FOREIGN KEY (`article_id`) REFERENCES `demo_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='组件示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_component`
--

LOCK TABLES `demo_component` WRITE;
/*!40000 ALTER TABLE `demo_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_curd_extension`
--

DROP TABLE IF EXISTS `demo_curd_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_curd_extension` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='服务层逻辑扩展 @DataProxy （扩展CURD）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_curd_extension`
--

LOCK TABLES `demo_curd_extension` WRITE;
/*!40000 ALTER TABLE `demo_curd_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_curd_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_simple`
--

DROP TABLE IF EXISTS `demo_simple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_simple` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bool` bit(1) DEFAULT NULL COMMENT '布尔',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `input` varchar(255) DEFAULT NULL COMMENT '文本',
  `number` float DEFAULT NULL COMMENT '数值',
  `slide` int(11) DEFAULT NULL COMMENT '滑动条',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='简单示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_simple`
--

LOCK TABLES `demo_simple` WRITE;
/*!40000 ALTER TABLE `demo_simple` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_simple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_tree`
--

DROP TABLE IF EXISTS `demo_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_tree` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级树节点',
  PRIMARY KEY (`id`),
  KEY `FKl36uvo19qj7l037g3fxtjxjgi` (`parent_id`),
  CONSTRAINT `FKl36uvo19qj7l037g3fxtjxjgi` FOREIGN KEY (`parent_id`) REFERENCES `demo_tree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='树示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_tree`
--

LOCK TABLES `demo_tree` WRITE;
/*!40000 ALTER TABLE `demo_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cloud_node`
--

DROP TABLE IF EXISTS `e_cloud_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cloud_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `access_token` varchar(255) DEFAULT NULL COMMENT 'Access Token',
  `config` longtext DEFAULT NULL COMMENT '节点配置',
  `duty` varchar(255) DEFAULT NULL COMMENT '负责人',
  `name` varchar(255) DEFAULT NULL COMMENT '友好名称',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名',
  `remark` longtext DEFAULT NULL COMMENT '描述',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `cloud_node_group_id` bigint(20) DEFAULT NULL COMMENT '所属分组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r3jlok3jyaw4plntt4wk59n5b` (`node_name`),
  KEY `FKdlevmrjxsm5xjcbl52w1vphn6` (`cloud_node_group_id`),
  CONSTRAINT `FKdlevmrjxsm5xjcbl52w1vphn6` FOREIGN KEY (`cloud_node_group_id`) REFERENCES `e_cloud_node_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='节点配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cloud_node`
--

LOCK TABLES `e_cloud_node` WRITE;
/*!40000 ALTER TABLE `e_cloud_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_cloud_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cloud_node_group`
--

DROP TABLE IF EXISTS `e_cloud_node_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cloud_node_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `config` longtext DEFAULT NULL COMMENT '分组配置',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(5000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tnlrraw5l0dtam4pm9ynljv0d` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='分组配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cloud_node_group`
--

LOCK TABLES `e_cloud_node_group` WRITE;
/*!40000 ALTER TABLE `e_cloud_node_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_cloud_node_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_complex_article`
--

DROP TABLE IF EXISTS `e_complex_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_complex_article` (
  `complex_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`complex_id`,`article_id`),
  KEY `FKfnrlqw0i99r9n3yhnjj4hm1vb` (`article_id`),
  CONSTRAINT `FKfnrlqw0i99r9n3yhnjj4hm1vb` FOREIGN KEY (`article_id`) REFERENCES `demo_article` (`id`),
  CONSTRAINT `FKqkltmeyft8wmfps5m7k0yp727` FOREIGN KEY (`complex_id`) REFERENCES `demo_complex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_complex_article`
--

LOCK TABLES `e_complex_article` WRITE;
/*!40000 ALTER TABLE `e_complex_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_complex_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_dict`
--

DROP TABLE IF EXISTS `e_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f5wwh5osfukkeebw7h2yb4kmp` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_dict`
--

LOCK TABLES `e_dict` WRITE;
/*!40000 ALTER TABLE `e_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_dict_item`
--

DROP TABLE IF EXISTS `e_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_dict_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `erupt_dict_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKl0kiq8otpn3fvtlvarebt8xkh` (`code`,`erupt_dict_id`),
  KEY `FKrrbi2dt94rjd8sjt830m3w0a` (`erupt_dict_id`),
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_dict_item`
--

LOCK TABLES `e_dict_item` WRITE;
/*!40000 ALTER TABLE `e_dict_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_dict_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_generator_class`
--

DROP TABLE IF EXISTS `e_generator_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_generator_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL COMMENT '实体类名',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(2000) DEFAULT NULL COMMENT '简介',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='生成Erupt代码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_generator_class`
--

LOCK TABLES `e_generator_class` WRITE;
/*!40000 ALTER TABLE `e_generator_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_generator_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_generator_field`
--

DROP TABLE IF EXISTS `e_generator_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_generator_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL COMMENT '字段名',
  `is_show` bit(1) DEFAULT NULL COMMENT '是否显示',
  `link_class` varchar(255) DEFAULT NULL COMMENT '关联实体类',
  `not_null` bit(1) DEFAULT NULL COMMENT '是否必填',
  `query` bit(1) DEFAULT NULL COMMENT '查询项',
  `show_name` varchar(255) DEFAULT NULL COMMENT '显示名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `sortable` bit(1) DEFAULT NULL COMMENT '字段排序',
  `type` varchar(255) DEFAULT NULL COMMENT '编辑类型',
  `class_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKslwo9qwwfbgif9mbbhg072s4i` (`class_id`),
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Erupt字段信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_generator_field`
--

LOCK TABLES `e_generator_field` WRITE;
/*!40000 ALTER TABLE `e_generator_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_generator_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_job`
--

DROP TABLE IF EXISTS `e_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `cron` varchar(255) DEFAULT NULL COMMENT 'Cron表达式',
  `handler` varchar(255) DEFAULT NULL COMMENT 'JOB处理类',
  `handler_param` varchar(2000) DEFAULT NULL COMMENT '任务参数',
  `name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `notify_emails` varchar(2000) DEFAULT NULL COMMENT '失败通知邮箱',
  `remark` varchar(2000) DEFAULT NULL COMMENT '描述',
  `status` bit(1) DEFAULT NULL COMMENT '任务状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1fu1amroa8n5mma3q9tey7bu9` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_job`
--

LOCK TABLES `e_job` WRITE;
/*!40000 ALTER TABLE `e_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_job_log`
--

DROP TABLE IF EXISTS `e_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `error_info` longtext DEFAULT NULL COMMENT '错误信息',
  `handler_param` varchar(2000) DEFAULT NULL COMMENT '任务参数',
  `result_info` varchar(2000) DEFAULT NULL COMMENT '执行结果',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `status` bit(1) DEFAULT NULL COMMENT '任务状态',
  `job_id` bigint(20) DEFAULT NULL COMMENT '任务名称',
  PRIMARY KEY (`id`),
  KEY `FKcpe22rpge2e4mmuva8l9dtmx0` (`job_id`),
  CONSTRAINT `FKcpe22rpge2e4mmuva8l9dtmx0` FOREIGN KEY (`job_id`) REFERENCES `e_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_job_log`
--

LOCK TABLES `e_job_log` WRITE;
/*!40000 ALTER TABLE `e_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_job_mail`
--

DROP TABLE IF EXISTS `e_job_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_job_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cc` varchar(255) DEFAULT NULL COMMENT '抄送人',
  `content` longtext DEFAULT NULL COMMENT '内容',
  `create_by` varchar(255) DEFAULT NULL COMMENT '发送人',
  `create_time` datetime DEFAULT NULL COMMENT '发送时间',
  `error_info` varchar(5000) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL COMMENT '接收人',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `subject` varchar(255) DEFAULT NULL COMMENT '主题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='发送邮件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_job_mail`
--

LOCK TABLES `e_job_mail` WRITE;
/*!40000 ALTER TABLE `e_job_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_job_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_login_log`
--

DROP TABLE IF EXISTS `e_upms_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) DEFAULT NULL COMMENT '浏览器',
  `device_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `region` varchar(255) DEFAULT NULL COMMENT 'IP来源',
  `system_name` varchar(255) DEFAULT NULL COMMENT '操作系统',
  `token` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_login_log`
--

LOCK TABLES `e_upms_login_log` WRITE;
/*!40000 ALTER TABLE `e_upms_login_log` DISABLE KEYS */;
INSERT INTO `e_upms_login_log` VALUES
(1,'Chrome 12 120','Computer','192.168.0.104','2024-01-21 19:34:29','0|0|0|内网IP|内网IP','Mac OS X','iYzuLnYXfCmmX4je','erupt'),
(2,'Chrome 12 120','Computer','192.168.0.102','2024-01-22 20:17:38','0|0|0|内网IP|内网IP','Mac OS X','W80ILLdUBRKrH3kC','erupt'),
(3,'Chrome 12 120','Computer','192.168.0.102','2024-01-22 22:47:24','0|0|0|内网IP|内网IP','Mac OS X','ucISEAxsEeuXYHHx','erupt'),
(4,'Chrome 12 120','Computer','192.168.0.102','2024-01-22 23:48:56','0|0|0|内网IP|内网IP','Mac OS X','ihy49IWaBOag9NP3','erupt');
/*!40000 ALTER TABLE `e_upms_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_menu`
--

DROP TABLE IF EXISTS `e_upms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `param` varchar(2000) DEFAULT NULL COMMENT '自定义参数',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `type` varchar(255) DEFAULT NULL COMMENT '菜单类型',
  `value` varchar(255) DEFAULT NULL COMMENT '类型值',
  `parent_menu_id` bigint(20) DEFAULT NULL COMMENT '上级菜单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_95xpkppt33d2bka0g2d7rgwqt` (`code`),
  KEY `FK5mkgea183mm02v7ic1pdwxy5s` (`parent_menu_id`),
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_menu`
--

LOCK TABLES `e_upms_menu` WRITE;
/*!40000 ALTER TABLE `e_upms_menu` DISABLE KEYS */;
INSERT INTO `e_upms_menu` VALUES
(1,NULL,'2024-01-21 19:34:13',NULL,NULL,'$NodeManager','fa fa-cloud','微节点管理',NULL,70,1,NULL,NULL,NULL),
(2,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup','','分组配置',NULL,10,1,'tree','CloudNodeGroup',1),
(3,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@ADD',NULL,'新增',NULL,10,1,'button','CloudNodeGroup@ADD',2),
(4,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@EDIT',NULL,'修改',NULL,20,1,'button','CloudNodeGroup@EDIT',2),
(5,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@DELETE',NULL,'删除',NULL,30,1,'button','CloudNodeGroup@DELETE',2),
(6,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','CloudNodeGroup@VIEW_DETAIL',2),
(7,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode','','节点配置',NULL,20,1,'table','CloudNode',1),
(8,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@ADD',NULL,'新增',NULL,10,1,'button','CloudNode@ADD',7),
(9,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@EDIT',NULL,'修改',NULL,20,1,'button','CloudNode@EDIT',7),
(10,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@DELETE',NULL,'删除',NULL,30,1,'button','CloudNode@DELETE',7),
(11,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','CloudNode@VIEW_DETAIL',7),
(12,NULL,'2024-01-21 19:34:13',NULL,NULL,'cloud_access_token_permission',NULL,'查看令牌',NULL,20,1,'button','cloud_access_token_permission',7),
(13,NULL,'2024-01-21 19:34:13',NULL,NULL,'cloud_node_manager_permission',NULL,'节点管理',NULL,30,1,'button','cloud_node_manager_permission',7),
(14,NULL,'2024-01-21 19:34:13',NULL,NULL,'$generator','fa fa-code','代码生成',NULL,40,1,NULL,NULL,NULL),
(15,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass','','生成Erupt代码',NULL,0,1,'table','GeneratorClass',14),
(16,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@ADD',NULL,'新增',NULL,10,1,'button','GeneratorClass@ADD',15),
(17,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@EDIT',NULL,'修改',NULL,20,1,'button','GeneratorClass@EDIT',15),
(18,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@DELETE',NULL,'删除',NULL,30,1,'button','GeneratorClass@DELETE',15),
(19,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','GeneratorClass@VIEW_DETAIL',15),
(20,NULL,'2024-01-21 19:34:13',NULL,NULL,'$job','fa fa-cubes','任务管理',NULL,30,1,NULL,NULL,NULL),
(21,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob','','任务维护',NULL,0,1,'table','EruptJob',20),
(22,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@ADD',NULL,'新增',NULL,10,1,'button','EruptJob@ADD',21),
(23,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@EDIT',NULL,'修改',NULL,20,1,'button','EruptJob@EDIT',21),
(24,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@DELETE',NULL,'删除',NULL,30,1,'button','EruptJob@DELETE',21),
(25,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptJob@VIEW_DETAIL',21),
(26,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJobLog','','任务日志',NULL,10,1,'table','EruptJobLog',20),
(27,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJobLog@DELETE',NULL,'删除',NULL,10,1,'button','EruptJobLog@DELETE',26),
(28,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJobLog@EXPORT',NULL,'导出',NULL,20,1,'button','EruptJobLog@EXPORT',26),
(29,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail','','发送邮件',NULL,20,1,'table','EruptMail',20),
(30,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail@ADD',NULL,'新增',NULL,10,1,'button','EruptMail@ADD',29),
(31,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail@DELETE',NULL,'删除',NULL,20,1,'button','EruptMail@DELETE',29),
(32,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail@VIEW_DETAIL',NULL,'详情',NULL,30,1,'button','EruptMail@VIEW_DETAIL',29),
(33,NULL,'2024-01-21 19:34:13',NULL,NULL,'monitor','fa fa-bullseye','系统监控',NULL,10,1,NULL,NULL,NULL),
(34,NULL,'2024-01-21 19:34:13',NULL,NULL,'server.html',NULL,'服务监控',NULL,10,1,'tpl','server.html',33),
(35,NULL,'2024-01-21 19:34:13',NULL,NULL,'redis.html',NULL,'缓存监控',NULL,20,1,'tpl','redis.html',33),
(36,NULL,'2024-01-21 19:34:13',NULL,NULL,'$manager','fa fa-cogs','系统管理',NULL,1,1,NULL,NULL,NULL),
(37,NULL,'2024-01-21 19:34:13',NULL,NULL,'$home','fa fa-home','首页',NULL,0,1,'router','/',NULL),
(38,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu','','菜单管理',NULL,0,1,'tree','EruptMenu',36),
(39,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@ADD',NULL,'新增',NULL,10,1,'button','EruptMenu@ADD',38),
(40,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@EDIT',NULL,'修改',NULL,20,1,'button','EruptMenu@EDIT',38),
(41,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@DELETE',NULL,'删除',NULL,30,1,'button','EruptMenu@DELETE',38),
(42,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptMenu@VIEW_DETAIL',38),
(43,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole','','角色管理',NULL,10,1,'table','EruptRole',36),
(44,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@ADD',NULL,'新增',NULL,10,1,'button','EruptRole@ADD',43),
(45,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@EDIT',NULL,'修改',NULL,20,1,'button','EruptRole@EDIT',43),
(46,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@DELETE',NULL,'删除',NULL,30,1,'button','EruptRole@DELETE',43),
(47,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptRole@VIEW_DETAIL',43),
(48,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg','','组织维护',NULL,20,1,'tree','EruptOrg',36),
(49,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@ADD',NULL,'新增',NULL,10,1,'button','EruptOrg@ADD',48),
(50,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@EDIT',NULL,'修改',NULL,20,1,'button','EruptOrg@EDIT',48),
(51,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@DELETE',NULL,'删除',NULL,30,1,'button','EruptOrg@DELETE',48),
(52,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptOrg@VIEW_DETAIL',48),
(53,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost','','岗位维护',NULL,30,1,'tree','EruptPost',36),
(54,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@ADD',NULL,'新增',NULL,10,1,'button','EruptPost@ADD',53),
(55,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@EDIT',NULL,'修改',NULL,20,1,'button','EruptPost@EDIT',53),
(56,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@DELETE',NULL,'删除',NULL,30,1,'button','EruptPost@DELETE',53),
(57,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptPost@VIEW_DETAIL',53),
(58,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser','','用户配置',NULL,40,1,'table','EruptUser',36),
(59,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@ADD',NULL,'新增',NULL,10,1,'button','EruptUser@ADD',58),
(60,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@EDIT',NULL,'修改',NULL,20,1,'button','EruptUser@EDIT',58),
(61,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@DELETE',NULL,'删除',NULL,30,1,'button','EruptUser@DELETE',58),
(62,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptUser@VIEW_DETAIL',58),
(63,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict','','数据字典',NULL,50,1,'table','EruptDict',36),
(64,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@ADD',NULL,'新增',NULL,10,1,'button','EruptDict@ADD',63),
(65,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@EDIT',NULL,'修改',NULL,20,1,'button','EruptDict@EDIT',63),
(66,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@DELETE',NULL,'删除',NULL,30,1,'button','EruptDict@DELETE',63),
(67,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDict@EXPORT',63),
(68,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@VIEW_DETAIL',NULL,'详情',NULL,50,1,'button','EruptDict@VIEW_DETAIL',63),
(69,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem','','字典项',NULL,60,2,'table','EruptDictItem',36),
(70,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@ADD',NULL,'新增',NULL,10,1,'button','EruptDictItem@ADD',69),
(71,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@EDIT',NULL,'修改',NULL,20,1,'button','EruptDictItem@EDIT',69),
(72,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@DELETE',NULL,'删除',NULL,30,1,'button','EruptDictItem@DELETE',69),
(73,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDictItem@EXPORT',69),
(74,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@IMPORTABLE',NULL,'导入',NULL,50,1,'button','EruptDictItem@IMPORTABLE',69),
(75,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@VIEW_DETAIL',NULL,'详情',NULL,60,1,'button','EruptDictItem@VIEW_DETAIL',69),
(76,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOnline','','在线用户',NULL,65,1,'table','EruptOnline',36),
(77,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOnline@EXPORT',NULL,'导出',NULL,10,1,'button','EruptOnline@EXPORT',76),
(78,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptLoginLog','','登录日志',NULL,70,1,'table','EruptLoginLog',36),
(79,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptLoginLog@EXPORT',NULL,'导出',NULL,10,1,'button','EruptLoginLog@EXPORT',78),
(80,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOperateLog','','操作日志',NULL,80,1,'table','EruptOperateLog',36),
(81,'erupt','2024-01-21 19:35:43','erupt','2024-01-21 19:35:43','AvNxK1IX',NULL,'班级管理',NULL,90,1,'table','Clazz',NULL),
(82,NULL,'2024-01-21 19:35:43',NULL,NULL,'U1Q90Vtn',NULL,'新增',NULL,10,1,'button','Clazz@ADD',81),
(83,NULL,'2024-01-21 19:35:43',NULL,NULL,'QWhD7SSQ',NULL,'修改',NULL,20,1,'button','Clazz@EDIT',81),
(84,NULL,'2024-01-21 19:35:43',NULL,NULL,'VVWdLOjk',NULL,'删除',NULL,30,1,'button','Clazz@DELETE',81),
(85,NULL,'2024-01-21 19:35:43',NULL,NULL,'eleMHabG',NULL,'导出',NULL,40,1,'button','Clazz@EXPORT',81),
(86,NULL,'2024-01-21 19:35:43',NULL,NULL,'TFqd7IAX',NULL,'导入',NULL,50,1,'button','Clazz@IMPORTABLE',81),
(87,NULL,'2024-01-21 19:35:43',NULL,NULL,'wVA54IPM',NULL,'详情',NULL,60,1,'button','Clazz@VIEW_DETAIL',81),
(88,'erupt','2024-01-21 19:36:18','erupt','2024-01-21 19:36:18','QZ6Gl3ap',NULL,'课程管理',NULL,100,1,'table','Course',NULL),
(89,NULL,'2024-01-21 19:36:18',NULL,NULL,'rtl5H7dA',NULL,'新增',NULL,10,1,'button','Course@ADD',88),
(90,NULL,'2024-01-21 19:36:18',NULL,NULL,'Ye6HIoMH',NULL,'修改',NULL,20,1,'button','Course@EDIT',88),
(91,NULL,'2024-01-21 19:36:18',NULL,NULL,'i7ND2WGv',NULL,'删除',NULL,30,1,'button','Course@DELETE',88),
(92,NULL,'2024-01-21 19:36:18',NULL,NULL,'YUmHKGW3',NULL,'导出',NULL,40,1,'button','Course@EXPORT',88),
(93,NULL,'2024-01-21 19:36:18',NULL,NULL,'ppzorWrQ',NULL,'导入',NULL,50,1,'button','Course@IMPORTABLE',88),
(94,NULL,'2024-01-21 19:36:18',NULL,NULL,'aQdSYUjN',NULL,'详情',NULL,60,1,'button','Course@VIEW_DETAIL',88),
(95,'erupt','2024-01-21 19:36:40','erupt','2024-01-21 19:36:40','1FlLfNsu',NULL,'成绩管理',NULL,110,1,'table','Score',NULL),
(96,NULL,'2024-01-21 19:36:40',NULL,NULL,'oS59KZnO',NULL,'新增',NULL,10,1,'button','Score@ADD',95),
(97,NULL,'2024-01-21 19:36:40',NULL,NULL,'FEKef3n2',NULL,'修改',NULL,20,1,'button','Score@EDIT',95),
(98,NULL,'2024-01-21 19:36:40',NULL,NULL,'yT8LpbeY',NULL,'删除',NULL,30,1,'button','Score@DELETE',95),
(99,NULL,'2024-01-21 19:36:40',NULL,NULL,'tq4vby2G',NULL,'导出',NULL,40,1,'button','Score@EXPORT',95),
(100,NULL,'2024-01-21 19:36:40',NULL,NULL,'nz9Swlmk',NULL,'导入',NULL,50,1,'button','Score@IMPORTABLE',95),
(101,NULL,'2024-01-21 19:36:40',NULL,NULL,'rXwd3YAP',NULL,'详情',NULL,60,1,'button','Score@VIEW_DETAIL',95),
(102,'erupt','2024-01-21 19:37:02','erupt','2024-01-21 19:37:02','q3Dr21lA',NULL,'学生管理',NULL,120,1,'table','Student',NULL),
(103,NULL,'2024-01-21 19:37:02',NULL,NULL,'smfr99O0',NULL,'新增',NULL,10,1,'button','Student@ADD',102),
(104,NULL,'2024-01-21 19:37:02',NULL,NULL,'YjVDewRs',NULL,'修改',NULL,20,1,'button','Student@EDIT',102),
(105,NULL,'2024-01-21 19:37:02',NULL,NULL,'cdrOSKx7',NULL,'删除',NULL,30,1,'button','Student@DELETE',102),
(106,NULL,'2024-01-21 19:37:02',NULL,NULL,'B1y3SXjn',NULL,'导出',NULL,40,1,'button','Student@EXPORT',102),
(107,NULL,'2024-01-21 19:37:02',NULL,NULL,'5V8UfHFm',NULL,'导入',NULL,50,1,'button','Student@IMPORTABLE',102),
(108,NULL,'2024-01-21 19:37:02',NULL,NULL,'DPEuDJOb',NULL,'详情',NULL,60,1,'button','Student@VIEW_DETAIL',102),
(109,'erupt','2024-01-21 19:37:58','erupt','2024-01-21 19:37:58','4AANRCuQ',NULL,'文章管理',NULL,130,1,'table','Article',NULL),
(110,NULL,'2024-01-21 19:37:58',NULL,NULL,'ICAiiSqp',NULL,'新增',NULL,10,1,'button','Article@ADD',109),
(111,NULL,'2024-01-21 19:37:58',NULL,NULL,'H5FvPZE2',NULL,'修改',NULL,20,1,'button','Article@EDIT',109),
(112,NULL,'2024-01-21 19:37:58',NULL,NULL,'75t4tKKN',NULL,'删除',NULL,30,1,'button','Article@DELETE',109),
(113,NULL,'2024-01-21 19:37:58',NULL,NULL,'gCXjG2zg',NULL,'导出',NULL,40,1,'button','Article@EXPORT',109),
(114,NULL,'2024-01-21 19:37:58',NULL,NULL,'0XewWoZY',NULL,'导入',NULL,50,1,'button','Article@IMPORTABLE',109),
(115,NULL,'2024-01-21 19:37:58',NULL,NULL,'ZTs1uqp0',NULL,'详情',NULL,60,1,'button','Article@VIEW_DETAIL',109),
(116,'erupt','2024-01-21 19:38:12','erupt','2024-01-21 19:38:12','GSMsmPye',NULL,'教师管理',NULL,140,1,'table','Teacher',NULL),
(117,NULL,'2024-01-21 19:38:12',NULL,NULL,'psmsTsol',NULL,'新增',NULL,10,1,'button','Teacher@ADD',116),
(118,NULL,'2024-01-21 19:38:12',NULL,NULL,'ztQaTSNH',NULL,'修改',NULL,20,1,'button','Teacher@EDIT',116),
(119,NULL,'2024-01-21 19:38:12',NULL,NULL,'Cm9bYa8l',NULL,'删除',NULL,30,1,'button','Teacher@DELETE',116),
(120,NULL,'2024-01-21 19:38:12',NULL,NULL,'9PtfP4M9',NULL,'导出',NULL,40,1,'button','Teacher@EXPORT',116),
(121,NULL,'2024-01-21 19:38:12',NULL,NULL,'T4eqVjOR',NULL,'导入',NULL,50,1,'button','Teacher@IMPORTABLE',116),
(122,NULL,'2024-01-21 19:38:12',NULL,NULL,'7wzrx5E6',NULL,'详情',NULL,60,1,'button','Teacher@VIEW_DETAIL',116),
(123,'erupt','2024-01-21 19:38:26','erupt','2024-01-21 19:38:26','s0RWF0rR',NULL,'实验管理',NULL,150,1,'table','Lab',NULL),
(124,NULL,'2024-01-21 19:38:26',NULL,NULL,'8IW0HN4C',NULL,'新增',NULL,10,1,'button','Lab@ADD',123),
(125,NULL,'2024-01-21 19:38:26',NULL,NULL,'7iUZJfeR',NULL,'修改',NULL,20,1,'button','Lab@EDIT',123),
(126,NULL,'2024-01-21 19:38:26',NULL,NULL,'3XXuvH6N',NULL,'删除',NULL,30,1,'button','Lab@DELETE',123),
(127,NULL,'2024-01-21 19:38:26',NULL,NULL,'pu3D44Kn',NULL,'详情',NULL,40,1,'button','Lab@VIEW_DETAIL',123),
(128,'erupt','2024-01-21 19:38:41','erupt','2024-01-21 19:38:41','1aQiVZXx',NULL,'前台管理',NULL,160,1,NULL,NULL,NULL),
(129,'erupt','2024-01-21 19:39:25','erupt','2024-01-21 19:39:25','IWU75DC5',NULL,'项目团队',NULL,170,1,'table','DashboardTech',128),
(130,NULL,'2024-01-21 19:39:25',NULL,NULL,'kUQZ7lSE',NULL,'新增',NULL,10,1,'button','DashboardTech@ADD',129),
(131,NULL,'2024-01-21 19:39:25',NULL,NULL,'nPRzpLQd',NULL,'修改',NULL,20,1,'button','DashboardTech@EDIT',129),
(132,NULL,'2024-01-21 19:39:25',NULL,NULL,'G4g2eCcx',NULL,'删除',NULL,30,1,'button','DashboardTech@DELETE',129),
(133,NULL,'2024-01-21 19:39:25',NULL,NULL,'u0btvEdi',NULL,'详情',NULL,40,1,'button','DashboardTech@VIEW_DETAIL',129),
(134,'erupt','2024-01-21 19:39:43','erupt','2024-01-21 19:39:43','ryuQUvta',NULL,'主页',NULL,180,1,'table','DashboardHome',128),
(135,NULL,'2024-01-21 19:39:43',NULL,NULL,'U9YqBveo',NULL,'新增',NULL,10,1,'button','DashboardHome@ADD',134),
(136,NULL,'2024-01-21 19:39:43',NULL,NULL,'mW40dWKP',NULL,'修改',NULL,20,1,'button','DashboardHome@EDIT',134),
(137,NULL,'2024-01-21 19:39:43',NULL,NULL,'f6ZDoE0g',NULL,'删除',NULL,30,1,'button','DashboardHome@DELETE',134),
(138,NULL,'2024-01-21 19:39:43',NULL,NULL,'7xWc4tJI',NULL,'详情',NULL,40,1,'button','DashboardHome@VIEW_DETAIL',134),
(139,'erupt','2024-01-21 19:40:52','erupt','2024-01-21 19:40:52','gDEqEYQ6',NULL,'实验介绍',NULL,190,1,'table','DashboardDescription',128),
(140,NULL,'2024-01-21 19:40:52',NULL,NULL,'o9Gwf4iE',NULL,'新增',NULL,10,1,'button','DashboardDescription@ADD',139),
(141,NULL,'2024-01-21 19:40:52',NULL,NULL,'wITIzS23',NULL,'修改',NULL,20,1,'button','DashboardDescription@EDIT',139),
(142,NULL,'2024-01-21 19:40:52',NULL,NULL,'IFvlfx2x',NULL,'删除',NULL,30,1,'button','DashboardDescription@DELETE',139),
(143,NULL,'2024-01-21 19:40:52',NULL,NULL,'c4eN6FW1',NULL,'详情',NULL,40,1,'button','DashboardDescription@VIEW_DETAIL',139),
(144,'erupt','2024-01-21 19:41:20','erupt','2024-01-21 19:41:20','f2YEmpDU',NULL,'实验必读',NULL,200,1,'table','DashboardNet',128),
(145,NULL,'2024-01-21 19:41:20',NULL,NULL,'e5APPduc',NULL,'新增',NULL,10,1,'button','DashboardNet@ADD',144),
(146,NULL,'2024-01-21 19:41:20',NULL,NULL,'ruCUUw5g',NULL,'修改',NULL,20,1,'button','DashboardNet@EDIT',144),
(147,NULL,'2024-01-21 19:41:20',NULL,NULL,'15jYVANc',NULL,'删除',NULL,30,1,'button','DashboardNet@DELETE',144),
(148,NULL,'2024-01-21 19:41:20',NULL,NULL,'JQVqFYLs',NULL,'详情',NULL,40,1,'button','DashboardNet@VIEW_DETAIL',144),
(149,'erupt','2024-01-21 19:41:54','erupt','2024-01-21 19:41:54','npqvbz2J',NULL,'步骤管理',NULL,210,1,'table','DashboardSteps',128),
(150,NULL,'2024-01-21 19:41:54',NULL,NULL,'VDyeN93j',NULL,'新增',NULL,10,1,'button','DashboardSteps@ADD',149),
(151,NULL,'2024-01-21 19:41:54',NULL,NULL,'6y0zvepz',NULL,'修改',NULL,20,1,'button','DashboardSteps@EDIT',149),
(152,NULL,'2024-01-21 19:41:54',NULL,NULL,'XRpPe0BO',NULL,'删除',NULL,30,1,'button','DashboardSteps@DELETE',149),
(153,NULL,'2024-01-21 19:41:54',NULL,NULL,'bi79B5Pi',NULL,'详情',NULL,40,1,'button','DashboardSteps@VIEW_DETAIL',149),
(154,'erupt','2024-01-21 19:42:26','erupt','2024-01-21 19:42:26','SkV49lWm',NULL,'问题管理',NULL,220,1,'table','Question',NULL),
(155,NULL,'2024-01-21 19:42:26',NULL,NULL,'3CqOHcEr',NULL,'新增',NULL,10,1,'button','Question@ADD',154),
(156,NULL,'2024-01-21 19:42:26',NULL,NULL,'mMnNFjqS',NULL,'修改',NULL,20,1,'button','Question@EDIT',154),
(157,NULL,'2024-01-21 19:42:26',NULL,NULL,'OftTK13A',NULL,'删除',NULL,30,1,'button','Question@DELETE',154),
(158,NULL,'2024-01-21 19:42:26',NULL,NULL,'eh9nKSgt',NULL,'导出',NULL,40,1,'button','Question@EXPORT',154),
(159,NULL,'2024-01-21 19:42:26',NULL,NULL,'IOQvq9d0',NULL,'导入',NULL,50,1,'button','Question@IMPORTABLE',154),
(160,NULL,'2024-01-21 19:42:26',NULL,NULL,'PhLwYCML',NULL,'详情',NULL,60,1,'button','Question@VIEW_DETAIL',154),
(161,'erupt','2024-01-21 19:42:44','erupt','2024-01-21 19:43:11','CKc2427I',NULL,'回答管理',NULL,240,1,'table','Answer',NULL),
(162,NULL,'2024-01-21 19:42:44',NULL,NULL,'Ak0NSbIP',NULL,'新增',NULL,10,1,'button','Answer@ADD',161),
(163,NULL,'2024-01-21 19:42:44',NULL,NULL,'jZ6gTyj7',NULL,'修改',NULL,20,1,'button','Answer@EDIT',161),
(164,NULL,'2024-01-21 19:42:44',NULL,NULL,'SES4l1Uc',NULL,'删除',NULL,30,1,'button','Answer@DELETE',161),
(165,NULL,'2024-01-21 19:42:44',NULL,NULL,'1jU2LwX0',NULL,'导出',NULL,40,1,'button','Answer@EXPORT',161),
(166,NULL,'2024-01-21 19:42:44',NULL,NULL,'0YJcI8f2',NULL,'导入',NULL,50,1,'button','Answer@IMPORTABLE',161),
(167,NULL,'2024-01-21 19:42:44',NULL,NULL,'Fzn1pOM0',NULL,'详情',NULL,60,1,'button','Answer@VIEW_DETAIL',161);
/*!40000 ALTER TABLE `e_upms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_operate_log`
--

DROP TABLE IF EXISTS `e_upms_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `create_time` datetime DEFAULT NULL COMMENT '记录时间',
  `error_info` varchar(4000) DEFAULT NULL COMMENT '错误信息',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `operate_user` varchar(255) DEFAULT NULL COMMENT '操作人',
  `region` varchar(255) DEFAULT NULL COMMENT 'IP来源',
  `req_addr` varchar(4000) DEFAULT NULL COMMENT '请求地址',
  `req_method` varchar(64) DEFAULT NULL COMMENT '请求方法',
  `req_param` longtext DEFAULT NULL COMMENT '请求参数',
  `status` bit(1) DEFAULT NULL COMMENT '是否成功',
  `total_time` bigint(20) DEFAULT NULL COMMENT '请求耗时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_operate_log`
--

LOCK TABLES `e_upms_operate_log` WRITE;
/*!40000 ALTER TABLE `e_upms_operate_log` DISABLE KEYS */;
INSERT INTO `e_upms_operate_log` VALUES
(1,'INSERT | 菜单管理','2024-01-21 19:35:43',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"班级管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Clazz\",\"sort\":90}','',71),
(2,'INSERT | 菜单管理','2024-01-21 19:36:18',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"课程管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Course\",\"sort\":100}','',44),
(3,'INSERT | 菜单管理','2024-01-21 19:36:40',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"成绩管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Score\",\"sort\":110}','',47),
(4,'INSERT | 菜单管理','2024-01-21 19:37:02',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"学生管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Student\",\"sort\":120}','',46),
(5,'INSERT | 菜单管理','2024-01-21 19:37:58',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"文章管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Article\",\"sort\":130}','',38),
(6,'INSERT | 菜单管理','2024-01-21 19:38:12',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"教师管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Teacher\",\"sort\":140}','',41),
(7,'INSERT | 菜单管理','2024-01-21 19:38:26',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"实验管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Lab\",\"sort\":150}','',44),
(8,'INSERT | 菜单管理','2024-01-21 19:38:41',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"前台管理\",\"status\":\"1\",\"sort\":160}','',56),
(9,'INSERT | 菜单管理','2024-01-21 19:39:25',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"项目团队\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardTech\",\"sort\":170}','',25),
(10,'INSERT | 菜单管理','2024-01-21 19:39:43',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"主页\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardHome\",\"sort\":180}','',42),
(11,'INSERT | 菜单管理','2024-01-21 19:40:52',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"实验介绍\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardDescription\",\"sort\":190}','',24),
(12,'INSERT | 菜单管理','2024-01-21 19:41:20',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"实验必读\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardNet\",\"sort\":200}','',32),
(13,'INSERT | 菜单管理','2024-01-21 19:41:54',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"步骤管理\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardSteps\",\"sort\":210}','',32),
(14,'INSERT | 菜单管理','2024-01-21 19:42:26',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"问题管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Question\",\"sort\":220}','',41),
(15,'INSERT | 菜单管理','2024-01-21 19:42:44',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"回答管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Answer\"}','',32),
(16,'UPDATE | 菜单管理','2024-01-21 19:43:11',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu/update','POST','{\"name\":\"回答管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Answer\",\"sort\":240,\"code\":\"CKc2427I\",\"id\":\"161\"}','',34),
(17,'INSERT | 项目团队','2024-01-22 20:21:16',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech','POST','{\"situatioone\":\"          贾志超 男 965-10-01\\n          学历：博士研究生学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任：电子信息与人工智能学院地址：陕西科技大学 \\n          电话：xxx-xxxxx手机：1331111111电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\"}','',78),
(18,'INSERT | 主页','2024-01-22 20:24:34',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardHome','POST','{\"cnName\":\"虚拟仿真平合网络实验\",\"enName\":\"VIRTUAL SIMULATION FLAT NETWORK EXPERIMENT\",\"colThree\":\"实验步骤：55步   实验学时：4学时  所属分类：眼镜材料学\",\"introduction\":\"眼睛是心灵的窗户”，人类80%的知识都通过视觉感知后获得。社会和科技的进步以及人类对视觉健康及视力改善的追求，推动了眼镜从传统近视和老花等矫正眼镜，到能够防紫外和蓝光的功能眼镜，再到虚拟现实增强的各类智能眼镜的进步与发展。可以说眼镜作为一类光学器件，已进入到人们生活和工作的方方面面。特别是电子信息时代成长起来的青少年，视力的健康关乎国家和未来，习近平总书记多次对近视防控做出重要指示批示，要求“全社会都要行动起来，共同呵护好孩子的眼睛。光学镜片结构复杂，其设计、生产的关键材料和核心技术由国外把持，行业现状是受制于人。党的二十大报告做出了“加快实现高水平科技自立自强”重大部署，强调“教育、科技、人才是全面建设社会主义现代化国家的基础性、战略性支撑”。为此，视光行业及专业领域针对国内生产工艺繁复、龙头企业镜片产品开发能力弱等问题，开展了产业链布局调整，高品质镜片的研发及人才需求激增。\"}','',15),
(19,'UPDATE | 项目团队','2024-01-22 22:47:50',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech/update','POST','{\"situatioone\":\"          贾志超 男 965-10-01\\n          学历：博士研究生学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任：电子信息与人工智能学院地址：陕西科技大学 \\n          电话：xxx-xxxxx手机：1331111111电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\",\"createBy\":\"erupt\",\"createTime\":\"2024-01-22 20:21:16\",\"updateBy\":\"erupt\",\"updateTime\":\"2024-01-22 20:21:16\",\"id\":\"1\"}','',95),
(20,'UPDATE | 项目团队','2024-01-22 22:51:41',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech/update','POST','{\"situatioone\":\"          贾志超 男 1965-10-01\\n          学历：博士研究生\\n          学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任：电子信息与人工智能学院\\n          地址：陕西科技大学 \\n          电话：xxx-xxxxx\\n          手机：1331111111\\n          电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\",\"createBy\":\"erupt\",\"createTime\":\"2024-01-22 20:21:16\",\"updateBy\":\"erupt\",\"updateTime\":\"2024-01-22 22:47:50\",\"id\":\"1\"}','',16),
(21,'INSERT | 实验介绍','2024-01-22 22:58:40',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardDescription','POST','{\"suzhimubiao\":\"培养学生遵守科学伦理，社会责任感和节能环保意识，在工程实践中遵守职业道德规范和践行社会主义核心价值观。\",\"zhishimubiao\":\"掌握光学镜片工厂化生产的先进工艺流程，掌握各工艺流程中的技术要点，掌握相关设备的使用方法。\",\"nenglimubiao\":\"评价光学镜片的设计过程、生产过程和最终结果，具有解决复杂问题的工程实践能力和数字化能力。\",\"yuanlione\":\"在室温下，将液态预聚体（单体、引发剂、紫外光吸收剂、抗氧剂、添加剂）经过预聚合达到一定粘度，并经过真空脱气之后注入到已装配好的模具中。再将浇注完成的模具放入烘箱中，恒温10小时以上，使其聚合固化成型，得到半成品镜片。\",\"yuanlitwo\":\"半成品树脂镜片质地软，需要增加基本膜层和各种功能膜。基本膜层有两种：一是加硬膜层，常采用涂敷法获得，即把镜片浸在加硬液中，以一定速度提升镜片架，使镜片表面涂敷一层一定厚度的均匀加硬液，然后加热固化；二是增透膜层，常采用溅射法获得，即将镜片放入真空腔，用高能粒子轰击靶材，使靶材原子飞到镜片表面，沉积在镜片表面形成薄膜。功能膜层（抗磨损膜、防蓝光膜层、防雾膜、防眩光膜，偏光膜、染色膜层）也常常被添加到镜片表面，使得镜片能满足不同应用场景的需求。\",\"jieguo\":\"记录每步实验结果：是\\n\\n实验结果与结论要求：实验报告\\n\\n其他描述：\\n\\n北斗卫星导航定位虚拟仿真实验的实验过程流程如图所示，进入实验主入口后分为四个实验模块进行，每个模块有对应的多路径实验条件设计或不同的实验操作，产生不同的实验结果。具体为：\\n\\n北斗图3.jpg\\n\\n实验模块一：北斗卫星导航系统，在虚拟仿真实验中学习认知北斗系统空间段、地面段、用户段，利用鼠标交互操作会有不同的实验现象和结果；\\n\\n实验模块二：北斗伪距定位算法，在实验多路径条件（选星、设置初始位值）下，会产生不同的迭代过程和定位实验结果（不同精度下）；\\n\\n实验模块三：北斗定位性能研究，探索在微波暗室实验多路径条件下（无环境无干扰、有环境无干扰、无环境有干扰），产生不同的定位实验结果，学生需综合所有实验结果，得到复杂电磁环境对定位性能影响的规律。\\n\\n实验模块四：北斗接收机实验，利用鼠标交互操作学习北斗卫星导航信号的产生、传输和接收及接收机原理，利用鼠标交互搭建接收机，并构建接收机定位实验系统，分析接收机定位性能。利用鼠标交互操作会有不同的实验现象和结果。\\n\\n     具体的实验主要结果如下：\\n\\n实验一：北斗卫星导航系统\\n\\n通过拖拽交互式的实验操作过程，使学生正确构建北斗卫星导航定位通信系统，并能建立起系统的正确的通信流程，培养学生的通信系统观，当学生在构建系统拖拽交互操作有误时，系统的完整通信流程无法建立，需要学生重新规划系统组成、重新构建系统，或者通过返回重新学习相关实验内容，再进行交互式拖拽实验，直至正确构建系统及其通信过程，至此完成该交互操作步骤，继续学习手持和车载终端的定位功能实现。\\n\\n实验二：伪距定位算法实验\\n\\n本实验给出6颗卫星的伪距数据和坐标数据，通过让学生选择其中任意4颗卫星（共15种组合），可利用伪距定位算法计算出待定位点在三维空间的位置坐标。\\n\\n当选择不同的4颗卫星组合时，计算的最终结果有微小差别（因卫星的几何构型不同，学生可以分析各种定位结果的差别原因），下面简单列举选择两种卫星组合情况下的计算结果。\\n\\n（1）选择1、2、3、4号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709563.7809, 4992760.1894, 3570929.1965)，单位为m。\\n\\n（2）选择3、4、5、6号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709564.447, 4992761.0408, 3570849.798)，单位为m。\\n\\n实验三：北斗定位性能研究实验\\n\\n在采用标准接收机的条件下，研究同频干扰信号和大气环境因素（电离层和对流层）对定位精度的影响：\\n\\n（1）无环境和无干扰测试条件下，接收机具有较高定位精度，在定位精度展示中可以看到点之间偏离小且集中，在定位结果展示上的观察到可用星数量较多，且接收到的各卫星信号具有较好的载噪比。\\n\\n（2）在有环境且无干扰的测试条件下，如电离层或对流层的大气空间环境影响，相比于无环境影响，定位精度降低，显示在定位精度动态展示中，定位点离散程度较大，定位展示中可用星数量减少，载噪比略降低。\\n\\n（3）在无环境且有干扰的测试条件下，增大同频干扰信号的强度,从-140dBm到-60dBm，以20dBm为间隔，发现接收机定位精度逐渐下降，在定位精度展示上，定位点分散程度变大，且各卫星信号的载噪比下降。当干扰信号功率增大到一定值时，为-60dBm，可见星数量下降为渐减少为5颗，可用星数量为0，最终无法定位。              \\n\\n实验四：北斗接收机定位实验\\n\\n（1）在频谱仪上观测导航信号特性参数\"}','',30),
(22,'INSERT | 实验必读','2024-01-22 23:09:33',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardNet','POST','{\"wangluoyaoqiu\":\"说明客户端到服务器的带宽要求（需提供测试带宽服务）：>50Mb/s 说明能够提供的并发相应数量（需提供在线排队提示服务）：100\",\"yingjianyaoqiu\":\"计算机硬件配置要求：CPU： 最低配置：Intel Core i5-7400 同等或更高配置； 推荐配置：Intel Core i7-9700k 同等或更高配置; 内存： 最低配置：8GB； 推荐配置：16GB 及以上； 显卡（图形处理器）： 最低配置：NVIDIA GeForce GTX 960/AMD Radeon R9 290同等或更高配置； 推荐配置：NVIDIA GeForce GTX 1060/AMD Radeon RX 480同等或更高配置； 存储容量： 最低剩余空间：10GB。 推荐剩余空间：40GB 及以上。\",\"caozuoxitongyaoqiu\":\"计算机操作系统和版本要求：Windows 7及以上 其他计算机终端操作系统和版本要求：无 支持移动端：否\"}','',13),
(23,'UPDATE | 项目团队','2024-01-22 23:32:53',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech/update','POST','{\"situatioone\":\"          贾志超 男 1965-10-01\\n          学历：博士研究生\\n          学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任\\n          学院：电子信息与人工智能学院\\n          地址：陕西科技大学 \\n          电话：xxx-xxxxx\\n          手机：1331111111\\n          电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\",\"createBy\":\"erupt\",\"createTime\":\"2024-01-22 20:21:16\",\"updateBy\":\"erupt\",\"updateTime\":\"2024-01-22 22:51:41\",\"id\":\"1\"}','',17),
(24,'INSERT | 教师管理','2024-01-22 23:57:18',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Teacher','POST','{\"teacherName\":\"t01\",\"gender\":false,\"teacherNo\":\"t01\",\"tel\":\"15195355289\"}','',29),
(25,'INSERT | 班级管理','2024-01-22 23:57:32',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Clazz','POST','{\"clazzNo\":\"c01\",\"name\":\"c01\",\"clazzDesc\":\"c01\",\"clazzTeacher\":\"1\"}','',10),
(26,'INSERT | 课程管理','2024-01-22 23:57:52',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Course','POST','{\"courseNo\":\"cc01\",\"name\":\"cc01\",\"courseHour\":45,\"courseDesc\":\"cc01\",\"courseActive\":true}','',11),
(27,'INSERT | 成绩管理','2024-01-22 23:58:07',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Score','POST','{\"courseNo\":\"1\",\"studentNo\":\"1\",\"teacherNo\":\"1\",\"mark1\":45,\"report\":\"\",\"mark2\":34,\"mark\":67}','',8);
/*!40000 ALTER TABLE `e_upms_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_org`
--

DROP TABLE IF EXISTS `e_upms_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '组织编码',
  `name` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `parent_org_id` bigint(20) DEFAULT NULL COMMENT '上级组织',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c2wj35ujq2m84uw59dx6wy3gj` (`code`),
  KEY `FKtj7222kjnkt7pv9kfn9g8ck4h` (`parent_org_id`),
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='组织维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_org`
--

LOCK TABLES `e_upms_org` WRITE;
/*!40000 ALTER TABLE `e_upms_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_post`
--

DROP TABLE IF EXISTS `e_upms_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '岗位编码',
  `name` varchar(255) DEFAULT NULL COMMENT '岗位名称',
  `weight` int(11) DEFAULT NULL COMMENT '岗位权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ltq5h3n5cyyk5nxtjhg9lhidg` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_post`
--

LOCK TABLES `e_upms_post` WRITE;
/*!40000 ALTER TABLE `e_upms_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_role`
--

DROP TABLE IF EXISTS `e_upms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jgxkp7mr4183tcwosrbqpsl3a` (`code`),
  KEY `FKad39xpgtpmhq0fp5newnabv1g` (`create_user_id`),
  KEY `FKbghup2p4f1x9eokeygyg8p658` (`update_user_id`),
  CONSTRAINT `FKad39xpgtpmhq0fp5newnabv1g` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKbghup2p4f1x9eokeygyg8p658` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_role`
--

LOCK TABLES `e_upms_role` WRITE;
/*!40000 ALTER TABLE `e_upms_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_role_menu`
--

DROP TABLE IF EXISTS `e_upms_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FKr6bl403chgwjnb6jk0uqqd9x8` (`menu_id`),
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`),
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_role_menu`
--

LOCK TABLES `e_upms_role_menu` WRITE;
/*!40000 ALTER TABLE `e_upms_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_user`
--

DROP TABLE IF EXISTS `e_upms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) DEFAULT NULL COMMENT '用户名',
  `is_admin` bit(1) DEFAULT NULL COMMENT '超管用户',
  `status` bit(1) DEFAULT NULL COMMENT '账户状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `expire_date` datetime DEFAULT NULL COMMENT '账号失效时间',
  `is_md5` bit(1) DEFAULT NULL COMMENT 'md5加密',
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `reset_pwd_time` datetime DEFAULT NULL COMMENT '重置密码时间',
  `white_ip` varchar(2000) DEFAULT NULL COMMENT 'ip白名单',
  `erupt_org_id` bigint(20) DEFAULT NULL COMMENT '所属组织',
  `erupt_post_id` bigint(20) DEFAULT NULL COMMENT '岗位',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL,
  `erupt_menu_id` bigint(20) DEFAULT NULL COMMENT '首页菜单',
  PRIMARY KEY (`id`),
  KEY `FK1re8jv3614mkk2wfxscvgvmnm` (`erupt_org_id`),
  KEY `FK53cice19aydjcuykpv847ocdv` (`erupt_post_id`),
  KEY `FKdvwfw4x66ahh1tavd69cnx4i0` (`create_user_id`),
  KEY `FKct3f9stm4eti10401f7rbh5ey` (`update_user_id`),
  KEY `FKga0jd7sahnn1tv14mq4dy5kba` (`erupt_menu_id`),
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`),
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`),
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='简单用户对象';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_user`
--

LOCK TABLES `e_upms_user` WRITE;
/*!40000 ALTER TABLE `e_upms_user` DISABLE KEYS */;
INSERT INTO `e_upms_user` VALUES
(1,'erupt','erupt','','','2024-01-21 19:34:13',NULL,NULL,NULL,'','c2610f901735286e712ef0a11df1535b',NULL,NULL,'2024-01-21 19:34:35',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `e_upms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_user_role`
--

DROP TABLE IF EXISTS `e_upms_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FKes2ylim5w3ej690ss84sb956x` (`user_id`),
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`),
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_user_role`
--

LOCK TABLES `e_upms_user_role` WRITE;
/*!40000 ALTER TABLE `e_upms_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods`
--

DROP TABLE IF EXISTS `mall_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` longtext DEFAULT NULL COMMENT '商品描述',
  `freight` double DEFAULT NULL COMMENT '运费',
  `image` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `status` bit(1) DEFAULT NULL COMMENT '商品状态',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL COMMENT '所属分类',
  PRIMARY KEY (`id`),
  KEY `FKfe3euswjprba9xxhgauis0te0` (`create_user_id`),
  KEY `FKa5c9s7iw1qnmdksudlplnsdbp` (`update_user_id`),
  KEY `FKt37gxywk0mov7wuq2vgw64xqb` (`category_id`),
  CONSTRAINT `FKa5c9s7iw1qnmdksudlplnsdbp` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKfe3euswjprba9xxhgauis0te0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKt37gxywk0mov7wuq2vgw64xqb` FOREIGN KEY (`category_id`) REFERENCES `mall_goods_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods`
--

LOCK TABLES `mall_goods` WRITE;
/*!40000 ALTER TABLE `mall_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods_category`
--

DROP TABLE IF EXISTS `mall_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `name` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`id`),
  KEY `FK325iutetrm4xdpbfh7id4iy2e` (`parent_id`),
  CONSTRAINT `FK325iutetrm4xdpbfh7id4iy2e` FOREIGN KEY (`parent_id`) REFERENCES `mall_goods_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods_category`
--

LOCK TABLES `mall_goods_category` WRITE;
/*!40000 ALTER TABLE `mall_goods_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods_coupon`
--

DROP TABLE IF EXISTS `mall_goods_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `end_time` datetime DEFAULT NULL COMMENT '失效时间',
  `max_count` int(11) DEFAULT NULL COMMENT '发行量',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `price` double DEFAULT NULL COMMENT '金额',
  `price_max` double DEFAULT NULL COMMENT '商品金额满多少可用',
  `start_time` datetime DEFAULT NULL COMMENT '生效时间',
  `category_id` bigint(20) DEFAULT NULL COMMENT '指定类别商品可用',
  PRIMARY KEY (`id`),
  KEY `FKkkdn4mcu5n45ve967arj1ou0q` (`category_id`),
  CONSTRAINT `FKkkdn4mcu5n45ve967arj1ou0q` FOREIGN KEY (`category_id`) REFERENCES `mall_goods_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='优惠券管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods_coupon`
--

LOCK TABLES `mall_goods_coupon` WRITE;
/*!40000 ALTER TABLE `mall_goods_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods_spec`
--

DROP TABLE IF EXISTS `mall_goods_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory` int(11) DEFAULT NULL COMMENT '库存',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `goods_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpa4p510o1pud1wdlgb2aub29t` (`goods_id`),
  CONSTRAINT `FKpa4p510o1pud1wdlgb2aub29t` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品型号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods_spec`
--

LOCK TABLES `mall_goods_spec` WRITE;
/*!40000 ALTER TABLE `mall_goods_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_answer`
--

DROP TABLE IF EXISTS `t_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content` longtext DEFAULT NULL COMMENT '回答内容',
  `question_id` bigint(20) DEFAULT NULL COMMENT '问题标题',
  `upvote_count` bigint(20) DEFAULT NULL COMMENT '点赞次数',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='回答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_answer`
--

LOCK TABLES `t_answer` WRITE;
/*!40000 ALTER TABLE `t_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_clazz`
--

DROP TABLE IF EXISTS `t_clazz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_clazz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clazz_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `clazz_no` varchar(255) DEFAULT NULL COMMENT '班级编号',
  `clazz_teacher` varchar(255) DEFAULT NULL COMMENT '班主任',
  `name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkbod6sraf09033e31lnoauyea` (`clazz_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='班级管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_clazz`
--

LOCK TABLES `t_clazz` WRITE;
/*!40000 ALTER TABLE `t_clazz` DISABLE KEYS */;
INSERT INTO `t_clazz` VALUES
(1,'c01','c01','1','c01');
/*!40000 ALTER TABLE `t_clazz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course`
--

DROP TABLE IF EXISTS `t_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_active` bit(1) DEFAULT NULL COMMENT '状态',
  `course_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `course_hour` int(11) DEFAULT NULL COMMENT '时长',
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKeah0vjfkol37wi79w6ih2tc11` (`course_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course`
--

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
INSERT INTO `t_course` VALUES
(1,'','cc01',45,'cc01','cc01');
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course_student`
--

DROP TABLE IF EXISTS `t_course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `mark` int(11) DEFAULT NULL COMMENT '总成绩',
  `student_no` varchar(255) DEFAULT NULL COMMENT '学生编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgx6a9b2tsbng1iwq2hv0uen82` (`student_no`,`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程-学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course_student`
--

LOCK TABLES `t_course_student` WRITE;
/*!40000 ALTER TABLE `t_course_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course_teacher`
--

DROP TABLE IF EXISTS `t_course_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course_teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `teacher_no` varchar(255) DEFAULT NULL COMMENT '教师编号',
  `teaching_date` datetime DEFAULT NULL COMMENT '授课日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK70bktmstrfgciylpn321u6d0v` (`teacher_no`,`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程-教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course_teacher`
--

LOCK TABLES `t_course_teacher` WRITE;
/*!40000 ALTER TABLE `t_course_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_course_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_description`
--

DROP TABLE IF EXISTS `t_dashboard_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_description` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `jieguo` longtext DEFAULT NULL COMMENT '结果与结论',
  `nenglimubiao` longtext DEFAULT NULL COMMENT '能力目标',
  `suzhimubiao` longtext DEFAULT NULL COMMENT '素质目标',
  `yuanlione` longtext DEFAULT NULL COMMENT '实验原理1',
  `yuanlitwo` longtext DEFAULT NULL COMMENT '实验原理2',
  `zhishimubiao` longtext DEFAULT NULL COMMENT '知识目标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验介绍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_description`
--

LOCK TABLES `t_dashboard_description` WRITE;
/*!40000 ALTER TABLE `t_dashboard_description` DISABLE KEYS */;
INSERT INTO `t_dashboard_description` VALUES
(1,'erupt','2024-01-22 22:58:40','erupt','2024-01-22 22:58:40','记录每步实验结果：是\n\n实验结果与结论要求：实验报告\n\n其他描述：\n\n北斗卫星导航定位虚拟仿真实验的实验过程流程如图所示，进入实验主入口后分为四个实验模块进行，每个模块有对应的多路径实验条件设计或不同的实验操作，产生不同的实验结果。具体为：\n\n北斗图3.jpg\n\n实验模块一：北斗卫星导航系统，在虚拟仿真实验中学习认知北斗系统空间段、地面段、用户段，利用鼠标交互操作会有不同的实验现象和结果；\n\n实验模块二：北斗伪距定位算法，在实验多路径条件（选星、设置初始位值）下，会产生不同的迭代过程和定位实验结果（不同精度下）；\n\n实验模块三：北斗定位性能研究，探索在微波暗室实验多路径条件下（无环境无干扰、有环境无干扰、无环境有干扰），产生不同的定位实验结果，学生需综合所有实验结果，得到复杂电磁环境对定位性能影响的规律。\n\n实验模块四：北斗接收机实验，利用鼠标交互操作学习北斗卫星导航信号的产生、传输和接收及接收机原理，利用鼠标交互搭建接收机，并构建接收机定位实验系统，分析接收机定位性能。利用鼠标交互操作会有不同的实验现象和结果。\n\n     具体的实验主要结果如下：\n\n实验一：北斗卫星导航系统\n\n通过拖拽交互式的实验操作过程，使学生正确构建北斗卫星导航定位通信系统，并能建立起系统的正确的通信流程，培养学生的通信系统观，当学生在构建系统拖拽交互操作有误时，系统的完整通信流程无法建立，需要学生重新规划系统组成、重新构建系统，或者通过返回重新学习相关实验内容，再进行交互式拖拽实验，直至正确构建系统及其通信过程，至此完成该交互操作步骤，继续学习手持和车载终端的定位功能实现。\n\n实验二：伪距定位算法实验\n\n本实验给出6颗卫星的伪距数据和坐标数据，通过让学生选择其中任意4颗卫星（共15种组合），可利用伪距定位算法计算出待定位点在三维空间的位置坐标。\n\n当选择不同的4颗卫星组合时，计算的最终结果有微小差别（因卫星的几何构型不同，学生可以分析各种定位结果的差别原因），下面简单列举选择两种卫星组合情况下的计算结果。\n\n（1）选择1、2、3、4号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709563.7809, 4992760.1894, 3570929.1965)，单位为m。\n\n（2）选择3、4、5、6号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709564.447, 4992761.0408, 3570849.798)，单位为m。\n\n实验三：北斗定位性能研究实验\n\n在采用标准接收机的条件下，研究同频干扰信号和大气环境因素（电离层和对流层）对定位精度的影响：\n\n（1）无环境和无干扰测试条件下，接收机具有较高定位精度，在定位精度展示中可以看到点之间偏离小且集中，在定位结果展示上的观察到可用星数量较多，且接收到的各卫星信号具有较好的载噪比。\n\n（2）在有环境且无干扰的测试条件下，如电离层或对流层的大气空间环境影响，相比于无环境影响，定位精度降低，显示在定位精度动态展示中，定位点离散程度较大，定位展示中可用星数量减少，载噪比略降低。\n\n（3）在无环境且有干扰的测试条件下，增大同频干扰信号的强度,从-140dBm到-60dBm，以20dBm为间隔，发现接收机定位精度逐渐下降，在定位精度展示上，定位点分散程度变大，且各卫星信号的载噪比下降。当干扰信号功率增大到一定值时，为-60dBm，可见星数量下降为渐减少为5颗，可用星数量为0，最终无法定位。              \n\n实验四：北斗接收机定位实验\n\n（1）在频谱仪上观测导航信号特性参数','评价光学镜片的设计过程、生产过程和最终结果，具有解决复杂问题的工程实践能力和数字化能力。','培养学生遵守科学伦理，社会责任感和节能环保意识，在工程实践中遵守职业道德规范和践行社会主义核心价值观。','在室温下，将液态预聚体（单体、引发剂、紫外光吸收剂、抗氧剂、添加剂）经过预聚合达到一定粘度，并经过真空脱气之后注入到已装配好的模具中。再将浇注完成的模具放入烘箱中，恒温10小时以上，使其聚合固化成型，得到半成品镜片。','半成品树脂镜片质地软，需要增加基本膜层和各种功能膜。基本膜层有两种：一是加硬膜层，常采用涂敷法获得，即把镜片浸在加硬液中，以一定速度提升镜片架，使镜片表面涂敷一层一定厚度的均匀加硬液，然后加热固化；二是增透膜层，常采用溅射法获得，即将镜片放入真空腔，用高能粒子轰击靶材，使靶材原子飞到镜片表面，沉积在镜片表面形成薄膜。功能膜层（抗磨损膜、防蓝光膜层、防雾膜、防眩光膜，偏光膜、染色膜层）也常常被添加到镜片表面，使得镜片能满足不同应用场景的需求。','掌握光学镜片工厂化生产的先进工艺流程，掌握各工艺流程中的技术要点，掌握相关设备的使用方法。');
/*!40000 ALTER TABLE `t_dashboard_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_home`
--

DROP TABLE IF EXISTS `t_dashboard_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_home` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `col_three` varchar(255) DEFAULT NULL COMMENT '步骤学时分类',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `introduction` longtext DEFAULT NULL COMMENT '实验简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='首页';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_home`
--

LOCK TABLES `t_dashboard_home` WRITE;
/*!40000 ALTER TABLE `t_dashboard_home` DISABLE KEYS */;
INSERT INTO `t_dashboard_home` VALUES
(1,'erupt','2024-01-22 20:24:34','erupt','2024-01-22 20:24:34','虚拟仿真平合网络实验','实验步骤：55步   实验学时：4学时  所属分类：眼镜材料学','VIRTUAL SIMULATION FLAT NETWORK EXPERIMENT','眼睛是心灵的窗户”，人类80%的知识都通过视觉感知后获得。社会和科技的进步以及人类对视觉健康及视力改善的追求，推动了眼镜从传统近视和老花等矫正眼镜，到能够防紫外和蓝光的功能眼镜，再到虚拟现实增强的各类智能眼镜的进步与发展。可以说眼镜作为一类光学器件，已进入到人们生活和工作的方方面面。特别是电子信息时代成长起来的青少年，视力的健康关乎国家和未来，习近平总书记多次对近视防控做出重要指示批示，要求“全社会都要行动起来，共同呵护好孩子的眼睛。光学镜片结构复杂，其设计、生产的关键材料和核心技术由国外把持，行业现状是受制于人。党的二十大报告做出了“加快实现高水平科技自立自强”重大部署，强调“教育、科技、人才是全面建设社会主义现代化国家的基础性、战略性支撑”。为此，视光行业及专业领域针对国内生产工艺繁复、龙头企业镜片产品开发能力弱等问题，开展了产业链布局调整，高品质镜片的研发及人才需求激增。');
/*!40000 ALTER TABLE `t_dashboard_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_net`
--

DROP TABLE IF EXISTS `t_dashboard_net`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_net` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `caozuoxitongyaoqiu` longtext DEFAULT NULL COMMENT '操作系统要求',
  `wangluoyaoqiu` longtext DEFAULT NULL COMMENT '网络要求',
  `yingjianyaoqiu` longtext DEFAULT NULL COMMENT '硬件要求',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验必读';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_net`
--

LOCK TABLES `t_dashboard_net` WRITE;
/*!40000 ALTER TABLE `t_dashboard_net` DISABLE KEYS */;
INSERT INTO `t_dashboard_net` VALUES
(1,'erupt','2024-01-22 23:09:33','erupt','2024-01-22 23:09:33','计算机操作系统和版本要求：Windows 7及以上 其他计算机终端操作系统和版本要求：无 支持移动端：否','说明客户端到服务器的带宽要求（需提供测试带宽服务）：>50Mb/s 说明能够提供的并发相应数量（需提供在线排队提示服务）：100','计算机硬件配置要求：CPU： 最低配置：Intel Core i5-7400 同等或更高配置； 推荐配置：Intel Core i7-9700k 同等或更高配置; 内存： 最低配置：8GB； 推荐配置：16GB 及以上； 显卡（图形处理器）： 最低配置：NVIDIA GeForce GTX 960/AMD Radeon R9 290同等或更高配置； 推荐配置：NVIDIA GeForce GTX 1060/AMD Radeon RX 480同等或更高配置； 存储容量： 最低剩余空间：10GB。 推荐剩余空间：40GB 及以上。');
/*!40000 ALTER TABLE `t_dashboard_net` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_steps`
--

DROP TABLE IF EXISTS `t_dashboard_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_steps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `rank` int(11) DEFAULT NULL COMMENT '步骤次序',
  `stepcontent` longtext DEFAULT NULL COMMENT '步骤内容',
  `stepname` varchar(255) DEFAULT NULL COMMENT '步骤名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验步骤';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_steps`
--

LOCK TABLES `t_dashboard_steps` WRITE;
/*!40000 ALTER TABLE `t_dashboard_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dashboard_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_tech`
--

DROP TABLE IF EXISTS `t_dashboard_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_tech` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `situationthree` longtext DEFAULT NULL COMMENT '学术研究情况',
  `situationtwo` longtext DEFAULT NULL COMMENT '教学研究情况',
  `situatioone` longtext DEFAULT NULL COMMENT '负责人情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目团队';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_tech`
--

LOCK TABLES `t_dashboard_tech` WRITE;
/*!40000 ALTER TABLE `t_dashboard_tech` DISABLE KEYS */;
INSERT INTO `t_dashboard_tech` VALUES
(1,'erupt','2024-01-22 20:21:16','erupt','2024-01-22 23:32:53','        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件','    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；','          贾志超 男 1965-10-01\n          学历：博士研究生\n          学位：博士 专业技术职务：教授 \n          行政职务：教研室主任\n          学院：电子信息与人工智能学院\n          地址：陕西科技大学 \n          电话：xxx-xxxxx\n          手机：1331111111\n          电子邮箱：hywang@sust.edu.cn\n          邮编：710000');
/*!40000 ALTER TABLE `t_dashboard_tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lab`
--

DROP TABLE IF EXISTS `t_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_lab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext DEFAULT NULL COMMENT '实验描述',
  `pdf_conclusions` varchar(255) DEFAULT NULL COMMENT '实验结果与结论',
  `pdf_goal` varchar(255) DEFAULT NULL COMMENT '教学目标',
  `pdf_principle` varchar(255) DEFAULT NULL COMMENT '实验原理',
  `pdf_step` varchar(255) DEFAULT NULL COMMENT '实验步骤',
  `pdf_team` varchar(255) DEFAULT NULL COMMENT '项目团队',
  `pic` varchar(255) DEFAULT NULL COMMENT '封面图',
  `title` varchar(255) DEFAULT NULL COMMENT '实验名称',
  `video_guide` varchar(255) DEFAULT NULL COMMENT '教学引导',
  `video_introduction` varchar(255) DEFAULT NULL COMMENT '视频简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lab`
--

LOCK TABLES `t_lab` WRITE;
/*!40000 ALTER TABLE `t_lab` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_question`
--

DROP TABLE IF EXISTS `t_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content` longtext DEFAULT NULL COMMENT '内容',
  `publish` bit(1) DEFAULT NULL COMMENT '问题状态',
  `solved` bit(1) DEFAULT NULL COMMENT '是否解决',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `upvote_count` bigint(20) DEFAULT NULL COMMENT '点赞次数',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_question`
--

LOCK TABLES `t_question` WRITE;
/*!40000 ALTER TABLE `t_question` DISABLE KEYS */;
INSERT INTO `t_question` VALUES
(1,'linjb','2024-01-22 15:49:40','linjb',NULL,'nihao nihao nihao nihao nihao ','','\0','nihao ',NULL,NULL);
/*!40000 ALTER TABLE `t_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_score`
--

DROP TABLE IF EXISTS `t_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `mark` int(11) DEFAULT NULL COMMENT '总成绩',
  `mark1` int(11) DEFAULT NULL COMMENT '成绩1',
  `mark2` int(11) DEFAULT NULL COMMENT '成绩2',
  `report` varchar(255) DEFAULT NULL COMMENT '实验报告',
  `student_no` varchar(255) DEFAULT NULL COMMENT '学生编号',
  `teacher_no` varchar(255) DEFAULT NULL COMMENT '教师编号',
  `student_id` bigint(20) DEFAULT NULL COMMENT '学生名称',
  PRIMARY KEY (`id`),
  KEY `FK9yiug4y55bkn06wffy1m32px0` (`student_id`),
  CONSTRAINT `FK9yiug4y55bkn06wffy1m32px0` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='成绩管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_score`
--

LOCK TABLES `t_score` WRITE;
/*!40000 ALTER TABLE `t_score` DISABLE KEYS */;
INSERT INTO `t_score` VALUES
(1,'1',39,45,34,'','1','1',1);
/*!40000 ALTER TABLE `t_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student`
--

DROP TABLE IF EXISTS `t_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `clazz_no` varchar(255) DEFAULT NULL COMMENT '班级',
  `gender` bit(1) DEFAULT NULL COMMENT '性别',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `student_no` varchar(255) DEFAULT NULL COMMENT '学号',
  `tel` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `clazz_id` bigint(20) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKj6jrjkwe4rh6bo2jykdrb8kbm` (`student_no`,`idcard`),
  KEY `FK86xs8ow9uasv8eew6aup5g8pg` (`clazz_id`),
  CONSTRAINT `FK86xs8ow9uasv8eew6aup5g8pg` FOREIGN KEY (`clazz_id`) REFERENCES `t_clazz` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES
(1,NULL,NULL,NULL,NULL,NULL,'linjb','123456','linjb','15195355289',NULL);
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher`
--

DROP TABLE IF EXISTS `t_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `gender` bit(1) DEFAULT NULL COMMENT '性别',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `teacher_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `teacher_no` varchar(255) DEFAULT NULL COMMENT '职工号',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKs3y47pmwlswxgpjujvdkig7gu` (`idcard`,`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='教师管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher`
--

LOCK TABLES `t_teacher` WRITE;
/*!40000 ALTER TABLE `t_teacher` DISABLE KEYS */;
INSERT INTO `t_teacher` VALUES
(1,NULL,NULL,'\0',NULL,'t01','t01','15195355289');
/*!40000 ALTER TABLE `t_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `build`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `build` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `build`;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `click_num` int(11) DEFAULT NULL COMMENT '点击数',
  `content` longtext DEFAULT NULL COMMENT '内容',
  `image` varchar(255) DEFAULT NULL COMMENT '标题图',
  `name` varchar(255) DEFAULT NULL COMMENT '标题',
  `original` bit(1) DEFAULT NULL COMMENT '是否原创',
  `publish` bit(1) DEFAULT NULL COMMENT '是否发布',
  `recommended_level` int(11) DEFAULT NULL COMMENT '推荐等级',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `blog_category_id` bigint(20) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`),
  KEY `FK1e19b3hgxj8njadninfsq3jra` (`create_user_id`),
  KEY `FKkql5hk0tc2pnawmaeu1lbw4qq` (`update_user_id`),
  KEY `FK74ctxx9batrm1ar915frybfmq` (`blog_category_id`),
  CONSTRAINT `FK1e19b3hgxj8njadninfsq3jra` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FK74ctxx9batrm1ar915frybfmq` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `FKkql5hk0tc2pnawmaeu1lbw4qq` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='博客管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` bit(1) DEFAULT NULL COMMENT '是否显示',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '分类介绍',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='博客类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_link`
--

DROP TABLE IF EXISTS `blog_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL COMMENT '站长邮箱',
  `name` varchar(255) DEFAULT NULL COMMENT '友链名',
  `remark` varchar(255) DEFAULT NULL COMMENT '友链简介',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '友链URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_link`
--

LOCK TABLES `blog_link` WRITE;
/*!40000 ALTER TABLE `blog_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_picture`
--

DROP TABLE IF EXISTS `blog_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `height` int(11) DEFAULT NULL COMMENT '高度',
  `remark` varchar(255) DEFAULT NULL COMMENT '图片备注',
  `sizes` int(11) DEFAULT NULL COMMENT '大小',
  `width` int(11) DEFAULT NULL COMMENT '宽度',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `pictures_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKem3m8nybh74e4gfg0xmyvkeax` (`create_user_id`),
  KEY `FKl9cbe3sag33xpaeblfb8vf1ml` (`update_user_id`),
  KEY `FKs5n8lg87qq92elejyjdbwt6iq` (`pictures_category_id`),
  CONSTRAINT `FKem3m8nybh74e4gfg0xmyvkeax` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKl9cbe3sag33xpaeblfb8vf1ml` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKs5n8lg87qq92elejyjdbwt6iq` FOREIGN KEY (`pictures_category_id`) REFERENCES `blog_picture_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='图片管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_picture`
--

LOCK TABLES `blog_picture` WRITE;
/*!40000 ALTER TABLE `blog_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_picture_category`
--

DROP TABLE IF EXISTS `blog_picture_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_picture_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90hls4khrum6t3q1gkdkqijr5` (`create_user_id`),
  KEY `FKk3sogcaj375aiqg1wr6c10o2h` (`update_user_id`),
  CONSTRAINT `FK90hls4khrum6t3q1gkdkqijr5` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKk3sogcaj375aiqg1wr6c10o2h` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='图床分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_picture_category`
--

LOCK TABLES `blog_picture_category` WRITE;
/*!40000 ALTER TABLE `blog_picture_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_picture_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe1wmsd60gau8s7rxiytnxvulq` (`create_user_id`),
  KEY `FKgctgb8bvmf3k40wn5ul267oio` (`update_user_id`),
  CONSTRAINT `FKe1wmsd60gau8s7rxiytnxvulq` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKgctgb8bvmf3k40wn5ul267oio` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='博客标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_article`
--

DROP TABLE IF EXISTS `demo_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `content` longtext DEFAULT NULL COMMENT '内容(UEditor)',
  `pic` varchar(255) DEFAULT NULL COMMENT '封面图',
  `publish` bit(1) DEFAULT NULL COMMENT '发布状态',
  `remark` varchar(5000) DEFAULT NULL COMMENT '备注',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `top_up` bit(1) DEFAULT NULL COMMENT '置顶',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9hr9liq52keob5o599gy0skkw` (`create_user_id`),
  KEY `FKfv1ogssebm95to9v437ttm34y` (`update_user_id`),
  CONSTRAINT `FK9hr9liq52keob5o599gy0skkw` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKfv1ogssebm95to9v437ttm34y` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文章发布';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_article`
--

LOCK TABLES `demo_article` WRITE;
/*!40000 ALTER TABLE `demo_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_complex`
--

DROP TABLE IF EXISTS `demo_complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_complex` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `choice` varchar(255) DEFAULT NULL COMMENT '通过SQL获取下拉列表',
  `code` longtext DEFAULT NULL COMMENT 'python代码编辑器',
  `from_dict` bigint(20) DEFAULT NULL COMMENT '字典值',
  `from_dict_code` varchar(255) DEFAULT NULL COMMENT '字典值',
  `article_id` bigint(20) DEFAULT NULL COMMENT '多对一表格',
  `tree_id` bigint(20) DEFAULT NULL COMMENT '多对一树',
  PRIMARY KEY (`id`),
  KEY `FKeqxb24s0q2253b1v18pdeeapx` (`article_id`),
  KEY `FKd96od49tv0uebree938gmku6p` (`tree_id`),
  CONSTRAINT `FKd96od49tv0uebree938gmku6p` FOREIGN KEY (`tree_id`) REFERENCES `demo_tree` (`id`),
  CONSTRAINT `FKeqxb24s0q2253b1v18pdeeapx` FOREIGN KEY (`article_id`) REFERENCES `demo_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='复杂示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_complex`
--

LOCK TABLES `demo_complex` WRITE;
/*!40000 ALTER TABLE `demo_complex` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_complex_tab`
--

DROP TABLE IF EXISTS `demo_complex_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_complex_tab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input` varchar(255) DEFAULT NULL COMMENT '文本',
  `number` float DEFAULT NULL COMMENT '数值',
  `complex_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKyiqlahfwo7f4xwsr67mt2eq8` (`complex_id`),
  CONSTRAINT `FKyiqlahfwo7f4xwsr67mt2eq8` FOREIGN KEY (`complex_id`) REFERENCES `demo_complex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='一对多新增';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_complex_tab`
--

LOCK TABLES `demo_complex_tab` WRITE;
/*!40000 ALTER TABLE `demo_complex_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_complex_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_component`
--

DROP TABLE IF EXISTS `demo_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auto_complete` varchar(255) DEFAULT NULL COMMENT '自动完成',
  `bool` bit(1) DEFAULT NULL COMMENT '布尔',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色选择',
  `date1` datetime DEFAULT NULL COMMENT '日期',
  `date_time` datetime DEFAULT NULL COMMENT '时间日期',
  `feature` varchar(255) DEFAULT NULL COMMENT '未来时间',
  `history` varchar(255) DEFAULT NULL COMMENT '过去时间',
  `input` varchar(255) DEFAULT NULL COMMENT '文本',
  `month` varchar(255) DEFAULT NULL COMMENT '月',
  `number1` double DEFAULT NULL COMMENT '数字',
  `slider` int(11) DEFAULT NULL COMMENT '数字滑块',
  `tags` varchar(255) DEFAULT NULL COMMENT '标签选择',
  `time` varchar(255) DEFAULT NULL COMMENT '时间',
  `week` varchar(255) DEFAULT NULL COMMENT '周',
  `week_input` varchar(255) DEFAULT NULL COMMENT '周选择器',
  `year` varchar(255) DEFAULT NULL COMMENT '年',
  `article_id` bigint(20) DEFAULT NULL COMMENT '文章选择',
  `tree_id` bigint(20) DEFAULT NULL COMMENT '多对一树',
  PRIMARY KEY (`id`),
  KEY `FKn5uhvcvqbjf7ms7wc1ays75pb` (`article_id`),
  KEY `FK44s9a2xh33b6bxlnuy5c0k7pf` (`tree_id`),
  CONSTRAINT `FK44s9a2xh33b6bxlnuy5c0k7pf` FOREIGN KEY (`tree_id`) REFERENCES `demo_tree` (`id`),
  CONSTRAINT `FKn5uhvcvqbjf7ms7wc1ays75pb` FOREIGN KEY (`article_id`) REFERENCES `demo_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='组件示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_component`
--

LOCK TABLES `demo_component` WRITE;
/*!40000 ALTER TABLE `demo_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_curd_extension`
--

DROP TABLE IF EXISTS `demo_curd_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_curd_extension` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='服务层逻辑扩展 @DataProxy （扩展CURD）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_curd_extension`
--

LOCK TABLES `demo_curd_extension` WRITE;
/*!40000 ALTER TABLE `demo_curd_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_curd_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_simple`
--

DROP TABLE IF EXISTS `demo_simple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_simple` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bool` bit(1) DEFAULT NULL COMMENT '布尔',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `input` varchar(255) DEFAULT NULL COMMENT '文本',
  `number` float DEFAULT NULL COMMENT '数值',
  `slide` int(11) DEFAULT NULL COMMENT '滑动条',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='简单示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_simple`
--

LOCK TABLES `demo_simple` WRITE;
/*!40000 ALTER TABLE `demo_simple` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_simple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_tree`
--

DROP TABLE IF EXISTS `demo_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_tree` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级树节点',
  PRIMARY KEY (`id`),
  KEY `FKl36uvo19qj7l037g3fxtjxjgi` (`parent_id`),
  CONSTRAINT `FKl36uvo19qj7l037g3fxtjxjgi` FOREIGN KEY (`parent_id`) REFERENCES `demo_tree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='树示例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_tree`
--

LOCK TABLES `demo_tree` WRITE;
/*!40000 ALTER TABLE `demo_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cloud_node`
--

DROP TABLE IF EXISTS `e_cloud_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cloud_node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `access_token` varchar(255) DEFAULT NULL COMMENT 'Access Token',
  `config` longtext DEFAULT NULL COMMENT '节点配置',
  `duty` varchar(255) DEFAULT NULL COMMENT '负责人',
  `name` varchar(255) DEFAULT NULL COMMENT '友好名称',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名',
  `remark` longtext DEFAULT NULL COMMENT '描述',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `cloud_node_group_id` bigint(20) DEFAULT NULL COMMENT '所属分组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r3jlok3jyaw4plntt4wk59n5b` (`node_name`),
  KEY `FKdlevmrjxsm5xjcbl52w1vphn6` (`cloud_node_group_id`),
  CONSTRAINT `FKdlevmrjxsm5xjcbl52w1vphn6` FOREIGN KEY (`cloud_node_group_id`) REFERENCES `e_cloud_node_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='节点配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cloud_node`
--

LOCK TABLES `e_cloud_node` WRITE;
/*!40000 ALTER TABLE `e_cloud_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_cloud_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cloud_node_group`
--

DROP TABLE IF EXISTS `e_cloud_node_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cloud_node_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `config` longtext DEFAULT NULL COMMENT '分组配置',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(5000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tnlrraw5l0dtam4pm9ynljv0d` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='分组配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cloud_node_group`
--

LOCK TABLES `e_cloud_node_group` WRITE;
/*!40000 ALTER TABLE `e_cloud_node_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_cloud_node_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_complex_article`
--

DROP TABLE IF EXISTS `e_complex_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_complex_article` (
  `complex_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`complex_id`,`article_id`),
  KEY `FKfnrlqw0i99r9n3yhnjj4hm1vb` (`article_id`),
  CONSTRAINT `FKfnrlqw0i99r9n3yhnjj4hm1vb` FOREIGN KEY (`article_id`) REFERENCES `demo_article` (`id`),
  CONSTRAINT `FKqkltmeyft8wmfps5m7k0yp727` FOREIGN KEY (`complex_id`) REFERENCES `demo_complex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_complex_article`
--

LOCK TABLES `e_complex_article` WRITE;
/*!40000 ALTER TABLE `e_complex_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_complex_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_dict`
--

DROP TABLE IF EXISTS `e_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f5wwh5osfukkeebw7h2yb4kmp` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_dict`
--

LOCK TABLES `e_dict` WRITE;
/*!40000 ALTER TABLE `e_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_dict_item`
--

DROP TABLE IF EXISTS `e_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_dict_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `erupt_dict_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKl0kiq8otpn3fvtlvarebt8xkh` (`code`,`erupt_dict_id`),
  KEY `FKrrbi2dt94rjd8sjt830m3w0a` (`erupt_dict_id`),
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_dict_item`
--

LOCK TABLES `e_dict_item` WRITE;
/*!40000 ALTER TABLE `e_dict_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_dict_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_generator_class`
--

DROP TABLE IF EXISTS `e_generator_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_generator_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL COMMENT '实体类名',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `remark` varchar(2000) DEFAULT NULL COMMENT '简介',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='生成Erupt代码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_generator_class`
--

LOCK TABLES `e_generator_class` WRITE;
/*!40000 ALTER TABLE `e_generator_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_generator_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_generator_field`
--

DROP TABLE IF EXISTS `e_generator_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_generator_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL COMMENT '字段名',
  `is_show` bit(1) DEFAULT NULL COMMENT '是否显示',
  `link_class` varchar(255) DEFAULT NULL COMMENT '关联实体类',
  `not_null` bit(1) DEFAULT NULL COMMENT '是否必填',
  `query` bit(1) DEFAULT NULL COMMENT '查询项',
  `show_name` varchar(255) DEFAULT NULL COMMENT '显示名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `sortable` bit(1) DEFAULT NULL COMMENT '字段排序',
  `type` varchar(255) DEFAULT NULL COMMENT '编辑类型',
  `class_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKslwo9qwwfbgif9mbbhg072s4i` (`class_id`),
  CONSTRAINT `FKslwo9qwwfbgif9mbbhg072s4i` FOREIGN KEY (`class_id`) REFERENCES `e_generator_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Erupt字段信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_generator_field`
--

LOCK TABLES `e_generator_field` WRITE;
/*!40000 ALTER TABLE `e_generator_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_generator_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_job`
--

DROP TABLE IF EXISTS `e_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `cron` varchar(255) DEFAULT NULL COMMENT 'Cron表达式',
  `handler` varchar(255) DEFAULT NULL COMMENT 'JOB处理类',
  `handler_param` varchar(2000) DEFAULT NULL COMMENT '任务参数',
  `name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `notify_emails` varchar(2000) DEFAULT NULL COMMENT '失败通知邮箱',
  `remark` varchar(2000) DEFAULT NULL COMMENT '描述',
  `status` bit(1) DEFAULT NULL COMMENT '任务状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1fu1amroa8n5mma3q9tey7bu9` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_job`
--

LOCK TABLES `e_job` WRITE;
/*!40000 ALTER TABLE `e_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_job_log`
--

DROP TABLE IF EXISTS `e_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `error_info` longtext DEFAULT NULL COMMENT '错误信息',
  `handler_param` varchar(2000) DEFAULT NULL COMMENT '任务参数',
  `result_info` varchar(2000) DEFAULT NULL COMMENT '执行结果',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `status` bit(1) DEFAULT NULL COMMENT '任务状态',
  `job_id` bigint(20) DEFAULT NULL COMMENT '任务名称',
  PRIMARY KEY (`id`),
  KEY `FKcpe22rpge2e4mmuva8l9dtmx0` (`job_id`),
  CONSTRAINT `FKcpe22rpge2e4mmuva8l9dtmx0` FOREIGN KEY (`job_id`) REFERENCES `e_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_job_log`
--

LOCK TABLES `e_job_log` WRITE;
/*!40000 ALTER TABLE `e_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_job_mail`
--

DROP TABLE IF EXISTS `e_job_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_job_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cc` varchar(255) DEFAULT NULL COMMENT '抄送人',
  `content` longtext DEFAULT NULL COMMENT '内容',
  `create_by` varchar(255) DEFAULT NULL COMMENT '发送人',
  `create_time` datetime DEFAULT NULL COMMENT '发送时间',
  `error_info` varchar(5000) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL COMMENT '接收人',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `subject` varchar(255) DEFAULT NULL COMMENT '主题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='发送邮件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_job_mail`
--

LOCK TABLES `e_job_mail` WRITE;
/*!40000 ALTER TABLE `e_job_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_job_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_login_log`
--

DROP TABLE IF EXISTS `e_upms_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) DEFAULT NULL COMMENT '浏览器',
  `device_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `region` varchar(255) DEFAULT NULL COMMENT 'IP来源',
  `system_name` varchar(255) DEFAULT NULL COMMENT '操作系统',
  `token` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_login_log`
--

LOCK TABLES `e_upms_login_log` WRITE;
/*!40000 ALTER TABLE `e_upms_login_log` DISABLE KEYS */;
INSERT INTO `e_upms_login_log` VALUES
(1,'Chrome 12 120','Computer','192.168.0.104','2024-01-21 19:34:29','0|0|0|内网IP|内网IP','Mac OS X','iYzuLnYXfCmmX4je','erupt'),
(2,'Chrome 12 120','Computer','192.168.0.102','2024-01-22 20:17:38','0|0|0|内网IP|内网IP','Mac OS X','W80ILLdUBRKrH3kC','erupt'),
(3,'Chrome 12 120','Computer','192.168.0.102','2024-01-22 22:47:24','0|0|0|内网IP|内网IP','Mac OS X','ucISEAxsEeuXYHHx','erupt'),
(4,'Chrome 12 120','Computer','192.168.0.102','2024-01-22 23:48:56','0|0|0|内网IP|内网IP','Mac OS X','ihy49IWaBOag9NP3','erupt');
/*!40000 ALTER TABLE `e_upms_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_menu`
--

DROP TABLE IF EXISTS `e_upms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `param` varchar(2000) DEFAULT NULL COMMENT '自定义参数',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `type` varchar(255) DEFAULT NULL COMMENT '菜单类型',
  `value` varchar(255) DEFAULT NULL COMMENT '类型值',
  `parent_menu_id` bigint(20) DEFAULT NULL COMMENT '上级菜单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_95xpkppt33d2bka0g2d7rgwqt` (`code`),
  KEY `FK5mkgea183mm02v7ic1pdwxy5s` (`parent_menu_id`),
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_menu`
--

LOCK TABLES `e_upms_menu` WRITE;
/*!40000 ALTER TABLE `e_upms_menu` DISABLE KEYS */;
INSERT INTO `e_upms_menu` VALUES
(1,NULL,'2024-01-21 19:34:13',NULL,NULL,'$NodeManager','fa fa-cloud','微节点管理',NULL,70,1,NULL,NULL,NULL),
(2,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup','','分组配置',NULL,10,1,'tree','CloudNodeGroup',1),
(3,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@ADD',NULL,'新增',NULL,10,1,'button','CloudNodeGroup@ADD',2),
(4,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@EDIT',NULL,'修改',NULL,20,1,'button','CloudNodeGroup@EDIT',2),
(5,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@DELETE',NULL,'删除',NULL,30,1,'button','CloudNodeGroup@DELETE',2),
(6,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNodeGroup@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','CloudNodeGroup@VIEW_DETAIL',2),
(7,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode','','节点配置',NULL,20,1,'table','CloudNode',1),
(8,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@ADD',NULL,'新增',NULL,10,1,'button','CloudNode@ADD',7),
(9,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@EDIT',NULL,'修改',NULL,20,1,'button','CloudNode@EDIT',7),
(10,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@DELETE',NULL,'删除',NULL,30,1,'button','CloudNode@DELETE',7),
(11,NULL,'2024-01-21 19:34:13',NULL,NULL,'CloudNode@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','CloudNode@VIEW_DETAIL',7),
(12,NULL,'2024-01-21 19:34:13',NULL,NULL,'cloud_access_token_permission',NULL,'查看令牌',NULL,20,1,'button','cloud_access_token_permission',7),
(13,NULL,'2024-01-21 19:34:13',NULL,NULL,'cloud_node_manager_permission',NULL,'节点管理',NULL,30,1,'button','cloud_node_manager_permission',7),
(14,NULL,'2024-01-21 19:34:13',NULL,NULL,'$generator','fa fa-code','代码生成',NULL,40,1,NULL,NULL,NULL),
(15,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass','','生成Erupt代码',NULL,0,1,'table','GeneratorClass',14),
(16,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@ADD',NULL,'新增',NULL,10,1,'button','GeneratorClass@ADD',15),
(17,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@EDIT',NULL,'修改',NULL,20,1,'button','GeneratorClass@EDIT',15),
(18,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@DELETE',NULL,'删除',NULL,30,1,'button','GeneratorClass@DELETE',15),
(19,NULL,'2024-01-21 19:34:13',NULL,NULL,'GeneratorClass@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','GeneratorClass@VIEW_DETAIL',15),
(20,NULL,'2024-01-21 19:34:13',NULL,NULL,'$job','fa fa-cubes','任务管理',NULL,30,1,NULL,NULL,NULL),
(21,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob','','任务维护',NULL,0,1,'table','EruptJob',20),
(22,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@ADD',NULL,'新增',NULL,10,1,'button','EruptJob@ADD',21),
(23,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@EDIT',NULL,'修改',NULL,20,1,'button','EruptJob@EDIT',21),
(24,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@DELETE',NULL,'删除',NULL,30,1,'button','EruptJob@DELETE',21),
(25,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJob@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptJob@VIEW_DETAIL',21),
(26,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJobLog','','任务日志',NULL,10,1,'table','EruptJobLog',20),
(27,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJobLog@DELETE',NULL,'删除',NULL,10,1,'button','EruptJobLog@DELETE',26),
(28,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptJobLog@EXPORT',NULL,'导出',NULL,20,1,'button','EruptJobLog@EXPORT',26),
(29,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail','','发送邮件',NULL,20,1,'table','EruptMail',20),
(30,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail@ADD',NULL,'新增',NULL,10,1,'button','EruptMail@ADD',29),
(31,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail@DELETE',NULL,'删除',NULL,20,1,'button','EruptMail@DELETE',29),
(32,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMail@VIEW_DETAIL',NULL,'详情',NULL,30,1,'button','EruptMail@VIEW_DETAIL',29),
(33,NULL,'2024-01-21 19:34:13',NULL,NULL,'monitor','fa fa-bullseye','系统监控',NULL,10,1,NULL,NULL,NULL),
(34,NULL,'2024-01-21 19:34:13',NULL,NULL,'server.html',NULL,'服务监控',NULL,10,1,'tpl','server.html',33),
(35,NULL,'2024-01-21 19:34:13',NULL,NULL,'redis.html',NULL,'缓存监控',NULL,20,1,'tpl','redis.html',33),
(36,NULL,'2024-01-21 19:34:13',NULL,NULL,'$manager','fa fa-cogs','系统管理',NULL,1,1,NULL,NULL,NULL),
(37,NULL,'2024-01-21 19:34:13',NULL,NULL,'$home','fa fa-home','首页',NULL,0,1,'router','/',NULL),
(38,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu','','菜单管理',NULL,0,1,'tree','EruptMenu',36),
(39,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@ADD',NULL,'新增',NULL,10,1,'button','EruptMenu@ADD',38),
(40,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@EDIT',NULL,'修改',NULL,20,1,'button','EruptMenu@EDIT',38),
(41,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@DELETE',NULL,'删除',NULL,30,1,'button','EruptMenu@DELETE',38),
(42,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptMenu@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptMenu@VIEW_DETAIL',38),
(43,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole','','角色管理',NULL,10,1,'table','EruptRole',36),
(44,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@ADD',NULL,'新增',NULL,10,1,'button','EruptRole@ADD',43),
(45,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@EDIT',NULL,'修改',NULL,20,1,'button','EruptRole@EDIT',43),
(46,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@DELETE',NULL,'删除',NULL,30,1,'button','EruptRole@DELETE',43),
(47,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptRole@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptRole@VIEW_DETAIL',43),
(48,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg','','组织维护',NULL,20,1,'tree','EruptOrg',36),
(49,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@ADD',NULL,'新增',NULL,10,1,'button','EruptOrg@ADD',48),
(50,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@EDIT',NULL,'修改',NULL,20,1,'button','EruptOrg@EDIT',48),
(51,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@DELETE',NULL,'删除',NULL,30,1,'button','EruptOrg@DELETE',48),
(52,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOrg@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptOrg@VIEW_DETAIL',48),
(53,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost','','岗位维护',NULL,30,1,'tree','EruptPost',36),
(54,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@ADD',NULL,'新增',NULL,10,1,'button','EruptPost@ADD',53),
(55,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@EDIT',NULL,'修改',NULL,20,1,'button','EruptPost@EDIT',53),
(56,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@DELETE',NULL,'删除',NULL,30,1,'button','EruptPost@DELETE',53),
(57,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptPost@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptPost@VIEW_DETAIL',53),
(58,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser','','用户配置',NULL,40,1,'table','EruptUser',36),
(59,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@ADD',NULL,'新增',NULL,10,1,'button','EruptUser@ADD',58),
(60,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@EDIT',NULL,'修改',NULL,20,1,'button','EruptUser@EDIT',58),
(61,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@DELETE',NULL,'删除',NULL,30,1,'button','EruptUser@DELETE',58),
(62,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptUser@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptUser@VIEW_DETAIL',58),
(63,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict','','数据字典',NULL,50,1,'table','EruptDict',36),
(64,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@ADD',NULL,'新增',NULL,10,1,'button','EruptDict@ADD',63),
(65,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@EDIT',NULL,'修改',NULL,20,1,'button','EruptDict@EDIT',63),
(66,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@DELETE',NULL,'删除',NULL,30,1,'button','EruptDict@DELETE',63),
(67,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDict@EXPORT',63),
(68,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDict@VIEW_DETAIL',NULL,'详情',NULL,50,1,'button','EruptDict@VIEW_DETAIL',63),
(69,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem','','字典项',NULL,60,2,'table','EruptDictItem',36),
(70,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@ADD',NULL,'新增',NULL,10,1,'button','EruptDictItem@ADD',69),
(71,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@EDIT',NULL,'修改',NULL,20,1,'button','EruptDictItem@EDIT',69),
(72,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@DELETE',NULL,'删除',NULL,30,1,'button','EruptDictItem@DELETE',69),
(73,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDictItem@EXPORT',69),
(74,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@IMPORTABLE',NULL,'导入',NULL,50,1,'button','EruptDictItem@IMPORTABLE',69),
(75,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptDictItem@VIEW_DETAIL',NULL,'详情',NULL,60,1,'button','EruptDictItem@VIEW_DETAIL',69),
(76,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOnline','','在线用户',NULL,65,1,'table','EruptOnline',36),
(77,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOnline@EXPORT',NULL,'导出',NULL,10,1,'button','EruptOnline@EXPORT',76),
(78,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptLoginLog','','登录日志',NULL,70,1,'table','EruptLoginLog',36),
(79,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptLoginLog@EXPORT',NULL,'导出',NULL,10,1,'button','EruptLoginLog@EXPORT',78),
(80,NULL,'2024-01-21 19:34:13',NULL,NULL,'EruptOperateLog','','操作日志',NULL,80,1,'table','EruptOperateLog',36),
(81,'erupt','2024-01-21 19:35:43','erupt','2024-01-21 19:35:43','AvNxK1IX',NULL,'班级管理',NULL,90,1,'table','Clazz',NULL),
(82,NULL,'2024-01-21 19:35:43',NULL,NULL,'U1Q90Vtn',NULL,'新增',NULL,10,1,'button','Clazz@ADD',81),
(83,NULL,'2024-01-21 19:35:43',NULL,NULL,'QWhD7SSQ',NULL,'修改',NULL,20,1,'button','Clazz@EDIT',81),
(84,NULL,'2024-01-21 19:35:43',NULL,NULL,'VVWdLOjk',NULL,'删除',NULL,30,1,'button','Clazz@DELETE',81),
(85,NULL,'2024-01-21 19:35:43',NULL,NULL,'eleMHabG',NULL,'导出',NULL,40,1,'button','Clazz@EXPORT',81),
(86,NULL,'2024-01-21 19:35:43',NULL,NULL,'TFqd7IAX',NULL,'导入',NULL,50,1,'button','Clazz@IMPORTABLE',81),
(87,NULL,'2024-01-21 19:35:43',NULL,NULL,'wVA54IPM',NULL,'详情',NULL,60,1,'button','Clazz@VIEW_DETAIL',81),
(88,'erupt','2024-01-21 19:36:18','erupt','2024-01-21 19:36:18','QZ6Gl3ap',NULL,'课程管理',NULL,100,1,'table','Course',NULL),
(89,NULL,'2024-01-21 19:36:18',NULL,NULL,'rtl5H7dA',NULL,'新增',NULL,10,1,'button','Course@ADD',88),
(90,NULL,'2024-01-21 19:36:18',NULL,NULL,'Ye6HIoMH',NULL,'修改',NULL,20,1,'button','Course@EDIT',88),
(91,NULL,'2024-01-21 19:36:18',NULL,NULL,'i7ND2WGv',NULL,'删除',NULL,30,1,'button','Course@DELETE',88),
(92,NULL,'2024-01-21 19:36:18',NULL,NULL,'YUmHKGW3',NULL,'导出',NULL,40,1,'button','Course@EXPORT',88),
(93,NULL,'2024-01-21 19:36:18',NULL,NULL,'ppzorWrQ',NULL,'导入',NULL,50,1,'button','Course@IMPORTABLE',88),
(94,NULL,'2024-01-21 19:36:18',NULL,NULL,'aQdSYUjN',NULL,'详情',NULL,60,1,'button','Course@VIEW_DETAIL',88),
(95,'erupt','2024-01-21 19:36:40','erupt','2024-01-21 19:36:40','1FlLfNsu',NULL,'成绩管理',NULL,110,1,'table','Score',NULL),
(96,NULL,'2024-01-21 19:36:40',NULL,NULL,'oS59KZnO',NULL,'新增',NULL,10,1,'button','Score@ADD',95),
(97,NULL,'2024-01-21 19:36:40',NULL,NULL,'FEKef3n2',NULL,'修改',NULL,20,1,'button','Score@EDIT',95),
(98,NULL,'2024-01-21 19:36:40',NULL,NULL,'yT8LpbeY',NULL,'删除',NULL,30,1,'button','Score@DELETE',95),
(99,NULL,'2024-01-21 19:36:40',NULL,NULL,'tq4vby2G',NULL,'导出',NULL,40,1,'button','Score@EXPORT',95),
(100,NULL,'2024-01-21 19:36:40',NULL,NULL,'nz9Swlmk',NULL,'导入',NULL,50,1,'button','Score@IMPORTABLE',95),
(101,NULL,'2024-01-21 19:36:40',NULL,NULL,'rXwd3YAP',NULL,'详情',NULL,60,1,'button','Score@VIEW_DETAIL',95),
(102,'erupt','2024-01-21 19:37:02','erupt','2024-01-21 19:37:02','q3Dr21lA',NULL,'学生管理',NULL,120,1,'table','Student',NULL),
(103,NULL,'2024-01-21 19:37:02',NULL,NULL,'smfr99O0',NULL,'新增',NULL,10,1,'button','Student@ADD',102),
(104,NULL,'2024-01-21 19:37:02',NULL,NULL,'YjVDewRs',NULL,'修改',NULL,20,1,'button','Student@EDIT',102),
(105,NULL,'2024-01-21 19:37:02',NULL,NULL,'cdrOSKx7',NULL,'删除',NULL,30,1,'button','Student@DELETE',102),
(106,NULL,'2024-01-21 19:37:02',NULL,NULL,'B1y3SXjn',NULL,'导出',NULL,40,1,'button','Student@EXPORT',102),
(107,NULL,'2024-01-21 19:37:02',NULL,NULL,'5V8UfHFm',NULL,'导入',NULL,50,1,'button','Student@IMPORTABLE',102),
(108,NULL,'2024-01-21 19:37:02',NULL,NULL,'DPEuDJOb',NULL,'详情',NULL,60,1,'button','Student@VIEW_DETAIL',102),
(109,'erupt','2024-01-21 19:37:58','erupt','2024-01-21 19:37:58','4AANRCuQ',NULL,'文章管理',NULL,130,1,'table','Article',NULL),
(110,NULL,'2024-01-21 19:37:58',NULL,NULL,'ICAiiSqp',NULL,'新增',NULL,10,1,'button','Article@ADD',109),
(111,NULL,'2024-01-21 19:37:58',NULL,NULL,'H5FvPZE2',NULL,'修改',NULL,20,1,'button','Article@EDIT',109),
(112,NULL,'2024-01-21 19:37:58',NULL,NULL,'75t4tKKN',NULL,'删除',NULL,30,1,'button','Article@DELETE',109),
(113,NULL,'2024-01-21 19:37:58',NULL,NULL,'gCXjG2zg',NULL,'导出',NULL,40,1,'button','Article@EXPORT',109),
(114,NULL,'2024-01-21 19:37:58',NULL,NULL,'0XewWoZY',NULL,'导入',NULL,50,1,'button','Article@IMPORTABLE',109),
(115,NULL,'2024-01-21 19:37:58',NULL,NULL,'ZTs1uqp0',NULL,'详情',NULL,60,1,'button','Article@VIEW_DETAIL',109),
(116,'erupt','2024-01-21 19:38:12','erupt','2024-01-21 19:38:12','GSMsmPye',NULL,'教师管理',NULL,140,1,'table','Teacher',NULL),
(117,NULL,'2024-01-21 19:38:12',NULL,NULL,'psmsTsol',NULL,'新增',NULL,10,1,'button','Teacher@ADD',116),
(118,NULL,'2024-01-21 19:38:12',NULL,NULL,'ztQaTSNH',NULL,'修改',NULL,20,1,'button','Teacher@EDIT',116),
(119,NULL,'2024-01-21 19:38:12',NULL,NULL,'Cm9bYa8l',NULL,'删除',NULL,30,1,'button','Teacher@DELETE',116),
(120,NULL,'2024-01-21 19:38:12',NULL,NULL,'9PtfP4M9',NULL,'导出',NULL,40,1,'button','Teacher@EXPORT',116),
(121,NULL,'2024-01-21 19:38:12',NULL,NULL,'T4eqVjOR',NULL,'导入',NULL,50,1,'button','Teacher@IMPORTABLE',116),
(122,NULL,'2024-01-21 19:38:12',NULL,NULL,'7wzrx5E6',NULL,'详情',NULL,60,1,'button','Teacher@VIEW_DETAIL',116),
(123,'erupt','2024-01-21 19:38:26','erupt','2024-01-21 19:38:26','s0RWF0rR',NULL,'实验管理',NULL,150,1,'table','Lab',NULL),
(124,NULL,'2024-01-21 19:38:26',NULL,NULL,'8IW0HN4C',NULL,'新增',NULL,10,1,'button','Lab@ADD',123),
(125,NULL,'2024-01-21 19:38:26',NULL,NULL,'7iUZJfeR',NULL,'修改',NULL,20,1,'button','Lab@EDIT',123),
(126,NULL,'2024-01-21 19:38:26',NULL,NULL,'3XXuvH6N',NULL,'删除',NULL,30,1,'button','Lab@DELETE',123),
(127,NULL,'2024-01-21 19:38:26',NULL,NULL,'pu3D44Kn',NULL,'详情',NULL,40,1,'button','Lab@VIEW_DETAIL',123),
(128,'erupt','2024-01-21 19:38:41','erupt','2024-01-21 19:38:41','1aQiVZXx',NULL,'前台管理',NULL,160,1,NULL,NULL,NULL),
(129,'erupt','2024-01-21 19:39:25','erupt','2024-01-21 19:39:25','IWU75DC5',NULL,'项目团队',NULL,170,1,'table','DashboardTech',128),
(130,NULL,'2024-01-21 19:39:25',NULL,NULL,'kUQZ7lSE',NULL,'新增',NULL,10,1,'button','DashboardTech@ADD',129),
(131,NULL,'2024-01-21 19:39:25',NULL,NULL,'nPRzpLQd',NULL,'修改',NULL,20,1,'button','DashboardTech@EDIT',129),
(132,NULL,'2024-01-21 19:39:25',NULL,NULL,'G4g2eCcx',NULL,'删除',NULL,30,1,'button','DashboardTech@DELETE',129),
(133,NULL,'2024-01-21 19:39:25',NULL,NULL,'u0btvEdi',NULL,'详情',NULL,40,1,'button','DashboardTech@VIEW_DETAIL',129),
(134,'erupt','2024-01-21 19:39:43','erupt','2024-01-21 19:39:43','ryuQUvta',NULL,'主页',NULL,180,1,'table','DashboardHome',128),
(135,NULL,'2024-01-21 19:39:43',NULL,NULL,'U9YqBveo',NULL,'新增',NULL,10,1,'button','DashboardHome@ADD',134),
(136,NULL,'2024-01-21 19:39:43',NULL,NULL,'mW40dWKP',NULL,'修改',NULL,20,1,'button','DashboardHome@EDIT',134),
(137,NULL,'2024-01-21 19:39:43',NULL,NULL,'f6ZDoE0g',NULL,'删除',NULL,30,1,'button','DashboardHome@DELETE',134),
(138,NULL,'2024-01-21 19:39:43',NULL,NULL,'7xWc4tJI',NULL,'详情',NULL,40,1,'button','DashboardHome@VIEW_DETAIL',134),
(139,'erupt','2024-01-21 19:40:52','erupt','2024-01-21 19:40:52','gDEqEYQ6',NULL,'实验介绍',NULL,190,1,'table','DashboardDescription',128),
(140,NULL,'2024-01-21 19:40:52',NULL,NULL,'o9Gwf4iE',NULL,'新增',NULL,10,1,'button','DashboardDescription@ADD',139),
(141,NULL,'2024-01-21 19:40:52',NULL,NULL,'wITIzS23',NULL,'修改',NULL,20,1,'button','DashboardDescription@EDIT',139),
(142,NULL,'2024-01-21 19:40:52',NULL,NULL,'IFvlfx2x',NULL,'删除',NULL,30,1,'button','DashboardDescription@DELETE',139),
(143,NULL,'2024-01-21 19:40:52',NULL,NULL,'c4eN6FW1',NULL,'详情',NULL,40,1,'button','DashboardDescription@VIEW_DETAIL',139),
(144,'erupt','2024-01-21 19:41:20','erupt','2024-01-21 19:41:20','f2YEmpDU',NULL,'实验必读',NULL,200,1,'table','DashboardNet',128),
(145,NULL,'2024-01-21 19:41:20',NULL,NULL,'e5APPduc',NULL,'新增',NULL,10,1,'button','DashboardNet@ADD',144),
(146,NULL,'2024-01-21 19:41:20',NULL,NULL,'ruCUUw5g',NULL,'修改',NULL,20,1,'button','DashboardNet@EDIT',144),
(147,NULL,'2024-01-21 19:41:20',NULL,NULL,'15jYVANc',NULL,'删除',NULL,30,1,'button','DashboardNet@DELETE',144),
(148,NULL,'2024-01-21 19:41:20',NULL,NULL,'JQVqFYLs',NULL,'详情',NULL,40,1,'button','DashboardNet@VIEW_DETAIL',144),
(149,'erupt','2024-01-21 19:41:54','erupt','2024-01-21 19:41:54','npqvbz2J',NULL,'步骤管理',NULL,210,1,'table','DashboardSteps',128),
(150,NULL,'2024-01-21 19:41:54',NULL,NULL,'VDyeN93j',NULL,'新增',NULL,10,1,'button','DashboardSteps@ADD',149),
(151,NULL,'2024-01-21 19:41:54',NULL,NULL,'6y0zvepz',NULL,'修改',NULL,20,1,'button','DashboardSteps@EDIT',149),
(152,NULL,'2024-01-21 19:41:54',NULL,NULL,'XRpPe0BO',NULL,'删除',NULL,30,1,'button','DashboardSteps@DELETE',149),
(153,NULL,'2024-01-21 19:41:54',NULL,NULL,'bi79B5Pi',NULL,'详情',NULL,40,1,'button','DashboardSteps@VIEW_DETAIL',149),
(154,'erupt','2024-01-21 19:42:26','erupt','2024-01-21 19:42:26','SkV49lWm',NULL,'问题管理',NULL,220,1,'table','Question',NULL),
(155,NULL,'2024-01-21 19:42:26',NULL,NULL,'3CqOHcEr',NULL,'新增',NULL,10,1,'button','Question@ADD',154),
(156,NULL,'2024-01-21 19:42:26',NULL,NULL,'mMnNFjqS',NULL,'修改',NULL,20,1,'button','Question@EDIT',154),
(157,NULL,'2024-01-21 19:42:26',NULL,NULL,'OftTK13A',NULL,'删除',NULL,30,1,'button','Question@DELETE',154),
(158,NULL,'2024-01-21 19:42:26',NULL,NULL,'eh9nKSgt',NULL,'导出',NULL,40,1,'button','Question@EXPORT',154),
(159,NULL,'2024-01-21 19:42:26',NULL,NULL,'IOQvq9d0',NULL,'导入',NULL,50,1,'button','Question@IMPORTABLE',154),
(160,NULL,'2024-01-21 19:42:26',NULL,NULL,'PhLwYCML',NULL,'详情',NULL,60,1,'button','Question@VIEW_DETAIL',154),
(161,'erupt','2024-01-21 19:42:44','erupt','2024-01-21 19:43:11','CKc2427I',NULL,'回答管理',NULL,240,1,'table','Answer',NULL),
(162,NULL,'2024-01-21 19:42:44',NULL,NULL,'Ak0NSbIP',NULL,'新增',NULL,10,1,'button','Answer@ADD',161),
(163,NULL,'2024-01-21 19:42:44',NULL,NULL,'jZ6gTyj7',NULL,'修改',NULL,20,1,'button','Answer@EDIT',161),
(164,NULL,'2024-01-21 19:42:44',NULL,NULL,'SES4l1Uc',NULL,'删除',NULL,30,1,'button','Answer@DELETE',161),
(165,NULL,'2024-01-21 19:42:44',NULL,NULL,'1jU2LwX0',NULL,'导出',NULL,40,1,'button','Answer@EXPORT',161),
(166,NULL,'2024-01-21 19:42:44',NULL,NULL,'0YJcI8f2',NULL,'导入',NULL,50,1,'button','Answer@IMPORTABLE',161),
(167,NULL,'2024-01-21 19:42:44',NULL,NULL,'Fzn1pOM0',NULL,'详情',NULL,60,1,'button','Answer@VIEW_DETAIL',161);
/*!40000 ALTER TABLE `e_upms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_operate_log`
--

DROP TABLE IF EXISTS `e_upms_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `create_time` datetime DEFAULT NULL COMMENT '记录时间',
  `error_info` varchar(4000) DEFAULT NULL COMMENT '错误信息',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `operate_user` varchar(255) DEFAULT NULL COMMENT '操作人',
  `region` varchar(255) DEFAULT NULL COMMENT 'IP来源',
  `req_addr` varchar(4000) DEFAULT NULL COMMENT '请求地址',
  `req_method` varchar(64) DEFAULT NULL COMMENT '请求方法',
  `req_param` longtext DEFAULT NULL COMMENT '请求参数',
  `status` bit(1) DEFAULT NULL COMMENT '是否成功',
  `total_time` bigint(20) DEFAULT NULL COMMENT '请求耗时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_operate_log`
--

LOCK TABLES `e_upms_operate_log` WRITE;
/*!40000 ALTER TABLE `e_upms_operate_log` DISABLE KEYS */;
INSERT INTO `e_upms_operate_log` VALUES
(1,'INSERT | 菜单管理','2024-01-21 19:35:43',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"班级管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Clazz\",\"sort\":90}','',71),
(2,'INSERT | 菜单管理','2024-01-21 19:36:18',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"课程管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Course\",\"sort\":100}','',44),
(3,'INSERT | 菜单管理','2024-01-21 19:36:40',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"成绩管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Score\",\"sort\":110}','',47),
(4,'INSERT | 菜单管理','2024-01-21 19:37:02',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"学生管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Student\",\"sort\":120}','',46),
(5,'INSERT | 菜单管理','2024-01-21 19:37:58',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"文章管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Article\",\"sort\":130}','',38),
(6,'INSERT | 菜单管理','2024-01-21 19:38:12',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"教师管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Teacher\",\"sort\":140}','',41),
(7,'INSERT | 菜单管理','2024-01-21 19:38:26',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"实验管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Lab\",\"sort\":150}','',44),
(8,'INSERT | 菜单管理','2024-01-21 19:38:41',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"前台管理\",\"status\":\"1\",\"sort\":160}','',56),
(9,'INSERT | 菜单管理','2024-01-21 19:39:25',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"项目团队\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardTech\",\"sort\":170}','',25),
(10,'INSERT | 菜单管理','2024-01-21 19:39:43',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"主页\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardHome\",\"sort\":180}','',42),
(11,'INSERT | 菜单管理','2024-01-21 19:40:52',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"实验介绍\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardDescription\",\"sort\":190}','',24),
(12,'INSERT | 菜单管理','2024-01-21 19:41:20',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"实验必读\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardNet\",\"sort\":200}','',32),
(13,'INSERT | 菜单管理','2024-01-21 19:41:54',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"步骤管理\",\"status\":\"1\",\"parentMenu\":{\"id\":\"128\",\"name\":\"前台管理\"},\"type\":\"table\",\"value\":\"DashboardSteps\",\"sort\":210}','',32),
(14,'INSERT | 菜单管理','2024-01-21 19:42:26',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"问题管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Question\",\"sort\":220}','',41),
(15,'INSERT | 菜单管理','2024-01-21 19:42:44',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"回答管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Answer\"}','',32),
(16,'UPDATE | 菜单管理','2024-01-21 19:43:11',NULL,'192.168.0.104','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/EruptMenu/update','POST','{\"name\":\"回答管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Answer\",\"sort\":240,\"code\":\"CKc2427I\",\"id\":\"161\"}','',34),
(17,'INSERT | 项目团队','2024-01-22 20:21:16',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech','POST','{\"situatioone\":\"          贾志超 男 965-10-01\\n          学历：博士研究生学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任：电子信息与人工智能学院地址：陕西科技大学 \\n          电话：xxx-xxxxx手机：1331111111电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\"}','',78),
(18,'INSERT | 主页','2024-01-22 20:24:34',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardHome','POST','{\"cnName\":\"虚拟仿真平合网络实验\",\"enName\":\"VIRTUAL SIMULATION FLAT NETWORK EXPERIMENT\",\"colThree\":\"实验步骤：55步   实验学时：4学时  所属分类：眼镜材料学\",\"introduction\":\"眼睛是心灵的窗户”，人类80%的知识都通过视觉感知后获得。社会和科技的进步以及人类对视觉健康及视力改善的追求，推动了眼镜从传统近视和老花等矫正眼镜，到能够防紫外和蓝光的功能眼镜，再到虚拟现实增强的各类智能眼镜的进步与发展。可以说眼镜作为一类光学器件，已进入到人们生活和工作的方方面面。特别是电子信息时代成长起来的青少年，视力的健康关乎国家和未来，习近平总书记多次对近视防控做出重要指示批示，要求“全社会都要行动起来，共同呵护好孩子的眼睛。光学镜片结构复杂，其设计、生产的关键材料和核心技术由国外把持，行业现状是受制于人。党的二十大报告做出了“加快实现高水平科技自立自强”重大部署，强调“教育、科技、人才是全面建设社会主义现代化国家的基础性、战略性支撑”。为此，视光行业及专业领域针对国内生产工艺繁复、龙头企业镜片产品开发能力弱等问题，开展了产业链布局调整，高品质镜片的研发及人才需求激增。\"}','',15),
(19,'UPDATE | 项目团队','2024-01-22 22:47:50',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech/update','POST','{\"situatioone\":\"          贾志超 男 965-10-01\\n          学历：博士研究生学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任：电子信息与人工智能学院地址：陕西科技大学 \\n          电话：xxx-xxxxx手机：1331111111电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\",\"createBy\":\"erupt\",\"createTime\":\"2024-01-22 20:21:16\",\"updateBy\":\"erupt\",\"updateTime\":\"2024-01-22 20:21:16\",\"id\":\"1\"}','',95),
(20,'UPDATE | 项目团队','2024-01-22 22:51:41',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech/update','POST','{\"situatioone\":\"          贾志超 男 1965-10-01\\n          学历：博士研究生\\n          学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任：电子信息与人工智能学院\\n          地址：陕西科技大学 \\n          电话：xxx-xxxxx\\n          手机：1331111111\\n          电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\",\"createBy\":\"erupt\",\"createTime\":\"2024-01-22 20:21:16\",\"updateBy\":\"erupt\",\"updateTime\":\"2024-01-22 22:47:50\",\"id\":\"1\"}','',16),
(21,'INSERT | 实验介绍','2024-01-22 22:58:40',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardDescription','POST','{\"suzhimubiao\":\"培养学生遵守科学伦理，社会责任感和节能环保意识，在工程实践中遵守职业道德规范和践行社会主义核心价值观。\",\"zhishimubiao\":\"掌握光学镜片工厂化生产的先进工艺流程，掌握各工艺流程中的技术要点，掌握相关设备的使用方法。\",\"nenglimubiao\":\"评价光学镜片的设计过程、生产过程和最终结果，具有解决复杂问题的工程实践能力和数字化能力。\",\"yuanlione\":\"在室温下，将液态预聚体（单体、引发剂、紫外光吸收剂、抗氧剂、添加剂）经过预聚合达到一定粘度，并经过真空脱气之后注入到已装配好的模具中。再将浇注完成的模具放入烘箱中，恒温10小时以上，使其聚合固化成型，得到半成品镜片。\",\"yuanlitwo\":\"半成品树脂镜片质地软，需要增加基本膜层和各种功能膜。基本膜层有两种：一是加硬膜层，常采用涂敷法获得，即把镜片浸在加硬液中，以一定速度提升镜片架，使镜片表面涂敷一层一定厚度的均匀加硬液，然后加热固化；二是增透膜层，常采用溅射法获得，即将镜片放入真空腔，用高能粒子轰击靶材，使靶材原子飞到镜片表面，沉积在镜片表面形成薄膜。功能膜层（抗磨损膜、防蓝光膜层、防雾膜、防眩光膜，偏光膜、染色膜层）也常常被添加到镜片表面，使得镜片能满足不同应用场景的需求。\",\"jieguo\":\"记录每步实验结果：是\\n\\n实验结果与结论要求：实验报告\\n\\n其他描述：\\n\\n北斗卫星导航定位虚拟仿真实验的实验过程流程如图所示，进入实验主入口后分为四个实验模块进行，每个模块有对应的多路径实验条件设计或不同的实验操作，产生不同的实验结果。具体为：\\n\\n北斗图3.jpg\\n\\n实验模块一：北斗卫星导航系统，在虚拟仿真实验中学习认知北斗系统空间段、地面段、用户段，利用鼠标交互操作会有不同的实验现象和结果；\\n\\n实验模块二：北斗伪距定位算法，在实验多路径条件（选星、设置初始位值）下，会产生不同的迭代过程和定位实验结果（不同精度下）；\\n\\n实验模块三：北斗定位性能研究，探索在微波暗室实验多路径条件下（无环境无干扰、有环境无干扰、无环境有干扰），产生不同的定位实验结果，学生需综合所有实验结果，得到复杂电磁环境对定位性能影响的规律。\\n\\n实验模块四：北斗接收机实验，利用鼠标交互操作学习北斗卫星导航信号的产生、传输和接收及接收机原理，利用鼠标交互搭建接收机，并构建接收机定位实验系统，分析接收机定位性能。利用鼠标交互操作会有不同的实验现象和结果。\\n\\n     具体的实验主要结果如下：\\n\\n实验一：北斗卫星导航系统\\n\\n通过拖拽交互式的实验操作过程，使学生正确构建北斗卫星导航定位通信系统，并能建立起系统的正确的通信流程，培养学生的通信系统观，当学生在构建系统拖拽交互操作有误时，系统的完整通信流程无法建立，需要学生重新规划系统组成、重新构建系统，或者通过返回重新学习相关实验内容，再进行交互式拖拽实验，直至正确构建系统及其通信过程，至此完成该交互操作步骤，继续学习手持和车载终端的定位功能实现。\\n\\n实验二：伪距定位算法实验\\n\\n本实验给出6颗卫星的伪距数据和坐标数据，通过让学生选择其中任意4颗卫星（共15种组合），可利用伪距定位算法计算出待定位点在三维空间的位置坐标。\\n\\n当选择不同的4颗卫星组合时，计算的最终结果有微小差别（因卫星的几何构型不同，学生可以分析各种定位结果的差别原因），下面简单列举选择两种卫星组合情况下的计算结果。\\n\\n（1）选择1、2、3、4号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709563.7809, 4992760.1894, 3570929.1965)，单位为m。\\n\\n（2）选择3、4、5、6号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709564.447, 4992761.0408, 3570849.798)，单位为m。\\n\\n实验三：北斗定位性能研究实验\\n\\n在采用标准接收机的条件下，研究同频干扰信号和大气环境因素（电离层和对流层）对定位精度的影响：\\n\\n（1）无环境和无干扰测试条件下，接收机具有较高定位精度，在定位精度展示中可以看到点之间偏离小且集中，在定位结果展示上的观察到可用星数量较多，且接收到的各卫星信号具有较好的载噪比。\\n\\n（2）在有环境且无干扰的测试条件下，如电离层或对流层的大气空间环境影响，相比于无环境影响，定位精度降低，显示在定位精度动态展示中，定位点离散程度较大，定位展示中可用星数量减少，载噪比略降低。\\n\\n（3）在无环境且有干扰的测试条件下，增大同频干扰信号的强度,从-140dBm到-60dBm，以20dBm为间隔，发现接收机定位精度逐渐下降，在定位精度展示上，定位点分散程度变大，且各卫星信号的载噪比下降。当干扰信号功率增大到一定值时，为-60dBm，可见星数量下降为渐减少为5颗，可用星数量为0，最终无法定位。              \\n\\n实验四：北斗接收机定位实验\\n\\n（1）在频谱仪上观测导航信号特性参数\"}','',30),
(22,'INSERT | 实验必读','2024-01-22 23:09:33',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardNet','POST','{\"wangluoyaoqiu\":\"说明客户端到服务器的带宽要求（需提供测试带宽服务）：>50Mb/s 说明能够提供的并发相应数量（需提供在线排队提示服务）：100\",\"yingjianyaoqiu\":\"计算机硬件配置要求：CPU： 最低配置：Intel Core i5-7400 同等或更高配置； 推荐配置：Intel Core i7-9700k 同等或更高配置; 内存： 最低配置：8GB； 推荐配置：16GB 及以上； 显卡（图形处理器）： 最低配置：NVIDIA GeForce GTX 960/AMD Radeon R9 290同等或更高配置； 推荐配置：NVIDIA GeForce GTX 1060/AMD Radeon RX 480同等或更高配置； 存储容量： 最低剩余空间：10GB。 推荐剩余空间：40GB 及以上。\",\"caozuoxitongyaoqiu\":\"计算机操作系统和版本要求：Windows 7及以上 其他计算机终端操作系统和版本要求：无 支持移动端：否\"}','',13),
(23,'UPDATE | 项目团队','2024-01-22 23:32:53',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/DashboardTech/update','POST','{\"situatioone\":\"          贾志超 男 1965-10-01\\n          学历：博士研究生\\n          学位：博士 专业技术职务：教授 \\n          行政职务：教研室主任\\n          学院：电子信息与人工智能学院\\n          地址：陕西科技大学 \\n          电话：xxx-xxxxx\\n          手机：1331111111\\n          电子邮箱：hywang@sust.edu.cn\\n          邮编：710000\",\"situationtwo\":\"    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；\",\"situationthree\":\"        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件\",\"createBy\":\"erupt\",\"createTime\":\"2024-01-22 20:21:16\",\"updateBy\":\"erupt\",\"updateTime\":\"2024-01-22 22:51:41\",\"id\":\"1\"}','',17),
(24,'INSERT | 教师管理','2024-01-22 23:57:18',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Teacher','POST','{\"teacherName\":\"t01\",\"gender\":false,\"teacherNo\":\"t01\",\"tel\":\"15195355289\"}','',29),
(25,'INSERT | 班级管理','2024-01-22 23:57:32',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Clazz','POST','{\"clazzNo\":\"c01\",\"name\":\"c01\",\"clazzDesc\":\"c01\",\"clazzTeacher\":\"1\"}','',10),
(26,'INSERT | 课程管理','2024-01-22 23:57:52',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Course','POST','{\"courseNo\":\"cc01\",\"name\":\"cc01\",\"courseHour\":45,\"courseDesc\":\"cc01\",\"courseActive\":true}','',11),
(27,'INSERT | 成绩管理','2024-01-22 23:58:07',NULL,'192.168.0.102','erupt','0|0|0|内网IP|内网IP','http://localhost:8080/erupt-api/data/modify/Score','POST','{\"courseNo\":\"1\",\"studentNo\":\"1\",\"teacherNo\":\"1\",\"mark1\":45,\"report\":\"\",\"mark2\":34,\"mark\":67}','',8);
/*!40000 ALTER TABLE `e_upms_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_org`
--

DROP TABLE IF EXISTS `e_upms_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '组织编码',
  `name` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `parent_org_id` bigint(20) DEFAULT NULL COMMENT '上级组织',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c2wj35ujq2m84uw59dx6wy3gj` (`code`),
  KEY `FKtj7222kjnkt7pv9kfn9g8ck4h` (`parent_org_id`),
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='组织维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_org`
--

LOCK TABLES `e_upms_org` WRITE;
/*!40000 ALTER TABLE `e_upms_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_post`
--

DROP TABLE IF EXISTS `e_upms_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '岗位编码',
  `name` varchar(255) DEFAULT NULL COMMENT '岗位名称',
  `weight` int(11) DEFAULT NULL COMMENT '岗位权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ltq5h3n5cyyk5nxtjhg9lhidg` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_post`
--

LOCK TABLES `e_upms_post` WRITE;
/*!40000 ALTER TABLE `e_upms_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_role`
--

DROP TABLE IF EXISTS `e_upms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `status` bit(1) DEFAULT NULL COMMENT '状态',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jgxkp7mr4183tcwosrbqpsl3a` (`code`),
  KEY `FKad39xpgtpmhq0fp5newnabv1g` (`create_user_id`),
  KEY `FKbghup2p4f1x9eokeygyg8p658` (`update_user_id`),
  CONSTRAINT `FKad39xpgtpmhq0fp5newnabv1g` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKbghup2p4f1x9eokeygyg8p658` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_role`
--

LOCK TABLES `e_upms_role` WRITE;
/*!40000 ALTER TABLE `e_upms_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_role_menu`
--

DROP TABLE IF EXISTS `e_upms_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FKr6bl403chgwjnb6jk0uqqd9x8` (`menu_id`),
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`),
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_role_menu`
--

LOCK TABLES `e_upms_role_menu` WRITE;
/*!40000 ALTER TABLE `e_upms_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_user`
--

DROP TABLE IF EXISTS `e_upms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `account` varchar(255) DEFAULT NULL COMMENT '用户名',
  `is_admin` bit(1) DEFAULT NULL COMMENT '超管用户',
  `status` bit(1) DEFAULT NULL COMMENT '账户状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `expire_date` datetime DEFAULT NULL COMMENT '账号失效时间',
  `is_md5` bit(1) DEFAULT NULL COMMENT 'md5加密',
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `reset_pwd_time` datetime DEFAULT NULL COMMENT '重置密码时间',
  `white_ip` varchar(2000) DEFAULT NULL COMMENT 'ip白名单',
  `erupt_org_id` bigint(20) DEFAULT NULL COMMENT '所属组织',
  `erupt_post_id` bigint(20) DEFAULT NULL COMMENT '岗位',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user_id` bigint(20) DEFAULT NULL,
  `erupt_menu_id` bigint(20) DEFAULT NULL COMMENT '首页菜单',
  PRIMARY KEY (`id`),
  KEY `FK1re8jv3614mkk2wfxscvgvmnm` (`erupt_org_id`),
  KEY `FK53cice19aydjcuykpv847ocdv` (`erupt_post_id`),
  KEY `FKdvwfw4x66ahh1tavd69cnx4i0` (`create_user_id`),
  KEY `FKct3f9stm4eti10401f7rbh5ey` (`update_user_id`),
  KEY `FKga0jd7sahnn1tv14mq4dy5kba` (`erupt_menu_id`),
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`),
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`),
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='简单用户对象';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_user`
--

LOCK TABLES `e_upms_user` WRITE;
/*!40000 ALTER TABLE `e_upms_user` DISABLE KEYS */;
INSERT INTO `e_upms_user` VALUES
(1,'erupt','erupt','','','2024-01-21 19:34:13',NULL,NULL,NULL,'','c2610f901735286e712ef0a11df1535b',NULL,NULL,'2024-01-21 19:34:35',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `e_upms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_upms_user_role`
--

DROP TABLE IF EXISTS `e_upms_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_upms_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FKes2ylim5w3ej690ss84sb956x` (`user_id`),
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`),
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_upms_user_role`
--

LOCK TABLES `e_upms_user_role` WRITE;
/*!40000 ALTER TABLE `e_upms_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_upms_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods`
--

DROP TABLE IF EXISTS `mall_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` longtext DEFAULT NULL COMMENT '商品描述',
  `freight` double DEFAULT NULL COMMENT '运费',
  `image` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `status` bit(1) DEFAULT NULL COMMENT '商品状态',
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL COMMENT '所属分类',
  PRIMARY KEY (`id`),
  KEY `FKfe3euswjprba9xxhgauis0te0` (`create_user_id`),
  KEY `FKa5c9s7iw1qnmdksudlplnsdbp` (`update_user_id`),
  KEY `FKt37gxywk0mov7wuq2vgw64xqb` (`category_id`),
  CONSTRAINT `FKa5c9s7iw1qnmdksudlplnsdbp` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKfe3euswjprba9xxhgauis0te0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`),
  CONSTRAINT `FKt37gxywk0mov7wuq2vgw64xqb` FOREIGN KEY (`category_id`) REFERENCES `mall_goods_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods`
--

LOCK TABLES `mall_goods` WRITE;
/*!40000 ALTER TABLE `mall_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods_category`
--

DROP TABLE IF EXISTS `mall_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `name` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`id`),
  KEY `FK325iutetrm4xdpbfh7id4iy2e` (`parent_id`),
  CONSTRAINT `FK325iutetrm4xdpbfh7id4iy2e` FOREIGN KEY (`parent_id`) REFERENCES `mall_goods_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods_category`
--

LOCK TABLES `mall_goods_category` WRITE;
/*!40000 ALTER TABLE `mall_goods_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods_coupon`
--

DROP TABLE IF EXISTS `mall_goods_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `end_time` datetime DEFAULT NULL COMMENT '失效时间',
  `max_count` int(11) DEFAULT NULL COMMENT '发行量',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `price` double DEFAULT NULL COMMENT '金额',
  `price_max` double DEFAULT NULL COMMENT '商品金额满多少可用',
  `start_time` datetime DEFAULT NULL COMMENT '生效时间',
  `category_id` bigint(20) DEFAULT NULL COMMENT '指定类别商品可用',
  PRIMARY KEY (`id`),
  KEY `FKkkdn4mcu5n45ve967arj1ou0q` (`category_id`),
  CONSTRAINT `FKkkdn4mcu5n45ve967arj1ou0q` FOREIGN KEY (`category_id`) REFERENCES `mall_goods_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='优惠券管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods_coupon`
--

LOCK TABLES `mall_goods_coupon` WRITE;
/*!40000 ALTER TABLE `mall_goods_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_goods_spec`
--

DROP TABLE IF EXISTS `mall_goods_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_goods_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory` int(11) DEFAULT NULL COMMENT '库存',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `goods_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpa4p510o1pud1wdlgb2aub29t` (`goods_id`),
  CONSTRAINT `FKpa4p510o1pud1wdlgb2aub29t` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品型号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_goods_spec`
--

LOCK TABLES `mall_goods_spec` WRITE;
/*!40000 ALTER TABLE `mall_goods_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_goods_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_answer`
--

DROP TABLE IF EXISTS `t_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content` longtext DEFAULT NULL COMMENT '回答内容',
  `question_id` bigint(20) DEFAULT NULL COMMENT '问题标题',
  `upvote_count` bigint(20) DEFAULT NULL COMMENT '点赞次数',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='回答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_answer`
--

LOCK TABLES `t_answer` WRITE;
/*!40000 ALTER TABLE `t_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_clazz`
--

DROP TABLE IF EXISTS `t_clazz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_clazz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clazz_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `clazz_no` varchar(255) DEFAULT NULL COMMENT '班级编号',
  `clazz_teacher` varchar(255) DEFAULT NULL COMMENT '班主任',
  `name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkbod6sraf09033e31lnoauyea` (`clazz_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='班级管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_clazz`
--

LOCK TABLES `t_clazz` WRITE;
/*!40000 ALTER TABLE `t_clazz` DISABLE KEYS */;
INSERT INTO `t_clazz` VALUES
(1,'c01','c01','1','c01');
/*!40000 ALTER TABLE `t_clazz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course`
--

DROP TABLE IF EXISTS `t_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_active` bit(1) DEFAULT NULL COMMENT '状态',
  `course_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `course_hour` int(11) DEFAULT NULL COMMENT '时长',
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKeah0vjfkol37wi79w6ih2tc11` (`course_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course`
--

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
INSERT INTO `t_course` VALUES
(1,'','cc01',45,'cc01','cc01');
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course_student`
--

DROP TABLE IF EXISTS `t_course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `mark` int(11) DEFAULT NULL COMMENT '总成绩',
  `student_no` varchar(255) DEFAULT NULL COMMENT '学生编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgx6a9b2tsbng1iwq2hv0uen82` (`student_no`,`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程-学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course_student`
--

LOCK TABLES `t_course_student` WRITE;
/*!40000 ALTER TABLE `t_course_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_course_teacher`
--

DROP TABLE IF EXISTS `t_course_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course_teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `teacher_no` varchar(255) DEFAULT NULL COMMENT '教师编号',
  `teaching_date` datetime DEFAULT NULL COMMENT '授课日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK70bktmstrfgciylpn321u6d0v` (`teacher_no`,`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程-教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course_teacher`
--

LOCK TABLES `t_course_teacher` WRITE;
/*!40000 ALTER TABLE `t_course_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_course_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_description`
--

DROP TABLE IF EXISTS `t_dashboard_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_description` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `jieguo` longtext DEFAULT NULL COMMENT '结果与结论',
  `nenglimubiao` longtext DEFAULT NULL COMMENT '能力目标',
  `suzhimubiao` longtext DEFAULT NULL COMMENT '素质目标',
  `yuanlione` longtext DEFAULT NULL COMMENT '实验原理1',
  `yuanlitwo` longtext DEFAULT NULL COMMENT '实验原理2',
  `zhishimubiao` longtext DEFAULT NULL COMMENT '知识目标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验介绍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_description`
--

LOCK TABLES `t_dashboard_description` WRITE;
/*!40000 ALTER TABLE `t_dashboard_description` DISABLE KEYS */;
INSERT INTO `t_dashboard_description` VALUES
(1,'erupt','2024-01-22 22:58:40','erupt','2024-01-22 22:58:40','记录每步实验结果：是\n\n实验结果与结论要求：实验报告\n\n其他描述：\n\n北斗卫星导航定位虚拟仿真实验的实验过程流程如图所示，进入实验主入口后分为四个实验模块进行，每个模块有对应的多路径实验条件设计或不同的实验操作，产生不同的实验结果。具体为：\n\n北斗图3.jpg\n\n实验模块一：北斗卫星导航系统，在虚拟仿真实验中学习认知北斗系统空间段、地面段、用户段，利用鼠标交互操作会有不同的实验现象和结果；\n\n实验模块二：北斗伪距定位算法，在实验多路径条件（选星、设置初始位值）下，会产生不同的迭代过程和定位实验结果（不同精度下）；\n\n实验模块三：北斗定位性能研究，探索在微波暗室实验多路径条件下（无环境无干扰、有环境无干扰、无环境有干扰），产生不同的定位实验结果，学生需综合所有实验结果，得到复杂电磁环境对定位性能影响的规律。\n\n实验模块四：北斗接收机实验，利用鼠标交互操作学习北斗卫星导航信号的产生、传输和接收及接收机原理，利用鼠标交互搭建接收机，并构建接收机定位实验系统，分析接收机定位性能。利用鼠标交互操作会有不同的实验现象和结果。\n\n     具体的实验主要结果如下：\n\n实验一：北斗卫星导航系统\n\n通过拖拽交互式的实验操作过程，使学生正确构建北斗卫星导航定位通信系统，并能建立起系统的正确的通信流程，培养学生的通信系统观，当学生在构建系统拖拽交互操作有误时，系统的完整通信流程无法建立，需要学生重新规划系统组成、重新构建系统，或者通过返回重新学习相关实验内容，再进行交互式拖拽实验，直至正确构建系统及其通信过程，至此完成该交互操作步骤，继续学习手持和车载终端的定位功能实现。\n\n实验二：伪距定位算法实验\n\n本实验给出6颗卫星的伪距数据和坐标数据，通过让学生选择其中任意4颗卫星（共15种组合），可利用伪距定位算法计算出待定位点在三维空间的位置坐标。\n\n当选择不同的4颗卫星组合时，计算的最终结果有微小差别（因卫星的几何构型不同，学生可以分析各种定位结果的差别原因），下面简单列举选择两种卫星组合情况下的计算结果。\n\n（1）选择1、2、3、4号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709563.7809, 4992760.1894, 3570929.1965)，单位为m。\n\n（2）选择3、4、5、6号卫星，并设置初值A0 = [0,0,0,0]T，通过5次迭代计算后，获得待定位点的位置坐标为P = (−1709564.447, 4992761.0408, 3570849.798)，单位为m。\n\n实验三：北斗定位性能研究实验\n\n在采用标准接收机的条件下，研究同频干扰信号和大气环境因素（电离层和对流层）对定位精度的影响：\n\n（1）无环境和无干扰测试条件下，接收机具有较高定位精度，在定位精度展示中可以看到点之间偏离小且集中，在定位结果展示上的观察到可用星数量较多，且接收到的各卫星信号具有较好的载噪比。\n\n（2）在有环境且无干扰的测试条件下，如电离层或对流层的大气空间环境影响，相比于无环境影响，定位精度降低，显示在定位精度动态展示中，定位点离散程度较大，定位展示中可用星数量减少，载噪比略降低。\n\n（3）在无环境且有干扰的测试条件下，增大同频干扰信号的强度,从-140dBm到-60dBm，以20dBm为间隔，发现接收机定位精度逐渐下降，在定位精度展示上，定位点分散程度变大，且各卫星信号的载噪比下降。当干扰信号功率增大到一定值时，为-60dBm，可见星数量下降为渐减少为5颗，可用星数量为0，最终无法定位。              \n\n实验四：北斗接收机定位实验\n\n（1）在频谱仪上观测导航信号特性参数','评价光学镜片的设计过程、生产过程和最终结果，具有解决复杂问题的工程实践能力和数字化能力。','培养学生遵守科学伦理，社会责任感和节能环保意识，在工程实践中遵守职业道德规范和践行社会主义核心价值观。','在室温下，将液态预聚体（单体、引发剂、紫外光吸收剂、抗氧剂、添加剂）经过预聚合达到一定粘度，并经过真空脱气之后注入到已装配好的模具中。再将浇注完成的模具放入烘箱中，恒温10小时以上，使其聚合固化成型，得到半成品镜片。','半成品树脂镜片质地软，需要增加基本膜层和各种功能膜。基本膜层有两种：一是加硬膜层，常采用涂敷法获得，即把镜片浸在加硬液中，以一定速度提升镜片架，使镜片表面涂敷一层一定厚度的均匀加硬液，然后加热固化；二是增透膜层，常采用溅射法获得，即将镜片放入真空腔，用高能粒子轰击靶材，使靶材原子飞到镜片表面，沉积在镜片表面形成薄膜。功能膜层（抗磨损膜、防蓝光膜层、防雾膜、防眩光膜，偏光膜、染色膜层）也常常被添加到镜片表面，使得镜片能满足不同应用场景的需求。','掌握光学镜片工厂化生产的先进工艺流程，掌握各工艺流程中的技术要点，掌握相关设备的使用方法。');
/*!40000 ALTER TABLE `t_dashboard_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_home`
--

DROP TABLE IF EXISTS `t_dashboard_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_home` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `cn_name` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `col_three` varchar(255) DEFAULT NULL COMMENT '步骤学时分类',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `introduction` longtext DEFAULT NULL COMMENT '实验简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='首页';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_home`
--

LOCK TABLES `t_dashboard_home` WRITE;
/*!40000 ALTER TABLE `t_dashboard_home` DISABLE KEYS */;
INSERT INTO `t_dashboard_home` VALUES
(1,'erupt','2024-01-22 20:24:34','erupt','2024-01-22 20:24:34','虚拟仿真平合网络实验','实验步骤：55步   实验学时：4学时  所属分类：眼镜材料学','VIRTUAL SIMULATION FLAT NETWORK EXPERIMENT','眼睛是心灵的窗户”，人类80%的知识都通过视觉感知后获得。社会和科技的进步以及人类对视觉健康及视力改善的追求，推动了眼镜从传统近视和老花等矫正眼镜，到能够防紫外和蓝光的功能眼镜，再到虚拟现实增强的各类智能眼镜的进步与发展。可以说眼镜作为一类光学器件，已进入到人们生活和工作的方方面面。特别是电子信息时代成长起来的青少年，视力的健康关乎国家和未来，习近平总书记多次对近视防控做出重要指示批示，要求“全社会都要行动起来，共同呵护好孩子的眼睛。光学镜片结构复杂，其设计、生产的关键材料和核心技术由国外把持，行业现状是受制于人。党的二十大报告做出了“加快实现高水平科技自立自强”重大部署，强调“教育、科技、人才是全面建设社会主义现代化国家的基础性、战略性支撑”。为此，视光行业及专业领域针对国内生产工艺繁复、龙头企业镜片产品开发能力弱等问题，开展了产业链布局调整，高品质镜片的研发及人才需求激增。');
/*!40000 ALTER TABLE `t_dashboard_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_net`
--

DROP TABLE IF EXISTS `t_dashboard_net`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_net` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `caozuoxitongyaoqiu` longtext DEFAULT NULL COMMENT '操作系统要求',
  `wangluoyaoqiu` longtext DEFAULT NULL COMMENT '网络要求',
  `yingjianyaoqiu` longtext DEFAULT NULL COMMENT '硬件要求',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验必读';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_net`
--

LOCK TABLES `t_dashboard_net` WRITE;
/*!40000 ALTER TABLE `t_dashboard_net` DISABLE KEYS */;
INSERT INTO `t_dashboard_net` VALUES
(1,'erupt','2024-01-22 23:09:33','erupt','2024-01-22 23:09:33','计算机操作系统和版本要求：Windows 7及以上 其他计算机终端操作系统和版本要求：无 支持移动端：否','说明客户端到服务器的带宽要求（需提供测试带宽服务）：>50Mb/s 说明能够提供的并发相应数量（需提供在线排队提示服务）：100','计算机硬件配置要求：CPU： 最低配置：Intel Core i5-7400 同等或更高配置； 推荐配置：Intel Core i7-9700k 同等或更高配置; 内存： 最低配置：8GB； 推荐配置：16GB 及以上； 显卡（图形处理器）： 最低配置：NVIDIA GeForce GTX 960/AMD Radeon R9 290同等或更高配置； 推荐配置：NVIDIA GeForce GTX 1060/AMD Radeon RX 480同等或更高配置； 存储容量： 最低剩余空间：10GB。 推荐剩余空间：40GB 及以上。');
/*!40000 ALTER TABLE `t_dashboard_net` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_steps`
--

DROP TABLE IF EXISTS `t_dashboard_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_steps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `rank` int(11) DEFAULT NULL COMMENT '步骤次序',
  `stepcontent` longtext DEFAULT NULL COMMENT '步骤内容',
  `stepname` varchar(255) DEFAULT NULL COMMENT '步骤名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验步骤';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_steps`
--

LOCK TABLES `t_dashboard_steps` WRITE;
/*!40000 ALTER TABLE `t_dashboard_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dashboard_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dashboard_tech`
--

DROP TABLE IF EXISTS `t_dashboard_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dashboard_tech` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `situationthree` longtext DEFAULT NULL COMMENT '学术研究情况',
  `situationtwo` longtext DEFAULT NULL COMMENT '教学研究情况',
  `situatioone` longtext DEFAULT NULL COMMENT '负责人情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目团队';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dashboard_tech`
--

LOCK TABLES `t_dashboard_tech` WRITE;
/*!40000 ALTER TABLE `t_dashboard_tech` DISABLE KEYS */;
INSERT INTO `t_dashboard_tech` VALUES
(1,'erupt','2024-01-22 20:21:16','erupt','2024-01-22 23:32:53','        在国内外公开发行刊物上发表的学术论文（含题目、刊物名称、署名次序与时间，不超过5项）；获得的学术研究表彰/奖励（含奖项名称、授予单位、署名次序、时间，不超过5项））\n          近年来获国家教学成果一等奖1项、陕西省教学成果特等奖1项，2020年获批国家级“新工科研究与实践”项目1项；主要研究方向有，现代信号检测与现代信息处理、水声信息感知、水下电子对抗与智能应用系统等；近年来，获国家科技进步二等奖2项，获省部级科技进步一、二、三等奖及发明三等奖共15项，2015年被评选为科学中国人年度人物，2020年获批国家重点自然基金项目，近5年发表重要学术论文80余篇，受理、授权专利36件','    作为第一署名人在国内外公开发行的刊物上发表的教学研究论文（含题目、刊物名称、时间，不超过10项）；获得的教学表彰/奖励（不超过5项））\n          随着北斗系统的广泛应用，从2016年开始，团队成员开展北斗导航定位系统的教学科研工作，同时将其作为电子信息类专业的选修课程；2018年，开始虚拟仿真实验课程建设，现为我校电子信息类专业通信原理、创新创业实验、综合实验等课程或环节的必修内容。团队负责人王海燕教授，注重教学实践，注重学生创新能力培养，能够将自己的科研成果第一时间转移到课程内容中，注重学生个性化培养；在本项目的开发过程中，突出学生中心地位，注重学生认知特点，以问题为导向，培养学习能力，在项目的内容、交互方式和学习效果上注重持续改进。曾主讲本科课程“微弱信号检测技术”、“电子系统分析与设计”、“学科前沿讲座”等3门课程；','          贾志超 男 1965-10-01\n          学历：博士研究生\n          学位：博士 专业技术职务：教授 \n          行政职务：教研室主任\n          学院：电子信息与人工智能学院\n          地址：陕西科技大学 \n          电话：xxx-xxxxx\n          手机：1331111111\n          电子邮箱：hywang@sust.edu.cn\n          邮编：710000');
/*!40000 ALTER TABLE `t_dashboard_tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lab`
--

DROP TABLE IF EXISTS `t_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_lab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext DEFAULT NULL COMMENT '实验描述',
  `pdf_conclusions` varchar(255) DEFAULT NULL COMMENT '实验结果与结论',
  `pdf_goal` varchar(255) DEFAULT NULL COMMENT '教学目标',
  `pdf_principle` varchar(255) DEFAULT NULL COMMENT '实验原理',
  `pdf_step` varchar(255) DEFAULT NULL COMMENT '实验步骤',
  `pdf_team` varchar(255) DEFAULT NULL COMMENT '项目团队',
  `pic` varchar(255) DEFAULT NULL COMMENT '封面图',
  `title` varchar(255) DEFAULT NULL COMMENT '实验名称',
  `video_guide` varchar(255) DEFAULT NULL COMMENT '教学引导',
  `video_introduction` varchar(255) DEFAULT NULL COMMENT '视频简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='实验管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lab`
--

LOCK TABLES `t_lab` WRITE;
/*!40000 ALTER TABLE `t_lab` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_question`
--

DROP TABLE IF EXISTS `t_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `content` longtext DEFAULT NULL COMMENT '内容',
  `publish` bit(1) DEFAULT NULL COMMENT '问题状态',
  `solved` bit(1) DEFAULT NULL COMMENT '是否解决',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `upvote_count` bigint(20) DEFAULT NULL COMMENT '点赞次数',
  `view_count` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_question`
--

LOCK TABLES `t_question` WRITE;
/*!40000 ALTER TABLE `t_question` DISABLE KEYS */;
INSERT INTO `t_question` VALUES
(1,'linjb','2024-01-22 15:49:40','linjb',NULL,'nihao nihao nihao nihao nihao ','','\0','nihao ',NULL,NULL);
/*!40000 ALTER TABLE `t_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_score`
--

DROP TABLE IF EXISTS `t_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_no` varchar(255) DEFAULT NULL COMMENT '课程编号',
  `mark` int(11) DEFAULT NULL COMMENT '总成绩',
  `mark1` int(11) DEFAULT NULL COMMENT '成绩1',
  `mark2` int(11) DEFAULT NULL COMMENT '成绩2',
  `report` varchar(255) DEFAULT NULL COMMENT '实验报告',
  `student_no` varchar(255) DEFAULT NULL COMMENT '学生编号',
  `teacher_no` varchar(255) DEFAULT NULL COMMENT '教师编号',
  `student_id` bigint(20) DEFAULT NULL COMMENT '学生名称',
  PRIMARY KEY (`id`),
  KEY `FK9yiug4y55bkn06wffy1m32px0` (`student_id`),
  CONSTRAINT `FK9yiug4y55bkn06wffy1m32px0` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='成绩管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_score`
--

LOCK TABLES `t_score` WRITE;
/*!40000 ALTER TABLE `t_score` DISABLE KEYS */;
INSERT INTO `t_score` VALUES
(1,'1',39,45,34,'','1','1',1);
/*!40000 ALTER TABLE `t_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student`
--

DROP TABLE IF EXISTS `t_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `clazz_no` varchar(255) DEFAULT NULL COMMENT '班级',
  `gender` bit(1) DEFAULT NULL COMMENT '性别',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `student_no` varchar(255) DEFAULT NULL COMMENT '学号',
  `tel` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `clazz_id` bigint(20) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKj6jrjkwe4rh6bo2jykdrb8kbm` (`student_no`,`idcard`),
  KEY `FK86xs8ow9uasv8eew6aup5g8pg` (`clazz_id`),
  CONSTRAINT `FK86xs8ow9uasv8eew6aup5g8pg` FOREIGN KEY (`clazz_id`) REFERENCES `t_clazz` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES
(1,NULL,NULL,NULL,NULL,NULL,'linjb','123456','linjb','15195355289',NULL);
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_teacher`
--

DROP TABLE IF EXISTS `t_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `gender` bit(1) DEFAULT NULL COMMENT '性别',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `teacher_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `teacher_no` varchar(255) DEFAULT NULL COMMENT '职工号',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKs3y47pmwlswxgpjujvdkig7gu` (`idcard`,`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='教师管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_teacher`
--

LOCK TABLES `t_teacher` WRITE;
/*!40000 ALTER TABLE `t_teacher` DISABLE KEYS */;
INSERT INTO `t_teacher` VALUES
(1,NULL,NULL,'\0',NULL,'t01','t01','15195355289');
/*!40000 ALTER TABLE `t_teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24 13:05:53
