-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: example
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app` (
  `appname` varchar(80) NOT NULL DEFAULT '',
  `geometry` varchar(9) NOT NULL DEFAULT '',
  `depth` smallint(5) unsigned NOT NULL DEFAULT '16',
  `hostreq` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userreq` bigint(20) unsigned NOT NULL DEFAULT '0',
  `timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `command` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display`
--

DROP TABLE IF EXISTS `display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display` (
  `hostname` varchar(40) NOT NULL DEFAULT '',
  `dispnum` int(10) unsigned DEFAULT '0',
  `geometry` varchar(9) NOT NULL DEFAULT '',
  `depth` smallint(5) unsigned NOT NULL DEFAULT '16',
  `sessnum` bigint(20) unsigned DEFAULT '0',
  `vncpass` varchar(16) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT '',
  KEY `idx_hostname` (`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display`
--

LOCK TABLES `display` WRITE;
/*!40000 ALTER TABLE `display` DISABLE KEYS */;
/*!40000 ALTER TABLE `display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domainclass`
--

DROP TABLE IF EXISTS `domainclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domainclass` (
  `class` tinyint(4) NOT NULL DEFAULT '0',
  `country` varchar(4) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `name` tinytext NOT NULL,
  `state` varchar(4) NOT NULL,
  PRIMARY KEY (`domain`),
  KEY `idx_class` (`class`) USING BTREE,
  KEY `idx_domain_class` (`domain`,`class`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domainclass`
--

LOCK TABLES `domainclass` WRITE;
/*!40000 ALTER TABLE `domainclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `domainclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domainclasses`
--

DROP TABLE IF EXISTS `domainclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domainclasses` (
  `class` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domainclasses`
--

LOCK TABLES `domainclasses` WRITE;
/*!40000 ALTER TABLE `domainclasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `domainclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileperm`
--

DROP TABLE IF EXISTS `fileperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileperm` (
  `sessnum` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fileuser` varchar(32) NOT NULL DEFAULT '',
  `fwhost` varchar(40) NOT NULL DEFAULT '',
  `fwport` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cookie` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`sessnum`,`fileuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileperm`
--

LOCK TABLES `fileperm` WRITE;
/*!40000 ALTER TABLE `fileperm` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hg_update_queue`
--

DROP TABLE IF EXISTS `hg_update_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hg_update_queue` (
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `other_id` int(11) DEFAULT NULL,
  `note` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_update_queue`
--

LOCK TABLES `hg_update_queue` WRITE;
/*!40000 ALTER TABLE `hg_update_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `hg_update_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `hostname` varchar(40) NOT NULL DEFAULT '',
  `provisions` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT '',
  `uses` int(11) NOT NULL DEFAULT '0',
  `portbase` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `max_uses` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES ('localhost',14,'up',0,0,NULL,0);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosttype`
--

DROP TABLE IF EXISTS `hosttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosttype` (
  `name` varchar(40) NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosttype`
--

LOCK TABLES `hosttype` WRITE;
/*!40000 ALTER TABLE `hosttype` DISABLE KEYS */;
INSERT INTO `hosttype` VALUES ('workspace',1,'Workspace host'),('fileserver',2,'Fileserver host'),('pubnet',4,'Public host'),('sessions',8,'Normal jobs'),('openvz',16,'OpenVZ');
/*!40000 ALTER TABLE `hosttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `sessnum` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jobid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `superjob` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `event` varchar(40) NOT NULL DEFAULT '',
  `ncpus` smallint(5) unsigned NOT NULL DEFAULT '0',
  `venue` varchar(80) NOT NULL DEFAULT '',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `heartbeat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` smallint(2) NOT NULL DEFAULT '1',
  `jobtoken` varchar(32) DEFAULT NULL,
  UNIQUE KEY `uidx_jobid` (`jobid`),
  KEY `idx_start` (`start`),
  KEY `idx_heartbeat` (`heartbeat`),
  KEY `idx_username_jobtoken` (`username`,`jobtoken`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joblog`
--

DROP TABLE IF EXISTS `joblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joblog` (
  `sessnum` bigint(20) unsigned NOT NULL DEFAULT '0',
  `job` int(10) unsigned NOT NULL DEFAULT '0',
  `superjob` bigint(20) unsigned NOT NULL DEFAULT '0',
  `event` varchar(40) NOT NULL DEFAULT '',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `walltime` double unsigned DEFAULT '0',
  `cputime` double unsigned DEFAULT '0',
  `ncpus` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` smallint(5) unsigned DEFAULT '0',
  `venue` varchar(80) NOT NULL DEFAULT '',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sessnum`,`job`,`event`,`venue`),
  KEY `idx_sessnum` (`sessnum`),
  KEY `idx_event` (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joblog`
--

LOCK TABLES `joblog` WRITE;
/*!40000 ALTER TABLE `joblog` DISABLE KEYS */;
/*!40000 ALTER TABLE `joblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_abuse_reports`
--

DROP TABLE IF EXISTS `jos_abuse_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_abuse_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `referenceid` int(11) unsigned NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(150) DEFAULT NULL,
  `reviewed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reviewed_by` int(11) unsigned NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_reviewed_by` (`reviewed_by`),
  KEY `idx_state` (`state`),
  KEY `idx_category_referenceid` (`category`,`referenceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_abuse_reports`
--

LOCK TABLES `jos_abuse_reports` WRITE;
/*!40000 ALTER TABLE `jos_abuse_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_abuse_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_activity_digests`
--

DROP TABLE IF EXISTS `jos_activity_digests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_activity_digests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(250) NOT NULL,
  `scope_id` int(11) unsigned NOT NULL DEFAULT '0',
  `frequency` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`scope_id`),
  KEY `idx_frequency` (`frequency`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_activity_digests`
--

LOCK TABLES `jos_activity_digests` WRITE;
/*!40000 ALTER TABLE `jos_activity_digests` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_activity_digests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_activity_logs`
--

DROP TABLE IF EXISTS `jos_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_activity_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `action` varchar(100) DEFAULT NULL,
  `scope` varchar(250) NOT NULL DEFAULT '',
  `scope_id` int(11) unsigned NOT NULL DEFAULT '0',
  `details` text,
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`),
  KEY `idx_action` (`action`),
  KEY `idx_parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_activity_logs`
--

LOCK TABLES `jos_activity_logs` WRITE;
/*!40000 ALTER TABLE `jos_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_activity_recipients`
--

DROP TABLE IF EXISTS `jos_activity_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_activity_recipients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(11) unsigned NOT NULL DEFAULT '0',
  `scope` varchar(250) NOT NULL,
  `scope_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `starred` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_log_id` (`log_id`),
  KEY `idx_user_id` (`scope_id`),
  KEY `idx_state` (`state`),
  KEY `idx_starred` (`starred`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_activity_recipients`
--

LOCK TABLES `jos_activity_recipients` WRITE;
/*!40000 ALTER TABLE `jos_activity_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_activity_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_activity_subscriptions`
--

DROP TABLE IF EXISTS `jos_activity_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_activity_subscriptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `scope` varchar(250) NOT NULL DEFAULT '',
  `scope_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_activity_subscriptions`
--

LOCK TABLES `jos_activity_subscriptions` WRITE;
/*!40000 ALTER TABLE `jos_activity_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_activity_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_announcements`
--

DROP TABLE IF EXISTS `jos_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_announcements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(100) DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `content` text,
  `priority` tinyint(2) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sticky` tinyint(2) NOT NULL DEFAULT '0',
  `email` tinyint(4) DEFAULT '0',
  `sent` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_state` (`state`),
  KEY `idx_priority` (`priority`),
  KEY `idx_sticky` (`sticky`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_announcements`
--

LOCK TABLES `jos_announcements` WRITE;
/*!40000 ALTER TABLE `jos_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_answers_questions`
--

DROP TABLE IF EXISTS `jos_answers_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_answers_questions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL DEFAULT '',
  `question` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `email` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `helpful` int(11) unsigned NOT NULL DEFAULT '0',
  `reward` tinyint(2) NOT NULL DEFAULT '0',
  `nothelpful` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  FULLTEXT KEY `ftidx_question` (`question`),
  FULLTEXT KEY `ftidx_subject` (`subject`),
  FULLTEXT KEY `ftidx_question_subject` (`question`,`subject`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_answers_questions`
--

LOCK TABLES `jos_answers_questions` WRITE;
/*!40000 ALTER TABLE `jos_answers_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_answers_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_answers_responses`
--

DROP TABLE IF EXISTS `jos_answers_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_answers_responses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) unsigned NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `helpful` int(11) unsigned NOT NULL DEFAULT '0',
  `nothelpful` int(11) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qid` (`question_id`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  FULLTEXT KEY `ftidx_answer` (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_answers_responses`
--

LOCK TABLES `jos_answers_responses` WRITE;
/*!40000 ALTER TABLE `jos_answers_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_answers_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_antispam_message_hashes`
--

DROP TABLE IF EXISTS `jos_antispam_message_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_antispam_message_hashes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_antispam_message_hashes`
--

LOCK TABLES `jos_antispam_message_hashes` WRITE;
/*!40000 ALTER TABLE `jos_antispam_message_hashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_antispam_message_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_antispam_token_counts`
--

DROP TABLE IF EXISTS `jos_antispam_token_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_antispam_token_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_count` int(11) DEFAULT '0',
  `bad_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_antispam_token_counts`
--

LOCK TABLES `jos_antispam_token_counts` WRITE;
/*!40000 ALTER TABLE `jos_antispam_token_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_antispam_token_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_antispam_token_probs`
--

DROP TABLE IF EXISTS `jos_antispam_token_probs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_antispam_token_probs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(256) NOT NULL,
  `prob` float DEFAULT '0',
  `prev_prob` float DEFAULT '0',
  `in_ham` int(11) DEFAULT '0',
  `in_spam` int(11) DEFAULT '0',
  `provider` varchar(256) DEFAULT NULL,
  `param1` varchar(256) NOT NULL,
  `param2` varchar(256) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_antispam_token_probs`
--

LOCK TABLES `jos_antispam_token_probs` WRITE;
/*!40000 ALTER TABLE `jos_antispam_token_probs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_antispam_token_probs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_antispam_words`
--

DROP TABLE IF EXISTS `jos_antispam_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_antispam_words` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_antispam_words`
--

LOCK TABLES `jos_antispam_words` WRITE;
/*!40000 ALTER TABLE `jos_antispam_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_antispam_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_assets`
--

DROP TABLE IF EXISTS `jos_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_assets`
--

LOCK TABLES `jos_assets` WRITE;
/*!40000 ALTER TABLE `jos_assets` DISABLE KEYS */;
INSERT INTO `jos_assets` VALUES (1,0,0,199,0,'root.1','Root Asset','{\"core.login.site\":{\"1\":1,\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(4,1,85,86,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,87,88,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,89,90,1,'com_config','com_config','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"7\":1},\"core.delete\":{\"7\":1},\"core.edit\":{\"7\":1},\"core.edit.state\":{\"7\":1}}'),(8,1,91,144,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(9,1,145,146,1,'com_cpanel','com_cpanel','{}'),(10,1,147,148,1,'com_installer','com_installer','{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),(11,1,149,150,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(12,1,151,152,1,'com_login','com_login','{}'),(13,1,153,154,1,'com_mailto','com_mailto','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"7\":1},\"core.delete\":{\"7\":1},\"core.edit\":{\"7\":1},\"core.edit.state\":{\"7\":1}}'),(14,1,155,156,1,'com_massmail','com_massmail','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"7\":1},\"core.delete\":{\"7\":1},\"core.edit\":{\"7\":1},\"core.edit.state\":{\"7\":1}}'),(15,1,157,158,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,159,160,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(17,1,161,162,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,163,164,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(19,1,165,168,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(20,1,169,170,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(21,1,171,172,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),(23,1,173,174,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(24,1,175,178,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(27,8,134,143,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(30,19,166,167,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(32,24,176,177,2,'com_users.category.7','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(107,1,195,196,1,'com_developer','com_developer','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(35,1,79,80,1,'com_answers','com_answers','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"2\":1},\"core.delete\":[],\"core.edit\":{\"2\":1},\"core.edit.state\":[],\"core.edit.own\":[]}'),(36,1,77,78,1,'com_billboards','com_billboards','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(37,1,75,76,1,'com_blog','com_blog','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(38,1,47,48,1,'com_citations','com_citations','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(39,1,45,46,1,'com_courses','com_courses','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(40,1,43,44,1,'com_cron','com_cron','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(41,1,33,42,1,'com_events','com_events','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(43,1,31,32,1,'com_feedback','com_feedback','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(44,1,29,30,1,'com_forum','com_forum','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(45,1,83,84,1,'com_groups','com_groups','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.view\":[],\"core.create\":{\"2\":1},\"core.delete\":[],\"core.edit\":{\"2\":1},\"core.edit.state\":[],\"core.edit.own\":[]}'),(46,1,27,28,1,'com_help','com_help','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(47,1,25,26,1,'com_jobs','com_jobs','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(48,1,7,24,1,'com_kb','com_kb','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(49,1,5,6,1,'com_members','com_members','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(50,1,3,4,1,'com_newsletter','com_newsletter','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(51,1,49,50,1,'com_poll','com_poll','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(52,1,51,52,1,'com_projects','com_projects','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.view\":[],\"core.create\":{\"2\":1},\"core.delete\":[],\"core.edit\":{\"2\":1},\"core.edit.state\":[],\"core.edit.own\":[]}'),(54,1,73,74,1,'com_resources','com_resources','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(55,1,71,72,1,'com_services','com_services','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(56,1,69,70,1,'com_store','com_store','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(57,1,67,68,1,'com_support','com_support','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(58,1,65,66,1,'com_system','com_system','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(59,1,63,64,1,'com_tags','com_tags','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(60,1,81,82,1,'com_tools','com_tools','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(62,1,61,62,1,'com_usage','com_usage','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(63,1,59,60,1,'com_user','com_user','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(64,1,57,58,1,'com_whatsnew','com_whatsnew','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(65,1,55,56,1,'com_wiki','com_wiki','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(66,1,53,54,1,'com_wishlist','com_wishlist','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(67,1,1,2,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(68,8,92,107,2,'com_content.category.8','com_content','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(69,8,108,125,2,'com_content.category.9','com_content','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(70,8,126,127,2,'com_content.category.10','com_content','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(71,8,128,129,2,'com_content.category.11','com_content','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(72,41,34,35,2,'com_events.category.12','com_events','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(73,41,36,37,2,'com_events.category.13','com_events','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(74,41,38,39,2,'com_events.category.14','com_events','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(75,41,40,41,2,'com_events.category.15','com_events','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(76,77,131,132,3,'com_content.category.16','com_content','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(77,8,130,133,2,'com_content.category.17','com_content','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(78,27,135,136,3,'com_content.article.1','Home','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(79,68,93,94,3,'com_content.article.2','Our Cyberinfrastructure','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(80,68,95,96,3,'com_content.article.3','About Us','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(81,68,97,98,3,'com_content.article.4','Contact Us','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(82,68,99,100,3,'com_content.article.5','Quotes','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(83,68,101,102,3,'com_content.article.6','Usage','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(84,68,103,104,3,'com_content.article.7','Copyrights','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(85,68,105,106,3,'com_content.article.8','Feedback','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(86,69,109,110,3,'com_content.article.11','Terms of Use','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(87,69,111,112,3,'com_content.article.12','Intellectual Property Considerations','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(88,69,113,114,3,'com_content.article.13','Creative Commons','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(89,69,115,116,3,'com_content.article.14','Submitting Content','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(90,27,137,138,3,'com_content.article.22','Discover','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(91,27,139,140,3,'com_content.article.32','Congratulations','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(92,69,117,118,3,'com_content.article.27','Privacy Policy','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(93,69,119,120,3,'com_content.article.28','Abuse Policy','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(94,69,121,122,3,'com_content.article.29','Legal','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(95,69,123,124,3,'com_content.article.30','HUBzero Accessibility Statement','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(96,27,141,142,3,'com_content.article.31','Community','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(97,1,179,180,1,'com_collections','com_collections','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(98,1,181,182,1,'com_dataviewer','com_dataviewer','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(99,1,183,184,1,'com_storefront','com_storefront','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(100,1,185,186,1,'com_cart','com_cart','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(101,1,187,188,1,'com_publications','com_publications','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(103,1,189,190,1,'com_feedaggregator','com_feedaggregator','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(104,1,191,192,1,'com_update','com_update','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(105,1,193,194,1,'com_time','com_time','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(108,1,197,198,1,'com_geosearch','com_geosearch','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(109,48,8,9,2,'com_kb.category.18','Members & Groups',''),(110,48,10,11,2,'com_kb.category.19','Login & Registration',''),(111,48,12,13,2,'com_kb.category.20','Miscellaneous',''),(112,48,14,15,2,'com_kb.category.21','Tags',''),(113,48,16,17,2,'com_kb.category.22','Tips',''),(114,48,18,19,2,'com_kb.category.23','Tools',''),(115,48,20,21,2,'com_kb.category.24','Resources',''),(116,48,22,23,2,'com_kb.category.25','Reward Points','');
/*!40000 ALTER TABLE `jos_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_associations`
--

DROP TABLE IF EXISTS `jos_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_associations`
--

LOCK TABLES `jos_associations` WRITE;
/*!40000 ALTER TABLE `jos_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_audit_results`
--

DROP TABLE IF EXISTS `jos_audit_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_audit_results` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(100) NOT NULL DEFAULT '',
  `scope_id` int(11) unsigned NOT NULL DEFAULT '0',
  `processed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `notes` tinytext NOT NULL,
  `test_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`),
  KEY `idx_status` (`status`),
  KEY `idx_test_id` (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_audit_results`
--

LOCK TABLES `jos_audit_results` WRITE;
/*!40000 ALTER TABLE `jos_audit_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_audit_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_auth_domain`
--

DROP TABLE IF EXISTS `jos_auth_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_auth_domain` (
  `authenticator` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_auth_domain`
--

LOCK TABLES `jos_auth_domain` WRITE;
/*!40000 ALTER TABLE `jos_auth_domain` DISABLE KEYS */;
INSERT INTO `jos_auth_domain` VALUES ('facebook','',1,'','authentication'),('google','',2,'','authentication'),('linkedin','',3,'','authentication'),('pucas','',4,'','authentication');
/*!40000 ALTER TABLE `jos_auth_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_auth_link`
--

DROP TABLE IF EXISTS `jos_auth_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_auth_link` (
  `auth_domain_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `linked_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_auth_link`
--

LOCK TABLES `jos_auth_link` WRITE;
/*!40000 ALTER TABLE `jos_auth_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_auth_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_author_assoc`
--

DROP TABLE IF EXISTS `jos_author_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_author_assoc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subtable` varchar(50) NOT NULL DEFAULT '',
  `subid` int(11) NOT NULL DEFAULT '0',
  `authorid` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_subtable_subid_authorid` (`subtable`,`subid`,`authorid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_author_assoc`
--

LOCK TABLES `jos_author_assoc` WRITE;
/*!40000 ALTER TABLE `jos_author_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_author_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_author_role_types`
--

DROP TABLE IF EXISTS `jos_author_role_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_author_role_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_author_role_types`
--

LOCK TABLES `jos_author_role_types` WRITE;
/*!40000 ALTER TABLE `jos_author_role_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_author_role_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_author_roles`
--

DROP TABLE IF EXISTS `jos_author_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_author_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_author_roles`
--

LOCK TABLES `jos_author_roles` WRITE;
/*!40000 ALTER TABLE `jos_author_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_author_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_author_stats`
--

DROP TABLE IF EXISTS `jos_author_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_author_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorid` int(11) NOT NULL,
  `tool_users` bigint(20) DEFAULT NULL,
  `andmore_users` bigint(20) DEFAULT NULL,
  `total_users` bigint(20) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_author_stats`
--

LOCK TABLES `jos_author_stats` WRITE;
/*!40000 ALTER TABLE `jos_author_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_author_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_billboards_billboards`
--

DROP TABLE IF EXISTS `jos_billboards_billboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_billboards_billboards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `text` text,
  `learn_more_text` varchar(255) DEFAULT NULL,
  `learn_more_target` varchar(255) DEFAULT NULL,
  `learn_more_class` varchar(255) DEFAULT NULL,
  `learn_more_location` varchar(255) DEFAULT NULL,
  `background_img` varchar(255) DEFAULT NULL,
  `padding` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `css` text,
  `published` tinyint(1) DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_collection_id` (`collection_id`),
  KEY `idx_published` (`published`),
  KEY `idx_alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_billboards_billboards`
--

LOCK TABLES `jos_billboards_billboards` WRITE;
/*!40000 ALTER TABLE `jos_billboards_billboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_billboards_billboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_billboards_collections`
--

DROP TABLE IF EXISTS `jos_billboards_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_billboards_collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_billboards_collections`
--

LOCK TABLES `jos_billboards_collections` WRITE;
/*!40000 ALTER TABLE `jos_billboards_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_billboards_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_blog_comments`
--

DROP TABLE IF EXISTS `jos_blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_blog_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_entry_id` (`entry_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_blog_comments`
--

LOCK TABLES `jos_blog_comments` WRITE;
/*!40000 ALTER TABLE `jos_blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_blog_entries`
--

DROP TABLE IF EXISTS `jos_blog_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_blog_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` tinytext NOT NULL,
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `allow_comments` tinyint(2) NOT NULL DEFAULT '0',
  `scope` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_alias` (`alias`),
  KEY `idx_scope_id` (`scope_id`),
  FULLTEXT KEY `ftidx_title` (`title`),
  FULLTEXT KEY `ftidx_content` (`content`),
  FULLTEXT KEY `ftidx_title_content` (`title`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_blog_entries`
--

LOCK TABLES `jos_blog_entries` WRITE;
/*!40000 ALTER TABLE `jos_blog_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_blog_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart`
--

DROP TABLE IF EXISTS `jos_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `itemid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `selections` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart`
--

LOCK TABLES `jos_cart` WRITE;
/*!40000 ALTER TABLE `jos_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_cart_items`
--

DROP TABLE IF EXISTS `jos_cart_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_cart_items` (
  `crtId` int(16) NOT NULL,
  `sId` int(16) NOT NULL,
  `crtiQty` int(5) DEFAULT NULL,
  `crtiOldQty` int(5) DEFAULT NULL,
  `crtiPrice` decimal(10,2) DEFAULT NULL,
  `crtiOldPrice` decimal(10,2) DEFAULT NULL,
  `crtiName` varchar(255) DEFAULT NULL,
  `crtiAvailable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crtId`,`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_cart_items`
--

LOCK TABLES `jos_cart_cart_items` WRITE;
/*!40000 ALTER TABLE `jos_cart_cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_carts`
--

DROP TABLE IF EXISTS `jos_cart_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_carts` (
  `crtId` int(16) NOT NULL AUTO_INCREMENT,
  `crtCreated` datetime DEFAULT NULL,
  `crtLastUpdated` datetime DEFAULT NULL,
  `uidNumber` int(16) DEFAULT NULL,
  PRIMARY KEY (`crtId`),
  UNIQUE KEY `uidx_uidNumber` (`uidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_carts`
--

LOCK TABLES `jos_cart_carts` WRITE;
/*!40000 ALTER TABLE `jos_cart_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_coupons`
--

DROP TABLE IF EXISTS `jos_cart_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_coupons` (
  `crtId` int(16) NOT NULL,
  `cnId` int(16) NOT NULL,
  `crtCnAdded` datetime DEFAULT NULL,
  `crtCnStatus` char(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_coupons`
--

LOCK TABLES `jos_cart_coupons` WRITE;
/*!40000 ALTER TABLE `jos_cart_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_downloads`
--

DROP TABLE IF EXISTS `jos_cart_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_downloads` (
  `dId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uId` int(11) DEFAULT NULL,
  `sId` int(11) DEFAULT NULL,
  `dDownloaded` datetime DEFAULT NULL,
  `dStatus` tinyint(1) DEFAULT '1',
  `dIp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`dId`),
  KEY `idx_uId` (`uId`),
  KEY `idx_sId` (`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_downloads`
--

LOCK TABLES `jos_cart_downloads` WRITE;
/*!40000 ALTER TABLE `jos_cart_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_memberships`
--

DROP TABLE IF EXISTS `jos_cart_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_memberships` (
  `crtmId` int(16) NOT NULL AUTO_INCREMENT,
  `pId` int(16) DEFAULT NULL,
  `crtId` int(16) DEFAULT NULL,
  `crtmExpires` datetime DEFAULT NULL,
  PRIMARY KEY (`crtmId`),
  UNIQUE KEY `uidx_pId_crtId` (`pId`,`crtId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_memberships`
--

LOCK TABLES `jos_cart_memberships` WRITE;
/*!40000 ALTER TABLE `jos_cart_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_meta`
--

DROP TABLE IF EXISTS `jos_cart_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_meta` (
  `mtId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `scope` varchar(100) NOT NULL DEFAULT '',
  `mtKey` varchar(100) NOT NULL DEFAULT '',
  `mtValue` text,
  PRIMARY KEY (`mtId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_meta`
--

LOCK TABLES `jos_cart_meta` WRITE;
/*!40000 ALTER TABLE `jos_cart_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_saved_addresses`
--

DROP TABLE IF EXISTS `jos_cart_saved_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_saved_addresses` (
  `saId` int(16) NOT NULL AUTO_INCREMENT,
  `uidNumber` int(16) NOT NULL,
  `saToFirst` char(100) NOT NULL,
  `saToLast` char(100) NOT NULL,
  `saAddress` char(255) NOT NULL,
  `saCity` char(25) NOT NULL,
  `saState` char(2) NOT NULL,
  `saZip` char(10) NOT NULL,
  PRIMARY KEY (`saId`),
  UNIQUE KEY `uidx_uidNumber_saToFirst_saToLast_saAddress_saZip` (`uidNumber`,`saToFirst`,`saToLast`,`saAddress`(100),`saZip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_saved_addresses`
--

LOCK TABLES `jos_cart_saved_addresses` WRITE;
/*!40000 ALTER TABLE `jos_cart_saved_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_saved_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_transaction_info`
--

DROP TABLE IF EXISTS `jos_cart_transaction_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_transaction_info` (
  `tId` int(16) NOT NULL,
  `tiShippingToFirst` char(100) DEFAULT NULL,
  `tiShippingToLast` char(100) DEFAULT NULL,
  `tiShippingAddress` char(255) DEFAULT NULL,
  `tiShippingCity` char(25) DEFAULT NULL,
  `tiShippingState` char(2) DEFAULT NULL,
  `tiShippingZip` char(10) DEFAULT NULL,
  `tiTotal` decimal(10,2) DEFAULT NULL,
  `tiSubtotal` decimal(10,2) DEFAULT NULL,
  `tiTax` decimal(10,2) DEFAULT NULL,
  `tiShipping` decimal(10,2) DEFAULT NULL,
  `tiShippingDiscount` decimal(10,2) DEFAULT NULL,
  `tiDiscounts` decimal(10,2) DEFAULT NULL,
  `tiItems` text,
  `tiPerks` text,
  `tiMeta` text,
  `tiCustomerStatus` char(15) DEFAULT 'unconfirmed',
  `tiNotes` text,
  PRIMARY KEY (`tId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_transaction_info`
--

LOCK TABLES `jos_cart_transaction_info` WRITE;
/*!40000 ALTER TABLE `jos_cart_transaction_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_transaction_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_transaction_items`
--

DROP TABLE IF EXISTS `jos_cart_transaction_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_transaction_items` (
  `tId` int(16) NOT NULL,
  `sId` int(16) NOT NULL,
  `tiQty` int(5) DEFAULT NULL,
  `tiPrice` decimal(10,2) DEFAULT NULL,
  `tiMeta` text,
  PRIMARY KEY (`tId`,`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_transaction_items`
--

LOCK TABLES `jos_cart_transaction_items` WRITE;
/*!40000 ALTER TABLE `jos_cart_transaction_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_transaction_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_transaction_steps`
--

DROP TABLE IF EXISTS `jos_cart_transaction_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_transaction_steps` (
  `tsId` int(16) NOT NULL AUTO_INCREMENT,
  `tId` int(16) NOT NULL,
  `tsStep` char(16) NOT NULL,
  `tsStatus` tinyint(1) DEFAULT '0',
  `tsMeta` char(255) DEFAULT NULL,
  PRIMARY KEY (`tsId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_transaction_steps`
--

LOCK TABLES `jos_cart_transaction_steps` WRITE;
/*!40000 ALTER TABLE `jos_cart_transaction_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_transaction_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cart_transactions`
--

DROP TABLE IF EXISTS `jos_cart_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cart_transactions` (
  `tId` int(16) NOT NULL AUTO_INCREMENT,
  `crtId` int(16) DEFAULT NULL,
  `tCreated` datetime DEFAULT NULL,
  `tLastUpdated` datetime DEFAULT NULL,
  `tStatus` char(32) DEFAULT NULL,
  PRIMARY KEY (`tId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cart_transactions`
--

LOCK TABLES `jos_cart_transactions` WRITE;
/*!40000 ALTER TABLE `jos_cart_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_cart_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_categories`
--

DROP TABLE IF EXISTS `jos_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_extension_published_access` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_categories`
--

LOCK TABLES `jos_categories` WRITE;
/*!40000 ALTER TABLE `jos_categories` DISABLE KEYS */;
INSERT INTO `jos_categories` VALUES (1,0,0,0,37,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','',0,'2009-10-18 16:07:09',0,'0000-00-00 00:00:00',0,'*'),(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:26:37',0,'0000-00-00 00:00:00',0,'*'),(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:35',0,'0000-00-00 00:00:00',0,'*'),(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:57',0,'0000-00-00 00:00:00',0,'*'),(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:15',0,'0000-00-00 00:00:00',0,'*'),(6,31,1,9,10,1,'uncategorised','com_weblinks','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*'),(7,32,1,11,12,1,'uncategorised','com_users','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*'),(8,68,1,1,2,1,'about','com_content','about','about','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(9,69,1,3,4,1,'legal','com_content','legal','legal','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(10,70,1,5,6,1,'browse','com_content','browse','browse','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(11,71,1,7,8,1,'presenters','com_content','presenters','presenters','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(12,72,1,9,10,1,'meeting','com_events','Meeting','meeting','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(13,73,1,11,12,1,'seminar','com_events','Seminar','seminar','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(14,74,1,13,30,1,'workshop','com_events','Workshop','workshop','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(15,75,1,31,32,1,'general','com_events','General','general','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(16,76,17,34,35,2,'features/frontpage','com_content','frontpage','frontpage','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(17,77,1,33,36,1,'features','com_content','features','features','','',1,0,'0000-00-00 00:00:00',1,'','','','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,''),(18,109,1,14,15,0,'groups','com_kb','Members & Groups','groups','','&quot;Members only&quot; content, working with member groups, member content, and member privileges.',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*'),(19,110,1,16,17,0,'registration','com_kb','Login & Registration','registration','','The following will try to answer some frequently recieved questions concerning login and registration issues.',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*'),(20,111,1,18,19,0,'misc','com_kb','Miscellaneous','misc','','Issues that don\\\'t necessarily fit in other categories, but that can affect hub use or are very helpful in using it.',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*'),(21,112,1,20,21,0,'tags','com_kb','Tags','tags','','Information about tags and how to deal with them.',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*'),(22,113,1,22,23,0,'tips','com_kb','Tips','tips','','Learn more about features of this hub you may not have known about.',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*'),(23,114,1,24,25,0,'tools','com_kb','Tools','tools','','The most common questions on launching and using simulation tools.',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*'),(24,115,1,26,27,0,'resources','com_kb','Resources','resources','','Questions, concerns, and problems you may have with uploading and publishing content on this site.',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*'),(25,116,1,28,29,0,'points','com_kb','Reward Points','points','','<p>Our hub is powered by your contributions!  We want to reward you for your efforts and encourage you to contribute more.  So we have introduced a new system of reward points similar to airline miles.</p>\r\n\r\n<p><img src=\\\"site/media/images/header_economy',1,0,'0000-00-00 00:00:00',1,'','','','',0,'2017-06-29 02:02:51',0,'0000-00-00 00:00:00',0,'*');
/*!40000 ALTER TABLE `jos_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations`
--

DROP TABLE IF EXISTS `jos_citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `published` int(3) NOT NULL DEFAULT '1',
  `affiliated` int(11) NOT NULL DEFAULT '0',
  `fundedby` int(3) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `address` varchar(250) DEFAULT NULL,
  `author` text,
  `booktitle` varchar(250) DEFAULT NULL,
  `chapter` varchar(250) DEFAULT NULL,
  `cite` varchar(250) DEFAULT NULL,
  `edition` varchar(250) DEFAULT NULL,
  `editor` varchar(250) DEFAULT NULL,
  `eprint` varchar(250) DEFAULT NULL,
  `howpublished` varchar(250) DEFAULT NULL,
  `institution` varchar(250) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `journal` varchar(250) DEFAULT NULL,
  `key` varchar(250) DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `month` varchar(50) DEFAULT NULL,
  `note` text,
  `number` varchar(50) DEFAULT NULL,
  `organization` varchar(250) DEFAULT NULL,
  `pages` varchar(250) DEFAULT NULL,
  `publisher` varchar(250) DEFAULT NULL,
  `series` varchar(250) DEFAULT NULL,
  `school` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `volume` varchar(11) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `doi` varchar(250) DEFAULT NULL,
  `ref_type` varchar(50) DEFAULT NULL,
  `date_submit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_accept` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_publish` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `software_use` int(3) DEFAULT NULL,
  `res_edu` int(3) DEFAULT NULL,
  `exp_list_exp_data` int(3) DEFAULT NULL,
  `exp_data` int(3) DEFAULT NULL,
  `notes` text,
  `language` varchar(100) DEFAULT NULL,
  `accession_number` varchar(100) DEFAULT NULL,
  `short_title` varchar(250) DEFAULT NULL,
  `author_address` text,
  `keywords` text,
  `abstract` text,
  `call_number` varchar(100) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `research_notes` text,
  `params` text,
  `formatted` text,
  `format` varchar(11) DEFAULT NULL,
  `scope` varchar(45) DEFAULT NULL,
  `scope_id` varchar(45) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` varchar(45) DEFAULT NULL,
  `custom4` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ftidx_title_isbn_doi_abstract` (`title`,`isbn`,`doi`,`abstract`),
  FULLTEXT KEY `ftidx_title_isbn_doi_abstract_author_publisher` (`title`,`isbn`,`doi`,`abstract`,`author`,`publisher`),
  FULLTEXT KEY `ftidx_search` (`title`,`isbn`,`doi`,`abstract`,`author`,`publisher`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations`
--

LOCK TABLES `jos_citations` WRITE;
/*!40000 ALTER TABLE `jos_citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_assoc`
--

DROP TABLE IF EXISTS `jos_citations_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_assoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0',
  `oid` int(11) DEFAULT '0',
  `type` varchar(50) DEFAULT NULL,
  `tbl` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_assoc`
--

LOCK TABLES `jos_citations_assoc` WRITE;
/*!40000 ALTER TABLE `jos_citations_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_citations_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_authors`
--

DROP TABLE IF EXISTS `jos_citations_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0',
  `author` varchar(64) DEFAULT NULL,
  `authorid` int(11) DEFAULT '0',
  `uidNumber` int(11) DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `givenName` varchar(255) NOT NULL DEFAULT '',
  `middleName` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `org_dept` varchar(255) NOT NULL DEFAULT '',
  `orgtype` varchar(255) NOT NULL DEFAULT '',
  `countryresident` char(2) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `host` varchar(64) NOT NULL DEFAULT '',
  `countrySHORT` char(2) NOT NULL DEFAULT '',
  `countryLONG` varchar(64) NOT NULL DEFAULT '',
  `ipREGION` varchar(128) NOT NULL DEFAULT '',
  `ipCITY` varchar(128) NOT NULL DEFAULT '',
  `ipLATITUDE` double DEFAULT NULL,
  `ipLONGITUDE` double DEFAULT NULL,
  `in_network` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_cid_author_authorid_uidNumber` (`cid`,`author`,`authorid`,`uidNumber`),
  KEY `idx_authorid` (`authorid`),
  KEY `idx_uidNumber` (`uidNumber`),
  KEY `idx_cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_authors`
--

LOCK TABLES `jos_citations_authors` WRITE;
/*!40000 ALTER TABLE `jos_citations_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_citations_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_format`
--

DROP TABLE IF EXISTS `jos_citations_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_format` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT NULL,
  `style` varchar(50) DEFAULT NULL,
  `format` text,
  PRIMARY KEY (`id`),
  KEY `idx_typeid` (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_format`
--

LOCK TABLES `jos_citations_format` WRITE;
/*!40000 ALTER TABLE `jos_citations_format` DISABLE KEYS */;
INSERT INTO `jos_citations_format` VALUES (1,NULL,'custom',''),(2,NULL,'APA','{AUTHORS}, {EDITORS} ({YEAR}), {TITLE/CHAPTER}, <i>{JOURNAL}</i>, <i>{BOOK TITLE}</i>, {EDITION}, {CHAPTER},\n				{SERIES}, {PUBLISHER}, {ADDRESS}, <b>{VOLUME}</b>, <b>{ISSUE/NUMBER}</b>: {PAGES}, {ORGANIZATION}, {INSTITUTION},\n				{SCHOOL}, {LOCATION}, {MONTH}, {ISBN/ISSN}, (DOI: {DOI}). Cited by: <a href=\'{SECONDARY LINK}\'>{SECONDARY COUNT}</a>'),(3,NULL,'IEEE','{AUTHORS}, {EDITORS} ({YEAR}), {TITLE/CHAPTER}, <i>{JOURNAL}</i>, <i>{BOOK TITLE}</i>, {EDITION}, {CHAPTER},\n				{SERIES}, {PUBLISHER}, {ADDRESS}, <b>{VOLUME}</b>, <b>{ISSUE/NUMBER}</b>: {PAGES}, {ORGANIZATION}, {INSTITUTION},\n				{SCHOOL}, {LOCATION}, {MONTH}, {ISBN/ISSN}, (DOI: {DOI})');
/*!40000 ALTER TABLE `jos_citations_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_links`
--

DROP TABLE IF EXISTS `jos_citations_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` text,
  `citation_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_links`
--

LOCK TABLES `jos_citations_links` WRITE;
/*!40000 ALTER TABLE `jos_citations_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_citations_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_secondary`
--

DROP TABLE IF EXISTS `jos_citations_secondary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_secondary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `sec_cits_cnt` int(11) DEFAULT NULL,
  `search_string` tinytext,
  `scope` varchar(250) DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `link1_url` tinytext,
  `link1_title` varchar(60) DEFAULT NULL,
  `link2_url` tinytext,
  `link2_title` varchar(60) DEFAULT NULL,
  `link3_url` tinytext,
  `link3_title` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cid` (`cid`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_secondary`
--

LOCK TABLES `jos_citations_secondary` WRITE;
/*!40000 ALTER TABLE `jos_citations_secondary` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_citations_secondary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_sponsors`
--

DROP TABLE IF EXISTS `jos_citations_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_sponsors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sponsor` varchar(150) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_sponsors`
--

LOCK TABLES `jos_citations_sponsors` WRITE;
/*!40000 ALTER TABLE `jos_citations_sponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_citations_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_sponsors_assoc`
--

DROP TABLE IF EXISTS `jos_citations_sponsors_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_sponsors_assoc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_sponsors_assoc`
--

LOCK TABLES `jos_citations_sponsors_assoc` WRITE;
/*!40000 ALTER TABLE `jos_citations_sponsors_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_citations_sponsors_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_citations_types`
--

DROP TABLE IF EXISTS `jos_citations_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_citations_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `type_title` varchar(255) DEFAULT NULL,
  `type_desc` text,
  `type_export` varchar(255) DEFAULT NULL,
  `fields` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_citations_types`
--

LOCK TABLES `jos_citations_types` WRITE;
/*!40000 ALTER TABLE `jos_citations_types` DISABLE KEYS */;
INSERT INTO `jos_citations_types` VALUES (1,'journal','Journal','',NULL,NULL),(2,'article','Article','',NULL,NULL),(3,'book','Book','',NULL,NULL),(4,'booklet','Booklet','',NULL,NULL),(5,'conference','Conference','',NULL,NULL),(6,'inbook','In Book','',NULL,NULL),(7,'incollection','In Collection','',NULL,NULL),(8,'inproceedings','In Proceedings','',NULL,NULL),(9,'magazine','Magazine','',NULL,NULL),(10,'manual','Manual','',NULL,NULL),(11,'mastersthesis','Masters Thesis','',NULL,NULL),(12,'misc','Misc','',NULL,NULL),(13,'phdthesis','PhD Thesis','',NULL,NULL),(14,'proceedings','Proceedings','',NULL,NULL),(15,'techreport','Tech Report','',NULL,NULL),(16,'unpublished','Unpublished','',NULL,NULL),(17,'patent','Patent','',NULL,NULL),(18,'chapter','Chapter','',NULL,NULL),(19,'notes','Text Snippet/Notes','',NULL,NULL),(20,'letter','Letter','',NULL,NULL),(21,'xarchive','XArchive','',NULL,NULL),(22,'manuscript','Manuscript','',NULL,NULL),(23,'paper','Paper',NULL,NULL,NULL),(24,'presentation','Presentation',NULL,NULL,NULL),(25,'publication','Publication',NULL,NULL,NULL),(26,'researchreport','Research Report',NULL,NULL,NULL),(27,'annualreport','Annual Report',NULL,NULL,NULL),(28,'governmentreport','Government report',NULL,NULL,NULL),(29,'poster','Poster',NULL,NULL,NULL);
/*!40000 ALTER TABLE `jos_citations_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_collections`
--

DROP TABLE IF EXISTS `jos_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_collections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` varchar(150) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `is_default` tinyint(2) NOT NULL DEFAULT '0',
  `description` mediumtext NOT NULL,
  `positive` int(11) NOT NULL DEFAULT '0',
  `negative` int(11) NOT NULL DEFAULT '0',
  `sort` varchar(50) NOT NULL DEFAULT 'created',
  `layout` varchar(50) NOT NULL DEFAULT 'grid',
  PRIMARY KEY (`id`),
  KEY `idx_object_type_object_id` (`object_type`,`object_id`),
  KEY `idx_state` (`state`),
  KEY `idx_access` (`access`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_collections`
--

LOCK TABLES `jos_collections` WRITE;
/*!40000 ALTER TABLE `jos_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_collections_assets`
--

DROP TABLE IF EXISTS `jos_collections_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_collections_assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'file',
  `ordering` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_collections_assets`
--

LOCK TABLES `jos_collections_assets` WRITE;
/*!40000 ALTER TABLE `jos_collections_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_collections_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_collections_following`
--

DROP TABLE IF EXISTS `jos_collections_following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_collections_following` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `follower_type` varchar(150) NOT NULL,
  `follower_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `following_type` varchar(150) NOT NULL DEFAULT '',
  `following_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_follower_type_follower_id` (`follower_type`,`follower_id`),
  KEY `idx_following_type_following_id` (`following_type`,`following_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_collections_following`
--

LOCK TABLES `jos_collections_following` WRITE;
/*!40000 ALTER TABLE `jos_collections_following` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_collections_following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_collections_items`
--

DROP TABLE IF EXISTS `jos_collections_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_collections_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `access` tinyint(2) NOT NULL DEFAULT '0',
  `positive` int(11) NOT NULL DEFAULT '0',
  `negative` int(11) NOT NULL DEFAULT '0',
  `type` varchar(150) NOT NULL DEFAULT '',
  `object_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_type_object_id` (`type`,`object_id`),
  FULLTEXT KEY `idx_fulltxt_title_description` (`title`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_collections_items`
--

LOCK TABLES `jos_collections_items` WRITE;
/*!40000 ALTER TABLE `jos_collections_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_collections_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_collections_posts`
--

DROP TABLE IF EXISTS `jos_collections_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_collections_posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `collection_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext NOT NULL,
  `original` tinyint(2) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_collection_id` (`collection_id`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_original` (`original`),
  FULLTEXT KEY `idx_fulltxt_description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_collections_posts`
--

LOCK TABLES `jos_collections_posts` WRITE;
/*!40000 ALTER TABLE `jos_collections_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_collections_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_collections_votes`
--

DROP TABLE IF EXISTS `jos_collections_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_collections_votes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `voted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_item_id_user_id` (`item_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_collections_votes`
--

LOCK TABLES `jos_collections_votes` WRITE;
/*!40000 ALTER TABLE `jos_collections_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_collections_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_content`
--

DROP TABLE IF EXISTS `jos_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`),
  FULLTEXT KEY `ftidx_title` (`title`),
  FULLTEXT KEY `ftidx_introtext_fulltext` (`introtext`,`fulltext`),
  FULLTEXT KEY `ftidx_title_introtext_fulltext` (`title`,`introtext`,`fulltext`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_content`
--

LOCK TABLES `jos_content` WRITE;
/*!40000 ALTER TABLE `jos_content` DISABLE KEYS */;
INSERT INTO `jos_content` VALUES (1,78,'Home','home','','{xhub:include type=\"stylesheet\" filename=\"pages/home.css\"}\r\n\r\n<div id=\"features\">\r\n	<div class=\"wrap\">\r\n		<h2>Features</h2>\r\n		<div class=\"grid\"><div class=\"col span4\">\r\n			<div class=\"resource\">\r\n				{xhub:module position=\"featureLeft\"}\r\n			</div>\r\n		</div>\r\n		<div class=\"col span4\">\r\n			<div class=\"poll\">\r\n				{xhub:module position=\"featureMiddle\"}\r\n			</div>\r\n		</div>\r\n		<div class=\"col span4 omega\">\r\n			<div class=\"tool\">\r\n				{xhub:module position=\"featureRight\"}\r\n			</div>\r\n		</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n\r\n<div class=\"highlight-section\">\r\n	<p>\r\n		Welcome to our community for scientific and educational collaboration.\r\n	</p>\r\n</div><!-- / .highlight-section -->\r\n\r\n<div class=\"events-section\">\r\n	<div class=\"wrap\">\r\n		<div class=\"grid\"><div class=\"col span3\">\r\n			<h2>News &amp; Events</h2>\r\n			<p>\r\n				Find out what\'s happening and what\'s new. Find information about the many public meetings and scientific symposia.\r\n			</p>\r\n		</div>\r\n		<div class=\"col span9 omega\">\r\n			<div class=\"grid\"><div class=\"col span6\">\r\n				{xhub:module position=\"eventsLeft\"}\r\n			</div>\r\n			<div class=\"col span6 omega\">\r\n				{xhub:module position=\"eventsRight\"}\r\n			</div>\r\n			</div>\r\n		</div>\r\n		</div>\r\n	</div>\r\n</div><!-- / .inner -->\r\n\r\n<div class=\"resources-section wrap\">\r\n	<div class=\"grid\"><div class=\"col span3\">\r\n		<h2>Resources</h2>\r\n		<p>\r\n			Browse our continually expanding user-submitted content that covers a broad range of topics.\r\n		</p>\r\n	</div>\r\n	<div class=\"col span9 omega\">\r\n		<div class=\"grid\"><div class=\"col span6\">\r\n			<h3>Search</h3>\r\n			<form action=\"/search/\" method=\"get\" class=\"search\">\r\n				<fieldset>\r\n					<label for=\"rsearchword\">Keyword or phrase:</label>\r\n					<input type=\"text\" name=\"terms\" id=\"rsearchword\" value=\"\" />\r\n					<input type=\"hidden\" name=\"domains[]\" value=\"resources\" />\r\n					<input type=\"submit\" value=\"Search\" />\r\n				</fieldset>\r\n			</form>\r\n		</div>\r\n		<div class=\"col span6 omega\">\r\n			<h3>Upload</h3>\r\n			<p>\r\n				Become a contributor and share your work with the community! <a href=\"/resources/new\" class=\"contributelink\">Get started &rarr;</a>\r\n			</p>\r\n		</div>\r\n		</div>\r\n\r\n		<div class=\"grid\"><div class=\"col span6\">\r\n			<h3>Categories</h3>\r\n			<ul>\r\n				<li><a href=\"/resources/courses\">Courses</a></li>\r\n				<li><a href=\"/resources/othermaterials\">Other Materials</a></li>\r\n				<li><a href=\"/resources/presentations\">Presentations</a></li>\r\n				<li><a href=\"/resources/publications\">Publications</a></li>\r\n				<li><a href=\"/resources/seminars\">Seminars</a></li>\r\n				<li><a href=\"/resources/tools\">Tools</a></li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"col span6 omega\">\r\n			{xhub:module position=\"toptags\"}\r\n		</div>\r\n		</div>\r\n	</div>\r\n	</div>\r\n</div><!-- / .inner -->','',1,0,0,2,'2010-03-25 06:26:40',62,'','2012-09-07 19:18:38',1008,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',20,0,1,'','',1,1645,'robots=\nauthor=',0,'',''),(2,79,'Our Cyberinfrastructure','hubzero','','<p>\r\n<img src=\"/media/system/images/hubzero-logo-2012.png\" class=\"align-right\" alt=\"HUBzero logo\" />\r\nOur web site is powered by the <a href=\"http://hubzero.org\">HUBzero&reg;\r\nPlatform for Scientific Collaboration</a> originally developed at <a href=\"http://www.purdue.edu\">Purdue University</a>.\r\nHUBzero was specifically designed to help a scientific community share\r\nresources and work together with one another.  Users can upload their own\r\ncontent--including tutorials, courses, publications, and animations--and\r\nshare them with the rest of the community.  But each hub is more than\r\njust a repository of information.  It is a place where researchers and\r\neducators can collaborate in private spaces to build simulation/modeling tools, gather datasets, and share them online.  Users can launch\r\ncomputations and view results with an ordinary web browser--without\r\nhaving to download, compile, or install any code.  The tools they access\r\nare not just web forms, but powerful graphical tools that support visualization\r\nand comparison of results.\r\n</p>\r\n<h3>How Does a Hub Differ From a Web Site?</h3>\r\n<p>\r\nAt its core, a hub is a web site built with many familiar open source\r\npackages--the Linux operating system, an Apache web server, a MySQL\r\ndatabase, PHP web scripting, and the Joomla content management\r\nsystem.  The HUBzero software builds upon that infrastructure to create\r\nan environment in which researchers, educators, and students can access\r\nsimulation tools and share information.  Specifically, we define a \"hub\"\r\nas a web-based collaboration environment with the following features:\r\n<ul>\r\n	<li>Interactive simulation tools, hosted on the hub cluster and delivered to your browser</li>\r\n	<li>Simulation tool development area, including source code control and bug tracking</li>\r\n	<li>Videos and other supporting media for classes, tutorials, and documentation</li>\r\n	<li>Groups and projects for private collaboration</li>\r\n	<li>Mechanism for uploading and sharing resources</li>\r\n	<li>5-star ratings and user feedback for resources</li>\r\n	<li>User support area, with question-and-answer forum</li>\r\n	<li>Statistics about users and usage patterns</li>\r\n</ul>\r\n</p><p>\r\nYou can use this software to <a href=\"http://hubzero.org/getstarted\">start a hub</a> for your own scientific community.  Join others in the <a href=\"http://hubzero.org/about/foundation\">HUBzero Foundation</a> and help to develop the platform.  Visit <a href=\"http://hubzero.org\">HUBzero.org</a> to learn more.\r\n</p>','',1,1,0,8,'2010-03-25 06:26:40',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',2,0,1,'','',1,19,'robots=\nauthor=',0,'',''),(3,80,'About Us','about','','<p class=\"warning\">\r\nEdit this page and fill in information about your project.  Think of\r\nthis page as the front page of a brochure.  Describe your overall\r\nproject and its goals in simple terms.  The following text is just\r\na suggestion for the kinds of things you might see on this page.\r\n</p>\r\n\r\n<h3>Our Mission</h3>\r\n\r\n<p>The Your Organization (YORG) is funded by <i>Your Funding Organization</i>\r\nwith a mission to <i>change the world</i>.</p>\r\n\r\n<h3>What is {xhub:getcfg hubShortName}?</h3>\r\n<p>\r\nThis web site is a resource for research, education and collaboration\r\nin <i>your science area</i>.  It hosts\r\n<a href=\"/resources/browse\">various resources</a> which will help you learn\r\nabout <i>your science area</i>, including\r\n<a href=\"/resources/seminars\">Seminars</a>,\r\n<a href=\"/resources/courses\">Courses</a>,\r\n<a href=\"/resources/teachingmaterials\">Teaching Materials</a>, and more.\r\nThese resources come from <a href=\"/members\">contributors</a> in our\r\nscientific community, and are used by <a href=\"/usage\">visitors from all\r\nover the world</a>.\r\n</p>\r\n<p>\r\nMost importantly, {xhub:getcfg hubShortURL} offers live <a href=\"/resources/tools/\">Simulation/Modeling Tools</a>\r\nwhich you can access from your web browser, so you can not only learn\r\nabout but also simulate <i>your science area</i>.\r\n</p>\r\n\r\n<h3>Join Us</h3>\r\n<ul>\r\n<li><a href=\"/register\" title=\"Sign up!\">Create your own account</a>.\r\nIt\'s free and will give you access to our\r\n<a href=\"/resources/tools/\" title=\"View a list of tools\">online simulation tools</a>\r\nand <a href=\"/discover\">other features</a>.</li>\r\n<li><a href=\"/groups/new\">Create your own private user group</a> and collaborate privately with students and colleagues that you invite.</li>\r\n<li><a href=\"/resources/new\">Become a contributor</a>\r\nby uploading your own presentations and simulation tools for others to share.</li>\r\n<li><a href=\"/answers/question/new\">Ask a question</a> in our <a href=\"/answers\">community forum</a>, and let the\r\ncommunity help you out.</li>\r\n</ul>','',1,1,0,8,'2010-03-25 06:26:40',62,'','0000-00-00 00:00:00',1,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',3,0,2,'','',1,173,'robots=\nauthor=',0,'',''),(4,81,'Contact Us','contact','','<p class=\"warning\">Edit this page and fill in your own contact information, so people know who owns and operates this site.</p>','',1,1,0,8,'2010-03-25 06:26:40',62,'','2010-03-27 16:19:26',63,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',3,0,3,'','',1,34,'robots=\nauthor=',0,'',''),(5,82,'Quotes','quotes','','<div style=\"text-align:right; margin:0; padding:0 0 1em 0;\"><a href=\"feedback/success_story\">Add Your Success Story</a></div>\r\n<p>{xhub:module position=\"quotes\" style=\"-1\"}</p>','',1,1,0,8,'2010-03-25 06:26:40',62,'','2010-03-26 15:03:09',63,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',2,0,4,'','',1,43,'robots=\nauthor=',0,'',''),(6,83,'Usage','usage','','About usage placeholder','',0,1,0,8,'2010-03-25 06:26:40',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"pageclass_sfx\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\"}',1,0,5,'','',1,2,'robots=\nauthor=\n',0,'',''),(7,84,'Copyrights','dmcapolicy','','<p class=\"warning\">Edit this page and fill in your contact information at the bottom.  Having this in place protects you from copyright violations.  If any of your users uploads material that infringes copyright protection, the copyright owner will send a \"take down\" notice to the address below.  When you receive such a letter, you are obliged to unpublish the offending material right away.</p>\r\n<p>To file a copyright infringement notification with us, you will need to send a written communication that includes substantially the following (please consult your legal counsel or see Section 512(c)(3) of the Copyright Act to confirm these requirements):</p>\r\n<ul>\r\n<li> A physical or electronic signature of a person authorized to act on behalf of the owner of an exclusive right that is allegedly infringed.</li>\r\n<li> Identification of the copyrighted work claimed to have been infringed, or, if multiple copyrighted works at a single online site are covered by a single notification, a representative list of such works at that site.</li>\r\n<li> Identification of the material that is claimed to be infringing or to be the subject of infringing activity and that is to be removed or access to which is to be disabled, and information reasonably sufficient to permit the service provider to locate the material. <strong>Providing URLs in the body of an email is the best way to help us locate content quickly.</strong></li>\r\n<li> Information reasonably sufficient to permit the service provider to contact the complaining party, such as an address, telephone number, and, if available, an electronic mail address at which the complaining party may be contacted.</li>\r\n<li> A statement that the complaining party has a good faith belief that use of the material in the manner complained of is not authorized by the copyright owner, its agent, or the law.</li>\r\n<li> A statement that the information in the notification is accurate, and under penalty of perjury, that the complaining party is authorized to act on behalf of the owner of an exclusive right that is allegedly infringed.</li>\r\n</ul>\r\n<p>Such written notice should be sent to our designated agent as follows:</p>\r\n<address> DMCA Complaints<br /> This Person<br /> 1234 Street<br /> City, ST 99999<br /> Fax: 555-555-5555<br /> </address>\r\n<p>Please also note that under Section 512(f) any person who knowingly materially misrepresents that material or activity is infringing may be subject to liability.</p>','',1,1,0,8,'2010-03-25 06:26:40',62,'','2010-03-26 15:06:42',63,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',3,0,6,'','',1,30,'robots=\nauthor=',0,'',''),(8,85,'Feedback','feedback','','About feedback placeholder','',1,1,0,8,'2010-03-25 06:26:40',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"pageclass_sfx\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\"}',1,0,7,'','',1,41,'robots=\nauthor=\n',0,'',''),(11,86,'Terms of Use','terms','','<p class=\"warning\">Edit this page with appropriate terms of use for your site under advice of legal council at your institution.  The following text is provided as example text, with placeholders for <strong>MyInstitution</strong>, <strong>MyState</strong>, and <strong>MyCounty</strong>.</p>\r\n<p>Please read these Terms of Use carefully before accessing {xhub:getcfg hubShortURL}.  The {xhub:getcfg hubShortURL} site is operated by a community of researchers and hosted by MyInstitution.  Your access to {xhub:getcfg hubShortURL} is subject to your agreement to these Terms of Use.  By accessing {xhub:getcfg hubShortURL}, you accept, without limitation or qualification, these Terms of Use.</p>\r\n<h3>Modification of the Agreement</h3>\r\n<p>We maintain the right to modify these Terms of Use and may do so by posting modifications on this page.  Any modification is effective immediately upon posting the modification unless otherwise stated.  Your continued use of {xhub:getcfg hubShortURL} following the posting of any modification signifies your acceptance of that modification.  You should regularly visit this page to review the current Terms of Use.</p>\r\n<h3>Eligibility, Registration, Access, and Termination</h3>\r\n<p>The {xhub:getcfg hubShortURL} site is limited to non-commercial educational and research activities.  Posting of spam messages or other commercial advertisements is a violation of these terms and may result in termination of your account.</p>\r\n<p>Certain portions of {xhub:getcfg hubShortURL} are limited to registered users and/or allow a user to participate in online services by entering personal information.  You agree that any information provided to {xhub:getcfg hubShortURL} in these areas will be complete and accurate, and that you will neither register under the name of nor attempt to enter {xhub:getcfg hubShortURL} under the name of another person or entity.</p>\r\n<p>You are responsible for maintaining the confidentiality of your user ID and password, if any, and for restricting access to your computer, and you agree to accept responsibility for all activities that occur under your account or password.  {xhub:getcfg hubShortURL} does not authorize use of your User ID by third-parties.</p>\r\n<p>We may, in our sole discretion, terminate or suspend your access to and use of {xhub:getcfg hubShortURL} without notice and for any reason, including for violation of these Terms of Use or for other conduct that we, in our sole discretion, believe to be unlawful or harmful to others.  In the event of termination, you are no longer authorized to access {xhub:getcfg hubShortURL}.</p>\r\n<h3>Privacy and Confidentiality</h3>\r\n<p>We respect your privacy.  We will only use your personal identification information to support and manage your use of {xhub:getcfg hubShortURL}, including the use of tracking cookies to facilitate {xhub:getcfg hubShortURL} security procedures.  MyInstitution and {xhub:getcfg hubShortURL} sponsors regularly request {xhub:getcfg hubShortURL} usages statistics and other information.  Usage of {xhub:getcfg hubShortURL} is monitored and usage statistics are collected and reported on a regular basis.  {xhub:getcfg hubShortURL} also reserves the right to contact you to request additional information or to keep you updated on changes to {xhub:getcfg hubShortURL}.  You may opt out of receiving newsletters and other non-essential communications.  No information that would identify you personally will be provided to sponsors or third parties without your permission.</p>\r\n<p>All information posted or stored on {xhub:getcfg hubShortURL} is potentially available to all other users of {xhub:getcfg hubShortURL}.  MyInstitution and {xhub:getcfg hubShortURL} disclaim any responsibility or capability for the preservation of confidentiality of such information. <em>Do not post or store information on {xhub:getcfg hubShortURL} if you expect to or are obligated to protect the confidentiality of that information.</em></p>\r\n<h3>Conduct</h3>\r\n<p>You are responsible at all times for using {xhub:getcfg hubShortURL} in a manner that is legal, ethical, and not to the detriment of others.  Quotas for disk storage, job submissions, and other limited resources are strictly enforced.  You may request an increase in your quota, but attempting to circumvent your quota is unethical and may lead to a termination of your account.  You agree to delete unused files and acknowledge that if you fail to do so, the files may be deleted for you.  You agree that you will not:</p>\r\n<ul>\r\n<li>Use email addresses obtained or accessed through {xhub:getcfg hubShortURL} to transmit the same or substantially similar unsolicited message to multiple recipients without a valid purpose specifically related to the research and education mission of {xhub:getcfg hubShortURL};</li>\r\n<li>Use {xhub:getcfg hubShortURL} to commit a criminal offense or to encourage others to conduct that would constitute a criminal offense or give rise to a civil liability;</li>\r\n<li>Violate any applicable law;</li>\r\n<li>Post or transmit any unlawful, threatening, libelous, harassing, defamatory, vulgar, obscene, pornographic, profane, or otherwise objectionable content;</li>\r\n<li>Use {xhub:getcfg hubShortURL} to impersonate other parties or entities;</li>\r\n<li>Use {xhub:getcfg hubShortURL} to upload any content that contains a software virus, \"Trojan Horse\" or any other computer code, files, or programs that may alter, damage, or interrupt the functionality of {xhub:getcfg hubShortURL} or the hardware or software of any other person who accesses {xhub:getcfg hubShortURL};</li>\r\n<li>Upload, post, email, or otherwise transmit any materials that you do not have a right to transmit under any law or under a contractual relationship;</li>\r\n<li>Alter, damage, or delete any content posted on {xhub:getcfg hubShortURL};</li>\r\n<li>Disrupt the normal flow of communication in any way;</li>\r\n<li>Claim a relationship with or speak for any business, association, or other organization for which you are not authorized to claim such a relationship;</li>\r\n<li>Post or transmit any unsolicited advertising, promotional materials, or other forms of solicitation;</li>\r\n<li>Post any material that infringes or violates the intellectual property rights of another.</li>\r\n</ul>\r\n<h3>Disclaimers</h3>\r\n<p>THE {xhub:getcfg hubShortName} AND ANY INFORMATION, PRODUCTS OR SERVICES ON IT ARE PROVIDED \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  MyInstitution and {xhub:getcfg hubShortURL} do not warrant, and hereby disclaim any warranties, either express or implied, with respect to the accuracy, adequacy or completeness of any good, service, or information obtained from {xhub:getcfg hubShortURL}.  MyInstitution does not warrant that {xhub:getcfg hubShortURL} will operate in an uninterrupted or error-free manner or that {xhub:getcfg hubShortURL} is free of viruses or other harmful components.  Use of {xhub:getcfg hubShortURL} is at your own risk.</p>\r\n<p>You agree that {xhub:getcfg hubShortURL} and its administrator, MyInstitution, shall have no liability for any consequential, indirect, punitive, special or incidental damages, whether foreseeable or unforeseeable (including, but not limited to, claims for defamation, errors, loss of data, or interruption in availability of data), arising out of or relating to your use of {xhub:getcfg hubShortURL} or any resource that you access through {xhub:getcfg hubShortURL}.</p>\r\n<p>The {xhub:getcfg hubShortURL} site hosts content from a number of authors.  The statements and views of these authors are theirs alone, and do not reflect the stances or policies of MyInstitution or their sponsors, nor does their posting imply the endorsement of MyInstitution or their sponsors.</p>\r\n<h3>Choice of Law/Forum Selection/Attorney Fees</h3>\r\n<p>You agree that any dispute arising out of or relating to {xhub:getcfg hubShortURL}, whether based in contract, tort, statutory or other law, will be governed by federal law and by the laws of MyState, excluding its conflicts of law provisions.  You further consent to the personal jurisdiction of and exclusive venue in the federal and state courts located in and serving MyCounty, MyState as the exclusive legal forums for any such dispute.</p>','',1,3,0,9,'2010-03-25 06:26:40',62,'','2010-03-26 15:18:45',63,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"1\",\"link_titles\":\"0\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',9,0,8,'','',1,20,'robots=\nauthor=',0,'',''),(12,87,'Intellectual Property Considerations','licensing','','<p>\r\nAll materials contributed to {xhub:getcfg hubShortURL} must have clearly defined rights\r\nand privileges.  We have instituted the following guidelines for all\r\nmaterials uploaded onto this site:\r\n</p>\r\n<h3>Simulation Tools</h3>\r\n<p>\r\n<div style=\"float:left; margin:10px;\">\r\n<a href=\"http://www.opensource.org/docs/definition.php\">\r\n<img src=\"/media/system/images/open_source_button.png\"  alt=\"Open Source (OSI) Logo\"></a>\r\n</div>\r\nSimulation tools can be made available online through HUBzero\'s\r\n<a href=\"http://hubzero.org/topics/middleware\">unique middleware</a>, so\r\nusers don\'t have to download or install any source code.  As such, the\r\nsource code for your tool can be completely protected, and may not require\r\nany license.  We do encourage our developers, however, to release their\r\ntools as <a href=\"http://www.opensource.org/\">open source</a> so that\r\nothers can build upon their work.  Please check with your local institution\r\nfor details on their policy for open source release.  If you\r\ndecide to make your source code available for download, we do require\r\nthat you include some well-defined license so that our users clearly\r\nunderstand how they are allowed to use your source code.  The <a href=\"http://opensource.org/licenses/alphabetical\">licenses available on opensource.org</a> have been vetted by lawyers and can be used right out of the box.\r\n</p>\r\n\r\n<h3>Seminars and Other Materials</h3>\r\n<p>\r\n<div style=\"float:left; margin:10px;\">\r\n<a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/\"><img alt=\"Creative Commons License\" style=\"border-width: 0\" src=\"/media/system/images/creativecommons-2.5.png\" style=\"float:left;\"/></a>\r\n</div>\r\nWe strongly encourage contributors of online presentations, teaching\r\nmaterials, animations, and other materials to adopt the\r\n<a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/\" title=\"Learn more about Creative Commons\">Creative Commons 3.0 license</a>.\r\nThis allows others to use your work for non-commercial purposes, but\r\nthey must acknowledge you as a source and share their derivative works\r\nunder the same license.  Note that this also gives you an opportunity\r\nto build upon their work!</p>\r\n<p>\r\nWe strongly encourage all contributors to adopt these licensing guidelines.\r\nIf you want to contribute, but for some reason you are unable to agree to\r\nthese licenses, please <a href=\"/support/ticket/new\">contact us</a>,\r\nso we can follow up and discuss other options.\r\n</p>','',1,3,0,9,'2010-03-25 06:26:40',62,'','2010-03-27 15:53:32',63,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_vote\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',13,0,7,'','',1,15,'robots=\nauthor=',0,'',''),(13,88,'Creative Commons','cc','','<h3>What is Creative Commons?</h3>\r\n\r\n<p>\r\n<img src=\"/media/system/images/cc_button.jpg\" style=\"float: left; margin: 6px;\"/>The Creative Commons (CC) enables copyright holders to grant some or all of their rights to the public while retaining others through a variety of licensing and contract schemes. {xhub:getcfg hubShortName} prefers the <a href=\"http://creativecommons.org/licenses/by-nc-sa/3.0/\">Creative Commons 3.0</a> license, which is well suited to education and academic research.  This license allows people to use your work for non-commercial purposes, but they must attribute you as a source, and they must share any derivative works under the same license.</p>\r\n\r\n<p><i>Offering your work under a CC license does not mean giving up your copyright. It means offering some of your rights to any member of the public but only on certain conditions.</i>  You may offer your work on {xhub:getcfg hubShortName} under a non-commercial license and still grant commercial licenses separately, on a case-by-case basis.</p>\r\n\r\n<p>For further information on Creative Commons visit the <a href=\"http://creativecommons.org/\">Creative Commons homepage</a>.</p>\r\n\r\n<h3>From the Creative Commons FAQ:</h3>\r\n\r\n<blockquote cite=\"http://wiki.creativecommons.org/FAQ\">\r\n<h4>What if I change my mind?</h4>\r\n<p>Creative Commons licenses are non-revocable. This means that you cannot stop someone, who has obtained your work under a Creative Commons license, from using the work according to that license. You can stop distributing your work under a Creative Commons license at any time you wish; but this will not withdraw any copies of your work that already exist under a Creative Commons license from circulation, be they verbatim copies, copies included in collective works and/or adaptations of your work. So you need to think carefully when choosing a Creative Commons license to make sure that you are happy for people to be using your work consistent with the terms of the license, even if you later stop distributing your work.</p>\r\n\r\n<h4>Do Creative Commons licenses affect fair use, fair dealing or other exceptions to copyright?</h4>\r\n<p>No. All jurisdictions allow some uses of copyrighted material without permission, such as quotation, current-affairs reporting, or parody, although these vary from country to country. These are not dependent on the license and so cannot be affected by it. To make this clear, all of our licenses include this or similar language: Nothing in this license is intended to reduce, limit, or restrict any rights arising from fair use, first sale or other limitations on the exclusive rights of the copyright owner under copyright law or other applicable laws. Thus, regardless of the jurisdiction a user is in, our licenses do not affect a user\'s right to use or allow use of content under copyright exceptions.</p>\r\n\r\n<h4>What happens if someone misuses my Creative Commons-licensed work?</h4>\r\n<p>A Creative Commons license terminates automatically if someone uses your work contrary to the license terms. This means that, if a person uses your work under a Creative Commons license and they, for example, fail to attribute your work in the manner you specified, then they no longer have the right to continue to use your work. This only applies in relation to the person in breach of the license; it does not apply generally to the other people who use your work under a Creative Commons license and comply with its terms.</p>\r\n</blockquote>','',1,3,0,9,'2010-03-25 06:26:40',62,'','2010-03-27 20:24:17',63,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_vote\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',10,0,6,'','',1,5,'robots=\nauthor=',0,'',''),(14,89,'Submitting Content','license','','<p>\r\n		THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS LICENSE.  THE WORK IS PROTECTED BY COPYRIGHT AND/OR OTHER APPLICABLE LAW.  ANY USE OF THE WORK OTHER THAN AS AUTHORIZED UNDER THIS LICENSE OR COPYRIGHT LAW IS PROHIBITED.\r\n	</p>\r\n	<p>\r\n		{xhub:getcfg hubShortURL} ACCEPTS AND AGREES TO BE BOUND BY THE TERMS OF THIS LICENSE.  THE LICENSOR (YOU) GRANTS {xhub:getcfg hubShortURL} THE RIGHTS CONTAINED HERE IN CONSIDERATION OF {xhub:getcfg hubShortURL}\'S ACCEPTANCE OF SUCH TERMS AND CONDITIONS.\r\n	</p>\r\n	<ol>\r\n	 <li>Definitions\r\n		<ol>\r\n		 <li>\"Collective Work\" means a work, such as a periodical issue, anthology or encyclopedia, in which the Work in its entirety in unmodified form, along with a number of other contributions, constituting separate and independent works in themselves, are assembled into a collective whole.  A work that constitutes a Collective Work will not be considered a Derivative Work (as defined below) for the purposes of this License.</li>\r\n		 <li>\"Derivative Work\" means a work based upon the Work or upon the Work and other pre-existing works, such as a translation, musical arrangement, dramatization, fictionalization, motion picture version, sound recording, art reproduction, abridgment, condensation, or any other form in which the Work may be recast, transformed, or adapted, except that a work that constitutes a Collective Work will not be considered a Derivative Work for the purpose of this License.  For the avoidance of doubt, where the Work is a musical composition or sound recording, the synchronization of the Work in timed-relation with a moving image (\"synching\") will be considered a Derivative Work for the purpose of this License.</li>\r\n		 <li>\"Licensor\" means the individual or entity that offers the Work under the terms of this License.</li>\r\n		 <li>\"Original Author\" means the individual or entity who created the Work.</li>\r\n		 <li>\"Work\" means the copyrightable work of authorship offered under the terms of this License.</li>\r\n		</ol>\r\n	 </li>\r\n	 <li>License Grant\r\n		<p>Subject to the terms and conditions of this License, Licensor hereby grants {xhub:getcfg hubShortURL} a worldwide, royalty-free, non-exclusive, perpetual (for the duration of the applicable copyright) license to exercise the rights in the Work as stated below:</p>\r\n		<ol>\r\n		 <li>to reproduce the Work, to incorporate the Work into one or more Collective Works, and to reproduce the Work as incorporated in the Collective Works;</li>\r\n		 <li>to create and reproduce Derivative Works;</li>\r\n		 <li>to distribute copies or phonorecords of, display publicly, perform publicly, and perform publicly by means of a digital audio transmission the Work including as incorporated in Collective Works;</li>\r\n		 <li>to distribute copies or phonorecords of, display publicly, perform publicly, and perform publicly by means of a digital audio transmission Derivative Works;</li>\r\n		</ol>\r\n		<p>The above rights may be exercised in all media and formats whether now known or hereafter devised.  The above rights include the right to make such modifications as are technically necessary to exercise the rights in other media and formats.  All rights not expressly granted by Licensor are hereby reserved, including but not limited to the rights set forth in Sections 4(d) and 4(e).</p>\r\n	</li>\r\n	<li>Representations, Warranties and Disclaimer\r\n		<p>UNLESS OTHERWISE MUTUALLY AGREED BY THE PARTIES IN WRITING, LICENSOR AND {xhub:getcfg hubShortURL} BOTH OFFER THE WORK AS-IS AND MAKE NO REPRESENTATIONS OR WARRANTIES OF ANY KIND CONCERNING THE WORK, EXPRESS, IMPLIED, STATUTORY OR OTHERWISE, INCLUDING, WITHOUT LIMITATION, WARRANTIES OF TITLE, MERCHANTIBILITY, FITNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, OR THE ABSENCE OF LATENT OR OTHER DEFECTS, ACCURACY, OR THE PRESENCE OF ABSENCE OF ERRORS, WHETHER OR NOT DISCOVERABLE.  SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, SO SUCH EXCLUSION MAY NOT APPLY IN ALL SITUATIONS.</p>\r\n	</li>\r\n	<li>Limitation on Liability\r\n		<p>EXCEPT TO THE EXTENT REQUIRED BY APPLICABLE LAW, IN NO EVENT WILL LICENSOR HOLD {xhub:getcfg hubShortURL} LIABLE ON ANY LEGAL THEORY FOR ANY SPECIAL, INCIDENTAL, CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES ARISING OUT OF THIS LICENSE OR THE USE OF THE WORK, EVEN IF LICENSOR AND/OR {xhub:getcfg hubShortURL} HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</p>\r\n	</li>\r\n	<li>Termination\r\n		<ol>\r\n		 <li>This License and the rights granted hereunder will terminate automatically upon any breach by {xhub:getcfg hubShortURL} of the terms of this License.  Individuals or entities who have received Collective Works or Derivative Works from {xhub:getcfg hubShortURL} under this License, however, will not have their licenses terminated provided such individuals or entities remain in full compliance with those licenses.  Sections 1, 2, 5, 6, 7, and 8 will survive any termination of this License.</li>\r\n		 <li>Subject to the above terms and conditions, the license granted here is perpetual (for the duration of the applicable copyright in the Work).  Notwithstanding the above, Licensor reserves the right to release the Work under different license terms or to stop distributing the Work at any time; provided, however that any such election will not serve to withdraw this License (or any other license that has been, or is required to be, granted under the terms of this License), and this License will continue in full force and effect unless terminated as stated above.</li>\r\n		</ol>\r\n	 </li>\r\n	 <li>Miscellaneous\r\n		<ol>\r\n		 <li>Each time {xhub:getcfg hubShortURL} distributes or publicly digitally performs the Work, a Collective Work, or a Derivative Work, the Licensor offers to the recipient a license to the Work on the same terms and conditions as the license granted to {xhub:getcfg hubShortURL} under this License.</li>\r\n		 <li>If any provision of this License is invalid or unenforceable under applicable law, it shall not affect the validity or enforceability of the remainder of the terms of this License, and without further action by the parties to this agreement, such provision shall be reformed to the minimum extent necessary to make such provision valid and enforceable.</li>\r\n		 <li>No term or provision of this License shall be deemed waived and no breach consented to unless such waiver or consent shall be in writing and signed by the party to be charged with such waiver or consent.</li>\r\n		 <li>This License constitutes the entire agreement between the parties with respect to the Work licensed here.  There are no understandings, agreements or representations with respect to the Work not specified here.  Neither Licensor nor {xhub:getcfg hubShortURL} shall be bound by any additional provisions that may appear in any communication between the parties.  This License may not be modified without the mutual written agreement of the Licensor and {xhub:getcfg hubShortURL}.</li>\r\n		</ol>\r\n	 </li>\r\n	</ol>','',1,3,0,9,'2010-03-25 06:26:40',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2010-03-25 06:26:40','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_vote\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_pdf_icon\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',7,0,5,'','',1,1,'robots=\nauthor=',0,'',''),(22,90,'Discover','discover','','{xhub:include type=\"stylesheet\" filename=\"pages/discover.css\"}\r\n\r\n<section class=\"odd\">\r\n	<h2>Do More</h2>\r\n\r\n	<div class=\"grid\">\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-resources\">\r\n				<h3><a href=\"/resources\">Resources</a></h3>\r\n				<p>Find the latest cutting-edge research in our <a href=\"/resources\">resources</a>.</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-citations\">\r\n				<h3><a href=\"/citations\">Citations</a></h3>\r\n				<p>See who has <a href=\"/citations\">cited</a> our content in their work.</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4 omega\">\r\n			<div class=\"block block-tags\">\r\n				<h3><a href=\"/tags\">Tags</a></h3>\r\n				<p>Explore all our content through <a href=\"/tags\">tags</a> or even tag content yourself.</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n\r\n	<div class=\"grid\">\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-blog\">\r\n				<h3><a href=\"/blog\">Blog</a></h3>\r\n				<p>Read the <a href=\"/blog\">latest entry</a> or browse the archive for articles of interest.</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-wiki\">\r\n				<h3><a href=\"/wiki\">Wiki</a></h3>\r\n				<p>Browse our user-generated <a href=\"/wiki\">wiki pages</a> or write your own.</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4 omega\">\r\n			<div class=\"block block-feedback\">\r\n				<h3><a href=\"/feedback\">Feedback</a></h3>\r\n				<p>Like something? Having trouble? <a href=\"/feedback\">Let us know what you think!</a></p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>\r\n\r\n<section class=\"even\">\r\n	<h2>Services</h2>\r\n\r\n	<div class=\"grid\">\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-contribute\">\r\n				<h3><a href=\"/resources/new\">Upload</a></h3>\r\n				<p><a href=\"/resources/new\">Publish</a> your own tools, seminars, and other content on this site.</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-tools\">\r\n				<h3><a href=\"/tools\">Tool Forge</a></h3>\r\n				<p>The <a href=\"/tools\">development area</a> for simulation tools. Sign up and manage your own software project!</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4 omega\">\r\n			<div class=\"block block-store\">\r\n				<h3><a href=\"/store\">Store</a></h3>\r\n				<p><a href=\"/store\">Purchase items</a> such as t-shirts using points you earn by helping out.</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>\r\n\r\n<section class=\"odd\">\r\n	<h2>What&#39;s Happening</h2>\r\n\r\n	<div class=\"grid\">\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-events\">\r\n				<h3><a href=\"/events\">Events</a></h3>\r\n				<p>Find information about the many upcoming <a href=\"/events\">public meetings and scientific symposia</a>.</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4\">\r\n			<div class=\"block block-whatsnew\">\r\n				<h3><a href=\"/whatsnew\">What&#39;s New</a></h3>\r\n				<p>Find the latest content posted on the site with our <a href=\"/whatsnew\">What&#39;s New</a> section.</p>\r\n			</div>\r\n		</div>\r\n\r\n		<div class=\"col span4 omega\">\r\n			<div class=\"block block-polls\">\r\n				<h3><a href=\"/poll\">Poll</a></h3>\r\n				<p>Respond to our poll questions and <a href=\"/poll\">see what everyone else is thinking</a>.</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</section>','',1,0,0,2,'2010-03-27 16:47:23',62,'','2013-08-29 20:43:06',1000,0,'0000-00-00 00:00:00','2010-03-27 16:47:23','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"0\",\"link_author\":\"\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',13,0,4,'','',1,155,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(32,91,'Getting Started','gettingstarted','','<p>{xhub:include type=\"stylesheet\" filename=\"pages/gettingstarted.css\"}</p>\r\n\r\n<div class=\"explore-section\">\r\n<div class=\"wrap\">\r\n<h2>Getting To Know Your Hub</h2>\r\n\r\n<div class=\"grid\">\r\n<div class=\"col span-third\">\r\n<div class=\"docblock use\">\r\n<h3>Utilize</h3>\r\n\r\n<p>View tutorials and read about how to use the numerous features of a HUB. We show you how to add content, customize your dashboard, create groups, and more.</p>\r\n\r\n<p class=\"btn-container\"><a class=\"btn\" href=\"http://hubzero.org/documentation/current/users\" rel=\"external\">User documentation</a></p>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col span-third\">\r\n<div class=\"docblock manage\">\r\n<h3>Manage</h3>\r\n\r\n<p>Read the manual for managing the content and functionality of a HUB. It progresses step-by-step through various common tasks and familiarizes you with the administrative interface.</p>\r\n\r\n<p class=\"btn-container\"><a class=\"btn\" href=\"http://hubzero.org/documentation/current/managers\" rel=\"external\">Manager documentation</a></p>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col span-third omega\">\r\n<div class=\"docblock customize\">\r\n<h3>Extend</h3>\r\n\r\n<p>Build your own extensions and discover how to extend or tailor the existing ones to your needs. We guide you through the creation steps and provide examples for download.</p>\r\n\r\n<p class=\"btn-container\"><a class=\"btn\" href=\"http://hubzero.org/documentation/current/webdevs\" rel=\"external\">Developer documentation</a></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"todo-section\">\r\n<div class=\"wrap\">\r\n<h2>Setting Up Your Hub</h2>\r\n\r\n<p class=\"begin\">We&#39;ve provided default content and menus for your hub, along with some commonly used extensions. However, the default content is pretty generic and you&#39;ll want to customize some of key pages to get the most out of your hub. We also have some recommendations on enabling some key features to help manage and protect your hub.&nbsp;</p>\r\n\r\n<div class=\"grid\">\r\n<div class=\"col span6\">\r\n<h2>Customize&nbsp;Your Hub&#39;s Content</h2>\r\n\r\n<ul>\r\n	<li class=\"about\">\r\n	<h3>&#39;About You&#39; Page</h3>\r\n\r\n	<p>A <a href=\"/about\" target=\"_blank\">page</a>* for telling your story and letting your visitors know all about you.&nbsp;</p>\r\n	</li>\r\n	<li class=\"contact\">\r\n	<h3>&#39;How to Contact&#39; Page</h3>\r\n\r\n	<p>A&nbsp;<a href=\"/about/contact\" target=\"_blank\">page</a>* to provide detailed contact information for your organization.</p>\r\n	</li>\r\n	<li class=\"terms\">\r\n	<h3>&#39;Terms of Use&#39; Page</h3>\r\n\r\n	<p>We put a generic&nbsp;<a href=\"/legal/terms\" target=\"_blank\">Terms of Use</a>*&nbsp;page in place, but you might want to customize it for your specific&nbsp;needs.<br />\r\n	<br />\r\n	<br />\r\n	<span style=\"background-color:rgb(255, 255, 255); font-family:helvetica neue,helvetica,arial,sans-serif; font-size:13px; font-style:normal; font-variant:normal; line-height:20.4799995422363px\">* Once you are ready to changing these pages, login to your site&#39;s&nbsp;</span><a href=\"/administrator\" style=\"font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; line-height: 20.4799995422363px; background-color: rgb(255, 255, 255);\">administrator</a><span style=\"background-color:rgb(255, 255, 255); font-family:helvetica neue,helvetica,arial,sans-serif; font-size:13px; font-style:normal; font-variant:normal; line-height:20.4799995422363px\">&nbsp;page and use the&nbsp;Article Manager (under the &#39;Content&#39; menu).&nbsp;</span></p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"col span6 omega\">\r\n<h2>Enable&nbsp;Recommended Features</h2>\r\n\r\n<ul>\r\n	<li class=\"logins\">\r\n	<h3>Facebook, Google, LinkedIn</h3>\r\n\r\n	<p>Hub come&nbsp;with the ability for users to authenticate with popular services like <a href=\"https://hubzero.org/documentation/2.0.0/managers/advancedsetup#fa\">Facebook</a>, <a href=\"http://hubzero.org/documentation/2.0.0/managers/advancedsetup#ga\">Google</a>, or <a href=\"http://hubzero.org/documentation/2.0.0/managers/advancedsetup#la\">LinkedIn</a>. Turn one or all of these on with a click of a button!</p>\r\n	</li>\r\n	<li class=\"analytics\">\r\n	<h3>Set up Analytics</h3>\r\n\r\n	<p>We highly recommend setting up <a href=\"https://hubzero.org/documentation/2.0.0/managers/advancedsetup#ga\">Google Analytics</a>&nbsp;on your hub. We provide a module to enable analytics use on your hub.</p>\r\n	</li>\r\n	<li class=\"captcha\">\r\n	<h3>Use ReCAPTCHA</h3>\r\n\r\n	<p>We provide basic image and text CAPTCHAs to help guard against spam bots, but we recommend configuring <a href=\"https://hubzero.org/documentation/2.0.0/managers/advancedsetup#rec\">ReCAPTCHA</a>&nbsp;for even better protection.</p>\r\n	</li>\r\n	<li class=\"contact\">\r\n	<h3>Email</h3>\r\n\r\n	<p>Hubs send&nbsp;outgoing email directly by default. Depending the type of server your hub is running on or your specific configuration,&nbsp;you might find the email your hub sends out gets marked as SPAM. We can&#39;t always easily prevent this from happening, but if you find your hub&#39;s email in SPAM folders too often,&nbsp;we recommend&nbsp;<a href=\"https://hubzero.org/documentation/2.0.0/installation/advanced_email_setup\">configuring your&nbsp;hub&#39;s STMP server to use a third party mail forwarding system</a>, such as Amazon SES or Mandril.&nbsp;</p>\r\n	</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!-- / .highlight-section -->\r\n\r\n<div class=\"support-section\">\r\n<div class=\"wrap\">\r\n<p>Where to Find Help</p>\r\n\r\n<p class=\"begin\">We try to make using and configuring a hub a simple, smooth process. Sometimes, however, you may have questions or issues not easily answered by the available documentation. If you need help or support while developing your hub, feel free to contact us.</p>\r\n\r\n<div class=\"grid\">\r\n<div class=\"col span4\">\r\n<div class=\"docblock question\">\r\n<h3>I have a question!</h3>\r\n\r\n<p>Have a question on how to do something? If the <a href=\"http://hubzero.org/documentation\" rel=\"external\">documentation</a> doesn&#39;t seem to be of help, you can try <a href=\"http://hubzero.org/answers\" rel=\"external\">asking the community</a>.</p>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col span4\">\r\n<div class=\"docblock idea\">\r\n<h3>I have an idea!</h3>\r\n\r\n<p>Think something can be done better or is missing? Post your <a href=\"http://hubzero.org/wishlist\" rel=\"external\">ideas or feature requests</a>. We&#39;d love to hear from you.</p>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col span4 omega\">\r\n<div class=\"docblock err\">\r\n<h3>I have an error!</h3>\r\n\r\n<p>We continually test and refine the code for an error-free experience but, sadly, we can make mistakes. If you found a bug, <a href=\"http://hubzero.org/support/ticket/new\" rel=\"external\">let us know</a>.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','',1,0,0,2,'2012-09-07 16:55:44',1008,'','2015-02-03 22:22:56',1000,1000,'2015-02-03 22:22:56','2012-09-07 16:55:44','0000-00-00 00:00:00','','','{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',14,0,2,'','',1,7,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(27,92,'Privacy Policy','privacy','','<p>We respect your privacy. We will never sell your e-mail address or other personally identifiable information to third parties, or make that information publicly available without your permission.</p>\r\n<p>We are a scientific project and we provide a free service, so we do track your activities on this site.  We combine your usage metrics with others to create an aggregate picture of how the site is being used, and we report <a href=\"usage\">that usage</a> publicly on our site and send similar quarterly reports to our program sponsors.  However, such usage reports never contain detailed information about your activities as an individual without your prior consent.</p>\r\n<p>From time to time, we work with other other projects that seek to study social interactions on the site.  We may share your activities with those groups, but they are bound by a Memorandum of Understanding to follow our policies and respect your privacy in the same way that we do.  We may contact you on their behalf and ask you to participate in their study, but your participation is voluntary, and your information will not be publicly released without your prior consent.</p>\r\n<p>We reserve the right to contact you to request additional information or to keep you updated on changes to {xhub:getcfg hubShortURL}. You may opt out of receiving newsletters and other non-essential communications by updating the settings in your account profile.</p>\r\n<p>All resources, wiki articles, blogs, questions, answers, or other information posted or stored on {xhub:getcfg hubShortURL} is potentially available to all other users of {xhub:getcfg hubShortURL}.  We do our best to restrict access to source code and to other private materials shared within groups.  However, we are a research project and our software is constantly changing.  We disclaim any responsibility or capability for the preservation of confidentiality of any information posted on this site. <em>Do not post or store information on {xhub:getcfg hubShortURL} if you expect to or are obligated to protect the confidentiality of that information.</em></p>\r\n<h3>Changes to policy</h3>\r\n<p>We may occasionally update our Privacy Policy to reflect changes in our practices and services. If we make material changes in the way we collect, use, or share your personal information, we will notify you and/or prominently post notices of the changes on our website.</p>','',1,3,0,9,'2012-05-02 12:15:06',62,'','2012-05-02 12:20:30',62,0,'0000-00-00 00:00:00','2012-05-02 12:15:06','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_vote\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_pdf_icon\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',2,0,4,'','',1,0,'robots=\nauthor=',0,'',''),(28,93,'Abuse Policy','abuse','','<p>\r\nYou are responsible at all times for using {xhub:getcfg hubShortURL} in a manner that is legal, ethical, and not to the detriment of others.  Once you have created an account, you are allowed to post materials and participate in other social networking features available on this site.  All members are encouraged to help moderate content and click on \"report abuse\" links to report any material deemed offensive or inappropriate.  If your posted material is reported as abusive, it will be immediately withdrawn and subsequently reviewed by a site administrator.  If the material is judged to be appropriate, it will be restored.  Otherwise, it will be removed from the site, and depending on the inappropriate nature of the content, your account may be terminated.\r\n</p><p>\r\nAll users must recognize that system resources on {xhub:getcfg hubShortURL} are limited.  Quotas for disk storage, job submissions, and other limited resources are strictly enforced. By using {xhub:getcfg hubShortURL}, you agree to delete unused files and acknowledge that if you fail to do so, the files may be deleted for you.  You may request an increase in system quotas, and you may use points to pay for premium services, but you may not circumvent the policies put in place to manage resources.\r\n</p><p>\r\n<em>Creating multiple accounts or otherwise gaming the system in order to earn extra points, to increase your disk quota, or to gain an unfair share of other system resources is strictly prohibited and may lead to termination of your account.</em></p>\r\n<p>\r\nBy using {xhub:getcfg hubShortURL}, you agree that:\r\n</p>\r\n<ul>\r\n <li>You will not use {xhub:getcfg hubShortURL} to commit a criminal offense or to encourage others to conduct what would constitute a criminal offense or give rise to a civil liability;</li>\r\n <li>You will not violate any applicable law;</li>\r\n <li>You will not post or transmit any unlawful, threatening, libelous, harassing, defamatory, vulgar, obscene, pornographic, profane, or otherwise objectionable content;</li>\r\n <li>You will not use {xhub:getcfg hubShortURL} to impersonate other parties or entities;</li>\r\n <li>You will not use {xhub:getcfg hubShortURL} to upload any content that contains a software virus, \"Trojan Horse\" or any other computer code, files, or programs that may alter, damage, or interrupt the functionality of {xhub:getcfg hubShortURL} or the hardware or software of any other person who accesses {xhub:getcfg hubShortURL};</li>\r\n <li>You will not post any material that infringes or violates the intellectual property rights of another;</li>\r\n <li>You will not redistribute resource materials posted on {xhub:getcfg hubShortURL} or create derivative works unless it is allowed by the license terms posted for a resource;</li>\r\n <li>You will not alter, damage, or delete any content posted on {xhub:getcfg hubShortURL};</li>\r\n <li>You will not claim a relationship with or speak for any business, association, or other organization for which you are not authorized to claim such a relationship;</li>\r\n <li>You will not post or transmit any unsolicited advertising, promotional materials, or other forms of solicitation;</li>\r\n <li>You will not use email addresses obtained or accessed through {xhub:getcfg hubShortURL} to transmit the same or substantially similar unsolicited message to multiple recipients without a valid purpose specifically related to the research and education mission of the {xhub:getcfg hubShortURL};</li>\r\n</ul>','',1,3,0,9,'2012-05-02 12:19:12',62,'','2012-05-02 12:20:14',62,0,'0000-00-00 00:00:00','2012-05-02 12:19:12','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_vote\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_pdf_icon\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',2,0,3,'','',1,0,'robots=\nauthor=',0,'',''),(29,94,'Legal','legal','','<p class=\"warning\">\r\nEdit this page and fill in contact information for your project, or unpublish it if you think it is unnecessary.  The following text is just\r\na suggestion for the policies that you may want to highlight, and your contact for legal issues.\r\n</p>\r\n\r\n<h3>Policies</h3>\r\n<p>Review {xhub:getcfg hubShortURL}\'s <a href=\"/legal/terms\">Terms of Use</a>, <a href=\"/legal/privacy\">Privacy Policy</a> or <a href=\"/legal/abuse\">Abuse Policy</a>.</p>\r\n\r\n<h3>Legal Contacts</h3>\r\n<div class=\"grid\"><div class=\"col span6\" id=\"getintouch\">\r\n	{xhub:module position=\"contact\"}\r\n</div><!-- / .col -->\r\n<div class=\"col span6 omega\">\r\n	<div class=\"vcard\">	\r\n		<address class=\"adr\">\r\n			<span class=\"fn org\">{Your Organization}</span><br />\r\n			<span class=\"street-address\">{Street Address}</span><br />\r\n			<span class=\"locality\">{City}</span>, <span class=\"region\">{Region/Stqte}</span> <span class=\"postal-code\">{Postal Code}</span><br />\r\n			<span class=\"country-name\">{Country}</span>\r\n		</address>\r\n		<p>\r\n			<span class=\"tel\"><span class=\"type\">Phone</span> +{Telephone}</span>\r\n		</p>\r\n	</div><!-- / .vcard -->\r\n</div><!-- / .col --></div>','',1,3,0,9,'2012-05-02 12:21:09',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2012-05-02 12:21:09','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_vote\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_pdf_icon\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',1,0,2,'','',1,2,'robots=\nauthor=',0,'',''),(30,95,'HUBzero Accessibility Statement','accessibility','','<div id=\"getintouch\" style=\"width:350px; float:right; margin:0px 0px 15px 25px; border: #cccccc 1px solid; padding:0px 10px 10px 10px;\">\r\n	{xhub:module position=\"accessibilitycontact\"}\r\n</div>\r\n\r\n<div>\r\n<h3>An Open Commitment</h3>\r\n<p>Our web site is built on the <a href=\"http://hubzero.org\">HUBzero&reg;</a> software platform.  The HUBzero team is committed to creating websites that are accessible to the widest possible audience, regardless of technology or ability.  If you find accessibility problems with our site, please report them so we can take corrective action.</p>\r\n\r\n<h3>Guidelines, Standards and Testing</h3>\r\n<p>Our site has been developed according to the following standards:</p>\r\n<dl>\r\n	<dt>Section 508</dt>\r\n	<dd>\r\n		<p>This website endeavors to meet or exceed the requirements of <a href=\"http://www.access-board.gov/508.htm\">Section 508 of the Rehabilitation Act</a>.</p>\r\n	</dd>\r\n	\r\n	<dt>WCAG 2.0</dt>\r\n	<dd>\r\n		<p>This website endeavors to conform to level AA standards, and where possible strive for AAA, as defined by <a href=\"http://www.w3.org/TR/WCAG20\" rel=\"external\">W3C\'s Web Content Accessibility Guidelines (WCAG) 2.0</a>. These guidelines provide web authors and designers with recommendations to help provide website content that is accessible to all users.</p>\r\n	</dd>\r\n	\r\n	<dt>Coding Standards</dt>\r\n	<dd>\r\n		<p>Pages on this site have been authored to be compliant with current W3C standards for <a href=\"http://www.w3.org/TR/xhtml1/\" rel=\"external\">HTML (XHTML 1.0 Strict)</a> and <a href=\"http://www.w3.org/TR/CSS21/\" rel=\"external\">CSS</a>. Standards-compliant code helps to ensure that visitors using assistive technologies (such as screen readers) are able to access the site contents.</p>\r\n	</dd>\r\n	\r\n	<dt>Additional Testing</dt>\r\n	<dd>\r\n		<p></p>\r\n		<p>In addition to reviewing for compliance with the standards noted above, we periodically test with such technologies as the <a href=\"http://wave.webaim.org/\" rel=\"external\">Web Accessibility Evaluation Tool</a>, <a href=\"http://achecker.ca/checker/index.php\" rel=\"external\">AChecker</a>, and try to test with a range of assistive technologies (e.g., JAWS and WindowEyes screen readers). We also appreciate any input from third parties and assistive technology users from the community.</p>\r\n	</dd>\r\n</dl>\r\n\r\n<h3>Contributed Content</h3>\r\n<p>While we make every effort to make sure that all pages designed and maintained by us are fully accessible, the accessibility of some contributed content is most often beyond our control.</p>\r\n</div>','',1,3,0,9,'2012-05-02 12:28:16',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2012-05-02 12:28:16','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_vote\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_pdf_icon\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"language\":\"\",\"keyref\":\"\",\"readmore\":\"\"}',1,0,1,'','',1,0,'robots=\nauthor=',0,'',''),(31,96,'Community','community','','{xhub:include type=\"stylesheet\" filename=\"pages/community.css\"}\r\n\r\n<div class=\"tagline\">\r\n	<p>Join the community!</p>\r\n</div>\r\n\r\n<div class=\"about odd members\">\r\n	<h3><a href=\"/members\">Members</a></h3>\r\n	<p>As a member, you instantly become part of a community designed for you and your colleagues.  Browse the <a href=\"/members\">profiles</a> of people who have joined this site. Find members with similar <a href=\"/tags\">interests</a>.</p>\r\n</div>\r\n\r\n<div class=\"about even groups\">\r\n	<h3>Groups</h3>\r\n	<p>Members working together! Groups are an easy way to share content and conversation, either privately or with the world.  Explore our <a href=\"/groups\">groups</a> and get in touch with <a href=\"/members\">members</a> with similar interests.</p>\r\n</div>\r\n\r\n<div class=\"about odd answers\">\r\n	<h3><a href=\"/answers\">Questions &amp; Answers</a></h3>\r\n	<p>Submit a question to our community and get an answer from real people. <a href=\"/answers/new\">Ask questions</a>, get <a href=\"/answers\">answers</a>, and help others.</p>\r\n</div>\r\n\r\n<div class=\"about even forum\">\r\n	<h3><a href=\"/forum\">Forum</a></h3>\r\n	<p>A place for you to start a <a href=\"/forum\">discussion</a> or find out what everyone is talking about.</p>\r\n</div>','',1,0,0,2,'2012-09-07 16:33:42',1008,'','2013-08-29 20:43:06',1000,0,'0000-00-00 00:00:00','2012-09-07 16:33:42','0000-00-00 00:00:00','','','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',4,0,3,'','',1,10,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
/*!40000 ALTER TABLE `jos_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_content_frontpage`
--

DROP TABLE IF EXISTS `jos_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_content_frontpage`
--

LOCK TABLES `jos_content_frontpage` WRITE;
/*!40000 ALTER TABLE `jos_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_content_rating`
--

DROP TABLE IF EXISTS `jos_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_content_rating`
--

LOCK TABLES `jos_content_rating` WRITE;
/*!40000 ALTER TABLE `jos_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `jos_contributor_ids_view`
--

DROP TABLE IF EXISTS `jos_contributor_ids_view`;
/*!50001 DROP VIEW IF EXISTS `jos_contributor_ids_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jos_contributor_ids_view` (
  `uidNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jos_contributors_view`
--

DROP TABLE IF EXISTS `jos_contributors_view`;
/*!50001 DROP VIEW IF EXISTS `jos_contributors_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jos_contributors_view` (
  `uidNumber` tinyint NOT NULL,
  `resource_count` tinyint NOT NULL,
  `wiki_count` tinyint NOT NULL,
  `total_count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jos_core_log_searches`
--

DROP TABLE IF EXISTS `jos_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_log_searches`
--

LOCK TABLES `jos_core_log_searches` WRITE;
/*!40000 ALTER TABLE `jos_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses`
--

DROP TABLE IF EXISTS `jos_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `blurb` text NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `length` varchar(255) DEFAULT NULL,
  `effort` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ftidx_alias_title_blurb` (`alias`,`title`,`blurb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses`
--

LOCK TABLES `jos_courses` WRITE;
/*!40000 ALTER TABLE `jos_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_announcements`
--

DROP TABLE IF EXISTS `jos_courses_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_announcements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offering_id` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `priority` tinyint(2) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sticky` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_offering_id` (`offering_id`),
  KEY `idx_section_id` (`section_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_state` (`state`),
  KEY `idx_priority` (`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_announcements`
--

LOCK TABLES `jos_courses_announcements` WRITE;
/*!40000 ALTER TABLE `jos_courses_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_asset_associations`
--

DROP TABLE IF EXISTS `jos_courses_asset_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_asset_associations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL DEFAULT '0',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `scope` varchar(255) NOT NULL DEFAULT 'asset_group',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_scope_id` (`scope_id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_asset_associations`
--

LOCK TABLES `jos_courses_asset_associations` WRITE;
/*!40000 ALTER TABLE `jos_courses_asset_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_asset_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_asset_group_types`
--

DROP TABLE IF EXISTS `jos_courses_asset_group_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_asset_group_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_asset_group_types`
--

LOCK TABLES `jos_courses_asset_group_types` WRITE;
/*!40000 ALTER TABLE `jos_courses_asset_group_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_asset_group_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_asset_groups`
--

DROP TABLE IF EXISTS `jos_courses_asset_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_asset_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(250) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_unit_id` (`unit_id`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_asset_groups`
--

LOCK TABLES `jos_courses_asset_groups` WRITE;
/*!40000 ALTER TABLE `jos_courses_asset_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_asset_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_asset_unity`
--

DROP TABLE IF EXISTS `jos_courses_asset_unity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_asset_unity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `passed` tinyint(1) NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_asset_unity`
--

LOCK TABLES `jos_courses_asset_unity` WRITE;
/*!40000 ALTER TABLE `jos_courses_asset_unity` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_asset_unity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_asset_views`
--

DROP TABLE IF EXISTS `jos_courses_asset_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_asset_views` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `viewed` datetime NOT NULL,
  `viewed_by` int(11) NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `user_agent_string` varchar(255) DEFAULT NULL,
  `session_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_asset_views`
--

LOCK TABLES `jos_courses_asset_views` WRITE;
/*!40000 ALTER TABLE `jos_courses_asset_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_asset_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_assets`
--

DROP TABLE IF EXISTS `jos_courses_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  `type` varchar(255) NOT NULL DEFAULT '',
  `subtype` varchar(255) NOT NULL DEFAULT 'file',
  `url` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `graded` tinyint(2) DEFAULT NULL,
  `grade_weight` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_assets`
--

LOCK TABLES `jos_courses_assets` WRITE;
/*!40000 ALTER TABLE `jos_courses_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_certificates`
--

DROP TABLE IF EXISTS `jos_courses_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `properties` text,
  `course_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_certificates`
--

LOCK TABLES `jos_courses_certificates` WRITE;
/*!40000 ALTER TABLE `jos_courses_certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_form_answers`
--

DROP TABLE IF EXISTS `jos_courses_form_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_form_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `correct` tinyint(4) NOT NULL,
  `left_dist` int(11) NOT NULL,
  `top_dist` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_form_answers`
--

LOCK TABLES `jos_courses_form_answers` WRITE;
/*!40000 ALTER TABLE `jos_courses_form_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_form_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_form_deployments`
--

DROP TABLE IF EXISTS `jos_courses_form_deployments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_form_deployments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `results_open` varchar(50) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `crumb` varchar(20) NOT NULL,
  `results_closed` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `allowed_attempts` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_crumb` (`crumb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_form_deployments`
--

LOCK TABLES `jos_courses_form_deployments` WRITE;
/*!40000 ALTER TABLE `jos_courses_form_deployments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_form_deployments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `jos_courses_form_latest_responses_view`
--

DROP TABLE IF EXISTS `jos_courses_form_latest_responses_view`;
/*!50001 DROP VIEW IF EXISTS `jos_courses_form_latest_responses_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jos_courses_form_latest_responses_view` (
  `id` tinyint NOT NULL,
  `respondent_id` tinyint NOT NULL,
  `question_id` tinyint NOT NULL,
  `answer_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jos_courses_form_questions`
--

DROP TABLE IF EXISTS `jos_courses_form_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_form_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `left_dist` int(11) NOT NULL,
  `top_dist` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `form_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_form_questions`
--

LOCK TABLES `jos_courses_form_questions` WRITE;
/*!40000 ALTER TABLE `jos_courses_form_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_form_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_form_respondent_progress`
--

DROP TABLE IF EXISTS `jos_courses_form_respondent_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_form_respondent_progress` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `respondent_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `submitted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_respondent_id_question_id` (`respondent_id`,`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_form_respondent_progress`
--

LOCK TABLES `jos_courses_form_respondent_progress` WRITE;
/*!40000 ALTER TABLE `jos_courses_form_respondent_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_form_respondent_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_form_respondents`
--

DROP TABLE IF EXISTS `jos_courses_form_respondents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_form_respondents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deployment_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `started` timestamp NULL DEFAULT NULL,
  `finished` timestamp NULL DEFAULT NULL,
  `attempt` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_deployment_id` (`deployment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_form_respondents`
--

LOCK TABLES `jos_courses_form_respondents` WRITE;
/*!40000 ALTER TABLE `jos_courses_form_respondents` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_form_respondents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_form_responses`
--

DROP TABLE IF EXISTS `jos_courses_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_form_responses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `respondent_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_respondent_id` (`respondent_id`),
  KEY `idx_question_id` (`question_id`),
  KEY `idx_answer_id` (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_form_responses`
--

LOCK TABLES `jos_courses_form_responses` WRITE;
/*!40000 ALTER TABLE `jos_courses_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_forms`
--

DROP TABLE IF EXISTS `jos_courses_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_forms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` text,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_forms`
--

LOCK TABLES `jos_courses_forms` WRITE;
/*!40000 ALTER TABLE `jos_courses_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_grade_book`
--

DROP TABLE IF EXISTS `jos_courses_grade_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_grade_book` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `scope` varchar(255) NOT NULL DEFAULT 'asset',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `override` decimal(5,2) DEFAULT NULL,
  `score_recorded` datetime DEFAULT NULL,
  `override_recorded` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_user_id_scope_scope_id` (`member_id`,`scope`,`scope_id`),
  UNIQUE KEY `alternate_key` (`member_id`,`scope`,`scope_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_grade_book`
--

LOCK TABLES `jos_courses_grade_book` WRITE;
/*!40000 ALTER TABLE `jos_courses_grade_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_grade_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_grade_policies`
--

DROP TABLE IF EXISTS `jos_courses_grade_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_grade_policies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext,
  `threshold` decimal(3,2) DEFAULT NULL,
  `exam_weight` decimal(3,2) DEFAULT NULL,
  `quiz_weight` decimal(3,2) DEFAULT NULL,
  `homework_weight` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_grade_policies`
--

LOCK TABLES `jos_courses_grade_policies` WRITE;
/*!40000 ALTER TABLE `jos_courses_grade_policies` DISABLE KEYS */;
INSERT INTO `jos_courses_grade_policies` VALUES (1,'An average exam score of 70% or greater is required to pass the class.  Quizzes and homeworks do not count toward the final score.',0.70,1.00,0.00,0.00);
/*!40000 ALTER TABLE `jos_courses_grade_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_log`
--

DROP TABLE IF EXISTS `jos_courses_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `scope` varchar(100) NOT NULL DEFAULT '',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `actor_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_log`
--

LOCK TABLES `jos_courses_log` WRITE;
/*!40000 ALTER TABLE `jos_courses_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_member_badges`
--

DROP TABLE IF EXISTS `jos_courses_member_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_member_badges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `section_badge_id` int(11) NOT NULL,
  `earned` int(1) DEFAULT NULL,
  `earned_on` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_on` datetime DEFAULT NULL,
  `validation_token` varchar(20) DEFAULT NULL,
  `criteria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_member_badges`
--

LOCK TABLES `jos_courses_member_badges` WRITE;
/*!40000 ALTER TABLE `jos_courses_member_badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_member_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_member_notes`
--

DROP TABLE IF EXISTS `jos_courses_member_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_member_notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) NOT NULL DEFAULT '',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `pos_x` int(11) NOT NULL DEFAULT '0',
  `pos_y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `timestamp` time NOT NULL DEFAULT '00:00:00',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_scoped` (`scope`,`scope_id`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_member_notes`
--

LOCK TABLES `jos_courses_member_notes` WRITE;
/*!40000 ALTER TABLE `jos_courses_member_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_member_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_members`
--

DROP TABLE IF EXISTS `jos_courses_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `offering_id` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `permissions` mediumtext NOT NULL,
  `enrolled` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `student` tinyint(2) NOT NULL DEFAULT '0',
  `first_visit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token` varchar(23) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_offering_id` (`offering_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_section_id` (`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_members`
--

LOCK TABLES `jos_courses_members` WRITE;
/*!40000 ALTER TABLE `jos_courses_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_offering_section_badge_criteria`
--

DROP TABLE IF EXISTS `jos_courses_offering_section_badge_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_offering_section_badge_criteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `section_badge_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_offering_section_badge_criteria`
--

LOCK TABLES `jos_courses_offering_section_badge_criteria` WRITE;
/*!40000 ALTER TABLE `jos_courses_offering_section_badge_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_offering_section_badge_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_offering_section_badges`
--

DROP TABLE IF EXISTS `jos_courses_offering_section_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_offering_section_badges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `provider_name` varchar(255) NOT NULL DEFAULT 'passport',
  `provider_badge_id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `criteria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_offering_section_badges`
--

LOCK TABLES `jos_courses_offering_section_badges` WRITE;
/*!40000 ALTER TABLE `jos_courses_offering_section_badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_offering_section_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_offering_section_codes`
--

DROP TABLE IF EXISTS `jos_courses_offering_section_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_offering_section_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(10) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeemed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeemed_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_offering_section_codes`
--

LOCK TABLES `jos_courses_offering_section_codes` WRITE;
/*!40000 ALTER TABLE `jos_courses_offering_section_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_offering_section_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_offering_section_dates`
--

DROP TABLE IF EXISTS `jos_courses_offering_section_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_offering_section_dates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `scope` varchar(150) NOT NULL DEFAULT '',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_section_id` (`section_id`),
  KEY `idx_scope_id` (`scope_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_offering_section_dates`
--

LOCK TABLES `jos_courses_offering_section_dates` WRITE;
/*!40000 ALTER TABLE `jos_courses_offering_section_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_offering_section_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_offering_sections`
--

DROP TABLE IF EXISTS `jos_courses_offering_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_offering_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offering_id` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(2) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `enrollment` tinyint(2) NOT NULL DEFAULT '0',
  `grade_policy_id` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offering_id` (`offering_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_offering_sections`
--

LOCK TABLES `jos_courses_offering_sections` WRITE;
/*!40000 ALTER TABLE `jos_courses_offering_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_offering_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_offerings`
--

DROP TABLE IF EXISTS `jos_courses_offerings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_offerings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `term` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_offerings`
--

LOCK TABLES `jos_courses_offerings` WRITE;
/*!40000 ALTER TABLE `jos_courses_offerings` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_offerings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_page_hits`
--

DROP TABLE IF EXISTS `jos_courses_page_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_page_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offering_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_offering_id` (`offering_id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_page_hits`
--

LOCK TABLES `jos_courses_page_hits` WRITE;
/*!40000 ALTER TABLE `jos_courses_page_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_page_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_pages`
--

DROP TABLE IF EXISTS `jos_courses_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `offering_id` varchar(100) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `privacy` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_offering_id` (`offering_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_pages`
--

LOCK TABLES `jos_courses_pages` WRITE;
/*!40000 ALTER TABLE `jos_courses_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_prerequisites`
--

DROP TABLE IF EXISTS `jos_courses_prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_prerequisites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `item_scope` varchar(255) NOT NULL DEFAULT 'asset',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `requisite_scope` varchar(255) NOT NULL DEFAULT 'asset',
  `requisite_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_prerequisites`
--

LOCK TABLES `jos_courses_prerequisites` WRITE;
/*!40000 ALTER TABLE `jos_courses_prerequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_progress_factors`
--

DROP TABLE IF EXISTS `jos_courses_progress_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_progress_factors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_progress_factors`
--

LOCK TABLES `jos_courses_progress_factors` WRITE;
/*!40000 ALTER TABLE `jos_courses_progress_factors` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_progress_factors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_reviews`
--

DROP TABLE IF EXISTS `jos_courses_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `offering_id` int(11) NOT NULL DEFAULT '0',
  `rating` decimal(2,1) NOT NULL DEFAULT '0.0',
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(2) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `positive` int(11) NOT NULL DEFAULT '0',
  `negative` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_reviews`
--

LOCK TABLES `jos_courses_reviews` WRITE;
/*!40000 ALTER TABLE `jos_courses_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_roles`
--

DROP TABLE IF EXISTS `jos_courses_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offering_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `permissions` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offering_id` (`offering_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_roles`
--

LOCK TABLES `jos_courses_roles` WRITE;
/*!40000 ALTER TABLE `jos_courses_roles` DISABLE KEYS */;
INSERT INTO `jos_courses_roles` VALUES (1,0,'instructor','Instructor',''),(2,0,'manager','Manager',''),(3,0,'student','Student','');
/*!40000 ALTER TABLE `jos_courses_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_courses_units`
--

DROP TABLE IF EXISTS `jos_courses_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_courses_units` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offering_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(250) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_offering_id` (`offering_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_courses_units`
--

LOCK TABLES `jos_courses_units` WRITE;
/*!40000 ALTER TABLE `jos_courses_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_courses_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_cron_jobs`
--

DROP TABLE IF EXISTS `jos_cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_cron_jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `plugin` varchar(255) NOT NULL DEFAULT '',
  `event` varchar(255) NOT NULL DEFAULT '',
  `last_run` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_run` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recurrence` varchar(50) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(3) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_cron_jobs`
--

LOCK TABLES `jos_cron_jobs` WRITE;
/*!40000 ALTER TABLE `jos_cron_jobs` DISABLE KEYS */;
INSERT INTO `jos_cron_jobs` VALUES (1,'Process Newsletter Mailings',0,'newsletter','processMailings','0000-00-00 00:00:00','0000-00-00 00:00:00','*/5 * * * *','2013-06-25 08:23:04',1001,'2013-07-16 17:15:01',0,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Process Newsletter Opens & Click IP Addresses',0,'newsletter','processIps','0000-00-00 00:00:00','0000-00-00 00:00:00','*/5 * * * *','2013-06-25 08:23:04',1001,'2013-07-16 17:15:01',0,0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Group Announcements',1,'groups','sendGroupAnnouncements','2016-04-09 15:15:01','2016-04-09 15:20:00','*/5 * * * *','0000-00-00 00:00:00',0,'2016-04-09 19:15:01',0,0,0,'{}','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `jos_cron_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_developer_access_tokens`
--

DROP TABLE IF EXISTS `jos_developer_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_developer_access_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `access_token` varchar(40) NOT NULL,
  `uidNumber` int(11) DEFAULT NULL,
  `expires` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_developer_access_tokens`
--

LOCK TABLES `jos_developer_access_tokens` WRITE;
/*!40000 ALTER TABLE `jos_developer_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_developer_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_developer_application_team_members`
--

DROP TABLE IF EXISTS `jos_developer_application_team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_developer_application_team_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidNumber` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_developer_application_team_members`
--

LOCK TABLES `jos_developer_application_team_members` WRITE;
/*!40000 ALTER TABLE `jos_developer_application_team_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_developer_application_team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_developer_applications`
--

DROP TABLE IF EXISTS `jos_developer_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_developer_applications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `client_id` varchar(80) DEFAULT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `hub_account` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_developer_applications`
--

LOCK TABLES `jos_developer_applications` WRITE;
/*!40000 ALTER TABLE `jos_developer_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_developer_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_developer_authorization_codes`
--

DROP TABLE IF EXISTS `jos_developer_authorization_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_developer_authorization_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `authorization_code` varchar(40) NOT NULL,
  `uidNumber` int(11) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` datetime NOT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_developer_authorization_codes`
--

LOCK TABLES `jos_developer_authorization_codes` WRITE;
/*!40000 ALTER TABLE `jos_developer_authorization_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_developer_authorization_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_developer_rate_limit`
--

DROP TABLE IF EXISTS `jos_developer_rate_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_developer_rate_limit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `uidNumber` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `limit_short` int(11) DEFAULT NULL,
  `limit_long` int(11) DEFAULT NULL,
  `count_short` int(11) DEFAULT NULL,
  `count_long` int(11) DEFAULT NULL,
  `expires_short` datetime DEFAULT NULL,
  `expires_long` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_developer_rate_limit`
--

LOCK TABLES `jos_developer_rate_limit` WRITE;
/*!40000 ALTER TABLE `jos_developer_rate_limit` DISABLE KEYS */;
INSERT INTO `jos_developer_rate_limit` VALUES (1,0,0,'192.168.33.1',120,10000,23,89,'2017-06-29 02:22:50','2017-06-30 02:09:13','2017-06-29 02:09:13'),(2,0,0,'192.168.33.1',120,10000,0,0,'2017-06-29 02:10:13','2017-06-30 02:09:13','2017-06-29 02:09:13');
/*!40000 ALTER TABLE `jos_developer_rate_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_developer_refresh_tokens`
--

DROP TABLE IF EXISTS `jos_developer_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_developer_refresh_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `refresh_token` varchar(40) NOT NULL,
  `uidNumber` int(11) DEFAULT NULL,
  `expires` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_developer_refresh_tokens`
--

LOCK TABLES `jos_developer_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `jos_developer_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_developer_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_document_resource_rel`
--

DROP TABLE IF EXISTS `jos_document_resource_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_document_resource_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_id` (`id`),
  UNIQUE KEY `uidx_document_id_resource_id` (`document_id`,`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_document_resource_rel`
--

LOCK TABLES `jos_document_resource_rel` WRITE;
/*!40000 ALTER TABLE `jos_document_resource_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_document_resource_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_document_text_data`
--

DROP TABLE IF EXISTS `jos_document_text_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_document_text_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text,
  `hash` char(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_hash` (`hash`),
  FULLTEXT KEY `ftidx_body` (`body`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_document_text_data`
--

LOCK TABLES `jos_document_text_data` WRITE;
/*!40000 ALTER TABLE `jos_document_text_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_document_text_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_doi_mapping`
--

DROP TABLE IF EXISTS `jos_doi_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_doi_mapping` (
  `local_revision` int(11) NOT NULL,
  `doi_label` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `alias` varchar(30) DEFAULT NULL,
  `versionid` int(11) DEFAULT '0',
  `doi` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_doi_mapping`
--

LOCK TABLES `jos_doi_mapping` WRITE;
/*!40000 ALTER TABLE `jos_doi_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_doi_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_email_bounces`
--

DROP TABLE IF EXISTS `jos_email_bounces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_email_bounces` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) DEFAULT NULL,
  `component` varchar(100) DEFAULT NULL,
  `object` varchar(100) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `reason` text,
  `date` datetime DEFAULT NULL,
  `resolved` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_email_bounces`
--

LOCK TABLES `jos_email_bounces` WRITE;
/*!40000 ALTER TABLE `jos_email_bounces` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_email_bounces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_event_registration`
--

DROP TABLE IF EXISTS `jos_event_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_event_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `submitted` datetime DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_event_registration`
--

LOCK TABLES `jos_event_registration` WRITE;
/*!40000 ALTER TABLE `jos_event_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_event_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_events`
--

DROP TABLE IF EXISTS `jos_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_events` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '1',
  `calendar_id` int(11) DEFAULT NULL,
  `ical_uid` varchar(255) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `adresse_info` varchar(120) NOT NULL DEFAULT '',
  `contact_info` varchar(120) NOT NULL DEFAULT '',
  `extra_info` varchar(240) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allday` int(11) DEFAULT '0',
  `time_zone` varchar(5) DEFAULT NULL,
  `repeating_rule` varchar(150) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `registerby` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text,
  `restricted` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ftidx_title` (`title`),
  FULLTEXT KEY `ftidx_content` (`content`),
  FULLTEXT KEY `ftidx_title_content` (`title`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_events`
--

LOCK TABLES `jos_events` WRITE;
/*!40000 ALTER TABLE `jos_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_events_calendars`
--

DROP TABLE IF EXISTS `jos_events_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_events_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(100) DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `published` int(11) DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `readonly` tinyint(4) DEFAULT '0',
  `last_fetched` datetime DEFAULT NULL,
  `last_fetched_attempt` datetime DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_events_calendars`
--

LOCK TABLES `jos_events_calendars` WRITE;
/*!40000 ALTER TABLE `jos_events_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_events_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_events_categories`
--

DROP TABLE IF EXISTS `jos_events_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_events_categories` (
  `id` int(12) NOT NULL DEFAULT '0',
  `color` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_events_categories`
--

LOCK TABLES `jos_events_categories` WRITE;
/*!40000 ALTER TABLE `jos_events_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_events_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_events_config`
--

DROP TABLE IF EXISTS `jos_events_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_events_config` (
  `param` varchar(100) DEFAULT NULL,
  `value` tinytext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_events_config`
--

LOCK TABLES `jos_events_config` WRITE;
/*!40000 ALTER TABLE `jos_events_config` DISABLE KEYS */;
INSERT INTO `jos_events_config` VALUES ('adminmail',''),('adminlevel','0'),('starday','0'),('mailview','NO'),('byview','NO'),('hitsview','NO'),('repeatview','NO'),('dateformat','0'),('calUseStdTime','NO'),('navbarcolor',''),('startview','month'),('calEventListRowsPpg','30'),('calSimpleEventForm','YES'),('defColor',''),('calForceCatColorEventForm','NO'),('fields','');
/*!40000 ALTER TABLE `jos_events_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_events_pages`
--

DROP TABLE IF EXISTS `jos_events_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_events_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT '0',
  `alias` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pagetext` text,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT '0',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT '0',
  `ordering` int(2) DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_events_pages`
--

LOCK TABLES `jos_events_pages` WRITE;
/*!40000 ALTER TABLE `jos_events_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_events_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_events_respondent_race_rel`
--

DROP TABLE IF EXISTS `jos_events_respondent_race_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_events_respondent_race_rel` (
  `respondent_id` int(11) DEFAULT NULL,
  `race` varchar(255) DEFAULT NULL,
  `tribal_affiliation` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_events_respondent_race_rel`
--

LOCK TABLES `jos_events_respondent_race_rel` WRITE;
/*!40000 ALTER TABLE `jos_events_respondent_race_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_events_respondent_race_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_events_respondents`
--

DROP TABLE IF EXISTS `jos_events_respondents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_events_respondents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT '0',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `affiliation` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `position_description` varchar(50) DEFAULT NULL,
  `highest_degree` varchar(10) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `disability_needs` tinyint(4) DEFAULT NULL,
  `dietary_needs` varchar(500) DEFAULT NULL,
  `attending_dinner` tinyint(4) DEFAULT NULL,
  `abstract` text,
  `comment` text,
  `arrival` varchar(50) DEFAULT NULL,
  `departure` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_events_respondents`
--

LOCK TABLES `jos_events_respondents` WRITE;
/*!40000 ALTER TABLE `jos_events_respondents` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_events_respondents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_extensions`
--

DROP TABLE IF EXISTS `jos_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10068 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_extensions`
--

LOCK TABLES `jos_extensions` WRITE;
/*!40000 ALTER TABLE `jos_extensions` DISABLE KEYS */;
INSERT INTO `jos_extensions` VALUES (1,'com_mailto','component','com_mailto','',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(5,'com_cache','component','com_cache','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(6,'com_categories','component','com_categories','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(7,'com_checkin','component','com_checkin','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(9,'com_cpanel','component','com_cpanel','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(10,'com_installer','component','com_installer','',1,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(11,'com_languages','component','com_languages','',1,1,1,1,'','{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}','','',0,'0000-00-00 00:00:00',0,0),(12,'com_login','component','com_login','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(13,'com_media','component','com_media','',1,1,0,1,'','{\"upload_extensions\":\"bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"site/media\",\"image_path\":\"site/media/images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp, gif, jpg, png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image/jpeg, image/gif, image/png, image/bmp, application/x-shockwave-flash, application/msword, application/excel, application/pdf, application/powerpoint, text/plain, application/x-zip\",\"upload_mime_illegal\":\"text/html\",\"enable_flash\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(14,'com_menus','component','com_menus','',1,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(15,'com_messages','component','com_messages','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(16,'com_modules','component','com_modules','',1,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(17,'com_newsfeeds','component','com_newsfeeds','',1,1,1,1,'','{\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"1\",\"show_link\":\"1\",\"show_cat_description\":\"1\",\"show_cat_items\":\"1\",\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(18,'com_plugins','component','com_plugins','',1,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(20,'com_templates','component','com_templates','',1,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(22,'com_content','component','com_content','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.7.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_noauth\":\"0\",\"show_title\":\"1\",\"link_titles\":\"0\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"0\",\"show_readmore\":\"1\",\"show_vote\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"0\",\"feed_summary\":\"0\",\"filter_tags\":\"\",\"filter_attritbutes\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10003,'plg_cron_resources','plugin','resources','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(23,'com_config','component','com_config','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.7.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"12\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(24,'com_redirect','component','com_redirect','',1,1,0,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(25,'com_users','component','com_users','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\"}','{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"useractivation\":\"1\",\"frontend_userparams\":\"1\",\"allow_duplicate_emails\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10004,'plg_tags_collections','plugin','collections','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',13,0),(10005,'plg_system_authfactors','plugin','authfactors','system',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(10006,'plg_authfactors_certificate','plugin','certificate','authfactors',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(10012,'com_developer','component','com_developer','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(10013,'plg_antispam_babajispam','plugin','babajispam','antispam',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',16,0),(100,'PHPMailer','library','phpmailer','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(101,'SimplePie','library','simplepie','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(102,'phputf8','library','phputf8','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(103,'Joomla! Platform','library','joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"11.4\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(205,'mod_custom','module','mod_custom','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(206,'mod_feed','module','mod_feed','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(207,'mod_footer','module','mod_footer','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(208,'mod_login','module','mod_login','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(209,'mod_menu','module','mod_menu','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(210,'mod_articles_news','module','mod_articles_news','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(211,'mod_random_image','module','mod_random_image','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(212,'mod_related_items','module','mod_related_items','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(213,'mod_search','module','mod_search','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(214,'mod_stats','module','mod_stats','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(216,'mod_users_latest','module','mod_users_latest','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(218,'mod_whosonline','module','mod_whosonline','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(219,'mod_wrapper','module','mod_wrapper','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(220,'mod_articles_category','module','mod_articles_category','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(222,'mod_languages','module','mod_languages','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(300,'mod_custom','module','mod_custom','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(301,'mod_feed','module','mod_feed','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(302,'mod_latest','module','mod_latest','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(304,'mod_login','module','mod_adminlogin','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(305,'mod_menu','module','mod_adminmenu','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(307,'mod_popular','module','mod_popular','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(310,'mod_submenu','module','mod_submenu','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(311,'mod_title','module','mod_title','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.7.1\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(314,'mod_version','module','mod_version','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,1,'','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(405,'plg_content_geshi','plugin','geshi','content',0,0,1,1,'','{}','','',0,'0000-00-00 00:00:00',2,0),(406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.7.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\"}','{\"style\":\"xhtml\"}','','',0,'2011-09-18 15:22:50',0,0),(407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,1,'','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,1,'','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(409,'plg_content_vote','plugin','vote','content',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',6,0),(410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'','{\"linenumbers\":\"0\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0),(411,'plg_editors_none','plugin','none','editors',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',2,0),(412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2011\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\\/\",\"version\":\"3.4.7\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\",\"skin\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"lang_code\":\"en\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"toolbar\":\"top\",\"toolbar_align\":\"left\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"true\",\"resize_horizontal\":\"false\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"format_date\":\"%Y-%m-%d\",\"inserttime\":\"1\",\"format_time\":\"%H:%M:%S\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"media\":\"1\",\"hr\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"style\":\"1\",\"layer\":\"1\",\"xhtmlxtras\":\"1\",\"visualchars\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advimage\":\"1\",\"advlink\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',0,'0000-00-00 00:00:00',3,0),(413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',1,0),(414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',2,0),(415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',3,0),(416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',4,0),(422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'','{}','','',0,'0000-00-00 00:00:00',11,0),(423,'plg_system_p3p','plugin','p3p','system',0,1,1,1,'','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',12,0),(424,'plg_system_cache','plugin','cache','system',0,0,1,1,'','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',20,0),(425,'plg_system_debug','plugin','debug','system',0,0,1,1,'','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',14,0),(426,'plg_system_log','plugin','log','system',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',15,0),(427,'plg_system_redirect','plugin','redirect','system',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',16,0),(428,'plg_system_remember','plugin','remember','system',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',17,0),(429,'plg_system_sef','plugin','sef','system',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',19,0),(430,'plg_system_logout','plugin','logout','system',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',13,0),(432,'plg_user_joomla','plugin','joomla','user',0,1,1,1,'','{\"autoregister\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0),(433,'plg_user_profile','plugin','profile','user',0,0,1,1,'','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',1,0),(435,'plg_content_categories','plugin','categories','content',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(436,'plg_system_languagecode','plugin','languagecode','system',0,0,1,1,'','{}','','',0,'0000-00-00 00:00:00',22,0),(437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',0,0),(10042,'plg_filesystem_dropbox','plugin','dropbox','filesystem',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',2,0),(440,'plg_system_highlight','plugin','highlight','system',0,1,1,1,'','{}','','',0,'0000-00-00 00:00:00',18,0),(600,'English (United Kingdom)','language','en-GB','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(601,'English (United Kingdom)','language','en-GB','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(700,'Joomla! CMS','file','joomla','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(800,'joomla','package','pkg_joomla','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1000,'com_answers','component','com_answers','',1,1,1,1,'','{\"infolink\":\"\\/kb\\/points\",\"notify_users\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(1001,'com_billboards','component','com_billboards','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1002,'com_blog','component','com_blog','',1,1,1,1,'','{\"title\":\"\",\"uploadpath\":\"\\/site\\/blog\",\"show_authors\":\"1\",\"allow_comments\":\"1\",\"feeds_enabled\":\"1\",\"feed_entries\":\"partial\",\"show_date\":\"3\"}','','',0,'0000-00-00 00:00:00',0,0),(1003,'com_citations','component','com_citations','',1,1,1,1,'','{\"citation_label\":\"number\",\"citation_rollover\":\"no\",\"citation_sponsors\":\"yes\",\"citation_import\":\"2\",\"citation_bulk_import\":\"2\",\"citation_download\":\"1\",\"citation_batch_download\":\"1\",\"citation_download_exclude\":\"\",\"citation_coins\":\"1\",\"citation_openurl\":\"1\",\"citation_url\":\"url\",\"citation_custom_url\":\"\",\"citation_cited\":\"0\",\"citation_cited_single\":\"\",\"citation_cited_multiple\":\"\",\"citation_show_tags\":\"no\",\"citation_allow_tags\":\"no\",\"citation_show_badges\":\"no\",\"citation_allow_badges\":\"no\",\"citation_format\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(1004,'com_courses','component','com_courses','',1,1,1,1,'','{\"uploadpath\":\"\\/site\\/courses\",\"tmpl\":\"\",\"default_asset_groups\":\"Lectures, Activities, Exam\",\"auto_approve\":\"1\",\"email_comment_processing\":\"0\",\"email_member_coursesidcussionemail_autosignup\":\"0\",\"intro_mycourses\":\"1\",\"intro_interestingcourses\":\"1\",\"intro_popularcourses\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(1005,'com_cron','component','com_cron','',1,1,1,1,'',' ','','',0,'0000-00-00 00:00:00',0,0),(1006,'com_events','component','com_events','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1008,'com_feedback','component','com_feedback','',1,1,1,1,'','{\"defaultpic\":\"\\/components\\/com_feedback\\/assets\\/img\\/contributor.gif\",\"uploadpath\":\"\\/site\\/quotes\",\"maxAllowed\":\"40000000\",\"file_ext\":\"jpg,jpeg,jpe,bmp,tif,tiff,png,gif\",\"blacklist\":\"\",\"badwords\":\"viagra, pharmacy, xanax, phentermine, dating, ringtones, tramadol, hydrocodone, levitra, ambien, vicodin, fioricet, diazepam, cash advance, free online, online gambling, online prescriptions, debt consolidation, baccarat, loan, slots, credit, mortgage, casino, slot, texas holdem, teen nude, orgasm, gay, fuck, crap, shit, asshole, cunt, fucker, fuckers, motherfucker, fucking, milf, cocksucker, porno, videosex, sperm, hentai, internet gambling, kasino, kasinos, poker, lottery, texas hold em, texas holdem, fisting\"}','','',0,'0000-00-00 00:00:00',0,0),(1009,'com_forum','component','com_forum','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1010,'com_groups','component','com_groups','',1,1,1,1,'','{\"ldapGroupMirror\":\"1\",\"ldapGroupLegacy\":\"1\",\"uploadpath\":\"\\/site\\/groups\",\"iconpath\":\"\\/components\\/com_groups\\/assets\\/img\\/icons\",\"join_policy\":\"0\",\"privacy\":\"0\",\"auto_approve\":\"1\",\"display_system_users\":\"no\",\"email_comment_processing\":\"1\",\"email_member_groupsidcussionemail_autosignup\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(1011,'com_help','component','com_help','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1012,'com_jobs','component','com_jobs','',1,1,1,1,'','{\"component_enabled\":\"1\",\"industry\":\"\",\"admingroup\":\"\",\"specialgroup\":\"jobsadmin\",\"autoapprove\":\"1\",\"defaultsort\":\"category\",\"jobslimit\":\"25\",\"maxads\":\"3\",\"allowsubscriptions\":\"1\",\"usonly\":\"0\",\"usegoogle\":\"0\",\"banking\":\"1\",\"promoline\":\"For a limited time: FREE Employer Services Basic subscription\",\"infolink\":\"kb\\/jobs\",\"premium_infolink\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(1013,'com_kb','component','com_kb','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1014,'com_members','component','com_members','',1,1,1,1,'','{\"privacy\":\"1\",\"bankAccounts\":\"1\",\"defaultpic\":\"\\/components\\/com_members\\/assets\\/img\\/profile.gif\",\"webpath\":\"\\/site\\/members\",\"homedir\":\"\\/home\\/example\",\"maxAllowed\":\"40000000\",\"file_ext\":\"jpg,jpeg,jpe,bmp,tif,tiff,png,gif\",\"user_messaging\":\"1\",\"employeraccess\":\"0\",\"gidNumber\":\"3000\",\"gid\":\"public\",\"shadowMax\":\"120\",\"shadowMin\":\"0\",\"shadowWarning\":\"7\",\"LoginReturn\":\"\\/members\\/myaccount\",\"ConfirmationReturn\":\"\\/members\\/myaccount\",\"passwordMeter\":\"0\",\"registrationUsername\":\"RRUU\",\"registrationPassword\":\"RRUU\",\"registrationConfirmPassword\":\"RRUU\",\"registrationFullname\":\"RRUU\",\"registrationEmail\":\"RRUU\",\"registrationConfirmEmail\":\"RRUU\",\"registrationURL\":\"HOHO\",\"registrationPhone\":\"HOHO\",\"registrationEmployment\":\"HOHO\",\"registrationOrganization\":\"HOHO\",\"registrationCitizenship\":\"HHHR\",\"registrationResidency\":\"HHHR\",\"registrationSex\":\"HHHH\",\"registrationDisability\":\"HHHH\",\"registrationHispanic\":\"HHHH\",\"registrationRace\":\"HHHR\",\"registrationInterests\":\"HOHO\",\"registrationReason\":\"HOHO\",\"registrationOptIn\":\"HOHO\",\"registrationCAPTCHA\":\"RHHH\",\"registrationTOU\":\"RHRH\",\"registrationORCID\":\"HHHH\",\"allowUserRegistration\":1,\"new_usertype\":2,\"guest_usergroup\":1,\"sendpassword\":1,\"useractivation\":2,\"simple_registration\":0,\"allow_duplicate_emails\":0,\"mail_to_admin\":1,\"captcha\":\"\",\"frontend_userparams\":1,\"site_language\":0,\"change_login_name\":0,\"reset_count\":10,\"reset_time\":1,\"login_attempts_limit\":10,\"login_attempts_timeframe\":1}','','',0,'0000-00-00 00:00:00',0,0),(1015,'com_newsletter','component','com_newsletter','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1016,'com_oaipmh','component','com_oaipmh','',1,1,1,1,'{}','{}','','',0,'0000-00-00 00:00:00',0,0),(1017,'com_poll','component','com_poll','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1018,'com_dataviewer','component','com_dataviewer','',1,1,1,1,'{\"legacy\":true,\"name\":\"Dataviewer\",\"type\":\"component\",\"creationDate\":\"2013-08-07\",\"author\":\"Sudheera R. Fernando\",\"copyright\":\"Copyright 2010-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"srf@xconsole.org\",\"authorUrl\":\"\",\"version\":\"2.0.2\",\"description\":\"Dataviewer for HUB Databases\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1019,'com_projects','component','com_projects','',1,1,1,1,'{}','{\"admingroup\": \"projectsadmin\", \"min_name_length\": \"6\", \"max_name_length\": \"25\", \"HIPAAlink\": \"/legal/privacy\", \"approachingQuota\": \"90\", \"premiumQuota\": \"1\", \"edit_settings\": \"1\", \"defaultQuota\": \"1\", \"imagepath\": \"/site/projects\", \"privacy\": \"1\", \"dbcheck\": \"1\", \"grantinfo\": \"0\", \"sdata_group\": \"hipaa_reviewers\", \"creatorgroup\": \"\", \"maxUpload\": \"104857600\", \"img_maxAllowed\": \"5242880\", \"sidebox_limit\": \"3\", \"pubQuota\": \"1\", \"webpath\": \"/srv/example/projects\", \"confirm_step\": \"0\", \"use_alias\": \"1\", \"premiumPubQuota\": \"1\", \"approve_restricted\": \"0\", \"restricted_upfront\": \"0\", \"logging\": \"0\", \"gitclone\": \"/site/projects/clone/.git\", \"restricted_data\": \"0\", \"documentation\": \"/projects/features\", \"img_file_ext\": \"jpg,jpeg,jpe,bmp,tif,tiff,png,gif\", \"FERPAlink\": \"/legal/privacy\", \"offroot\": \"1\", \"defaultpic\": \"/components/com_projects/assets/img/project.png\", \"limit\": \"25\", \"ginfo_group\": \"sps_reviewers\", \"reserved_names\": \"clone, temp, test\", \"messaging\": \"1\", \"gitpath\": \"/usr/bin/git\", \"privacylink\": \"/legal/privacy\", \"group_prefix\": \"pr-\", \"component_on\": \"1\"}','','',0,'0000-00-00 00:00:00',0,0),(1020,'com_publications','component','com_publications','',1,1,1,1,'{}','enabled=1\nautoapprove=1\nautoapproved_users=\nemail=0\ndefault_category=dataset\ndefaultpic=/components/com_publications/assets/img/resource_thumb.gif\ntoolpic=/components/com_publications/assets/img/tool_thumb.gif\nvideo_thumb=/components/com_publications/images/video_thumb.gif\ngallery_thumb=/components/com_publications/images/gallery_thumb.gif\nwebpath=/site/publications\naboutdoi=\ndoi_shoulder=\ndoi_prefix=\ndoi_service=\ndoi_userpw=\ndoi_xmlschema=\ndoi_publisher=\ndoi_resolve=http://dx.doi.org/\ndoi_verify=http://n2t.net/ezid/id/\nsupportedtag=\nsupportedlink=\ngoogle_id=\nshow_authors=1\nshow_ranking=1\nshow_rating=1\nshow_date=3\nshow_citation=1\npanels=content, description, authors, audience, gallery, tags, access, license, notes\nsuggest_licence=0\nshow_tags=1\nshow_metadata=1\nshow_notes=1\nshow_license=1\nshow_access=0\nshow_gallery=1\nshow_audience=0\naudiencelink=\ndocumentation=/kb/publications\ndeposit_terms=/legal/termsofdeposit\ndbcheck=0\nrepository=0\naip_path=/srv/AIP','','',0,'0000-00-00 00:00:00',0,0),(1022,'com_resources','component','com_resources','',1,1,1,1,'','{\"autoapprove\":\"0\",\"autoapproved_users\":\"\",\"cc_license\":\"1\",\"email_when_approved\":\"0\",\"defaultpic\":\"\\/components\\/com_resources\\/images\\/resource_thumb.gif\",\"tagstool\":\"screenshots,poweredby,bio,credits,citations,sponsoredby,references,publications\",\"tagsothr\":\"bio,credits,citations,sponsoredby,references,publications\",\"accesses\":\"Public,Registered,Special,Protected,Private\",\"webpath\":\"\\/site\\/resources\",\"toolpath\":\"\\/site\\/resources\\/tools\",\"uploadpath\":\"\\/site\\/resources\",\"maxAllowed\":\"40000000\",\"file_ext\":\"jpg,jpeg,jpe,bmp,tif,tiff,png,gif,pdf,zip,mpg,mpeg,avi,mov,wmv,asf,asx,ra,rm,txt,rtf,doc,xsl,html,js,wav,mp3,eps,ppt,pps,swf,tar,tex,gz\",\"doi\":\"\",\"aboutdoi\":\"\",\"supportedtag\":\"\",\"supportedlink\":\"\",\"browsetags\":\"on\",\"google_id\":\"\",\"show_authors\":\"1\",\"show_assocs\":\"1\",\"show_ranking\":\"0\",\"show_rating\":\"1\",\"show_date\":\"3\",\"show_metadata\":\"1\",\"show_citation\":\"1\",\"show_audience\":\"0\",\"audiencelink\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(1023,'com_services','component','com_services','',1,1,1,1,'','{\"autoapprove\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(1024,'com_store','component','com_store','',1,1,1,1,'','{\"store_enabled\":\"1\",\"webpath\":\"\\/site\\/store\",\"hubaddress_ln1\":\"\",\"hubaddress_ln2\":\"\",\"hubaddress_ln3\":\"\",\"hubaddress_ln4\":\"\",\"hubaddress_ln5\":\"\",\"hubemail\":\"\",\"hubphone\":\"\",\"headertext_ln1\":\"\",\"headertext_ln2\":\"\",\"footertext\":\"\",\"receipt_title\":\"Your Order at HUB Store\",\"receipt_note\":\"Thank You for contributing to our HUB!\"}','','',0,'0000-00-00 00:00:00',0,0),(1025,'com_support','component','com_support','',1,1,1,1,'','{\"feed_summary\":\"0\",\"severities\":\"critical,major,normal,minor,trivial\",\"webpath\":\"\\/site\\/tickets\",\"maxAllowed\":\"40000000\",\"file_ext\":\"jpg,jpeg,jpe,bmp,tif,tiff,png,gif,pdf,zip,mpg,mpeg,avi,mov,wmv,asf,asx,ra,rm,txt,rtf,doc,xsl,html,js,wav,mp3,eps,ppt,pps,swf,tar,tex,gz,mp4\",\"group\":\"\",\"emails\":\"{config.mailfrom}\",\"0\":\"\",\"blacklist\":\"\",\"badwords\":\"viagra, pharmacy, xanax, phentermine, dating, ringtones, tramadol, hydrocodone, levitra, ambien, vicodin, fioricet, diazepam, cash advance, free online, online gambling, online prescriptions, debt consolidation, baccarat, loan, slots, credit, mortgage, casino, slot, texas holdem, teen nude, orgasm, gay, fuck, crap, shit, asshole, cunt, fucker, fuckers, motherfucker, fucking, milf, cocksucker, porno, videosex, sperm, hentai, internet gambling, kasino, kasinos, poker, lottery, texas hold em, texas holdem, fisting\",\"email_processing\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(1026,'com_system','component','com_system','',1,1,1,1,'','{\"geodb_password\":\"\",\"ldap_basedn\":\"dc=com\",\"geodb_database\":\"\",\"ldap_managerdn\":\"cn=admin,dc=com\",\"ldap_searchdn\":\"cn=search,dc=com\",\"geodb_driver\":\"pdo\",\"ldap_primary\":\"ldap:\\/\\/127.0.0.1\",\"ldap_managerpw\":\"UkPERc4BgQ\",\"geodb_prefix\":\"\",\"geodb_port\":\"\",\"ldap_searchpw\":\"1s8EuACQXU\",\"ldap_secondary\":\"\",\"ldap_tls\":\"0\",\"geodb_host\":\"\",\"geodb_user\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(1027,'com_tags','component','com_tags','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1028,'com_tools','component','com_tools','',1,1,1,1,'','{\"admingroup\": \"apps\", \"doi_newservice\": \"\", \"doi_resolve\": \"http://dx.doi.org/\", \"learn_url\": \"http://rappture.org/wiki/FAQ_UpDownloadSrc\", \"doi_publisher\": \"\", \"storagehost\": \"tcp://localhost:300\", \"launch_ipad\": \"0\", \"params_whitelist\": \"\", \"screenshot_edit\": \"0\", \"contribtool_redirect\": \"/home\", \"mwDBPassword\": \"\", \"default_vnc\": \"780x600\", \"exec_pu\": \"1\", \"mwDBDriver\": \"\", \"project_path\": \"/tools/\", \"doi_verify\": \"http://n2t.net/ezid/id/\", \"new_doi\": \"0\", \"mwDBUsername\": \"\", \"warn_multiples\": \"0\", \"shareable\": \"1\", \"mwDBPort\": \"\", \"show_storage\": \"1\", \"demo_url\": \"\", \"stopRedirect\": \"index.php?option=com_members&task=myaccount\", \"contribtool_on\": \"1\", \"dev_suffix\": \"_dev\", \"doi_newprefix\": \"\", \"downloadable_on\": \"0\", \"developer_site\": \"Forge\", \"rappture_url\": \"http://rappture.org\", \"mwDBPrefix\": \"\", \"mwDBDatabase\": \"\", \"invokescript_dir\": \"/apps\", \"doi_shoulder\": \"\", \"default_mw\": \"narwhal\", \"mw_on\": \"1\", \"mwDBHost\": \"\", \"mw_redirect\": \"/home\", \"sourcecodePath\": \"site/protected/source\", \"group_prefix\": \"app-\"}','','',0,'0000-00-00 00:00:00',0,0),(1030,'com_usage','component','com_usage','',1,1,1,1,'','{\"statsDBDriver\":\"mysql\",\"statsDBHost\":\"localhost\",\"statsDBPort\":\"\",\"statsDBUsername\":\"example\",\"statsDBPassword\":\"US9YJ66x3aR6J5\",\"statsDBDatabase\":\"example_metrics\",\"statsDBPrefix\":\"\",\"mapsApiKey\":\"\",\"stats_path\":\"\\/site\\/stats\",\"maps_path\":\"\\/site\\/stats\\/maps\",\"plots_path\":\"\\/site\\/stats\\/plots\",\"charts_path\":\"\\/site\\/stats\\/plots\"}','','',0,'0000-00-00 00:00:00',0,0),(1031,'com_whatsnew','component','com_whatsnew','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1032,'com_wiki','component','com_wiki','',1,1,1,1,'','{\"subpage_separator\":\"\\/\",\"homepage\":\"MainPage\",\"max_pagename_length\":\"100\",\"filepath\":\"\\/site\\/wiki\",\"mathpath\":\"\\/site\\/wiki\\/math\",\"tmppath\":\"\\/site\\/wiki\\/tmp\",\"maxAllowed\":\"40000000\",\"img_ext\":\"jpg,jpeg,jpe,bmp,tif,tiff,png,gif\",\"file_ext\":\"jpg,jpeg,jpe,bmp,tif,tiff,png,gif,pdf,zip,mpg,mpeg,avi,mov,wmv,asf,asx,ra,rm,txt,rtf,doc,xsl,html,js,wav,mp3,eps,ppt,pps,swf,tar,tex,gz\",\"cache\":\"0\",\"cache_time\":\"15\"}','','',0,'0000-00-00 00:00:00',0,0),(1033,'com_wishlist','component','com_wishlist','',1,1,1,1,'','{\"categories\":\"general, resource, group, user\",\"group\":\"hubdev\",\"banking\":\"1\",\"allow_advisory\":\"0\",\"votesplit\":\"0\",\"webpath\":\"\\/site\\/wishlist\",\"show_percentage_granted\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(1034,'com_search','component','com_search','',1,1,1,1,'','{\"engine\":\"basic\"}','','',0,'0000-00-00 00:00:00',0,0),(1035,'com_cart','component','com_cart','',1,0,1,1,'{\"legacy\":true,\"name\":\"Cart\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Configure cart\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1036,'com_storefront','component','com_storefront','',1,0,1,1,'','{\"downloadFolder\":\"\\/site\\/protected\\/storefront\\/software\",\"imagesFolder\":\"\\/site\\/storefront\\/products\",\"collectionsImagesFolder\":\"\\/site\\/storefront\\/collections\"}','','',0,'0000-00-00 00:00:00',0,0),(1037,'com_collections','component','com_collections','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1038,'com_feedaggregator','component','com_feedaggregator','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1039,'com_update','component','com_update','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1040,'com_time','component','com_time','',1,0,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1400,'Authentication - Facebook','plugin','facebook','authentication',0,0,1,1,'','{\"site_login\":\"1\",\"graph_version\":\"v2.9\"}','','',0,'0000-00-00 00:00:00',2,0),(1401,'Authentication - Google','plugin','google','authentication',0,0,1,1,'','{\"site_login\":\"1\"}','','',0,'0000-00-00 00:00:00',3,0),(1402,'Authentication - HUBzero','plugin','hubzero','authentication',0,1,1,1,'','{\"admin_login\":\"1\",\"site_login\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(1403,'Authentication - Linkedin','plugin','linkedin','authentication',0,0,1,1,'','{\"site_login\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(1404,'Authentication - PUCAS','plugin','pucas','authentication',0,0,1,1,'','{\"site_login\":\"1\"}','','',0,'0000-00-00 00:00:00',6,0),(1405,'Authentication - Twitter','plugin','twitter','authentication',0,0,1,1,'','{\"site_login\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(1406,'Citation - Bibtex','plugin','bibtex','citation',0,1,1,1,'','title_match_percent=90%\n\n','','',0,'0000-00-00 00:00:00',2,0),(1407,'Citation - Default','plugin','default','citation',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1408,'Citation - Endnote','plugin','endnote','citation',0,1,1,1,'','custom_tags=badges-%=\ntags-%<\ntitle_match_percent=85%\n\n','','',0,'0000-00-00 00:00:00',3,0),(1409,'Content - xHubTags','plugin','xhubtags','content',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1410,'Courses - Announcements','plugin','announcements','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1412,'Courses - Course Offerings','plugin','offerings','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1413,'Courses - Course Overview','plugin','overview','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1414,'Courses - Course Related','plugin','related','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',12,0),(1415,'Courses - Course Reviews','plugin','reviews','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(1416,'Courses - Dashboard','plugin','dashboard','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1417,'Courses - Disucssions','plugin','discussions','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1418,'Courses - Guide','plugin','guide','courses',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',15,0),(1419,'Courses - My Progress','plugin','progress','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1420,'Courses - Notes','plugin','notes','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',13,0),(1421,'Courses - Outline','plugin','outline','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1422,'Courses - Pages','plugin','pages','courses',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1423,'Courses - Store','plugin','store','courses',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',14,0),(1425,'Cron - Cache','plugin','cache','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1426,'Cron - Groups','plugin','groups','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1427,'Cron - Members','plugin','members','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1428,'Cron - Newsletter','plugin','newsletter','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1429,'Cron - Support','plugin','support','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1430,'Groups - Announcements','plugin','announcements','groups',0,1,1,1,'','plugin_access=members\ndisplay_tab=1','','',0,'0000-00-00 00:00:00',2,0),(1431,'Groups - Blog','plugin','blog','groups',0,1,1,1,'','uploadpath=/site/groups/{{gid}}/blog\nposting=0\nfeeds_enabled=0\nfeed_entries=partial','','',0,'0000-00-00 00:00:00',3,0),(1432,'Groups - Calendar','plugin','calendar','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1433,'Groups - Forum','plugin','forum','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1434,'Groups - Member Options','plugin','memberoptions','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1435,'Groups - Members','plugin','members','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1436,'Groups - Messages','plugin','messages','groups',0,1,1,1,'','{\"limit\":50,\"display_tab\":0}','','',0,'0000-00-00 00:00:00',9,0),(1437,'Groups - Projects','plugin','projects','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1438,'Groups - Resources','plugin','resources','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',11,0),(1439,'Groups - Usage','plugin','usage','groups',0,0,1,1,'','uploadpath=/site/groups/{{gid}}/blog\nposting=0\nfeeds_enabled=0\nfeed_entries=partial','','',0,'0000-00-00 00:00:00',12,0),(1440,'Groups - Wiki','plugin','wiki','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',13,0),(1441,'Groups - Wishlist','plugin','wishlist','groups',0,1,1,1,'','limit=50','','',0,'0000-00-00 00:00:00',14,0),(1442,'HUBzero - Autocompleter','plugin','autocompleter','hubzero',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1443,'HUBzero - Comments','plugin','comments','hubzero',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1444,'plg_wiki_parserdefault','plugin','parserdefault','wiki',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1445,'plg_wiki_editortoolbar','plugin','editortoolbar','wiki',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1446,'plg_wiki_editorwykiwyg','plugin','editorwykiwyg','wiki',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1447,'plg_captcha_image','plugin','image','captcha',0,1,1,1,'','bgColor=#ffffff\ntextColor=#2c8007\nimageFunction=Adv\n','','',0,'0000-00-00 00:00:00',4,0),(1448,'plg_captcha_math','plugin','math','captcha',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1449,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1450,'Members - Account','plugin','account','members',0,1,1,1,'','ssh_key_upload=0\n\n','','',0,'0000-00-00 00:00:00',3,0),(1451,'Members - Blog','plugin','blog','members',0,1,1,1,'','uploadpath=/site/members/{{uid}}/blog\nfeeds_enabled=0\nfeed_entries=partial','','',0,'0000-00-00 00:00:00',4,0),(1452,'Members - Contributions','plugin','contributions','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1453,'Members - Contributions - Resources','plugin','resources','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1454,'Members - Contributions - Topics','plugin','wiki','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1455,'Members - Courses','plugin','courses','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(1456,'Members - Dashboard','plugin','dashboard','members',0,1,1,1,'','{\"allow_customization\":\"1\",\"position\":\"memberDashboard\",\"defaults\":\"[{\\\"module\\\":44,\\\"col\\\":1,\\\"row\\\":1,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":35,\\\"col\\\":1,\\\"row\\\":3,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":38,\\\"col\\\":1,\\\"row\\\":5,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":39,\\\"col\\\":1,\\\"row\\\":7,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":33,\\\"col\\\":2,\\\"row\\\":1,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":42,\\\"col\\\":2,\\\"row\\\":3,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":34,\\\"col\\\":2,\\\"row\\\":5,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":41,\\\"col\\\":3,\\\"row\\\":1,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":36,\\\"col\\\":3,\\\"row\\\":3,\\\"size_x\\\":1,\\\"size_y\\\":2},{\\\"module\\\":37,\\\"col\\\":3,\\\"row\\\":5,\\\"size_x\\\":1,\\\"size_y\\\":2}]\"}','','',0,'0000-00-00 00:00:00',1,0),(1458,'Members - Groups','plugin','groups','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1460,'Members - Messages','plugin','messages','members',0,1,1,1,'','default_method=email\n\n','','',0,'0000-00-00 00:00:00',12,0),(1461,'Members - Points','plugin','points','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',13,0),(1462,'Members - Profile','plugin','profile','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1463,'Members - Projects','plugin','projects','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',14,0),(1464,'Members - Resume','plugin','resume','members',0,1,1,1,'','limit=50','','',0,'0000-00-00 00:00:00',15,0),(1465,'Members - Usage','plugin','usage','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',16,0),(1466,'Projects - Blog','plugin','feed','projects',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1467,'Projects - Files','plugin','files','projects',0,1,1,1,'','maxUpload=104857600\nmaxDownload=1048576\nreservedNames=google , dropbox, shared, temp\nconnectedProjects=\nenable_google=0\ngoogle_clientId=\ngoogle_clientSecret=\ngoogle_appKey=\ngoogle_folder=Google\nsync_lock=0\nauto_sync=1\nlatex=1\ntexpath=/usr/bin/\ngspath=/usr/bin/','','',0,'0000-00-00 00:00:00',5,0),(1468,'Projects - Notes','plugin','notes','projects',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1469,'Projects - Publications','plugin','publications','projects',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1470,'Projects - Team','plugin','team','projects',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1471,'Projects - Todo','plugin','todo','projects',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1472,'Resources - About','plugin','about','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1474,'Resources - Citations','plugin','citations','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1476,'Resources - Questions','plugin','questions','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',11,0),(1477,'Resources - Recommendations','plugin','recommendations','resources',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1478,'Resources - Related','plugin','related','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1479,'Resources - Reviews','plugin','reviews','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1480,'Resources - Share','plugin','share','resources',0,1,1,1,'','icons_limit=3\nshare_facebook=1\nshare_twitter=1\nshare_google=1\nshare_digg=1\nshare_technorati=1\nshare_delicious=1\nshare_reddit=0\nshare_email=0\nshare_print=0\n\n','','',0,'0000-00-00 00:00:00',8,0),(1481,'Resources - Sponsors','plugin','sponsors','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',12,0),(1482,'Resources - Supporting Documents','plugin','supportingdocs','resources',0,1,1,1,'','display_limit=50','','',0,'0000-00-00 00:00:00',13,0),(1483,'Resources - Usage','plugin','usage','resources',0,1,1,1,'','{\"period\":\"14\",\"chart_path\":\"/site/stats/chart_resources/\",\"map_path\":\"/site/stats/resource_maps/\"}','','',0,'0000-00-00 00:00:00',5,0),(1484,'Resources - Versions','plugin','versions','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1485,'Resources - Wishlist','plugin','wishlist','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',14,0),(1486,'Support - Answers','plugin','answers','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1487,'Support - Blog','plugin','blog','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1488,'Support - CAPTCHA','plugin','captcha','support',0,1,1,1,'','modCaptcha=text\ncomCaptcha=image\nbgColor=#2c8007\ntextColor=#ffffff\nimageFunction=Adv\n','','',0,'0000-00-00 00:00:00',7,0),(1489,'Support - Comments','plugin','comments','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1490,'Support - Knowledgebase Comments','plugin','kb','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1491,'Support - Resources','plugin','resources','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1492,'Support - Transfer','plugin','transfer','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1493,'Support - Wishlist','plugin','wishlist','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1494,'System - HUBzero','plugin','hubzero','system',0,1,1,1,'','search=search\n\n','','',0,'0000-00-00 00:00:00',21,0),(1495,'System - xFeed','plugin','xfeed','system',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',23,0),(10061,'plg_cron_storefront','plugin','storefront','cron',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',14,0),(10062,'plg_search_solr','plugin','solr','search',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',5,0),(1497,'System - JQuery','plugin','jquery','system',0,1,1,1,'','{\"jquery\":\"1\",\"jqueryVersion\":\"1.7.2\",\"jquerycdnpath\":\"\\/\\/ajax.googleapis.com\\/ajax\\/libs\\/jquery\\/1.7.2\\/jquery.min.js\",\"jqueryui\":\"1\",\"jqueryuiVersion\":\"1.8.6\",\"jqueryuicdnpath\":\"\\/\\/ajax.googleapis.com\\/ajax\\/libs\\/jqueryui\\/1.8.6\\/jquery-ui.min.js\",\"jqueryuicss\":\"0\",\"jqueryuicsspath\":\"\\/plugins\\/system\\/jquery\\/css\\/jquery-ui-1.8.6.custom.css\",\"jquerytools\":\"1\",\"jquerytoolsVersion\":\"1.2.5\",\"jquerytoolscdnpath\":\"http:\\/\\/cdn.jquerytools.org\\/1.2.5\\/all\\/jquery.tools.min.js\",\"jqueryfb\":\"1\",\"jqueryfbVersion\":\"2.0.4\",\"jqueryfbcdnpath\":\"\\/\\/fancyapps.com\\/fancybox\\/\",\"jqueryfbcss\":\"1\",\"jqueryfbcsspath\":\"\\/media\\/system\\/css\\/jquery.fancybox.css\",\"activateSite\":\"1\",\"noconflictSite\":\"0\",\"activateAdmin\":\"0\",\"noconflictAdmin\":\"0\"}','','',1000,'2013-09-01 14:26:58',1,0),(1498,'Tags - Answers','plugin','answers','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1499,'Tags - Blogs','plugin','blogs','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(1500,'Tags - Citations','plugin','citations','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1501,'Tags - Events','plugin','events','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1502,'Tags - Forum','plugin','forum','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1503,'Tags - Groups','plugin','groups','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1504,'Tags - Knowledgebase','plugin','kb','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',11,0),(1505,'Tags - Members','plugin','members','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1506,'Tags - Resources','plugin','resources','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1507,'Tags - Support','plugin','support','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1508,'Tags - Topics','plugin','wiki','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1509,'Usage - Domains','plugin','domains','usage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1510,'Usage - Domain Class','plugin','domainclass','usage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1511,'Usage - Maps','plugin','maps','usage',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1512,'Usage - Overview','plugin','overview','usage',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1513,'Usage - Region','plugin','region','usage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1514,'Usage - Partners','plugin','partners','usage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1515,'Usage - Tools','plugin','tools','usage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1516,'User - xHUB','plugin','xusers','user',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1517,'User - LDAP','plugin','ldap','user',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1518,'User - Constant Contact','plugin','constantcontact','user',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1519,'Whatsnew - Content','plugin','content','whatsnew',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1520,'Whatsnew - Events','plugin','events','whatsnew',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1521,'Whatsnew - Knowledge Base','plugin','kb','whatsnew',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1522,'Whatsnew - Resources','plugin','resources','whatsnew',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1523,'Whatsnew - Topics','plugin','wiki','whatsnew',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1524,'XMessage - RSS','plugin','rss','xmessage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1525,'XMessage - Internal','plugin','internal','xmessage',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1526,'XMessage - SMS TXT','plugin','smstxt','xmessage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1527,'XMessage - Instant Message','plugin','im','xmessage',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1528,'XMessage - Handler','plugin','handler','xmessage',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1529,'XMessage - Email','plugin','email','xmessage',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1530,'plg_search_blogs','plugin','blogs','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1531,'plg_search_citations','plugin','citations','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1532,'plg_search_content','plugin','content','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1533,'plg_search_weighttitle','plugin','weighttitle','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1534,'plg_search_events','plugin','events','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1535,'plg_search_forum','plugin','forum','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1536,'plg_search_groups','plugin','groups','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1537,'plg_search_kb','plugin','kb','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1538,'plg_search_members','plugin','members','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1539,'plg_search_questions and Answers','plugin','questions','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1540,'plg_search_resources','plugin','resources','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1541,'plg_search_sitemap','plugin','sitemap','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1542,'plg_search_sortcourses','plugin','sortcourses','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1543,'plg_search_sortevents','plugin','sortevents','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1544,'plg_search_suffixes','plugin','suffixes','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1545,'plg_search_wiki','plugin','wiki','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1546,'plg_search_weightcontributor','plugin','weightcontributor','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1547,'plg_search_weighttools','plugin','weighttools','search',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1548,'plg_search_wishlists','plugin','wishlists','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1554,'plg_support_forum','plugin','forum','support',0,1,1,1,'{\"legacy\":false,\"name\":\"Support - Forum Abuse reports\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Various functions for the Report Abuse Component\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10055,'plg_support_slack','plugin','slack','support',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',12,0),(1558,'plg_cron_users','plugin','users','cron',0,1,1,1,'{\"legacy\":false,\"name\":\"Cron - Users\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Cron events for users\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1559,'plg_groups_collections','plugin','collections','groups',0,1,1,1,'{\"legacy\":false,\"name\":\"Groups - Collections\",\"type\":\"plugin\",\"creationDate\":\"December 2012\",\"author\":\"Shawn Rice\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"zooley@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5\",\"description\":\"Display collections\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',5,0),(1560,'plg_members_collections','plugin','collections','members',0,1,1,1,'{\"legacy\":false,\"name\":\"Members - Collections\",\"type\":\"plugin\",\"creationDate\":\"December 2012\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"support@hubzero.org\",\"authorUrl\":\"\",\"version\":\"1.5\",\"description\":\"Display collections\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',5,0),(1561,'plg_projects_databases','plugin','databases','projects',0,1,1,1,'{\"legacy\":false,\"name\":\"Projects - Databases\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Sudheera R. Fernando\",\"copyright\":\"Copyright (C) 2013-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Databases for Projects environment\",\"group\":\"\"}','{\"db_password\": \"ry4SNH2bt336R9\", \"db_user\": \"datawriter\", \"db_ro_user\": \"dataviewer\", \"db_host\": \"localhost\", \"db_ro_password\": \"acuTTqX8Y954z2\"}','','',0,'0000-00-00 00:00:00',1,0),(1562,'plg_publications_citations','plugin','citations','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Citations\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays citations for a publication\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1564,'plg_publications_questions','plugin','questions','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Questions\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays questions related to a publication (by tag)\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1565,'plg_publications_recommendations','plugin','recommendations','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Recommendations\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays recommendations for a publication\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1566,'plg_publications_related','plugin','related','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Related\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays related publication\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1567,'plg_publications_reviews','plugin','reviews','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Reviews\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays reviews for a publication\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1568,'plg_publications_share','plugin','share','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Share\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Display options to post publication link on Facebbok, Twitter etc.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1569,'plg_publications_supportingdocs','plugin','supportingdocs','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - supportingdocs\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays supporting docs for a publication\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1570,'plg_publications_usage','plugin','usage','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Usage\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays usage info for a publication\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1571,'plg_publications_versions','plugin','versions','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - versions\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays all versions of a publication\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1572,'plg_publications_wishlist','plugin','wishlist','publications',0,1,1,1,'{\"legacy\":false,\"name\":\"Publication - Wishlist\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays publication wishlist\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1573,'plg_resources_groups','plugin','groups','resources',0,1,1,1,'{\"legacy\":false,\"name\":\"Resource - Group\",\"type\":\"plugin\",\"creationDate\":\"Unknown\",\"author\":\"Shawn Rice\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Display group ownership for a resource\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1575,'plg_system_mobile','plugin','mobile','system',0,1,1,0,'{\"legacy\":true,\"name\":\"System - Mobile\",\"type\":\"plugin\",\"creationDate\":\"December 2012\",\"author\":\"HUBzero\",\"copyright\":\"Copyright (c) Purdue University, 2013. All rights reserved\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"1\",\"description\":\"PLG_SYSTEM_MOBILE_DESC\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',10,0),(1582,'plg_courses_syllabus','plugin','syllabus','courses',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',16,0),(1584,'plg_courses_faq','plugin','faq','courses',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',18,0),(1585,'plg_search_courses','plugin','courses','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1586,'plg_search_collections','plugin','collections','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1587,'plg_search_projects','plugin','projects','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1588,'plg_search_publications','plugin','publications','search',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1589,'plg_cron_courses','plugin','courses','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1590,'plg_editors_ckeditor','plugin','ckeditor','editors',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1591,'plg_system_supergroup','plugin','supergroup','system',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',24,0),(1592,'plg_geocode_arcgisonline','plugin','arcgisonline','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1593,'plg_geocode_baidu','plugin','baidu','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1594,'plg_geocode_bingmaps','plugin','bingmaps','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1595,'plg_geocode_cloudmade','plugin','cloudmade','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',4,0),(1596,'plg_geocode_datasciencetoolkit','plugin','datasciencetoolkit','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1597,'plg_geocode_freegeoip','plugin','freegeoip','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1598,'plg_geocode_geocoderca','plugin','geocoderca','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1599,'plg_geocode_geocoderus','plugin','geocoderus','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1600,'plg_geocode_geoip','plugin','geoip','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(1601,'plg_geocode_geoips','plugin','geoips','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1602,'plg_geocode_geonames','plugin','geonames','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',11,0),(1603,'plg_geocode_geoplugin','plugin','geoplugin','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',12,0),(1604,'plg_geocode_googlemaps','plugin','googlemaps','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',13,0),(1605,'plg_geocode_googlemapsbusiness','plugin','googlemapsbusiness','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',14,0),(1606,'plg_geocode_hostip','plugin','hostip','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',15,0),(1607,'plg_geocode_ignopenls','plugin','ignopenls','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',16,0),(1608,'plg_geocode_ipgeobase','plugin','ipgeobase','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',17,0),(1609,'plg_geocode_ipinfodb','plugin','ipinfodb','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',18,0),(1610,'plg_geocode_local','plugin','local','geocode',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',19,0),(1611,'plg_geocode_mapquest','plugin','mapquest','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',20,0),(1612,'plg_geocode_maxmind','plugin','maxmind','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',21,0),(1613,'plg_geocode_maxmindbinary','plugin','maxmindbinary','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',22,0),(1614,'plg_geocode_nominatim','plugin','nominatim','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',23,0),(1615,'plg_geocode_oiorest','plugin','oiorest','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',24,0),(1616,'plg_geocode_openstreetmap','plugin','openstreetmap','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',25,0),(1617,'plg_geocode_tomtom','plugin','tomtom','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',26,0),(1618,'plg_geocode_yandex','plugin','yandex','geocode',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',27,0),(1619,'plg_resources_findthistext','plugin','findthistext','resources',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',15,0),(1620,'plg_cron_projects','plugin','projects','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1621,'plg_cron_publications','plugin','publications','cron',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1622,'plg_content_formatwiki','plugin','formatwiki','content',0,1,1,1,'','{\"applyFormat\":1,\"convertFormat\":1}','','',0,'0000-00-00 00:00:00',8,0),(1623,'plg_content_formathtml','plugin','formathtml','content',0,1,1,1,'','{\"applyFormat\":1,\"convertFormat\":0,\"sanitizeBefore\":0}','','',0,'0000-00-00 00:00:00',9,0),(1624,'plg_editors_wikitoolbar','plugin','wikitoolbar','editors',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1625,'plg_editors_wikiwyg','plugin','wikiwyg','editors',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1626,'plg_projects_links','plugin','links','projects',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(1627,'plg_groups_courses','plugin','courses','groups',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1628,'plg_support_publications','plugin','publications','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(1629,'plg_tags_publications','plugin','publications','tags',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',12,0),(1630,'plg_hubzero_systemplate','plugin','systemplate','hubzero',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1631,'plg_hubzero_systickets','plugin','systickets','hubzero',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',9,0),(1632,'plg_hubzero_sysusers','plugin','sysusers','hubzero',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1634,'plg_antispam_akismet','plugin','akismet','antispam',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1635,'plg_antispam_mollom','plugin','mollom','antispam',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',11,0),(1636,'plg_antispam_spamassassin','plugin','spamassassin','antispam',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',12,0),(1637,'plg_members_impact','plugin','impact','members',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',11,0),(1638,'plg_publications_groups','plugin','groups','publications',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1639,'plg_support_wiki','plugin','wiki','support',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',11,0),(1641,'plg_tools_java','plugin','java','tools',0,1,1,1,'','{\"browsers\":\"*, chrome 999999.0\\n*, safari 1.0\\n*, iceweasel 1.0\\n*, firefox 1.0\\n*, opera 1.0\\n*, IE 3.0\\n*, mozilla 5.0\\niOS, Safari 9999.9\"}','','',0,'0000-00-00 00:00:00',1,0),(1642,'plg_tools_novnc','plugin','novnc','tools',0,0,1,1,'','{\"browsers\":\"*, safari 5.1\\n*, chrome 26.0\\n*, iceweasel 38.0\\n*, firefox 30.0\\n*, opera 23.0\\n*, mozilla 5.0\\niOS, safari 1.0\\nWindows, msie 10.0\\nWindows, ie 10.0\"}','','',0,'0000-00-00 00:00:00',2,0),(1643,'plg_whatsnew_publications','plugin','publications','whatsnew',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',6,0),(1644,'plg_groups_citations','plugin','citations','groups',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',15,0),(1645,'plg_oaipmh_publications','plugin','publications','oaipmh',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1646,'plg_user_geo','plugin','geo','user',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',8,0),(1647,'plg_user_middleware','plugin','middleware','user',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',7,0),(1648,'plg_oaipmh_resources','plugin','resources','oaipmh',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(1649,'plg_system_certificate','plugin','certificate','system',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(1650,'plg_authentication_certificate','plugin','certificate','authentication',0,0,1,1,'','{\"site_login\":\"1\"}','','',0,'0000-00-00 00:00:00',7,0),(10015,'plg_system_userconsent','plugin','userconsent','system',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',3,0),(1701,'hubbasic2012','template','hubbasic2012','',0,1,1,1,'{}','{}','','',0,'0000-00-00 00:00:00',0,0),(1702,'hubbasic2013','template','hubbasic2013','',0,1,1,1,'{}','{}','','',0,'0000-00-00 00:00:00',0,0),(1703,'welcome','template','welcome','',0,1,1,1,'{}','{}','','',0,'0000-00-00 00:00:00',0,0),(1705,'kameleon (admin)','template','kameleon','',1,1,1,1,'{}','{}','','',0,'0000-00-00 00:00:00',0,0),(1706,'Kimera (site)','template','kimera','',0,1,1,1,'{}','{}','','',0,'0000-00-00 00:00:00',0,0),(1200,'mod_announcements','module','mod_announcements','',0,1,1,1,'{\"legacy\":true,\"name\":\"Announcements Display\",\"type\":\"module\",\"creationDate\":\"May 2010\",\"author\":\"HUBzero\",\"copyright\":\"\",\"authorEmail\":\"alisa@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.0.0\",\"description\":\"This module allows the display of announcements\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1201,'mod_application_env','module','mod_application_env','',0,1,1,1,'{\"legacy\":true,\"name\":\"Application Environment\",\"type\":\"module\",\"creationDate\":\"April 2012\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2009 HUBzero Foundation, LLC.\",\"authorEmail\":\"zooley@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"This module displays the current application environment (production, stage, testing, development)\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1202,'mod_billboards','module','mod_billboards','',0,1,1,1,'{\"legacy\":true,\"name\":\"Billboards\",\"type\":\"module\",\"creationDate\":\"November 2011\",\"author\":\"HUBzero\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"Rotate through billboards of content\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1203,'mod_events_cal','module','mod_events_cal','',0,1,1,1,'{\"legacy\":true,\"name\":\"Events Calendar\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays a calendar with days that have events linked. Requires events component.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1204,'mod_events_latest','module','mod_events_latest','',0,1,1,1,'{\"legacy\":true,\"name\":\"Latest Events\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Displays a list of upcoming events.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1205,'mod_featuredblog','module','mod_featuredblog','',0,1,1,1,'{\"legacy\":true,\"name\":\"Featured Blog\",\"type\":\"module\",\"creationDate\":\"November 2010\",\"author\":\"HUBzero\",\"copyright\":\"(C) 2000 - 2004 Miro International Pty Ltd\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"4.5.1\",\"description\":\"This module randomly displays a featured blog entry.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1206,'mod_featuredmember','module','mod_featuredmember','',0,1,1,1,'{\"legacy\":true,\"name\":\"Featured Member\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module randomly displays a featured member or contributor.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1207,'mod_featuredquestion','module','mod_featuredquestion','',0,1,1,1,'{\"legacy\":true,\"name\":\"Featured Question\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module randomly displays a featured question.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1208,'mod_featuredresource','module','mod_featuredresource','',0,1,1,1,'{\"legacy\":true,\"name\":\"Featured Resource\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module randomly displays a featured resource.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1209,'mod_feed_youtube','module','mod_feed_youtube','',0,1,1,1,'{\"legacy\":true,\"name\":\"YouTube Feed Display\",\"type\":\"module\",\"creationDate\":\"April 2010\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.5.0\",\"description\":\"This module allows to display a youtube playlist feed\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1210,'mod_findresources','module','mod_findresources','',0,1,1,1,'{\"legacy\":true,\"name\":\"Find Resources\",\"type\":\"module\",\"creationDate\":\"Sep 2009\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"alisa@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"Module to display resources search, popular tags and categories.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1211,'mod_googleanalytics','module','mod_googleanalytics','',0,1,1,1,'{\"legacy\":true,\"name\":\"Google Analytics\",\"type\":\"module\",\"creationDate\":\"April 2012\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2009 HUBzero Foundation, LLC.\",\"authorEmail\":\"zooley@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"This module adds some Javascript to the page for Google Analytics reporting\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1212,'mod_hubzilla','module','mod_hubzilla','',0,1,1,1,'{\"legacy\":true,\"name\":\"Hubzilla\",\"type\":\"module\",\"creationDate\":\"August 2012\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2009 HUBzero Foundation, LLC.\",\"authorEmail\":\"zooley@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"Hubzilla attack!\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1213,'mod_incremental_registration','module','mod_incremental_registration','',0,1,1,1,'{\"legacy\":true,\"name\":\"Incremental Registration\",\"type\":\"module\",\"creationDate\":\"April 2012\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2009 HUBzero Foundation, LLC.\",\"authorEmail\":\"zooley@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"This module displays a page curl for enticing users to incrementally register demographics.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1214,'mod_latestblog','module','mod_latestblog','',0,1,1,1,'{\"legacy\":true,\"name\":\"Latest Blog posts\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows the latest blog posts in the site blog as well as group blogs.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1215,'mod_latestdiscussions','module','mod_latestdiscussions','',0,1,1,1,'{\"legacy\":true,\"name\":\"Latest Discussions\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows the latest discussions in the site forum as well as the group forum.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1216,'mod_latestgroups','module','mod_latestgroups','',0,1,1,1,'{\"legacy\":true,\"name\":\"Latest Groups\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows the latest discussions in the site forum as well as the group forum.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1217,'mod_latestusage','module','mod_latestusage','',0,1,1,1,'{\"legacy\":true,\"name\":\"Latest Usage\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module displays the latest usage numbers.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1218,'mod_logjserrors','module','mod_logjserrors','',0,1,1,1,'{\"legacy\":true,\"name\":\"Log JS Errors\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.5.0\",\"description\":\"Logs js errors\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10007,'plg_authfactors_authy','plugin','authy','authfactors',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(10008,'plg_cron_forum','plugin','forum','cron',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(10009,'plg_mail_mandrill','plugin','mandrill','mail',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',1,0),(10010,'plg_publications_watch','plugin','watch','publications',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',2,0),(10011,'plg_content_antispam','plugin','antispam','content',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',10,0),(1220,'mod_mycontributions','module','mod_mycontributions','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Contributions\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a list of contributions\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1221,'mod_mycourses','module','mod_mycourses','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Courses\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a list of courses the user belongs to and their status in it\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1223,'mod_mygroups','module','mod_mygroups','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Groups\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a list of groups the user belongs to and their status in it\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1224,'mod_mymessages','module','mod_mymessages','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Messages\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a list of unread messages sent by the site.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1225,'mod_mypoints','module','mod_mypoints','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Points\",\"type\":\"module\",\"creationDate\":\"October 2009\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"zooley@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1\",\"description\":\"This module will display a point total and list of most recent point transactions.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1226,'mod_myprojects','module','mod_myprojects','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Projects\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Alissa Nedossekina\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module displays a list of projects the user belongs, their role in the project and the number of updates since last visit.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1227,'mod_myquestions','module','mod_myquestions','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Questions\",\"type\":\"module\",\"creationDate\":\"Jan 2009\",\"author\":\"snowwitje\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"alisa@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1\",\"description\":\"This module will display a list of questions submitted by the user, as well as those user can answer.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1228,'mod_myresources','module','mod_myresources','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Resources\",\"type\":\"module\",\"creationDate\":\"January 2011\",\"author\":\"HUBzero\",\"copyright\":\"(C) 2011 HUBzero\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"1\",\"description\":\"This module will display a list of publications (resources, wiki pages, etc.)\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1229,'mod_mysessions','module','mod_mysessions','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Sessions\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Christopher Smoak\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows a list of the user\'s active tool sessions.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1230,'mod_mysubmissions','module','mod_mysubmissions','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Submissions\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Shows a list of submissions (resources) in progress.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1231,'mod_mytickets','module','mod_mytickets','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Tickets\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Shawn Rice\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a list of active support tickets submitted by the user\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1232,'mod_mytools','module','mod_mytools','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Tools\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows a list of the user\'s favorite tools, recently used tools, and all available tools.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1233,'mod_mywishes','module','mod_mywishes','',0,1,1,1,'{\"legacy\":true,\"name\":\"My Wishes\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a list of open wishes submitted by\\/ assigned to the user\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1234,'mod_newsletter','module','mod_newsletter','',0,1,1,1,'{\"legacy\":true,\"name\":\"Newsletter\",\"type\":\"module\",\"creationDate\":\"August 2012\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2009 HUBzero Foundation, LLC.\",\"authorEmail\":\"csmoak@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.0.0\",\"description\":\"Newsletter Mailing List Sign up\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1235,'mod_notices','module','mod_notices','',0,0,1,1,'{\"legacy\":true,\"name\":\"Notices Module\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows a notice (when site will be down, etc.) box for site visitors.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1236,'mod_poll','module','mod_poll','',0,1,1,1,'{\"legacy\":true,\"name\":\"Poll\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.5.0\",\"description\":\"DESCPOLL\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1237,'mod_polltitle','module','mod_polltitle','',0,1,1,1,'{\"legacy\":true,\"name\":\"XPoll Title\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows the most popular FAQs.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1238,'mod_popularfaq','module','mod_popularfaq','',0,1,1,1,'{\"legacy\":true,\"name\":\"Popular FAQs\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows the most popular FAQs.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1239,'mod_popularquestions','module','mod_popularquestions','',0,1,1,1,'{\"legacy\":true,\"name\":\"Popular Questions\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows questions with the most popular (helpful) responses added to the Answers component.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1240,'mod_quicktips','module','mod_quicktips','',0,1,1,1,'{\"legacy\":true,\"name\":\"Quick Tips\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Shawn Rice\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows a quick \\\"tip of the day\\\" or \\\"did you know...\\\" feature.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1241,'mod_quotes','module','mod_quotes','',0,1,1,1,'{\"legacy\":true,\"name\":\"Quotes\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module compliments the Feedback component. It is used to display selected quotes on Notable Quotes page.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1242,'mod_randomquote','module','mod_randomquote','',0,1,1,1,'{\"legacy\":true,\"name\":\"Random Quote\",\"type\":\"module\",\"creationDate\":\"Mar 2010\",\"author\":\"HUBzero\",\"copyright\":\"(C) 2010 HUBzero\",\"authorEmail\":\"alisa@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"Module to display random featured quote\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1243,'mod_rapid_contact','module','mod_rapid_contact','',0,1,1,1,'{\"legacy\":true,\"name\":\"Rapid Contact\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows a notice (when site will be down, etc.) box for site visitors.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1244,'mod_recentquestions','module','mod_recentquestions','',0,1,1,1,'{\"legacy\":true,\"name\":\"Latest Questions\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows the latest questions added to the Answers component.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1245,'mod_reportproblems','module','mod_reportproblems','',0,1,1,1,'{\"legacy\":true,\"name\":\"Trouble Report\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a trouble report form\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1246,'mod_resourcemenu','module','mod_resourcemenu','',0,1,1,1,'{\"legacy\":true,\"name\":\"HUB Resource Menu\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows any extra navigation or content in a pop-up style menu. Supports {xhub:module position=\\\"\\\" style=\\\"\\\"} tags.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1247,'mod_slideshow','module','mod_slideshow','',0,1,1,1,'{\"legacy\":true,\"name\":\"Slideshow\",\"type\":\"module\",\"creationDate\":\"June 2009\",\"author\":\"HUBzero\",\"copyright\":\"(C) 2000 - 2004 Miro International Pty Ltd\",\"authorEmail\":\"alisa@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.1.0\",\"description\":\"Displays HUB flash image slideshow.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1248,'mod_sliding_panes','module','mod_sliding_panes','',0,1,1,1,'{\"legacy\":true,\"name\":\"Sliding Panes\",\"type\":\"module\",\"creationDate\":\"Jan 2010\",\"author\":\"HUBzero\",\"copyright\":\"(C) 2000 - 2004 Miro International Pty Ltd\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"Rotate through panes of content\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10000,'plg_antispam_blacklist','plugin','blacklist','antispam',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',13,0),(10001,'plg_antispam_linkrife','plugin','linkrife','antispam',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',14,0),(10002,'plg_antispam_bayesian','plugin','bayesian','antispam',0,0,1,1,'','','','',0,'0000-00-00 00:00:00',15,0),(1251,'mod_toptags','module','mod_toptags','',0,1,1,1,'{\"legacy\":true,\"name\":\"Top Tags\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows a a list of the top used tags.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1252,'mod_twitterfeed','module','mod_twitterfeed','',0,1,1,1,'{\"legacy\":true,\"name\":\"Twitter Feed\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"csmoak@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.0.0\",\"description\":\"Loads the Twitter feed of the specified Twitter ID\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1253,'mod_whatsnew','module','mod_whatsnew','',0,1,1,1,'{\"legacy\":true,\"name\":\"What\'s New\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"Lists the newest resources and events on the site.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1254,'mod_wishvoters','module','mod_wishvoters','',0,1,1,1,'{\"legacy\":true,\"name\":\"Wish Voters\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module will display a list of most active wish voters\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1256,'mod_youtube','module','mod_youtube','',0,1,1,1,'{\"legacy\":true,\"name\":\"YouTube\",\"type\":\"module\",\"creationDate\":\"March 2011\",\"author\":\"HUBzero\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"csmoak@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.0.0\",\"description\":\"This module allows to display a youtube feed\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1257,'mod_grouppages','module','mod_grouppages','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1301,'mod_answers','module','mod_answers','',1,1,1,1,'{\"legacy\":true,\"name\":\"Answers\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows on the Admin area Home Page and displays items that administrator needs to watch for.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1302,'mod_application_env','module','mod_application_env','',1,1,1,1,'{\"legacy\":true,\"name\":\"Application Environment\",\"type\":\"module\",\"creationDate\":\"April 2012\",\"author\":\"Shawn Rice\",\"copyright\":\"Copyright 2005-2009 HUBzero Foundation, LLC.\",\"authorEmail\":\"zooley@purdue.edu\",\"authorUrl\":\"\",\"version\":\"1.5.0\",\"description\":\"This module displays the current application environment (production, stage, testing, development)\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10014,'plg_system_spamjail','plugin','spamjail','system',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',5,0),(1304,'mod_groups','module','mod_groups','',1,1,1,1,'{\"legacy\":true,\"name\":\"Groups\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows on the Admin area Home Page and displays items that administrator needs to watch for.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1305,'mod_members','module','mod_members','',1,1,1,1,'{\"legacy\":true,\"name\":\"Members\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows on the Admin area Home Page and displays items that administrator needs to watch for.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1306,'mod_resources','module','mod_resources','',1,1,1,1,'{\"legacy\":true,\"name\":\"Resources\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows on the Admin area Home Page and displays items that administrator needs to watch for.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1307,'mod_supporttickets','module','mod_supporttickets','',1,1,1,1,'{\"legacy\":true,\"name\":\"Support Tickets\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows on the Admin area Home Page and displays items that administrator needs to watch for.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1308,'mod_tools','module','mod_tools','',1,1,1,1,'{\"legacy\":true,\"name\":\"Tools\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows on the Admin area Home Page and displays items that administrator needs to watch for.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1309,'mod_whosonline','module','mod_whosonline','',1,1,1,1,'{\"legacy\":true,\"name\":\"Show Online Users\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Christopher Smoak\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"csmoak@purdue.edu\",\"authorUrl\":\"https:\\/\\/hubzero.org\",\"version\":\"1.0.0\",\"description\":\"This module shows a list of the currently logged in users\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1310,'mod_wishlist','module','mod_wishlist','',1,1,1,1,'{\"legacy\":true,\"name\":\"Wishlist\",\"type\":\"module\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"Copyright 2005-2015 HUBzero Foundation, LLC.\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"This module shows on the Admin area Home Page and displays items that administrator needs to watch for.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(1311,'mod_supportactivity','module','mod_supportactivity','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1312,'mod_mycuration','module','mod_mycuration','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1313,'mod_users','module','mod_users','',1,0,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1314,'mod_collect','module','mod_collect','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1315,'mod_courses','module','mod_courses','',1,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(1316,'mod_mytodos','module','mod_mytodos','',0,1,1,1,'','','','',0,'0000-00-00 00:00:00',0,0),(10016,'plg_system_password','plugin','password','system',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',9,0),(10017,'plg_system_unapproved','plugin','unapproved','system',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',8,0),(10018,'plg_system_unconfirmed','plugin','unconfirmed','system',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',7,0),(10019,'plg_system_incomplete','plugin','incomplete','system',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',6,0),(10020,'plg_members_todo','plugin','todo','members',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',17,0),(10021,'plg_authentication_orcid','plugin','orcid','authentication',0,0,1,0,'','{\"site_login\":\"1\"}','','',0,'0000-00-00 00:00:00',8,0),(10022,'plg_projects_watch','plugin','watch','projects',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',10,0),(10023,'plg_cron_geosearch','plugin','geosearch','cron',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',11,0),(10024,'plg_system_memberhome','plugin','memberhome','system',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',25,0),(10025,'plg_members_citations','plugin','citations','members',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',18,0),(10026,'plg_content_opengraph','plugin','opengraph','content',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',11,0),(10027,'com_geosearch','component','com_geosearch','',1,0,1,0,'','','','',0,'0000-00-00 00:00:00',0,0),(10028,'plg_filesystem_local','plugin','local','filesystem',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',1,0),(10029,'plg_groups_files','plugin','files','groups',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',16,0),(10030,'plg_update_support','plugin','support','update',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',1,0),(10031,'plg_update_cache','plugin','cache','update',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',2,0),(10032,'mod_feedaggregator','module','mod_feedaggregator','',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',0,0),(10033,'plg_handlers_pdf','plugin','pdf','handlers',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',1,0),(10034,'plg_handlers_latex','plugin','latex','handlers',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',2,0),(10035,'plg_handlers_hubpresenter','plugin','hubpresenter','handlers',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',3,0),(10037,'plg_newsletter_event','plugin','event','newsletter',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',1,0),(10038,'plg_newsletter_feedaggregator','plugin','feedaggregator','newsletter',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',2,0),(10039,'plg_newsletter_resource','plugin','resource','newsletter',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',3,0),(10040,'plg_metadata_local','plugin','local','metadata',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',1,0),(10041,'plg_resources_windowstools','plugin','windowstools','resources',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',16,0),(10043,'plg_filesystem_github','plugin','github','filesystem',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',3,0),(10044,'plg_resources_googlescholar','plugin','googlescholar','resources',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',17,0),(10045,'plg_resources_opengraph','plugin','opengraph','resources',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',18,0),(10046,'plg_resources_dublincore','plugin','dublincore','resources',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',19,0),(10047,'plg_publications_googlescholar','plugin','googlescholar','publications',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',3,0),(10048,'plg_publications_opengraph','plugin','opengraph','publications',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',4,0),(10049,'plg_publications_dublincore','plugin','dublincore','publications',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',5,0),(10050,'plg_system_activity','plugin','activity','system',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',26,0),(10051,'plg_members_activity','plugin','activity','members',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',19,0),(10052,'plg_groups_activity','plugin','activity','groups',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',17,0),(10053,'plg_resources_watch','plugin','watch','resources',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',20,0),(10054,'mod_myactivity','module','mod_myactivity','',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',0,0),(10056,'plg_authentication_shibboleth','plugin','shibboleth','authentication',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',9,0),(10067,'plg_publications_forks','plugin','forks','publications',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',6,0),(10058,'plg_cron_activity','plugin','activity','cron',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',13,0),(10059,'plg_projects_info','plugin','info','projects',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',2,0),(10060,'plg_authentication_scistarter','plugin','scistarter','authentication',0,0,1,0,'','','','',0,'0000-00-00 00:00:00',10,0),(10063,'plg_system_content','plugin','content','system',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',27,0),(10064,'plg_filesystem_googledrive','plugin','googledrive','filesystem',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',4,0),(10065,'plg_tags_courses','plugin','courses','tags',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',14,0),(10066,'plg_filesystem_awss3','plugin','awss3','filesystem',0,1,1,0,'','','','',0,'0000-00-00 00:00:00',5,0);
/*!40000 ALTER TABLE `jos_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_feedaggregator_feeds`
--

DROP TABLE IF EXISTS `jos_feedaggregator_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_feedaggregator_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_feedaggregator_feeds`
--

LOCK TABLES `jos_feedaggregator_feeds` WRITE;
/*!40000 ALTER TABLE `jos_feedaggregator_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_feedaggregator_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_feedaggregator_posts`
--

DROP TABLE IF EXISTS `jos_feedaggregator_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_feedaggregator_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `feed_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_feedaggregator_posts`
--

LOCK TABLES `jos_feedaggregator_posts` WRITE;
/*!40000 ALTER TABLE `jos_feedaggregator_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_feedaggregator_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_feedback`
--

DROP TABLE IF EXISTS `jos_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '',
  `org` varchar(100) DEFAULT '',
  `quote` text,
  `picture` varchar(250) DEFAULT '',
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_ok` tinyint(1) DEFAULT '0',
  `contact_ok` tinyint(1) DEFAULT '0',
  `notes` text,
  `short_quote` text,
  `miniquote` varchar(255) NOT NULL DEFAULT '',
  `admin_rating` tinyint(1) NOT NULL DEFAULT '0',
  `notable_quote` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_feedback`
--

LOCK TABLES `jos_feedback` WRITE;
/*!40000 ALTER TABLE `jos_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_file_metadata`
--

DROP TABLE IF EXISTS `jos_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_file_metadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_file_metadata`
--

LOCK TABLES `jos_file_metadata` WRITE;
/*!40000 ALTER TABLE `jos_file_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_focus_area_resource_type_rel`
--

DROP TABLE IF EXISTS `jos_focus_area_resource_type_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_focus_area_resource_type_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `focus_area_id` int(11) NOT NULL,
  `resource_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_focus_area_resource_type_rel`
--

LOCK TABLES `jos_focus_area_resource_type_rel` WRITE;
/*!40000 ALTER TABLE `jos_focus_area_resource_type_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_focus_area_resource_type_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_focus_areas`
--

DROP TABLE IF EXISTS `jos_focus_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_focus_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `mandatory_depth` int(11) DEFAULT NULL,
  `multiple_depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_focus_areas`
--

LOCK TABLES `jos_focus_areas` WRITE;
/*!40000 ALTER TABLE `jos_focus_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_focus_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_forum_attachments`
--

DROP TABLE IF EXISTS `jos_forum_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_forum_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `state` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_filename_post_id` (`filename`,`post_id`),
  KEY `idx_parent` (`parent`),
  KEY `idx_filename_postid` (`filename`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_forum_attachments`
--

LOCK TABLES `jos_forum_attachments` WRITE;
/*!40000 ALTER TABLE `jos_forum_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_forum_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_forum_categories`
--

DROP TABLE IF EXISTS `jos_forum_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_forum_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(2) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `scope` varchar(100) NOT NULL DEFAULT 'site',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `closed` tinyint(2) NOT NULL DEFAULT '0',
  `asset_id` int(11) NOT NULL DEFAULT '0',
  `object_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_object_id` (`object_id`),
  KEY `idx_state` (`state`),
  KEY `idx_access` (`access`),
  KEY `idx_section_id` (`section_id`),
  KEY `idx_closed` (`closed`),
  KEY `idx_scoped` (`scope`,`scope_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_forum_categories`
--

LOCK TABLES `jos_forum_categories` WRITE;
/*!40000 ALTER TABLE `jos_forum_categories` DISABLE KEYS */;
INSERT INTO `jos_forum_categories` VALUES (1,'Discussions','discussions','Default category for all discussions in this forum.','2012-05-24 17:33:36',0,'0000-00-00 00:00:00',0,1,0,'site',0,1,0,0,0,0);
/*!40000 ALTER TABLE `jos_forum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_forum_posts`
--

DROP TABLE IF EXISTS `jos_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `comment` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sticky` tinyint(2) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `scope` varchar(100) NOT NULL DEFAULT 'site',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `scope_sub_id` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `last_activity` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `asset_id` int(11) NOT NULL DEFAULT '0',
  `object_id` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `thread` int(11) NOT NULL DEFAULT '0',
  `closed` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_access` (`access`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_object_id` (`object_id`),
  KEY `idx_state` (`state`),
  KEY `idx_sticky` (`sticky`),
  KEY `idx_parent` (`parent`),
  KEY `idx_scoped` (`scope`,`scope_id`),
  FULLTEXT KEY `ftidx_comment` (`comment`),
  FULLTEXT KEY `ftidx_comment_title` (`comment`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_forum_posts`
--

LOCK TABLES `jos_forum_posts` WRITE;
/*!40000 ALTER TABLE `jos_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_forum_sections`
--

DROP TABLE IF EXISTS `jos_forum_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_forum_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(2) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `scope` varchar(100) NOT NULL DEFAULT 'site',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `asset_id` int(11) NOT NULL DEFAULT '0',
  `object_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_scoped` (`scope`,`scope_id`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_object_id` (`object_id`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_forum_sections`
--

LOCK TABLES `jos_forum_sections` WRITE;
/*!40000 ALTER TABLE `jos_forum_sections` DISABLE KEYS */;
INSERT INTO `jos_forum_sections` VALUES (1,'Default Section','defaultsection','2012-05-24 17:33:36',0,1,1,'site',0,0,0,0);
/*!40000 ALTER TABLE `jos_forum_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_geosearch_markers`
--

DROP TABLE IF EXISTS `jos_geosearch_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_geosearch_markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `addressLatitude` varchar(255) DEFAULT NULL,
  `addressLongitude` varchar(255) DEFAULT NULL,
  `review` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_geosearch_markers`
--

LOCK TABLES `jos_geosearch_markers` WRITE;
/*!40000 ALTER TABLE `jos_geosearch_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_geosearch_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_import_hooks`
--

DROP TABLE IF EXISTS `jos_import_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_import_hooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(25) DEFAULT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` text,
  `file` varchar(100) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_import_hooks`
--

LOCK TABLES `jos_import_hooks` WRITE;
/*!40000 ALTER TABLE `jos_import_hooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_import_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_import_runs`
--

DROP TABLE IF EXISTS `jos_import_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_import_runs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` int(11) DEFAULT NULL,
  `processed` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `ran_by` int(11) DEFAULT NULL,
  `ran_at` datetime DEFAULT NULL,
  `dry_run` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_import_runs`
--

LOCK TABLES `jos_import_runs` WRITE;
/*!40000 ALTER TABLE `jos_import_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_import_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_imports`
--

DROP TABLE IF EXISTS `jos_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_imports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `notes` text,
  `file` varchar(255) DEFAULT '',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `state` int(11) unsigned NOT NULL DEFAULT '1',
  `mode` varchar(10) DEFAULT 'UPDATE',
  `params` text,
  `hooks` text,
  `fields` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_imports`
--

LOCK TABLES `jos_imports` WRITE;
/*!40000 ALTER TABLE `jos_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_incremental_registration_group_label_rel`
--

DROP TABLE IF EXISTS `jos_incremental_registration_group_label_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_incremental_registration_group_label_rel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_incremental_registration_group_label_rel`
--

LOCK TABLES `jos_incremental_registration_group_label_rel` WRITE;
/*!40000 ALTER TABLE `jos_incremental_registration_group_label_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_incremental_registration_group_label_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_incremental_registration_groups`
--

DROP TABLE IF EXISTS `jos_incremental_registration_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_incremental_registration_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hours` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_incremental_registration_groups`
--

LOCK TABLES `jos_incremental_registration_groups` WRITE;
/*!40000 ALTER TABLE `jos_incremental_registration_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_incremental_registration_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_incremental_registration_labels`
--

DROP TABLE IF EXISTS `jos_incremental_registration_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_incremental_registration_labels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_incremental_registration_labels`
--

LOCK TABLES `jos_incremental_registration_labels` WRITE;
/*!40000 ALTER TABLE `jos_incremental_registration_labels` DISABLE KEYS */;
INSERT INTO `jos_incremental_registration_labels` VALUES (1,'mailPreferenceOption','E-Mail Updates');
/*!40000 ALTER TABLE `jos_incremental_registration_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_incremental_registration_options`
--

DROP TABLE IF EXISTS `jos_incremental_registration_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_incremental_registration_options` (
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `popover_text` text NOT NULL,
  `award_per` int(11) NOT NULL,
  `test_group` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_incremental_registration_options`
--

LOCK TABLES `jos_incremental_registration_options` WRITE;
/*!40000 ALTER TABLE `jos_incremental_registration_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_incremental_registration_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_incremental_registration_popover_recurrence`
--

DROP TABLE IF EXISTS `jos_incremental_registration_popover_recurrence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_incremental_registration_popover_recurrence` (
  `idx` int(11) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_incremental_registration_popover_recurrence`
--

LOCK TABLES `jos_incremental_registration_popover_recurrence` WRITE;
/*!40000 ALTER TABLE `jos_incremental_registration_popover_recurrence` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_incremental_registration_popover_recurrence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_item_comment_files`
--

DROP TABLE IF EXISTS `jos_item_comment_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_item_comment_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_item_comment_files`
--

LOCK TABLES `jos_item_comment_files` WRITE;
/*!40000 ALTER TABLE `jos_item_comment_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_item_comment_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_item_comments`
--

DROP TABLE IF EXISTS `jos_item_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_item_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `item_type` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `notify` tinyint(2) NOT NULL DEFAULT '0',
  `access` tinyint(2) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `positive` int(11) NOT NULL DEFAULT '0',
  `negative` int(11) NOT NULL DEFAULT '0',
  `rating` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_item_type_item_id` (`item_type`,`item_id`),
  KEY `idx_parent` (`parent`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_item_comments`
--

LOCK TABLES `jos_item_comments` WRITE;
/*!40000 ALTER TABLE `jos_item_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_item_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_item_votes`
--

DROP TABLE IF EXISTS `jos_item_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_item_votes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `item_type` varchar(255) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `vote` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_item_type_item_id` (`item_type`,`item_id`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_item_votes`
--

LOCK TABLES `jos_item_votes` WRITE;
/*!40000 ALTER TABLE `jos_item_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_item_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_item_watch`
--

DROP TABLE IF EXISTS `jos_item_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_item_watch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `item_type` varchar(150) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `email` varchar(150) DEFAULT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `digest` int(11) NOT NULL DEFAULT '0',
  `delivered` datetime DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `idx_item_type_item_id` (`item_type`,`item_id`),
  KEY `idx_created_by_email` (`created_by`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_item_watch`
--

LOCK TABLES `jos_item_watch` WRITE;
/*!40000 ALTER TABLE `jos_item_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_item_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_admins`
--

DROP TABLE IF EXISTS `jos_jobs_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_admins`
--

LOCK TABLES `jos_jobs_admins` WRITE;
/*!40000 ALTER TABLE `jos_jobs_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_applications`
--

DROP TABLE IF EXISTS `jos_jobs_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `applied` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `withdrawn` datetime DEFAULT '0000-00-00 00:00:00',
  `cover` text,
  `resumeid` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `reason` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_applications`
--

LOCK TABLES `jos_jobs_applications` WRITE;
/*!40000 ALTER TABLE `jos_jobs_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_categories`
--

DROP TABLE IF EXISTS `jos_jobs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(150) NOT NULL DEFAULT '',
  `ordernum` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_categories`
--

LOCK TABLES `jos_jobs_categories` WRITE;
/*!40000 ALTER TABLE `jos_jobs_categories` DISABLE KEYS */;
INSERT INTO `jos_jobs_categories` VALUES (1,'Scientific/Technical Staff',3,''),(2,'Post-Doctoral Researcher',2,''),(3,'Faculty Tenure & Tenure-Track',1,'');
/*!40000 ALTER TABLE `jos_jobs_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_employers`
--

DROP TABLE IF EXISTS `jos_jobs_employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_employers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subscriptionid` int(11) NOT NULL DEFAULT '0',
  `companyName` varchar(250) DEFAULT '',
  `companyLocation` varchar(250) DEFAULT '',
  `companyWebsite` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_employers`
--

LOCK TABLES `jos_jobs_employers` WRITE;
/*!40000 ALTER TABLE `jos_jobs_employers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_openings`
--

DROP TABLE IF EXISTS `jos_jobs_openings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_openings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0',
  `employerid` int(11) NOT NULL DEFAULT '0',
  `code` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `companyName` varchar(200) NOT NULL DEFAULT '',
  `companyLocation` varchar(200) DEFAULT '',
  `companyLocationCountry` varchar(100) DEFAULT '',
  `companyWebsite` varchar(200) DEFAULT '',
  `description` text,
  `addedBy` int(11) NOT NULL DEFAULT '0',
  `editedBy` int(11) DEFAULT '0',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(3) NOT NULL DEFAULT '0',
  `type` int(3) NOT NULL DEFAULT '0',
  `closedate` datetime DEFAULT '0000-00-00 00:00:00',
  `expiredate` datetime DEFAULT '0000-00-00 00:00:00',
  `opendate` datetime DEFAULT '0000-00-00 00:00:00',
  `startdate` datetime DEFAULT '0000-00-00 00:00:00',
  `applyExternalUrl` varchar(250) DEFAULT '',
  `applyInternal` int(3) DEFAULT '0',
  `contactName` varchar(100) DEFAULT '',
  `contactEmail` varchar(100) DEFAULT '',
  `contactPhone` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_openings`
--

LOCK TABLES `jos_jobs_openings` WRITE;
/*!40000 ALTER TABLE `jos_jobs_openings` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_openings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_prefs`
--

DROP TABLE IF EXISTS `jos_jobs_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_prefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `category` varchar(20) NOT NULL DEFAULT 'resume',
  `filters` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_prefs`
--

LOCK TABLES `jos_jobs_prefs` WRITE;
/*!40000 ALTER TABLE `jos_jobs_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_resumes`
--

DROP TABLE IF EXISTS `jos_jobs_resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_resumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `main` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_resumes`
--

LOCK TABLES `jos_jobs_resumes` WRITE;
/*!40000 ALTER TABLE `jos_jobs_resumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_seekers`
--

DROP TABLE IF EXISTS `jos_jobs_seekers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_seekers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `lookingfor` varchar(255) DEFAULT '',
  `tagline` varchar(255) DEFAULT '',
  `linkedin` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `updated` datetime DEFAULT '0000-00-00 00:00:00',
  `sought_cid` int(11) DEFAULT '0',
  `sought_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_seekers`
--

LOCK TABLES `jos_jobs_seekers` WRITE;
/*!40000 ALTER TABLE `jos_jobs_seekers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_seekers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_shortlist`
--

DROP TABLE IF EXISTS `jos_jobs_shortlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_shortlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp` int(11) NOT NULL DEFAULT '0',
  `seeker` int(11) NOT NULL DEFAULT '0',
  `category` varchar(11) NOT NULL DEFAULT 'resume',
  `jobid` int(11) DEFAULT '0',
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_shortlist`
--

LOCK TABLES `jos_jobs_shortlist` WRITE;
/*!40000 ALTER TABLE `jos_jobs_shortlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_shortlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_stats`
--

DROP TABLE IF EXISTS `jos_jobs_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `category` varchar(11) NOT NULL DEFAULT '',
  `total_viewed` int(11) DEFAULT '0',
  `total_shared` int(11) DEFAULT '0',
  `viewed_today` int(11) DEFAULT '0',
  `lastviewed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_stats`
--

LOCK TABLES `jos_jobs_stats` WRITE;
/*!40000 ALTER TABLE `jos_jobs_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_jobs_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_jobs_types`
--

DROP TABLE IF EXISTS `jos_jobs_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_jobs_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_jobs_types`
--

LOCK TABLES `jos_jobs_types` WRITE;
/*!40000 ALTER TABLE `jos_jobs_types` DISABLE KEYS */;
INSERT INTO `jos_jobs_types` VALUES (1,'Full-time'),(2,'Part-time'),(3,'Contract'),(4,'Internship'),(5,'Temporary');
/*!40000 ALTER TABLE `jos_jobs_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_kb_articles`
--

DROP TABLE IF EXISTS `jos_kb_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_kb_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `alias` varchar(200) DEFAULT NULL,
  `params` text,
  `fulltxt` text,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT '0',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT '0',
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `state` int(3) DEFAULT '0',
  `access` tinyint(3) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `version` int(11) DEFAULT '0',
  `category` int(11) DEFAULT '0',
  `helpful` int(11) NOT NULL DEFAULT '0',
  `nothelpful` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`),
  KEY `idx_alias` (`alias`),
  FULLTEXT KEY `ftidx_title` (`title`),
  FULLTEXT KEY `ftidx_title_params_fulltxt` (`title`,`params`,`fulltxt`),
  FULLTEXT KEY `ftidx_params` (`params`),
  FULLTEXT KEY `ftidx_fulltxt` (`fulltxt`),
  FULLTEXT KEY `ftidx_title_fulltxt` (`title`,`fulltxt`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_kb_articles`
--

LOCK TABLES `jos_kb_articles` WRITE;
/*!40000 ALTER TABLE `jos_kb_articles` DISABLE KEYS */;
INSERT INTO `jos_kb_articles` VALUES (1,'What are groups?','general','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<h4>Work together with your colleagues</h4>\r\n	<p>Create a group to organize your interactions.  Group members can:</p>\r\n	<ul>\r\n	<li>Post content that only other group members are allowed to see\r\n	<li>Export their content to other web sites, and brand it with their own logo\r\n</ul>\r\n	<h4>Create a new group</h4>\r\n	<p>You can <a href=\"/groups/new\">create your own group</a> of users.  Just fill in a simple form choosing a group name, a title, and a brief description, so that others will know what your group is about.  Once created, your group title and description will be available for all to see in the <a href=\"/groups/browse\">list of all groups</a>.  Each group also has its own page, which contains a link that other users can click on to request membership.</p>\r\n	<h4>Managing group members</h4>\r\n	<p>Whenever another user requests membership, you will receive an email asking you to approve their request.  To do this, log in and visit the <a href=\"/groups\">groups</a> page and find your group name.  If you\'re logged in, you should see a <i>[manage]</i> link next to the group name.  Clicking on that link will bring up a page showing a list of users who have requested membership.  Use the controls on that page to approve or deny their request.  You can use the same page to promote ordinary users to also act as managers, so they can help you approve or deny requests.  You can also demote or remove users from your group.<br />\r\nOnce removed from a group, a user will no longer have access to protected or private group resources.  Of course, they can always rejoin the group at any point by requesting membership and going through the usual approval process.<br />\r\n<strong>Note:</strong> All groups must have at least one manager. If you are the last manager of a group, you will <em>not</em> be able to demote or remove yourself from the group.\r\n</p>','2011-03-31 15:10:54',62,'2011-03-31 15:10:54',62,0,'0000-00-00 00:00:00',1,1,3,1,18,0,0),(2,'Why is Hispanic / Latino not a racial background choice?','hispanic','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>According to U.S. government guidelines, ethnic heritage and racial background are to be separate, distinct questions and responses.  \\\"Ethnic Heritage\\\" defines membership in cultural groups such as Hispanic / Latino, whereas \\\"Racial Background\\\" is based on ancestry and genetic groups.  This issue is handled in various ways outside the U.S., and the current standards continue to evolve.  We realize this distinction may be somewhat confusing, but we must conform to the latest reporting standards required by the government.<br />\r\nMore precise definitions of the various racial background and ethnic heritage choices are as follows:</p>\r\n	<h3>Racial Background</h3>\r\n	<ul>\r\n	<li><b>American Indian or Alaska Native</b><br />\r\nPersons having origins in any of the original peoples of North and South America (including Central America), and who maintains cultural identification through tribal affiliation or community recognition.\r\n</li>\r\n	<li><b>Asian</b><br />\r\nPersons having origins in any of the original peoples of the Far East, Southeast Asia or the Indian subcontinent, including for example, Cambodia, China, India, Japan, Korea, Malaysia, Pakistan, the Philippine Islands, Thailand, and Vietnam.\r\n</li>\r\n	<li><b>Black or African American</b><br />\r\nPersons having origins in any of the black racial groups of Africa.\r\n</li>\r\n	<li><b>Native Hawaiian or Other Pacific Islander</b><br />\r\nPersons having origins in any of the original peoples of Hawaii, Guam, Samoa, or other Pacific Islands.\r\n</li>\r\n	<li><b>White</b><br />\r\nPersons having origins in any of the original peoples of Europe, the Middle East, or North Africa.\r\n</li>\r\n	</ul>\r\n	<h3>Ethnic Heritage</h3>\r\n	<ul>\r\n	<li><b>Hispanic or Latino</b><br />\r\nPersons of Cuban, Mexican, Puerto Rican, Central or South American, or other Spanish culture of origin, regardless of race.\r\n</li>\r\n	</ul>','2011-03-31 17:21:07',69,'2011-03-31 17:21:07',69,0,'0000-00-00 00:00:00',1,1,2,1,19,0,0),(3,'Why can\\\'t I log in?','login','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>Have you registered? You must register in order to log in. If you have registered and you still cannot log in then check and double-check your username and password. Usually this is the problem; if not, contact <a href=\\\"/support/ticket/new/\\\" title=\\\"Report problem form\\\">support</a>.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,1,1,19,0,0),(4,'I registered but cannot log in!','login2','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<ul>\r\n<li>If this is a <b>new account</b>, you won\'t be able to log in until you\'ve confirmed your e-mail address.  Right after you registered, you should have received an e-mail at the address that you registered with us.  This e-mail contains a special link.  Click on the link to prove that you can receive e-mail from us.  If you did not receive the e-mail, make sure that you did not misspell your e-mail address when you registered with us.  Check your junk mail folder to see if the e-mail message wound up there.</li>\r\n<li>If this is an <b>old account</b>, check that you are entering the correct username and password.  If you\'ve forgotten your password, you can <a href=\"/login/reset\">recover it</a>.</li>\r\n<li>In either case, make sure that <a href=\"/kb/misc/cookies\">cookies are enabled</a> for your browser.  If all else fails, <a href=\"/support/ticket/new\" title=\"Report problems form\">report the problem</a> in our support area.</li>\r\n</ul>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,19,0,0),(5,'I registered in the past but cannot log in anymore!','login3','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<p>You may have entered an incorrect username or password.  If you\'ve forgotten either one, you can <a href=\"/login/remind\">recover your username</a> or <a href=\"/login/reset\">recover your password</a>.  Just fill out the form, and we\'ll send your account information to the e-mail address that you registered with your account.  If you\'ve changed e-mail addresses and can no longer recover your account information, <a href=\"/support/ticket/new/\" title=\"Report problems form\">contact support</a>, and we\'ll help you recover your account.\r\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,4,1,19,0,0),(6,'I\'ve lost my password!','pwreset','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<p>Don\'t panic!  We can <a href=\"/login/reset\">reset your password</a> and send instructions to the e-mail address that you have on file with us.  Then, you can follow the instructions, log in to the site, and change your password to anything you like.\r\n</p><p>\r\n<b>Note:</b>  If you don\'t receive an e-mail after resetting your password, check your junk mail folder and make sure that it didn\'t get filed there by mistake.  If you no longer have access to the e-mail address that you have on file with us, <a href=\"/support/ticket/new/\">contact support</a> and we\'ll help you recover your account.\r\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,19,0,0),(7,'Why do I get logged off automatically?','autologout','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>If you do not check the <i>Remember login</i> box when you log in, the site will only keep you logged in for a short time.  This prevents misuse of your account by anyone else.  To stay logged in, check the box during login.  This is not recommended if you access the site from a shared computer--e.g., in a library, internet cafe, university lab, etc.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,1,1,19,0,0),(8,'Why do I need to register at all?','register','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<p>Registration will give you access to additional features not available to guest users, including access to simulation/modeling tools, the ability to ask questions, create private groups, participate in discussions, rate resources, and more.  The registration process is completely automatic and it takes just a few minutes.  Your registration also helps us sustain this project.  Our funding agency periodically reviews statistics about the number of users that access our site.  By registering and filling in your personal profile, you are helping to justify our existence and continue our funding.\r\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,19,0,0),(9,'How do I change my password?','pwchange','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<p>We have multiple methods available to help you change your password. If you can\'t remember your password, go to the <a href=\"/login/reset\">forgot password</a> page to reset it. If you\'re already logged in, and simply wish to change your password, go to your <a href=\"/members/myaccount/account\">account page</a> for a quick password change form.</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,19,0,0),(10,'How do I change my username?','username','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>Sorry, but login names cannot be changed.  If this is poses a serious problem for you, please <a href=\\\"/support/ticket/new/\\\" title=\\\"Trouble report page\\\">contact our support team</a>.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,19,0,0),(11,'How to View/Download Video Content?','video','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>This hub relies on two formats of video files, MP4 (MPEG-4) mostly used for podcasts but  also can be viewed directly on your computer, and Windows Media Player which is used by older lectures and seminars.  In general we sugguest Apple Quicktime for playing MP4 files, however there are a variety of MP4 players available.<br />\nWe recommend VideoLAN.org\\\'s <a href=\\\"http://www.videolan.org/\\\" rel=\\\"external\\\">VLC - Media Player</a>, a free cross-platform media player that supports a large number of multimedia formats, without the need for additional codecs. It will play both the MP4 and Windows Media Player files. You will have to copy and paste the video URL from your browser to the VLC player (menu <em>file-&gt;open network</em>). Below are operating system specific issues for those using Windows Media Player.<br />\nBelow is a list of OS specific player issues:</p>\n	<ul>\n	<li><b>Windows</b><br />\nIf you\\\'re experiencing problems viewing video lectures on Windows systems, make sure that you\\\'ve installed the latest WindowsMedia software:<br />\n<a href=\\\"http://www.microsoft.com/windows/windowsmedia/mp10/default.aspx\\\" rel=\\\"external\\\"\\\">Windows Media Player for Windows</a>\n</li>\n	<li><b>Mac OS X</b><br />\nIf you\\\'re experiencing problems viewing video lectures on Mac OS X systems, make sure that you\\\'ve installed the latest WindowsMedia software:<br />\n<a href=\\\"http://www.microsoft.com/windows/windowsmedia/software/Macintosh/osx/default.aspx\\\" rel=\\\"external\\\">Windows Media Player for Mac OS X</a><br />\n<strong>NOTE:</strong> Microsoft will continue to offer Windows Media Player for Mac as a download free of charge, but has no plans to provide<br />\nfuture updates or product support. Instead, Microsoft will be offering <a href=\\\"http://www.microsoft.com/windows/windowsmedia/player/flip4mac.mspx\\\" rel=\\\"external\\\">Windows Media&reg; Components for Quicktime, by Flip4Mac&trade;</a>, as an<br />\nalternative for Mac OS X users wanting to play Windows Media Audio and Windows Media Video. Requires Mac OS X version 10.3.9 or later and QuickTime version 6.5 or later.<br />\n<b>Known Issue:</b> Windows Media Player 9 for Mas OS X may have difficulty playing secure video streams (URLs starting with \\\'https\\\'). The Flip4Mac plugin described above fixes this problem.\n</li>\n	<li><b>Linux</b><br />\nNo currently known issues.  Use <a href=\\\"http://www.videolan.org/\\\" rel=\\\"external\\\">VideoLAN Media Player</a> or equivalent application.\n</li>\n	<li><b>MacOS Classic</b><br />\nIf you don\\\'t have Mac OS X, get the <a href=\\\"http://www.microsoft.com/windows/windowsmedia/download/mac71.aspx\\\" rel=\\\"external\\\">Windows Media Player for Mac 7.1</a> which runs on the Macintosh Classic OS.\n</li>\n	</ul>\n	<h3>Downloading Video and Audio Content</h3>\n	<p><img src=\\\"/site/images/kb/video_download.jpg\\\" alt=\\\"browser download\\\" class=\\\"align-right\\\"><br />\nMost of this hub\\\'s video and audio content is downloadable.  Proceedures varry depending on the browser you are using:</p>\n	<ul>\n	<li><b>Firefox</b><br />\nRight click (hold click for Mac) on the resource link, select \\\"Save Link As...\\\", a dialog box will appear allowing you to save document as a file.\n</li>\n	<li><b>Internet Explorer</b><br />\nRight click on the resource link, then select \\\"Save Target As...\\\", a dialog box will appear allowing you to save document as a file.  Mac users should drag the link to their desktop or folder and the document will be downloaded.\n</li>\n	<li><b>Safari</b><br />\nControl-click on the resource link, then select \\\"Download Linked File\\\", the document will download to your download\\\'s folder.  The download folder is specified using the <i>Preferences</i> menu and selecting the <i>General</i> tab.\n</li>\n	</ul>\n	<h3>Continued Problems</h3>\n	<p>If the problem persists, please send us a <a href=\\\"support/ticket/new/\\\">trouble report</a>.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,20,0,0),(12,'How to enable pop-ups?','popups','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>Web pages can use the JavaScript language to automatically force the your web browser to open new windows.  This capability has often been abused by advertising sites and many browsers disable the capability by default.<br />\nYou must enable pop-ups for this site in order to do file downloads.  The way in which this is done varies from browser to browser:</p>\n	<ul>\n	<li><b>Firefox</b><br />\nGo to the <i>Edit-&gt;Preferences</i> menu and choose the <i>Content</i> icon at the top of the dialog.  If <i>Block pop-up windows</i> is checked, add this site to the <i>Exceptions</i> list.<br />\nFirefox also uses plugins to filter pop-ups.  The most common plugin is NoScript.  To enable a pop-up for a particular page, select the highlighted <i>S</i> icon at the bottom of the browser to instruct NoScript to allow the pop-up.\n</li>\n	<li><b>Internet Explorer</b><br />\nGo to <i>Tools-&gt;Internet Options</i> menu. Click on the <i>Privacy</i> tab. Uncheck the field <i>Block pop-ups\\\'</i> (<i>Turn on Pop-up Blocker</i> in IE 7.x). This will unblock pop-ups from all sites. To only allow pop-ups from this site, check <i>Block pop-ups</i> and click on <i>Settings</i>. Enter the address of this site in the field <i>Address of Web site to allow:</i> and click <i>Add</i>. Close all windows.\n</li>\n	<li><b>Safari</b><br />\nGo to the menu bar and select <i>Safari-&gt;Preferences</i> and choose the <i>Security</i> tab. If <i>Block pop-up windows</i> is checked, uncheck it.\n</li>\n	<li><b>Opera</b><br />\nApple OSX - Go to the menu bar and select <i>Opera-&gt;Quick Preferences</i> and make sure \\\"Block all pop-ups\\\" is not selected (click on it to toggle preference).<br />\nWindows - Go to the menu bar and select <i>Tools-&gt;Quick Preferences</i> and make sure <i>Block all pop-ups</i> is not selected (click on it to toggle preference).\n</li>\n	<li><b>Konqueror</b><br />\nGo to the <i>Settings-&gt;Configure Konqueror</i> menu and choose Java and JavaScript.  Select the JavaScript tab at the top of the dialog.  In the center of the dialog is a <i>Domain-Specific</i>policy mechanism.  Press the <i>New...</i> button and type the address of this site for the host or domain name.  Select <i>Accept</i> for the policy.  Set the <i>Open new windows</i> policy to <i>Allow</i>.\n</li>\n	<li><b>Mozilla</b><br />\nGo to the <i>Edit-&gt;Preferences</i> menu and choose <i>Privacy</i> and <i>Security-&gt;Popup Windows</i>.  There, you can add the address for this site to the <i>Allowed Sites</i>.\n</li>\n	</ul>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,20,0,0),(13,'Why do I need Java?','java','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>In order to access the simulation tools, you must have Java version 1.4 or later installed on your machine and enabled in your web browser.  Note that Java is <em>not</em> the same as Javascript.  Visit the <a href=\\\"http://www.java.com/en/download/installed.jsp\\\" rel=\\\"external\\\">Java website</a> to verify which version of Java is installed on your browser.  You can also <a href=\\\"http://www.java.com/en/download/manual.jsp\\\" rel=\\\"external\\\">upgrade</a> to the latest release of Java. If you do not have access to install plug-ins, please contact your system administrator about installing or upgrading your Java.</p>\n	<h4>Known Issues</h4>\n	<ul>\n	<li><b>KDE Konqueror</b><br />\nTo enable Java in the KDE Konqueror browser, make sure that the Java preferences are enabled and that <i>Use KIO</i> is checked.  In the box that specifies the path to the <i>java</i> executable, simply typing <i>java</i> often works better than the full path to the executable.</li>\n	</ul>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,1,1,20,0,0),(14,'How to Enable Cookies','cookies','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>In order to log in to this site, you must enable cookies in your browser.  Instructions for enabling cookies in common browsers are listed below. If your browser is not listed, please check its website or other browser documentation for more information.</p>\n	<h3>Windows IE 6/7</h3>\n	<ul>\n	<li>In <i>Tools</i> menu, click <i>Internet Options</i></li>\n	<li>Click <i>Privacy tab</i></li>\n	<li>Click <i>Advanced button</i></li>\n	<li>Check the box next to <i>Override Automatic Cookie Handlng</i></li>\n	<li>At bottom, check the box next to <i>Always accept session cookies</i></li>\n	<li>Click <i>OK</i></li>\n	<li>Now you should be able to <a href=\\\"/login\\\">log in</a></li>\n	</ul>\n	<h3>Firefox 1/2</h3>\n	<ul>\n	<li>In <i>Tools</i> menu, select <i>Options...</i></li>\n	<li>Click <i>Advanced</i> icon</li>\n	<li>Select/expand cookies section on left</li>\n	<li>Check box next to <i>Allow Sites to Set Cookies</i></li>\n	<li>Now you should be able to <a href=\\\"/login\\\">log in</a></li>\n	</ul>\n	<h3>Safari 1.2.4</h3>\n	<ul>\n	<li>Click on <i>Safari</i> tab on menu bar</li>\n	<li>Click <i>Preferences</i></li>\n	<li>Click <i>Security</i> tab</li>\n	<li>Ensure <i>Enable Javascript</i> is enabled</li>\n	<li>In the cookies area, choose either <i>Only from sites you navigate to</i> or <i>Always</i></li>\n	<li>Now you should be able to <a href=\\\"/login\\\">log in</a></li>\n	</ul>\n	<h3>Netscape 7</h3>\n	<ul>\n	<li>In <i>Edit</i> menu, select <i>Preferences</i></li>\n	<li>Select <i>Privacy and Security</i></li>\n	<li>Select <i>Cookies</i></li>\n	<li>Select <i>Enable All Cookies</i> or <i>Enable cookies for the originating website only</i></li>\n	<li>Click <i>OK</i></li>\n	<li>Now you should be able to <a href=\\\"/login\\\">log in</a></li>\n	</ul>\n	<h3>Mac IE 5</h3>\n	<ul>\n	<li><a href=\\\"http://www.mozilla.com/firefox/\\\">Download Firefox</a> and use it instead.  :)</li>\n	<li>If you must use Mac IE 5, follow these instructions...</li>\n	<li>Go to <i>Edit</i> menu, select <i>Preferences</i></li>\n	<li>Click on <i>Receiving Files</i> settings</li>\n	<li>Click on <i>Cookies</i></li>\n	<li>In the pull-down menu labeled <i>When receiving cookies:</i>, select <i>Never Ask</i> or <i>Ask for each site.</i></li>\n	<li>Clicking <i>Ask for each site</i> will display a prompt asking if you\\\'d like to accept cookies for this site. Click <i>Accept</i>.</li>\n	<li>Now you should be able to <a href=\\\"/login\\\">log in</a></li>\n	</ul>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,20,0,0),(15,'Share a simulation session','share','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<p>Have some interesting results from a simulation that you\'d like someone else to see? Share the session!\r\nEnter one or more login names in the form beneath the tool session and click on the <i>Share</i> button.  Anyone added for sharing will see your tool session listed on their own <i>My Sessions</i> area on their <a href=\"/members/myaccount\">dashboard page</a>.  Just as you would click a link to resume a tool session, they can click the link and access your session.  Many people can access a single session at the same time and discuss the results on a conference call.\r\n</p><p>\r\n<b>Note:</b>  If you don\'t want others to have control of the tool, be sure to select the <i>Read-Only</i> checkbox before sharing the session.\r\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,22,0,0),(16,'Rate a Resource','rate','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>Rating a resource is quick and easy.<br />\nEvery resource has two sets of stars: the average rating and your rating. If you haven\\\'t rated a resource, you\\\'re rating will show up as a set of slightly grayed out stars.<br />\nTo rate the resource, hover over your rating stars. The stars will change to red depending on where your cursor is. If you want a four star rating, move the cursor until you see four red stars and then click.  You will be taken to a form where you can then add comments, suggestions, and even tags.  If you\\\'d like to remain anonymous, be sure to check the box.  Otherwise, your name will show up next to your rating and your comments on the resource page.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,1,1,22,0,0),(17,'Customize your dashboard page','personalize','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<p>To change your <a href=\"/members/myaccount\"> dashboard page</a>, simply click the <i>Personalize</i> button located in the upper-right corner of that page.  The page will enter a customization mode where you may move modules around by simple drag-and-drop, remove modules, or add modules.  When you\'re done, click the <i>finish</i> button and all your changes will be saved.  Your changes will even be remembered the next time you log in--even if you use a different computer!\r\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,22,0,0),(18,'Renaming Sessions','rename','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>You can rename a simulation session by simple double-clicking the session title just above the active tool area.  The title will then become a text box where you can input any title you wish.  Press the TAB key or ENTER key to save changes or press ESC to cancel.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,22,0,0),(19,'How to use WebDAV to access your hub storage','webdav','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>WebDAV is the Distributed Authoring and Versioning extension to the standard HTTP/HTTPS web protocol.  It allows a client to browse a remote filesystem, usually with a graphical browser that makes it appear that your files are on your desktop.  You may access your hub storage using only the secure version of this service (HTTPS).  We do not support HTTP.  Most modern computer platforms support HTTPS transport for WebDAV with either small adjustments or freely available software.</p>\n	<h3>Linux/Unix</h3>\n	<p>If you use the KDE graphical desktop environment, you can access your hub storage with the Konqueror browser by typing the special URL <tt>webdavs://{xhub:getcfg hubHostname}/webdav</tt> into the Location field of the browser.  It will prompt you for your hub login and password.  Thereafter, you traverse your home directory by clicking on folders and you can drag and drop files to your desktop.<br />\n<a href=\\\"http://www.webdav.org/cadaver/\\\" rel=\\\"external\\\">Cadaver</a> is a text-mode WebDAV browser.  It can be used if it is compiled with SSL support.  Invoke it with the command <tt>cadaver https://{xhub:getcfg hubHostname}/webdav</tt> and it will prompt you for your hub login and password.  You can then use it in a manner similar to FTP.<br />\nIf you are using Linux, you can use the <a href=\\\"http://dav.sourceforge.net/\\\" rel=\\\"external\\\">davfs</a> kernel module to mount your hub storage area as a local filesystem.</p>\n	<h3>Macintosh</h3>\n	<p>MacOS versions 10.4 and higher support HTTPS transport for WebDAV using the Finder.  To access your hub directory, select the Go menu in the Finder and choose \\\"Connect to Network Server\\\".  Enter the URL <tt>https://{xhub:getcfg hubHostname}/webdav</tt> into the address field.  You will be prompted for your hub login and password.<br />\nMacOS versions lower than 10.4 do not have support for HTTPS, but a free client exists.  Download <a href=\\\"http://www.webdav.org/goliath/\\\" rel=\\\"external\\\">Goliath</a> and install it on your system.  Invoke it and use <tt>https://{xhub:getcfg hubHostname}/webdav</tt> as the address to connect to.  Note that you may also use Goliath on newer MacOS platforms as well.</p>\n	<h3>Windows</h3>\n	<p>Windows XP systems have native support for accessing WebDAV storage via HTTPS, but it may be disabled by default depending on how your OS was configured.  Try these instructions first, and then check the next set of instructions to enable WebDAV.  To access your hub storage,</p>\n	<ul>\n	<li> Double-click on the desktop icon called \\\"My Network Places\\\".</li>\n	<li> This will invoke a dialog box where you can select \\\"Add Network Place\\\".  This will invoke a wizard that you can step through.</li>\n	<li> Select the \\\"Choose another network location\\\" function.</li>\n	<li> The wizard will then ask you for the \\\"Internet or Network Address.\\\"  In the box, type <tt>https://{xhub:getcfg hubHostname}/webdav</tt></li>\n	<li> Specify the name that you would like to have associated with this storage space.  An icon will be created for the hub storage folder.  When you double-click on it to open it, you will be prompted for your hub login and password.</li>\n	</ul>\n	<h4>Enabling WebDAV in Windows XP</h4>\n	<p>If the steps above do not work, for Windows XP, or you cannot find the named options, your OS may have WebDAV turned off by default.  Do the following additional steps and then try to add network storage again.</p>\n	<ul>\n	<li>Open Windows Explorer</li>\n	<li>Go to the \\\"Tools\\\" menu and select \\\"Folder Options\\\"</li>\n	<li>Select the radio button \\\"Use Windows classic folders\\\" under \\\"Tasks\\\".</li>\n	</ul>\n	<h4>Windows 2003 users cannot access secure WebDAV</h4>\n	<p>There is no support for secure WebDAV transport in Windows 2003.  Various workarounds have been suggested, but it appears the easiest action to take is to simply upgrade the OS.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,2,1,22,0,0),(20,'Troubleshoot','troubleshoot','uploadpath=/site/kb\nshow_authors=1\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','<p>There are two common reasons why you may not be able to view an application.</p>\r\n	<ul>\r\n	<li><b>The tool is internally misconfigured.</b>  If you can look at your <a href=\"/members/myaccount\">personalized dashboard page</a> and see that the tool you just started does not appear in the list of running sessions, it exited before it could be viewed.  You should <a href=\"/support/ticket/new\">report this as a problem</a>.\r\n	<li><b>The Java interpreter won\'t start or is misconfigured.</b>  If you\'ve been able to view applications in previous times with the same browser, usually you can solve this problem by restarting your browser.  Make sure that all instances of the browser (e.g. multiple windows) are stopped in order to properly stop and restart the Java environment.  If this fails to make tool sessions viewable, consult the <a href=\"/kb/misc/java/\">Java page</a> for more platform-specific hints.</li>\r\n	</ul>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,2,1,23,0,0),(21,'Help! I\\\'m getting a Java error!','javaerr','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>Users may experience a Java error on Mac OS X if they are using Java version 1.3 and below. Please ensure your Java install is up to date.<br />\nNOTE! For gecko browsers (Mozilla, Firefox, Camino), the following may be the source of the error:</p>\n	<blockquote cite=\\\"http://plugindoc.mozdev.org/OSX.html#Java\\\"><p>Mozilla will only use <abbr title=\\\"Java Runtime Engine\\\">JRE</abbr> 1.3.1, even if a later JRE is installed [Bug 197813]. To use a newer JRE, you will need to install the <a href=\\\"http://javaplugin.sourceforge.net/\\\">Java Embedding Plugin for Mac OS X</a>. This plugin is beta quality software, and may have bugs and cause problems. Read the <a href=\\\"http://javaplugin.sourceforge.net/Readme.html\\\">Readme</a> before installing it.</p></blockquote>\n	<p>Java for Windows, Mac OS, Solaris, and Linux can be downloaded <a href=\\\"http://www.java.com/en/download/\\\">here</a>. Instructions for installation may also be found at that site.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,1,1,23,0,0),(22,'Signed Applet','applet','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>If you are behind a network firewall that requires you to use a web proxy with your browser, your Java environment will also need to use a proxy to connect to tool sessions.  The default security manager for Java stipulates that an applet can make network connections only to the web server from which it was originally loaded.  Connecting to a proxy requires additional privileges&#8212;even though the ultimate connection through the proxy is to the originating web server.</p>\n<p>In order to empower an applet with additional privileges, it must be <i>signed</i>.  This is a process by which a cryptographic identity is added to the applet to prove the identity of its author.  The first time you load a particular signed applet, your Java virtual machine will show you a dialog  which shows that the applet was authored by HUBzero and is confirmed by Thawte Consulting (a certificate authority that most JVM\\\'s trust).  If you trust the author of this applet, you can select \\\"Yes\\\" to load the applet.<p>\nA signed applet can have many privileges.  It can access your general window system, your computer\\\'s peripherals, and your local file system.  This site\\\'s VNC applet uses additional privileges <strong class=\\\"highlight\\\">only to connect to your web proxy.</strong>  The applet contains no code to perform any kind of additional access to your computer\\\'s local resources.\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,2,1,23,0,0),(23,'Why the math question?','why_the_math_question','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>When you use the Help button to submit a trouble report, it may ask you a simple math question such as \\\"What is the sum of 3 and 5?\\\" You get this if you\\\'re not logged in. Providing a correct answer gives us some indication that you\\\'re a human that has read and understood the question--not a bot that is attempting to put spam on our site!\n</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,0,1,20,0,0),(24,'Frequently Asked Questions','faq','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<ul class=\"faq-list\">\r\n  <li><a href=\"#groupdiscoverability\">What is Group Discoverability?</a></li>\r\n   <li><a href=\"#groupmembership\">What is Group Membership Access?</a></li>\r\n   <li><a href=\"#groupcustomization\">How to Customize a Group?</a></li>\r\n   <li><a href=\"#groupaccesslevels\">What are Group Plugin Access Levels?</a></li>\r\n  <li><a href=\"#groupmanagement\">How are groups managed?</a></li>\r\n    <li><a href=\"#leavegroup\">How do I leave a group?</a></li>\r\n    <li><a href=\"#deletegroup\">How do I delete a group?</a></li>\r\n</ul>\r\n\r\n<h3><a name=\"groupdiscoverability\"></a>What is Group Discoverability?</h3>\r\n<p>All groups have an overall discoverability setting of either visible or hidden. This determines whether or not the group appears in searches or by browsing groups. Visible means the group can be found by anyone, hidden means the reverse.</p>\r\n<p>The group mangers have the ability to update the group discoverability which can be found by editing the group.</p>\r\n<p>Group managers can also set access restrictions on each group plugin (members, messages, wiki, etc) to limit access to that specific plugin\'s content. Information about group access levels can be found below.</p>\r\n\r\n<h3><a name=\"groupmembership\"></a>What is Group Membership Access?</h3>\r\n<p>Group membership allows for groups to restrict access for new members. There are four settings for group membership: Anyone or Open, Restricted, Invite Only, and Closed.</p>\r\n<ol>\r\n<li><strong>Anyone or Open</strong> means that if a registered hub member comes to you group they will be able to click a button to join the group without a group manager having to approve. </li>\r\n<li><strong>Restricted</strong> means that the user will have to enter a reason for wanting to join the group and a group manager must approve their request before they will be granted access to the group.</li>\r\n<li><strong>Invite Only</strong> means that the user will not be able to join the group unless they have been sent a group invite from one of the group managers.</li>\r\n<li><strong>Closed</strong> simply means that membership cannot be modified.</li>\r\n</ol>\r\n<p>The group managers have the ability to update the group membership access, which can be found by editing the group.</p>\r\n\r\n<h3><a name=\"groupcustomization\"></a>How to Customize a Group?</h3>\r\n<p>Groups allow for customization including adding a group logo, customizing the group home or main page (instead of using default group description and random selection of group members), setting group plugin access levels (discussed below), and the ability to add extra custom group pages.</p>\r\n<p>All group managers can customize any of these items through the group customization interface.</p>\r\n\r\n<h3><a name=\"groupaccesslevels\"></a>What are Group Plugin Access Levels?</h3>\r\n<p>Group Plugin Access Levels allow for groups to set access levels for each plugin (members, messages, wiki, etc) individually. The different access levels are: Any HUB Visitor, Registered HUB Members, Group Members, and Disabled or Off.</p>\r\n<ol>\r\n<li><strong>Any HUB Visitor</strong> means that if a guest (not logged in user) comes to the group plugin they will be granted access to view the plugin but not allowed to perform any actions (add, edit, delete, etc) within the plugin.</li>\r\n<li><strong>Registered HUB Members</strong> means that if a HUB member (not a member of the group) comes to the group plugin they will be granted access to view the plugin but not allowed to perform any actions (add, edit, delete, etc) within the plugin. Guest users will not be granted access to view the plugin.</li>\r\n<li><strong>Group Members</strong> means that is a group member comes to the group plugin they will granted access to view the plugin and perform any actions that group members are allowed to perform. Guest users and Registered HUB users will not be granted access to the plugin.</li>\r\n<li><strong>Disabled or Off</strong> means that no one will be granted access to the plugin.</li>\r\n</ol>\r\n<p>All group managers have the ability to update the group plugin access levels, which can be found through the group customization interface.</p>\r\n\r\n<h3><a name=\"groupmanagement\"></a>How are groups managed?</h3>\r\n<p>When you create a group, you are automatically made its first manager. As manager, you can also promote members to help you run the group.</p>\r\n<p><strong>A group manager can</strong>:</p>\r\n<ol>\r\n  <li>Create group participation rules</li>\r\n  <li>Promote/demote members and approve/deny membership requests.</li>\r\n  <li>Modify information about the group\r\n    <ul>\r\n      <li>Create or change the group name</li>\r\n      <li>Create or change the group description</li>\r\n      <li>Associate the group with an external URL</li>\r\n      <li>Determine whether or not your group wiki pages, resources, and discussion topics can be viewed by non-members.</li>\r\n      <li>Moderate group discussions</li>\r\n    </ul>\r\n  </li>\r\n</ol>\r\n<p>There\'s no upper limit on the number of managers a group can have, but a group <strong>must</strong> have at least one manager at all times.</p>\r\n<p>You can read about keeping your group happy on the <a href=\"/kb/groups/guide\">Tips for Running Your Group</a> page.</p>\r\n\r\n<h3><a name=\"leavegroup\"></a>How do I leave a group?</h3>\r\n<p>To Leave a group navigate to your Member profile then to the Groups tab. There you will see a listing of all the groups you are associated with. Along the right side of the listing there is a Remove icon. Clicking this link will remove you from the group. You can also navigate directly to the group and click the cancel group membership button.</p>\r\n<p><em>Note: You will not be able to leave a group if you are the only group manager. You must promote someone else in the group first before removing yourself.</em></p>\r\n\r\n<h3><a name=\"deletegroup\"></a>How do I delete a group?</h3>\r\n<p>To Delete a group navigate to your Member profile then to the Groups tab. There you will see a listing of all the groups you are associated with. Along the right side of the listing you will see a Trash icon. Clicking this will take you to another screen to confirm deletion of the group.</p>\r\n<p><em>Note: You will not be able to delete a group if there are other members still in the group.</em></p>\r\n\r\n<hr />\r\n\r\n<p>Return to <a href=\"/groups\">the main groups page</a>.</p>','2010-03-25 06:26:40',62,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,4,1,18,0,0),(25,'Group Guidelines & Tips','guide','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>Ultimately it is the Admins that decide what the rules are for their group, but if you have been made a manager of a group, here are some suggestions for keeping your group happy:</p>\r\n\r\n<h3>Manager Guidelines</h3>\r\n<p>If you are a manager of a group, here are some pointers for creating a thriving community:</p>\r\n<ol>\r\n    <li><strong>Invite your friends</strong> and anyone you know who is interested in what you are interested in. Having group members is the first step in having a successful group!</li> \r\n    <li><strong>Visit the group frequently.</strong> Groups thrive with daily discussion, and with daily responses from other members of the community, in chat and on the discussion boards.</li>\r\n  <li><strong>Moderate, moderate, moderate!</strong> Successful groups are kept in check by good moderation. Tend that garden; pull the weeds, mow the lawn, prune the roses, etc. To help you moderate your group, you can enlist other members to become moderators. Moderators don\\\'t have full administrative power, but they can help you moderate pool submissions, keep tabs on discussions, and weed out the people who don\\\'t play by the rules.</li>\r\n</ol>\r\n\r\n<h3>Removing members</h3>\r\n<p>Here are some general guidelines to help managers determine how and when to use the removing feature.</p>\r\n<p>\\\"Removing\\\" is when a person is removed from a group. They can come back if they want, but some trolls just need a cooling off period and are remorseful when they return.</p>\r\n<ul>\r\n    <li>Use this power wisely and sparingly.</li>\r\n   <li>If a troll types or posts something offensive, they should be warned.</li>\r\n  <li>If they continue their behavior, they should be removed. You can do this from the members list.</li>\r\n</ul>\r\n\r\n<h3>Group Life </h3>\r\n<h4>Swearing</h4>\r\n<p>People ask if it\\\'s OK to swear. It is OK to swear so long as you\\\'re not offending, insulting or harassing anybody.</p>\r\n\r\n<h4>Porn</h4>\r\n<p>Porn, nudity and other such content is not disallowed, but it shouldn\\\'t be posted in public areas.</p>\r\n\r\n<h4>Trolls</h4>\r\n<p>Trolls are people who are just being rude and obnoxious, and are generally trying to offend, shock, harass, abuse or otherwise annoy people. Dealing with such people can often be difficult, but they should not go unwarned or unremoved. Trolls can destroy a community, and often this is their goal.</p>\r\n<p>Trolls thrive on attention, and often the best way to deal with them is to completely ignore them. They don\\\'t know when they are being ignored, all they know is that no one is responding to their attempts to annoy, harass or offend.</p>\r\n\r\n<hr />\r\n\r\n<p>Return to <a href=\\\"/groups\\\">the main groups page</a>.</p>','2011-03-31 15:24:31',69,'2011-03-31 15:24:31',69,0,'0000-00-00 00:00:00',1,1,3,1,18,0,0),(27,'Frequently Asked Questions','faq','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<ul class=\\\"faq-list\\\">\r\n	<li><a href=\\\"#explanation\\\">What are resources?</a></li>\r\n	<li><a href=\\\"#create\\\">How do I upload a new resource?</a></li>\r\n	<li><a href=\\\"#delete\\\">How can I delete a resource?</a></li>\r\n	<li><a href=\\\"#limit\\\">Is there a limit on the number of resources I can submit?</a></li>\r\n</ul>\r\n\r\n<h3><a name=\\\"explanation\\\"></a>What are resources?</h3>\r\n<p>Think of a hub as an empty library.  Resources are items on the shelves.  Unlike a traditional library, resources not only be publications, but also videos, tools, animations, and other types.  Anyone can upload resources, although some hubs require moderation and approval before a resource is posted.</p>\r\n\r\n<h3><a name=\\\"create\\\"></a>How do I upload a new resource?</h3>\r\n<p>You can submit a new resource with our <a href=\\\"/resources/new\\\">contribution section</a>. This will guide you, step-by-step, through the process. If you get interrupted during the submission process, no problem.  The hub will remember where you left off.  Submissions may be worked on at your leisure and submitted at any future date when you feel they are ready.</p>\r\n\r\n<h3><a name=\\\"deletetag\\\"></a>How can I delete a resource?</h3>\r\n<p>Currently, you can\\\'t. This is partly because others may reference your resource in journal articles, and it would be wrong for it to suddenly disappear.  Instead, resources are normally \\\"retired,\\\" or put in a state where they can be seen but not downloaded or used.  If you wish to have a resource retired or completely removed, please contact our support and we will work with you to address the issue.</p>\r\n\r\n<h3><a name=\\\"taglimit\\\"></a>Is there a limit on the number of resources I can submit?</h3>\r\n<p>No.  Think of resources as publications or presentations that you would be proud to have others find in the library.  It usually takes time to produce high-quality resources, but there is no limit on the amount that you can contribute</p>\r\n\r\n<hr />\r\n\r\n<p>Back to the <a href=\\\"/resources\\\">main Resources page</a>.</p>','2010-03-27 11:27:39',63,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',1,1,7,1,24,0,0),(28,'Earning points in the Questions & Answers forum','earning_points_in_the_answers_forum','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<p>Each question in the forum has its own \\\"market\\\" value, which reflects the level of community interest the question has generated. This is calculated by summing up the weighted number of answers, recommendations and answer votes, e.g. each additional answer rises the value of the question by 10 points, each recommendation by 2 points, etc. When the person who asked the question selects an answer as most helpful, the question gets 20 bonus points and is considered to be closed. At that moment the accumulated point value of the question is distributed between participating parties. One third of the value goes to the asker; another third goes to the user whose answer was accepted as the best; the remaining third is split between all users who answered the question, provided that their response received at least 3 community votes and more than half of those are positive (users found them helpful). In the case of only one answer, or if the community vote requirement is not satisfied, the user whose answer was accepted as best gets the remainder of accumulated points for the question.</p>\r\n<p>Additionally, users will get monthly \\\"royalty\\\" payments for their questions and answers based on the total of received question recommendations and answer votes. The royalty payment is distributed the same way as the points at question closure. The more community interest the question generates and the more positive votes your answer receives, the more points you earn as a result.</p>\r\n<p>You can boost the value of your question by assigning a point reward for best answer. This can be done when you first submit your question, provided that you have funds available on your account. The amount you set aside for the reward is not deducted from your account until you select the winner, but is meanwhile kept on hold. If you are not satisfied with a single answer and do not wish to name a winner, you have an option to withdraw your question.</p>','2011-03-31 13:52:03',71,'2011-03-31 13:52:03',71,0,'0000-00-00 00:00:00',1,1,6,1,25,0,0),(29,'Frequently Asked Questions','faq','show_date=2\nallow_comments=0\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial','<ul class=\\\"faq-list\\\"> \r\n	<li><a href=\\\"#tagsexplanation\\\">What are tags?</a></li> \r\n	<li><a href=\\\"#createtag\\\">How do I create a new tag?</a></li> \r\n	<li><a href=\\\"#deletetag\\\">How can I delete a tag?</a></li> \r\n	<li><a href=\\\"#removetag\\\">How can I remove a tag from a resource/group/my profile/etc?</a></li> \r\n	<li><a href=\\\"#taglimit\\\">Is there a limit on the number of tags I can add to an item?</a></li> \r\n	<li><a href=\\\"#otherstags\\\">Can I tell who\\\'s tagged another member\\\'s content?</a></li> \r\n</ul> \r\n \r\n<h3><a name=\\\"tagsexplanation\\\"></a>What are tags?</h3> \r\n<p>Tags are like keywords or category labels. Tags help you find content, events, and members which have something in common or similar interests. Tags can be added to groups, your profile, resources, wiki pages, and events.</p> \r\n \r\n<h3><a name=\\\"createtag\\\"></a>How do I create a new tag?</h3> \r\n<p>When creating or editing content, your profile, groups, etc. you can add or remove tags as you wish. If a tag doesn\\\'t already exist, simply typing it in a \\\"Tags\\\" form field will create it and make it available for everyone to use.</p> \r\n \r\n<h3><a name=\\\"deletetag\\\"></a>How can I delete a tag?</h3> \r\n<p>You can\\\'t. Tags can only be deleted by the site administrators. You may only remove tags from a piece of content or profile.</p> \r\n \r\n<h3><a name=\\\"removetag\\\"></a>How can I remove a tag from a resource/group/my profile/etc?</h3> \r\n<p>When editing content, your profile, groups, etc. you can remove tags by simply deleting them from the list presented in the \\\"Tags\\\" form field.</p> \r\n \r\n<h3><a name=\\\"taglimit\\\"></a>Is there a limit on the number of tags I can add to an item?</h3> \r\n<p>No. You should be able to add as many tags as you want to taggable content/profiles.</p> \r\n \r\n<h3><a name=\\\"otherstags\\\"></a>Can I tell who\\\'s tagged another member\\\'s content?</h3> \r\n<p>No. Who tagged an item and what tags they added is currently not available to users.</p> \r\n \r\n<hr /> \r\n \r\n<p>Back to the <a href=\\\"/tags\\\">main Tags page</a>.</p>','2010-03-27 13:24:44',62,'2010-03-27 13:27:17',63,0,'0000-00-00 00:00:00',1,1,11,1,21,0,0),(42,'Where do I go for documentation?','testarticle','uploadpath=/site/kb\nshow_authors=1\nallow_comments=1\nclose_comments=year\nfeeds_enabled=1\nfeed_entries=partial\nshow_date=2','Documentation can be found in <a href=\"https://hubzero.org/documentation\">HUBzero\'s documentation page<a>.','2011-04-01 10:25:02',71,'2011-04-01 10:25:02',0,0,'0000-00-00 00:00:00',1,1,5,1,20,0,0);
/*!40000 ALTER TABLE `jos_kb_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_kb_comments`
--

DROP TABLE IF EXISTS `jos_kb_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_kb_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `asset_id` int(11) NOT NULL DEFAULT '0',
  `helpful` int(11) NOT NULL DEFAULT '0',
  `nothelpful` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_entry_id` (`entry_id`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_kb_comments`
--

LOCK TABLES `jos_kb_comments` WRITE;
/*!40000 ALTER TABLE `jos_kb_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_kb_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_kb_votes`
--

DROP TABLE IF EXISTS `jos_kb_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_kb_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0',
  `ip` varchar(15) DEFAULT NULL,
  `vote` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type_object_id` (`type`,`object_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_kb_votes`
--

LOCK TABLES `jos_kb_votes` WRITE;
/*!40000 ALTER TABLE `jos_kb_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_kb_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_languages`
--

DROP TABLE IF EXISTS `jos_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_languages`
--

LOCK TABLES `jos_languages` WRITE;
/*!40000 ALTER TABLE `jos_languages` DISABLE KEYS */;
INSERT INTO `jos_languages` VALUES (1,'en-GB','English (UK)','English (UK)','en','en','','','','',1,1,1);
/*!40000 ALTER TABLE `jos_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_licenses`
--

DROP TABLE IF EXISTS `jos_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) DEFAULT NULL,
  `description` text,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_licenses`
--

LOCK TABLES `jos_licenses` WRITE;
/*!40000 ALTER TABLE `jos_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_licenses_tools`
--

DROP TABLE IF EXISTS `jos_licenses_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_licenses_tools` (
  `license_id` int(11) DEFAULT '0',
  `tool_id` int(11) DEFAULT '0',
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_licenses_tools`
--

LOCK TABLES `jos_licenses_tools` WRITE;
/*!40000 ALTER TABLE `jos_licenses_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_licenses_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_licenses_users`
--

DROP TABLE IF EXISTS `jos_licenses_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_licenses_users` (
  `license_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`license_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_licenses_users`
--

LOCK TABLES `jos_licenses_users` WRITE;
/*!40000 ALTER TABLE `jos_licenses_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_licenses_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_market_history`
--

DROP TABLE IF EXISTS `jos_market_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_market_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL DEFAULT '0',
  `category` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` varchar(50) DEFAULT NULL,
  `log` text,
  `market_value` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_market_history`
--

LOCK TABLES `jos_market_history` WRITE;
/*!40000 ALTER TABLE `jos_market_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_market_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_media_tracking`
--

DROP TABLE IF EXISTS `jos_media_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_media_tracking` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(200) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `object_duration` int(11) DEFAULT NULL,
  `current_position` int(11) DEFAULT NULL,
  `farthest_position` int(11) DEFAULT NULL,
  `current_position_timestamp` datetime DEFAULT NULL,
  `farthest_position_timestamp` datetime DEFAULT NULL,
  `completed` int(11) DEFAULT NULL,
  `total_views` int(11) DEFAULT NULL,
  `total_viewing_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_media_tracking`
--

LOCK TABLES `jos_media_tracking` WRITE;
/*!40000 ALTER TABLE `jos_media_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_media_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_media_tracking_detailed`
--

DROP TABLE IF EXISTS `jos_media_tracking_detailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_media_tracking_detailed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(200) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `object_duration` int(11) DEFAULT NULL,
  `current_position` int(11) DEFAULT NULL,
  `farthest_position` int(11) DEFAULT NULL,
  `current_position_timestamp` datetime DEFAULT NULL,
  `farthest_position_timestamp` datetime DEFAULT NULL,
  `completed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_media_tracking_detailed`
--

LOCK TABLES `jos_media_tracking_detailed` WRITE;
/*!40000 ALTER TABLE `jos_media_tracking_detailed` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_media_tracking_detailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_menu`
--

DROP TABLE IF EXISTS `jos_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(333)),
  KEY `idx_language` (`language`),
  KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_menu`
--

LOCK TABLES `jos_menu` WRITE;
/*!40000 ALTER TABLE `jos_menu` DISABLE KEYS */;
INSERT INTO `jos_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,225,0,'*',0),(4,'mainmenu','Resources','resources','','discover/resources','index.php?Itemid=','alias',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"88\"}',116,121,0,'*',0),(5,'mainmenu','Members','members','','community/members','index.php?Itemid=','alias',1,76,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"83\"}',146,147,0,'*',0),(6,'mainmenu','Events','events','','discover/events','index.php?Itemid=','alias',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"85\"}',132,133,0,'*',0),(7,'mainmenu','About','about','','about','index.php?option=com_content&view=article&id=3','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"0\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',161,174,0,'*',0),(8,'mainmenu','Support','support','','support','index.php?Itemid=','alias',1,1,1,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"84\"}',179,188,0,'*',0),(9,'about','About Us','aboutus','','aboutus','index.php?option=com_content&view=article&id=3','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',79,90,0,'*',0),(10,'about','Contact Us','contact','','aboutus/contact','index.php?option=com_content&view=article&id=4','component',1,9,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',80,81,0,'*',0),(15,'about','Copyright Infringement Notification','dmcapolicy','','aboutus/dmcapolicy','index.php?option=com_content&view=article&id=7','component',1,9,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',84,85,0,'*',0),(17,'about','Our Cyberinfrastructure','hubzero','','aboutus/hubzero','index.php?option=com_content&view=article&id=2','component',1,9,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',86,87,0,'*',0),(19,'about','Terms of Use','terms','','aboutus/terms','index.php?option=com_content&view=article&id=11','component',1,9,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"0\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',82,83,0,'*',0),(20,'mainmenu','What\'s New','whatsnew','','discover/resources/whatsnew','index.php?option=com_whatsnew&view=results&layout=display','component',-2,4,3,1030,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"period\":\"resources:month\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',117,118,0,'*',0),(21,'mainmenu','Upload','upload','','discover/resources/upload','/resources/new','url',-2,4,3,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"0\"}',119,120,0,'*',0),(32,'mainmenu','Groups','groups','','community/groups','index.php?Itemid=','alias',1,76,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"81\"}',148,149,0,'*',0),(37,'mainmenu','Knowledge Base','knowledgebase','','support/knowledgebase','index.php?Itemid=','alias',1,8,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"82\"}',180,181,0,'*',0),(38,'mainmenu','Report a Problem','reportproblems','','support/reportproblems','/feedback/report_problems','url',1,8,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"0\"}',182,183,0,'*',0),(39,'mainmenu','Tickets','tickets','','support/tickets','/support/tickets','url',1,8,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"0\"}',184,185,0,'*',0),(40,'mainmenu','Wish List','wishlist','','support/wishlist','index.php?Itemid=','alias',1,8,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"92\"}',186,187,0,'*',0),(41,'mainmenu','Discover','discover','','discover','index.php?option=com_content&view=article&id=22','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',109,140,0,'*',0),(42,'mainmenu','Wiki','wiki','','discover/wiki','index.php?Itemid=','alias',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"86\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',128,129,0,'*',0),(43,'mainmenu','Questions & Answers','answers','','community/answers','index.php?Itemid=','alias',1,76,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"77\"}',152,153,0,'*',0),(44,'mainmenu','Tags','tags','','discover/tags','index.php?Itemid=','alias',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"89\"}',126,127,0,'*',0),(45,'mainmenu','Citations','citations','','discover/citations','index.php?Itemid=','alias',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"79\"}',130,131,0,'*',0),(46,'mainmenu','&nbsp;','n','','discover/n','','separator',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"0\"}',124,125,0,'*',0),(47,'mainmenu','Feedback','feedback','','discover/feedback','index.php?Itemid=','alias',-2,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"93\"}',138,139,0,'*',0),(48,'mainmenu','Store','store','','discover/store','index.php?Itemid=','alias',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"90\"}',136,137,0,'*',0),(49,'mainmenu','&nbsp;','n','','discover/n','','separator',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"0\"}',134,135,0,'*',0),(50,'mainmenu','Tool Forge','tools','','discover/tools','index.php?Itemid=','alias',-2,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"87\"}',122,123,0,'*',0),(55,'default','Login','login','','login','index.php?option=com_users&view=login','component',1,1,1,25,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_login_title\":\"1\",\"header_login\":\"\",\"login_message\":\"0\",\"description_login\":\"1\",\"description_login_text\":\"Log in with your <br \\/> hub account.\",\"image_login\":\"\",\"image_login_align\":\"right\",\"show_logout_title\":\"1\",\"header_logout\":\"\",\"logout\":\"\",\"logout_message\":\"1\",\"description_logout\":\"1\",\"description_logout_text\":\"\",\"image_logout\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\",\"login_redirect_url\":\"\\/members\\/myaccount\"}',155,160,0,'*',0),(56,'default','Logout','logout','','logout','index.php?option=com_users&view=logout','component',1,1,1,25,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_login_title\":\"1\",\"header_login\":\"\",\"login\":\"\",\"login_message\":\"0\",\"description_login\":\"0\",\"description_login_text\":\"\",\"image_login\":\"\",\"image_login_align\":\"right\",\"show_logout_title\":\"1\",\"header_logout\":\"\",\"logout\":\"\",\"logout_message\":\"1\",\"description_logout\":\"1\",\"description_logout_text\":\"\",\"image_logout\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',175,176,0,'*',0),(59,'default','Reset','reset','','login/reset','index.php?option=com_users&view=reset','component',1,55,2,25,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',158,159,0,'*',0),(60,'default','Remind','remind','','login/remind','index.php?option=com_users&view=remind','component',1,55,2,25,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',156,157,0,'*',0),(65,'mainmenu','Contact Us','contact','','about/contact','index.php?option=com_content&view=article&id=4','component',1,7,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',166,167,0,'*',0),(66,'mainmenu','Terms of Use','terms','','about/terms','index.php?option=com_content&view=article&id=11','component',1,7,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"0\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',168,169,0,'*',0),(67,'mainmenu','Copyright Infringement','copyright','','about/copyright','index.php?option=com_content&view=article&id=7','component',1,7,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',170,171,0,'*',0),(68,'mainmenu','Our Cyberinfrastructure','hubzero','','about/hubzero','index.php?option=com_content&view=article&id=2','component',1,7,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',172,173,0,'*',0),(69,'legal','Legal','legal','','legal','index.php?option=com_content&view=article&id=29','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',91,106,0,'*',0),(70,'legal','Abuse Policy','abuse','','legal/abuse','index.php?option=com_content&view=article&id=28','component',1,69,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',92,93,0,'*',0),(71,'legal','Privacy Policy','privacy','','legal/privacy','index.php?option=com_content&view=article&id=27','component',1,69,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',94,95,0,'*',0),(72,'legal','Terms of Use','terms','','legal/terms','index.php?option=com_content&view=article&id=11','component',1,69,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"0\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',96,97,0,'*',0),(73,'legal','Licensing Content','licensing','','legal/licensing','index.php?option=com_content&view=article&id=12','component',1,69,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',100,101,0,'*',0),(74,'legal','Submitting Content','license','','legal/license','index.php?option=com_content&view=article&id=14','component',1,69,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"0\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',102,103,0,'*',0),(75,'legal','Accessibility Statement','accessibility','','legal/accessibility','index.php?option=com_content&view=article&id=30','component',1,69,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',104,105,0,'*',0),(76,'mainmenu','Community','community','','community','index.php?option=com_content&view=article&id=31','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',143,154,0,'*',0),(77,'default','Questions & Answers','answers','','answers','index.php?option=com_answers&view=questions&layout=search','component',1,1,1,1000,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"notify_users\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',203,204,0,'*',0),(78,'default','Blog','blog','','blog','index.php?option=com_blog&view=entries&layout=display','component',1,1,1,1002,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"cleanintro\":\"\",\"introlength\":\"300\",\"show_authors\":\"\",\"allow_comments\":\"\",\"feeds_enabled\":\"\",\"feed_entries\":\"\",\"show_date\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',177,178,0,'*',0),(79,'default','Citations','citations','','citations','index.php?option=com_citations&view=citations&layout=display','component',1,1,1,1003,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"citation_label\":\"\",\"citation_rollover\":\"\",\"citation_sponsors\":\"\",\"citation_import\":\"\",\"citation_bulk_import\":\"\",\"citation_download\":\"\",\"citation_batch_download\":\"\",\"citation_download_exclude\":\"\",\"citation_coins\":\"\",\"citation_openurl\":\"\",\"citation_url\":\"\",\"citation_custom_url\":\"\",\"citation_cited\":\"\",\"citation_cited_single\":\"\",\"citation_cited_multiple\":\"\",\"citation_show_tags\":\"\",\"citation_allow_tags\":\"\",\"citation_show_badges\":\"\",\"citation_allow_badges\":\"\",\"citation_format\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',189,190,0,'*',0),(80,'default','Forum','forum','','forum','index.php?option=com_forum&view=sections&layout=display','component',1,1,1,1009,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"filepath\":\"\\/site\\/forum\",\"forum\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',195,196,0,'*',0),(81,'default','Groups','groups','','groups','index.php?option=com_groups&view=intro','component',1,1,1,1010,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"join_policy\":\"\",\"privacy\":\"\",\"auto_approve\":\"\",\"display_system_users\":\"\",\"email_comment_processing\":\"\",\"email_member_groupsidcussionemail_autosignup\":\"\",\"intro_mygroups\":\"\",\"intro_interestinggroups\":\"\",\"intro_populargroups\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',197,198,0,'*',0),(82,'default','Knowledge Base','kb','','kb','index.php?option=com_kb&view=articles&layout=display','component',1,1,1,1013,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_date\":\"\",\"allow_comments\":\"\",\"close_comments\":\"\",\"feeds_enabled\":\"\",\"feed_entries\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',199,200,0,'*',0),(83,'default','Members','members','','members','index.php?option=com_members&view=profiles&layout=browse','component',1,1,1,1014,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"privacy\":\"\",\"bankAccounts\":\"\",\"user_messaging\":\"\",\"employeraccess\":\"\",\"shadowMax\":\"\",\"shadowMin\":\"0\",\"shadowWarning\":\"7\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',201,202,0,'*',0),(84,'default','Support','support','','support','index.php?option=com_support&view=index&layout=display','component',1,1,1,1025,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"feed_summary\":\"\",\"emails\":\"{config.mailfrom}\",\"blacklist\":\"\",\"badwords\":\"viagra, pharmacy, xanax, phentermine, dating, ringtones, tramadol, hydrocodone, levitra, ambien, vicodin, fioricet, diazepam, cash advance, free online, online gambling, online prescriptions, debt consolidation, baccarat, loan, slots, credit, mortgage, casino, slot, texas holdem, teen nude, orgasm, gay, fuck, crap, shit, asshole, cunt, fucker, fuckers, motherfucker, fucking, milf, cocksucker, porno, videosex, sperm, hentai, internet gambling, kasino, kasinos, poker, lottery, texas hold em, texas holdem, fisting\",\"email_processing\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',209,210,0,'*',0),(85,'default','Events','events','','events','index.php?option=com_events&view=browse&layout=month','component',1,1,1,1006,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',191,192,0,'*',0),(86,'default','Wiki','wiki','','wiki','index.php?option=com_wiki&view=page&layout=display','component',1,1,1,1032,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',217,218,0,'*',0),(87,'default','Tool Forge','tools','','tools','index.php?option=com_tools&view=tools&layout=display','component',1,1,1,1028,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"mw_on\":\"\",\"shareable\":\"\",\"warn_multiples\":\"\",\"show_storage\":\"\",\"contribtool_on\":\"\",\"usedoi\":\"\",\"exec_pu\":\"\",\"screenshot_edit\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',213,214,0,'*',0),(88,'default','Resources','resources','','resources','index.php?option=com_resources&view=intro','component',1,1,1,1022,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"autoapprove\":\"\",\"autoapproved_users\":\"\",\"cc_license\":\"\",\"cc_license_custom\":\"\",\"email_when_approved\":\"\",\"browsetags\":\"\",\"show_authors\":\"\",\"show_assocs\":\"\",\"show_ranking\":\"\",\"show_rating\":\"\",\"show_date\":\"\",\"show_metadata\":\"\",\"show_citation\":\"\",\"show_audience\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',205,206,0,'*',0),(89,'default','Tags','tags','','tags','index.php?option=com_tags&view=tags&layout=display','component',1,1,1,1027,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',211,212,0,'*',0),(90,'default','Store','store','','store','index.php?option=com_store&view=shop&layout=display','component',1,1,1,1024,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"store_enabled\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',207,208,0,'*',0),(92,'default','Wishlist','wishlist','','wishlist','index.php?option=com_wishlist&view=wishlist','component',1,1,1,1033,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"banking\":\"\",\"allow_advisory\":\"\",\"votesplit\":\"\",\"show_percentage_granted\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',219,220,0,'*',0),(93,'default','Feedback','feedback','','feedback','index.php?option=com_feedback&view=feedback&layout=display','component',1,1,1,1008,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"blacklist\":\"\",\"badwords\":\"viagra, pharmacy, xanax, phentermine, dating, ringtones, tramadol, hydrocodone, levitra, ambien, vicodin, fioricet, diazepam, cash advance, free online, online gambling, online prescriptions, debt consolidation, baccarat, loan, slots, credit, mortgage, casino, slot, texas holdem, teen nude, orgasm, gay, fuck, crap, shit, asshole, cunt, fucker, fuckers, motherfucker, fucking, milf, cocksucker, porno, videosex, sperm, hentai, internet gambling, kasino, kasinos, poker, lottery, texas hold em, texas holdem, fisting\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',193,194,0,'*',0),(94,'default','What\'s New','whatsnew','','whatsnew','index.php?option=com_whatsnew&view=results&layout=display','component',1,1,1,1031,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"period\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',215,216,0,'*',0),(95,'default','Congratulations','congratulations','','congratulations','index.php?option=com_content&view=article&id=32','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',141,142,0,'*',0),(96,'legal','Creative Commons','cc','','legal/cc','index.php?option=com_content&view=article&id=13','component',1,69,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_section\":\"\",\"link_section\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"0\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',98,99,0,'*',0),(97,'about','Quotes','quotes','','aboutus/quotes','index.php?option=com_content&view=article&id=5','component',1,9,2,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"1\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',88,89,0,'*',0),(98,'mainmenu','Projects','projects','','community/projects','index.php?Itemid=','alias',1,76,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"99\"}',150,151,0,'*',0),(99,'default','Projects','projects','','projects','index.php?option=com_projects&view=browse','component',1,1,1,1019,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"grantinfo\":\"\",\"confirm_step\":\"\",\"edit_settings\":\"\",\"restricted_data\":\"\",\"restricted_upfront\":\"\",\"approve_restricted\":\"\",\"offroot\":\"\",\"messaging\":\"\",\"privacy\":\"\",\"use_alias\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',221,222,0,'*',0),(100,'default','Home','home','','home','index.php?option=com_content&view=article&id=1','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_noauth\":\"\",\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"1\",\"show_section\":\"0\",\"link_section\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"feed_summary\":\"\",\"page_title\":\"\",\"show_page_title\":\"1\",\"pageclass_sfx\":\"\",\"menu_image\":\"0\",\"secure\":\"0\"}',107,108,1,'*',0),(101,'main','com_answers','answers','','answers','index.php?option=com_answers','component',1,1,1,1000,0,0,'0000-00-00 00:00:00',0,0,'',0,'',11,12,0,'*',1),(102,'main','com_billboards','billboards','','billboards','index.php?option=com_billboards','component',1,1,1,1001,0,0,'0000-00-00 00:00:00',0,0,'',0,'',35,36,0,'*',1),(103,'main','com_blog','blog','','blog','index.php?option=com_blog','component',1,1,1,1002,0,0,'0000-00-00 00:00:00',0,0,'',0,'',33,34,0,'*',1),(104,'main','com_citations','citations','','citations','index.php?option=com_citations','component',1,1,1,1003,0,0,'0000-00-00 00:00:00',0,0,'',0,'',31,32,0,'*',1),(105,'main','com_cron','cron','','cron','index.php?option=com_cron','component',1,1,1,1005,0,0,'0000-00-00 00:00:00',0,0,'',0,'',29,30,0,'*',1),(106,'main','com_events','events','','events','index.php?option=com_events','component',1,1,1,1006,0,0,'0000-00-00 00:00:00',0,0,'',0,'',25,26,0,'*',1),(107,'main','com_feedback','feedback','','feedback','index.php?option=com_feedback','component',1,1,1,1008,0,0,'0000-00-00 00:00:00',0,0,'',0,'',27,28,0,'*',1),(108,'main','com_groups','groups','','groups','index.php?option=com_groups','component',1,1,1,1010,0,0,'0000-00-00 00:00:00',0,0,'',0,'',23,24,0,'*',1),(109,'main','com_jobs','jobs','','jobs','index.php?option=com_jobs','component',1,1,1,1012,0,0,'0000-00-00 00:00:00',0,0,'',0,'',21,22,0,'*',1),(110,'main','com_kb','kb','','kb','index.php?option=com_kb','component',1,1,1,1013,0,0,'0000-00-00 00:00:00',0,0,'',0,'',19,20,0,'*',1),(111,'main','com_members','members','','members','index.php?option=com_members','component',1,1,1,1014,0,0,'0000-00-00 00:00:00',0,0,'',0,'',17,18,0,'*',1),(112,'main','com_newsletter','newsletter','','newsletter','index.php?option=com_newsletter','component',1,1,1,1015,0,0,'0000-00-00 00:00:00',0,0,'',0,'',15,16,0,'*',1),(113,'main','com_poll','poll','','poll','index.php?option=com_poll','component',1,1,1,1017,0,0,'0000-00-00 00:00:00',0,0,'',0,'',13,14,0,'*',1),(114,'main','com_projects','projects','','projects','index.php?option=com_projects','component',1,1,1,1019,0,0,'0000-00-00 00:00:00',0,0,'',0,'',37,38,0,'*',1),(116,'main','com_resources','resources','','resources','index.php?option=com_resources','component',1,1,1,1022,0,0,'0000-00-00 00:00:00',0,0,'',0,'',71,72,0,'*',1),(117,'main','com_services','services','','services','index.php?option=com_services','component',1,1,1,1023,0,0,'0000-00-00 00:00:00',0,0,'',0,'',69,70,0,'*',1),(118,'main','com_store','store','','store','index.php?option=com_store','component',1,1,1,1024,0,0,'0000-00-00 00:00:00',0,0,'',0,'',67,68,0,'*',1),(119,'main','com_support','support','','support','index.php?option=com_support','component',1,1,1,1025,0,0,'0000-00-00 00:00:00',0,0,'',0,'',65,66,0,'*',1),(120,'main','com_system','system','','system','index.php?option=com_system','component',1,1,1,1026,0,0,'0000-00-00 00:00:00',0,0,'',0,'',59,60,0,'*',1),(121,'main','com_tags','tags','','tags','index.php?option=com_tags','component',1,1,1,1027,0,0,'0000-00-00 00:00:00',0,0,'',0,'',63,64,0,'*',1),(122,'main','com_tools','tools','','tools','index.php?option=com_tools','component',1,1,1,1028,0,0,'0000-00-00 00:00:00',0,0,'',0,'',61,62,0,'*',1),(123,'main','com_usage','usage','','usage','index.php?option=com_usage','component',1,1,1,1030,0,0,'0000-00-00 00:00:00',0,0,'',0,'',57,58,0,'*',1),(124,'main','com_wiki','wiki','','wiki','index.php?option=com_wiki','component',1,1,1,1032,0,0,'0000-00-00 00:00:00',0,0,'',0,'',55,56,0,'*',1),(125,'main','com_wishlist','wishlist','','wishlist','index.php?option=com_wishlist','component',1,1,1,1033,0,0,'0000-00-00 00:00:00',0,0,'',0,'',53,54,0,'*',1),(126,'main','com_search','search','','search','index.php?option=com_search&task=configure','component',1,1,1,1034,0,0,'0000-00-00 00:00:00',0,0,'',0,'',41,42,0,'*',1),(127,'main','com_forum','forum','','forum','index.php?option=com_forum','component',1,1,1,1009,0,0,'0000-00-00 00:00:00',0,0,'',0,'',47,48,0,'*',1),(128,'main','com_cart','cart','','cart','index.php?option=com_cart','component',1,1,1,1035,0,0,'0000-00-00 00:00:00',0,0,'',0,'',45,46,0,'*',1),(129,'main','com_courses','courses','','courses','index.php?option=com_courses','component',1,1,1,1004,0,0,'0000-00-00 00:00:00',0,0,'',0,'',43,44,0,'*',1),(130,'main','com_dataviewer','dataviewer','','dataviewer','index.php?option=com_dataviewer','component',1,1,1,1018,0,0,'0000-00-00 00:00:00',0,0,'',0,'',39,40,0,'*',1),(131,'main','com_oaipmh','oaipmh','','oaipmh','index.php?option=com_oaipmh','component',1,1,1,1016,0,0,'0000-00-00 00:00:00',0,0,'',0,'',51,52,0,'*',1),(132,'main','com_publications','publications','','publications','index.php?option=com_publications','component',1,1,1,1020,0,0,'0000-00-00 00:00:00',0,0,'',0,'',49,50,0,'*',1),(134,'main','com_collections','collections','','collections','index.php?option=com_collections','component',1,1,1,1037,0,0,'0000-00-00 00:00:00',0,0,'',0,'',9,10,0,'*',1),(135,'main','com_storefront','storefront','','storefront','index.php?option=com_storefront','component',1,1,1,1036,0,0,'0000-00-00 00:00:00',0,0,'',0,'',7,8,0,'*',1),(137,'main','com_time','time','','time','index.php?option=com_time','component',0,1,1,1040,0,0,'0000-00-00 00:00:00',0,0,'',0,'',5,6,0,'*',1),(139,'default','Register','register','','register','index.php?option=com_members&view=register&layout=create','component',1,1,1,1014,0,0,'0000-00-00 00:00:00',0,1,'',0,'',223,224,0,'*',0),(140,'mainmenu','Courses','courses','','discover/courses','index.php?Itemid=','alias',1,41,2,1004,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"143\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',110,111,0,'*',0),(145,'mainmenu','Forum','forum','','community/forum','index.php?Itemid=','alias',1,76,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"80\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',144,145,0,'*',0),(141,'mainmenu','Collections','collections','','discover/collections','index.php?Itemid=','alias',1,41,2,1037,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"142\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',112,113,0,'*',0),(144,'mainmenu','Blog','blog','','discover/blog','index.php?Itemid=','alias',1,41,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"78\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',114,115,0,'*',0),(142,'default','Collections','collections','','collections','index.php?option=com_collections&view=collections&layout=collections','component',1,1,1,1037,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',73,74,0,'*',0),(143,'default','Courses','courses','','courses','index.php?option=com_courses&view=courses&layout=intro','component',1,1,1,1004,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',75,76,0,'*',0),(146,'default','Newsletter','newsletter','','newsletter','index.php?option=com_newsletter&view=newsletter&layout=view','component',1,1,1,1015,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',77,78,0,'*',0),(147,'mainmenu','Newsletter','newsletter','','about/newsletter','index.php?Itemid=','alias',1,7,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"146\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',162,163,0,'*',0),(148,'mainmenu','&nbsp;','nbsp','','about/nbsp','','separator',1,7,2,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"\",\"menu_text\":1}',164,165,0,'*',0),(149,'main','com_developer','developer','','developer','index.php?option=com_developer','component',1,1,1,10012,0,0,'0000-00-00 00:00:00',0,0,'',0,'',3,4,0,'*',1),(150,'main','com_geosearch','geosearch','','geosearch','index.php?option=com_geosearch','component',0,1,1,10027,0,0,'0000-00-00 00:00:00',0,0,'',0,'',1,2,0,'*',1);
/*!40000 ALTER TABLE `jos_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_menu_types`
--

DROP TABLE IF EXISTS `jos_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_menu_types`
--

LOCK TABLES `jos_menu_types` WRITE;
/*!40000 ALTER TABLE `jos_menu_types` DISABLE KEYS */;
INSERT INTO `jos_menu_types` VALUES (1,'mainmenu','Main Menu','The main menu for the site'),(2,'about','About','About Side Menu'),(3,'default','Default','default'),(4,'legal','Legal','Menu for policies and legal items');
/*!40000 ALTER TABLE `jos_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_messages`
--

DROP TABLE IF EXISTS `jos_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_messages`
--

LOCK TABLES `jos_messages` WRITE;
/*!40000 ALTER TABLE `jos_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_messages_cfg`
--

DROP TABLE IF EXISTS `jos_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_messages_cfg`
--

LOCK TABLES `jos_messages_cfg` WRITE;
/*!40000 ALTER TABLE `jos_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_metrics_author_cluster`
--

DROP TABLE IF EXISTS `jos_metrics_author_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_metrics_author_cluster` (
  `authorid` varchar(60) NOT NULL DEFAULT '0',
  `classes` int(11) DEFAULT '0',
  `users` int(11) DEFAULT '0',
  `schools` int(11) DEFAULT '0',
  PRIMARY KEY (`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_metrics_author_cluster`
--

LOCK TABLES `jos_metrics_author_cluster` WRITE;
/*!40000 ALTER TABLE `jos_metrics_author_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_metrics_author_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_metrics_ipgeo_cache`
--

DROP TABLE IF EXISTS `jos_metrics_ipgeo_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_metrics_ipgeo_cache` (
  `ip` int(10) NOT NULL DEFAULT '0',
  `countrySHORT` char(2) NOT NULL DEFAULT '',
  `countryLONG` varchar(64) NOT NULL DEFAULT '',
  `ipREGION` varchar(128) NOT NULL DEFAULT '',
  `ipCITY` varchar(128) NOT NULL DEFAULT '',
  `ipLATITUDE` double DEFAULT NULL,
  `ipLONGITUDE` double DEFAULT NULL,
  `lookup_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`),
  KEY `idx_lookup_datetime` (`lookup_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_metrics_ipgeo_cache`
--

LOCK TABLES `jos_metrics_ipgeo_cache` WRITE;
/*!40000 ALTER TABLE `jos_metrics_ipgeo_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_metrics_ipgeo_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_migrations`
--

DROP TABLE IF EXISTS `jos_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_migrations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL DEFAULT '',
  `scope` varchar(255) NOT NULL,
  `hash` char(32) NOT NULL DEFAULT '',
  `direction` varchar(10) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `action_by` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=668 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_migrations`
--

LOCK TABLES `jos_migrations` WRITE;
/*!40000 ALTER TABLE `jos_migrations` DISABLE KEYS */;
INSERT INTO `jos_migrations` VALUES (1,'Migration20120101000000Core.php','core/migrations','9d859ff24ee0f494d85ab78bdf40b1ff','up','2014-09-03 19:13:35','root','success'),(2,'Migration20120101000001Core.php','core/migrations','4a9f8891218f27622d7065bec5aa7744','up','2014-09-03 19:13:40','root','success'),(3,'Migration20120101000002Core.php','core/migrations','c9ce6fbcb031136b3d632be5cdeaafd5','up','2014-09-03 19:13:44','root','success'),(4,'Migration20120101000003Core.php','core/migrations','375d1bc02488c3ff9c0a458eb12922f8','up','2014-09-03 19:13:47','root','success'),(5,'Migration20120101000004Core.php','core/migrations','d0391e65c90255014dd3e57d6f3b53bd','up','2014-09-03 19:13:53','root','success'),(6,'Migration20120101000005Core.php','core/migrations','da0691900747a6bdbb2053e6aa326761','up','2014-09-03 19:13:57','root','success'),(7,'Migration20120101000006Core.php','core/migrations','a6ca583dab9cc196455b87b9b6b192ec','up','2014-09-03 19:14:01','root','success'),(8,'Migration20121009000000ComWiki.php','core/migrations','4d38777de32a2742e9bc19a8c16f451f','up','2014-09-03 19:14:12','root','success'),(9,'Migration20121015000000ComTools.php','core/migrations','105873a4abea1cfabce923a974954050','up','2014-09-03 19:14:12','root','success'),(10,'Migration20121016000000ComCourses.php','core/migrations','68f8ffa8b5cfdff8f69dc082ade1bba1','up','2014-09-03 19:14:12','root','success'),(11,'Migration20121018000000ComWiki.php','core/migrations','7a2334999fbd25108a01cdfd00e02962','up','2014-09-03 19:14:12','root','success'),(12,'Migration20121027000000ComCitations.php','core/migrations','fa28bbbb0848676966596e9dc33ca2d0','up','2014-09-03 19:14:12','root','success'),(13,'Migration20121130000000ComForum.php','core/migrations','a927d10f1b7013d144d50921dc191336','up','2014-09-03 19:14:12','root','success'),(14,'Migration20121217000000ComForum.php','core/migrations','becd8037cb2da9b3268e23d54c4b6328','up','2014-09-03 19:14:12','root','success'),(15,'Migration20130101000000ComCourses.php','core/migrations','1e18fc06847c699ea2f169028ed9c439','up','2014-09-03 19:14:12','root','success'),(16,'Migration20130114000000Core.php','core/migrations','085352375f2ff65e8c512788462cb35b','up','2014-09-03 19:14:12','root','success'),(17,'Migration20130201000000PlgUserConstantcontact.php','core/migrations','8eaac8ff756f52e4cb8ae1b633b4e559','up','2014-09-03 19:14:12','root','success'),(18,'Migration20130208000000ComGroups.php','core/migrations','00f7c4aea09f1ff9e86e271ed66309aa','up','2014-09-03 19:14:12','root','success'),(19,'Migration20130214000000Core.php','core/migrations','debe105763913a76dd82b81ff941c8de','up','2014-09-03 19:14:12','root','success'),(20,'Migration20130220000000ComResources.php','core/migrations','72b11c90bdf8bacff9021a6509b9875f','up','2014-09-03 19:14:12','root','success'),(21,'Migration20130311000000PlgHubzeroComments.php','core/migrations','c538f5e482c73e4ffe9b14ca75efa531','up','2014-09-03 19:14:12','root','success'),(22,'Migration20130320000000ComCourses.php','core/migrations','b844452d09baf5d4b680432d795f4fca','up','2014-09-03 19:14:12','root','success'),(23,'Migration20130322000000ComCourses.php','core/migrations','311e009451898df6de6ea90b232bf4fd','up','2014-09-03 19:14:12','root','success'),(24,'Migration20130329000000ComCourses.php','core/migrations','430df927a67ebda2f485ad9340b1634c','up','2014-09-03 19:14:12','root','success'),(25,'Migration20130331000000ComCourses.php','core/migrations','13d010e8c42f2855cf05eee3854285d5','up','2014-09-03 19:14:12','root','success'),(26,'Migration20130401000000ComCourses.php','core/migrations','3c8891353dcbf5ef7a3d33a6ae09017e','up','2014-09-03 19:14:12','root','success'),(27,'Migration20130401000000ComGroups.php','core/migrations','3dc7cfb1a413fe3bc3fcfddd27ac3ab6','up','2014-09-03 19:14:12','root','success'),(28,'Migration20130403000000ComCourses.php','core/migrations','3977afdb4209d767be0653ec3a6391d4','up','2014-09-03 19:14:12','root','success'),(29,'Migration20130403000000Core.php','core/migrations','3d6af0961683f4e77e25f6916ae8c87c','up','2014-09-03 19:14:12','root','success'),(30,'Migration20130404000000ComCitations.php','core/migrations','96133f48b193a1d76f7a7be31d0dbf5f','up','2014-09-03 19:14:12','root','success'),(31,'Migration20130404000000ComCourses.php','core/migrations','b0c569d47023a47001bc5c6ebc45d543','up','2014-09-03 19:14:12','root','success'),(32,'Migration20130410000000ComCourses.php','core/migrations','e4ffc5c7220a48bae192446457ae3a72','up','2014-09-03 19:14:12','root','success'),(33,'Migration20130410000000Core.php','core/migrations','88ceaf7e64db4e4de17707715371140e','up','2014-09-03 19:14:12','root','success'),(34,'Migration20130411000000ComCourses.php','core/migrations','f83e4903c93d12c69664d880e5673953','up','2014-09-03 19:14:12','root','success'),(35,'Migration20130412000000ComCourses.php','core/migrations','196274412289c68de1e160dd9b49e84b','up','2014-09-03 19:14:12','root','success'),(36,'Migration20130413000000ComCourses.php','core/migrations','c51e0833db0c5286789b85c793ed4d0a','up','2014-09-03 19:14:12','root','success'),(37,'Migration20130415000000ComSupport.php','core/migrations','3de99f5f127c19841f04b8d6a1ffd8fd','up','2014-09-03 19:14:12','root','success'),(38,'Migration20130416193151PlgCoursesOutline.php','core/migrations','ec5a92145d120ddc3c5750bae38ea5d3','up','2014-09-03 19:14:12','root','success'),(39,'Migration20130423001442ComCourses.php','core/migrations','9bbcbf50e45f16c1f9f4b1c5443d75db','up','2014-09-03 19:14:12','root','success'),(40,'Migration20130423115530ComTags.php','core/migrations','1a7b5976b56e44a9f06273c59e93b36b','up','2014-09-03 19:14:12','root','success'),(41,'Migration20130423115913ComWiki.php','core/migrations','3e5ac2de3a5dc73f15ed5c980fe7bb58','up','2014-09-03 19:14:12','root','success'),(42,'Migration20130423204702PlgCoursesPages.php','core/migrations','04c82ce82a6707e4a5205ccfb5187799','up','2014-09-03 19:14:12','root','success'),(43,'Migration20130423204715ComCourses.php','core/migrations','034244a90c4ce86424906f5b69772042','up','2014-09-03 19:14:12','root','success'),(44,'Migration20130423213901ComCourses.php','core/migrations','2226978242ebb07d139c76e2feb5c289','up','2014-09-03 19:14:12','root','success'),(45,'Migration20130426062338ComCourses.php','core/migrations','928bcc6458c490c44546eb6b5a94d9a8','up','2014-09-03 19:14:12','root','success'),(46,'Migration20130426070126ComTags.php','core/migrations','10b87268e6cc90e98745b36983114063','up','2014-09-03 19:14:12','root','success'),(47,'Migration20130426071400Core.php','core/migrations','5a0f9b902c9cc4c43b4850b4f469d298','up','2014-09-03 19:14:12','root','success'),(48,'Migration20130426071658ComHelp.php','core/migrations','d0748f74b9158958ca367ac829cfd497','up','2014-09-03 19:14:13','root','success'),(49,'Migration20130426072033ComCron.php','core/migrations','b0278bb91b8f904aa1fa4b680e71b6a7','up','2014-09-03 19:14:13','root','success'),(50,'Migration20130426074801ComSupport.php','core/migrations','c608ffbf6d386b85e7175fbfbc62e511','up','2014-09-03 19:14:13','root','success'),(51,'Migration20130429103200PlgGroupsCalendar.php','core/migrations','c209ffdaf1cd1892946e9ff38753a574','up','2014-09-03 19:14:13','root','success'),(52,'Migration20130430112401ComCourses.php','core/migrations','3f1a4136748fe7da64e2e76ad45e1182','up','2014-09-03 19:14:13','root','success'),(53,'Migration20130501120700PlgCronGroups.php','core/migrations','f854a44560ef02a1407a70d7c6747e6c','up','2014-09-03 19:14:13','root','success'),(54,'Migration20130506233657ComCourses.php','core/migrations','81c68decb346f25c4cfa80eadda003b7','up','2014-09-03 19:14:13','root','success'),(55,'Migration20130507030333ComCourses.php','core/migrations','ed2f713b568e61b156fbfb18f86b704f','up','2014-09-03 19:14:13','root','success'),(56,'Migration20130507085501ComForum.php','core/migrations','392b473abb12b4cc83eb59d45d5aeb73','up','2014-09-03 19:14:13','root','success'),(57,'Migration20130507170000PlgMembersProfile.php','core/migrations','f9b670bd56e5eb430192576a556005f0','up','2014-09-03 19:14:13','root','success'),(58,'Migration20130512175201ComForum.php','core/migrations','98b081a12ca344ec4756d33e5c1604e5','up','2014-09-03 19:14:13','root','success'),(59,'Migration20130512175301PlgCoursesDiscussions.php','core/migrations','de5ec225357cbf7b82a2575a885c3a23','up','2014-09-03 19:14:13','root','success'),(60,'Migration20130516175532ComFeedback.php','core/migrations','6587433b05cfb7dd75baa0c68ac0b688','up','2014-09-03 19:14:13','root','success'),(61,'Migration20130517101308ComContent.php','core/migrations','7dfb2ccdd73de0254fa1c9f6640ff114','up','2014-09-03 19:14:13','root','success'),(62,'Migration20130521160001ComForum.php','core/migrations','59bdfb0f7773760ea4ffcd065d823a05','up','2014-09-03 19:14:13','root','success'),(63,'Migration20130524101101PlgCoursesDiscussions.php','core/migrations','c7c62aa350a8a598baf3de31a05b075f','up','2014-09-03 19:14:13','root','success'),(64,'Migration20130529204838PlgAuthenticationTwitter.php','core/migrations','21999cd694c4a2c6f221d36f15dc8b39','up','2014-09-03 19:14:13','root','success'),(65,'Migration20130530153638ComCron.php','core/migrations','e33fab341344db643e9ba56f93462750','up','2014-09-03 19:14:13','root','success'),(66,'Migration20130531081238PlgCoursesNotes.php','core/migrations','95f6a849fef71b7951b1eec3c04a0094','up','2014-09-03 19:14:13','root','success'),(67,'Migration20130610123201PlgCoursesDiscussions.php','core/migrations','623789040dccfd065003c705e199af02','up','2014-09-03 19:14:13','root','success'),(68,'Migration20130617121701ComCourses.php','core/migrations','c87da2902fcd4c42c817531b99fff395','up','2014-09-03 19:14:13','root','success'),(69,'Migration20130617171001ComForum.php','core/migrations','fae3f4c2e79c5dd61aa13d47ba88747a','up','2014-09-03 19:14:13','root','success'),(70,'Migration20130618144751PlgMembersProfile.php','core/migrations','39f85d30d6c25ffee6fd8bed8039ae17','up','2014-09-03 19:14:13','root','success'),(71,'Migration20130619181459PlgGroupsAnnouncements.php','core/migrations','fba56331387376d9ae5f28166b77b2c8','up','2014-09-03 19:14:13','root','success'),(72,'Migration20130621115001ComSupport.php','core/migrations','4d086dcd0b1b0696434cd14080054b3d','up','2014-09-03 19:14:13','root','success'),(73,'Migration20130621155138PlgCoursesNotes.php','core/migrations','40694fd727e927f4f39312f901176275','up','2014-09-03 19:14:13','root','success'),(74,'Migration20130624184902PlgGroupsCalendar.php','core/migrations','9b45454f204767fc0c6f3a079a8c9f88','up','2014-09-03 19:14:13','root','success'),(75,'Migration20130702181838ComWiki.php','core/migrations','190377c4e8def55044573f24c5007847','up','2014-09-03 19:14:13','root','success'),(76,'Migration20130703075132ComCourses.php','core/migrations','cef0950db16b6dd8bf637341054aa609','up','2014-09-03 19:14:13','root','success'),(77,'Migration20130708082138ComWiki.php','core/migrations','e6f637f86a84a63c8ac57e7818dfa474','up','2014-09-03 19:14:13','root','success'),(78,'Migration20130715111246ModIncrementalRegistration.php','core/migrations','47cbaefce5c432e11280cf2ba3b0a477','up','2014-09-03 19:14:13','root','success'),(79,'Migration20130716202127ComNewsletter.php','core/migrations','7f0427a8f44024763e02981d081a2ae9','up','2014-09-03 19:14:13','root','success'),(80,'Migration20130717140704PlgCronNewsletter.php','core/migrations','4227bf712d4d339e8d0cd53c2cf14106','up','2014-09-03 19:14:13','root','success'),(81,'Migration20130723163332ComCourses.php','core/migrations','0d451a44f9da2ff6fcabbe2b88e3ace8','up','2014-09-03 19:14:13','root','success'),(82,'Migration20130723171332ComCourses.php','core/migrations','ee1c86ef882d6ef30de8953103b1bd80','up','2014-09-03 19:14:13','root','success'),(83,'Migration20130725184342ComCourses.php','core/migrations','ff2e8775db31c3e8ca356cada9cb2e89','up','2014-09-03 19:14:13','root','success'),(84,'Migration20130729084642ComForum.php','core/migrations','61bfc81cfff30e5e29661a7c295b4007','up','2014-09-03 19:14:13','root','success'),(85,'Migration20130729130302PlgYsearchCourses.php','core/migrations','1ca275a7edfb14bdff6826fbd445c945','up','2014-09-03 19:14:13','root','success'),(86,'Migration20130731170234ComCourses.php','core/migrations','07f14cd52ed816a4d5de7396f2dcf383','up','2014-09-03 19:14:13','root','success'),(87,'Migration20130731203037ComResources.php','core/migrations','a7f10ca0a71c48e636d145e07e7b3d81','up','2014-09-03 19:14:13','root','success'),(88,'Migration20130801182039ComPdf2form.php','core/migrations','0f20a38b11b5457f3a413030b1809628','up','2014-09-03 19:14:13','root','success'),(89,'Migration20130809151809ComTags.php','core/migrations','e5d0cec98d604a84ceca1e25f95a70e9','up','2014-09-03 19:14:13','root','success'),(90,'Migration20130809152737ComCourses.php','core/migrations','10694cc0fd3b15b30254d4f201ab9ade','up','2014-09-03 19:14:13','root','success'),(91,'Migration20130812132139ComCollections.php','core/migrations','75a8ed41da8ba67499599deee4801a51','up','2014-09-03 19:14:13','root','success'),(92,'Migration20130812182339ComCart.php','core/migrations','3041c23955421f5e98b4841d3e06d9f5','up','2014-09-03 19:14:13','root','success'),(93,'Migration20130812201731ComStorefront.php','core/migrations','bad1e44540cd3757634918929863ee14','up','2014-09-03 19:14:13','root','success'),(94,'Migration20130813195602ComOaipmh.php','core/migrations','2e62f1439099d09d368536521a33d6da','up','2014-09-03 19:14:13','root','success'),(95,'Migration20130813210535PlgProjectsDatabases.php','core/migrations','abefb5b05e69e76d343d43883ff67be3','up','2014-09-03 19:14:14','root','success'),(96,'Migration20130814185755ComNewsletter.php','core/migrations','36aaf46d71945972e9b8d1a2055abc68','up','2014-09-03 19:14:14','root','success'),(97,'Migration20130814201250ComCourses.php','core/migrations','7f3a0d9b02dcd74c800d1c5246b14bf5','up','2014-09-03 19:14:14','root','success'),(98,'Migration20130815175354ComDataviewer.php','core/migrations','2b2951fee852448fa9c4e92710efddfe','up','2014-09-03 19:14:14','root','success'),(99,'Migration20130816143341ComCitations.php','core/migrations','c11206a40ab8b0c7b8fdfe0610bbf12b','up','2014-09-03 19:14:14','root','success'),(100,'Migration20130819145850ComCourses.php','core/migrations','7de4c2e68aaa2adbbc2613fa9156779e','up','2014-09-03 19:14:14','root','success'),(101,'Migration20130820135328ComNewsletter.php','core/migrations','ac55cd216a381a8a0f546d2009941475','up','2014-09-03 19:14:14','root','success'),(102,'Migration20130821164314ComStorefront.php','core/migrations','0b87606e4b6733187cc07a0790b776f3','up','2014-09-03 19:14:14','root','success'),(103,'Migration20130821164628ComCart.php','core/migrations','fbefebeab9a70c799cbbc41968086a93','up','2014-09-03 19:14:14','root','success'),(104,'Migration20130826150814ComResources.php','core/migrations','227a0e97a65419b657308309b1402a2c','up','2014-09-03 19:14:14','root','success'),(105,'Migration20130827143717Core.php','core/migrations','7e25e6848c5ee7d60b23bafc2d73a790','up','2014-09-03 19:14:14','root','success'),(106,'Migration20130828201526ComPublications.php','core/migrations','c8036f7262dda05b07add524f2f4da47','up','2014-09-03 19:14:14','root','success'),(107,'Migration20130828203404Core.php','core/migrations','4e42d7b290d963dbd40d6d0cbdaae5c4','up','2014-09-03 19:14:14','root','success'),(108,'Migration20130829203107ComProjects.php','core/migrations','78dc7180fbad54c4842db1ab8dc7d663','up','2014-09-03 19:14:14','root','success'),(109,'Migration20130829211856ComPublications.php','core/migrations','befedf94d321d88e2673d88378533d2e','up','2014-09-03 19:14:14','root','success'),(110,'Migration20130830175756ComCourses.php','core/migrations','aa7ba7de0263dd6dc53ba9c428fb608d','up','2014-09-03 19:14:14','root','success'),(111,'Migration20130905195600ComCourses.php','core/migrations','3a77a9ddf5a77f910339dcc9c8cd6f43','up','2014-09-03 19:14:14','root','success'),(112,'Migration20130911070500ComCourses.php','core/migrations','fa9471f7390ba8361ebdb5597ef72009','up','2014-09-03 19:14:14','root','success'),(113,'Migration20130916080500ComWiki.php','core/migrations','01ef84e10af396e560e045a11f01f213','up','2014-09-03 19:14:14','root','success'),(114,'Migration20130918132946ComForum.php','core/migrations','94fbb1e67fde497c956082a88ca1fb99','up','2014-09-03 19:14:14','root','success'),(115,'Migration20130924000000ComCategories.php','core/migrations','9d826b54252d765f522935c1bb70d982','up','2014-09-03 19:14:14','root','success'),(116,'Migration20130924000001ComContent.php','core/migrations','acf0a04f1c5fc7b1feabb3104a4de62a','up','2014-09-03 19:14:14','root','success'),(117,'Migration20130924000002Core.php','core/migrations','3f4527ffbdfeeef20c5da83ab70f9833','up','2014-09-03 19:14:14','root','success'),(118,'Migration20130924000003ComBanners.php','core/migrations','06f8217b7f3cf88e5915b4425de0e7ca','up','2014-09-03 19:14:14','root','success'),(119,'Migration20130924000004ComContacts.php','core/migrations','e5b55b821abfaa52cad30d51bb7c33b5','up','2014-09-03 19:14:15','root','success'),(120,'Migration20130924000005Core.php','core/migrations','649f28e7601c6613a342c816a547f4fe','up','2014-09-03 19:14:15','root','success'),(121,'Migration20130924000006ComFinder.php','core/migrations','79e8c90e208dfaf60a43111b1630f72d','up','2014-09-03 19:14:15','root','success'),(122,'Migration20130924000007Core.php','core/migrations','6a2c5938fcf46aad0c724f2b47e01b90','up','2014-09-03 19:14:15','root','success'),(123,'Migration20130924000008Core.php','core/migrations','c2cfb7c58f738f9771ca8c5cf0d0fdd5','up','2014-09-03 19:14:15','root','success'),(124,'Migration20130924000009ComMenus.php','core/migrations','7d36ed6b99bd79101e806abfa9bbcdc0','up','2014-09-03 19:14:15','root','success'),(125,'Migration20130924000010ComMessages.php','core/migrations','261bb825a6af71667d39f875050fb125','up','2014-09-03 19:14:15','root','success'),(126,'Migration20130924000011ComModules.php','core/migrations','51725306e1edbf18471e7d840d8c78a0','up','2014-09-03 19:14:15','root','success'),(127,'Migration20130924000012ComNewsfeeds.php','core/migrations','2c25893333e66f159340119260a11d28','up','2014-09-03 19:14:15','root','success'),(128,'Migration20130924000013Core.php','core/migrations','7281393178fa6fe1b441f5887010e116','up','2014-09-03 19:14:15','root','success'),(129,'Migration20130924000014ComWeblinks.php','core/migrations','04d08ca3153b73779b8b307d19689103','up','2014-09-03 19:14:15','root','success'),(130,'Migration20130926143200Core.php','core/migrations','04771524e2f8b2806f462cf21a57b21f','up','2014-09-03 19:14:15','root','success'),(131,'Migration20130930160944ComBillboards.php','core/migrations','3abeaa15fe60b65b244f12cef206b52c','up','2014-09-03 19:14:15','root','success'),(132,'Migration20131002133124ComCollections.php','core/migrations','9493f286bac5a1bbd8d73c176e74c216','up','2014-09-03 19:14:15','root','success'),(133,'Migration20131011164749ComCourses.php','core/migrations','2d57d06ca62c892eb9b509e5c861127d','up','2014-09-03 19:14:15','root','success'),(134,'Migration20131011210918ComTools.php','core/migrations','3f8d18135a7db6d6bc9a7b1e3b923e67','up','2014-09-03 19:14:15','root','success'),(135,'Migration20131014103753ComMembers.php','core/migrations','3348945c25c8c0c1e6425bb8bfb79f2b','up','2014-09-03 19:14:15','root','success'),(136,'Migration20131016184016PlgGroupsAnnouncements.php','core/migrations','7276c1fc325e6c9bc13b77e31ececa63','up','2014-09-03 19:14:15','root','success'),(137,'Migration20131017133750ComWiki.php','core/migrations','1203e8a9fc7a3414a39e904c1f6afbc1','up','2014-09-03 19:14:15','root','success'),(138,'Migration20131018163729ComCollections.php','core/migrations','2da3363e392407adbdc46beffe7885e2','up','2014-09-03 19:14:15','root','success'),(139,'Migration20131021090512ComCourses.php','core/migrations','60dd497cb78775c78d74a3d0955b947c','up','2014-09-03 19:14:15','root','success'),(140,'Migration20131021211223Core.php','core/migrations','3ddb3eb4af78c52e9b5d404126cc64b1','up','2014-09-03 19:14:15','root','success'),(141,'Migration20131021225942ComCitations.php','core/migrations','d39606737c08df397b855dc3fac4d817','up','2014-09-03 19:14:15','root','success'),(142,'Migration20131022144858ComMembers.php','core/migrations','b89dc94db0a52e47639b27d21a244d42','up','2014-09-03 19:14:15','root','success'),(143,'Migration20131024114858ComCourses.php','core/migrations','5d9fd0d02557a9aca26797ee626f1675','up','2014-09-03 19:14:15','root','success'),(144,'Migration20131024182332Core.php','core/migrations','3f97532ddd05ce539b67bb45a0aa874b','up','2014-09-03 19:14:15','root','success'),(145,'Migration20131031124923ComCitations.php','core/migrations','9f62ca16b397428a65eb7bd5e77a034a','up','2014-09-03 19:14:15','root','success'),(146,'Migration20131106150723ComProjects.php','core/migrations','9745c5569e93d3a479ab6a1aa5fb9a3a','up','2014-09-03 19:14:15','root','success'),(147,'Migration20131106150723PlgYsearchCollections.php','core/migrations','689fa41eb7e9687e52b656632b99b3d1','up','2014-09-03 19:14:15','root','success'),(148,'Migration20131106150723PlgYsearchProjects.php','core/migrations','26a90de4fca38b6909df79ee2ed85a32','up','2014-09-03 19:14:16','root','success'),(149,'Migration20131106150723PlgYsearchPublications.php','core/migrations','1f042842e7460aba9e820a4d2a19d4d4','up','2014-09-03 19:14:16','root','success'),(150,'Migration20131106152023ComCollections.php','core/migrations','ae8ebe5cb2acca2a35399618ddcbfc32','up','2014-09-03 19:14:16','root','success'),(151,'Migration20131106153123PlgYsearchCollections.php','core/migrations','be94f6f1a6075b75db00828187d8a0ab','up','2014-09-03 19:14:16','root','success'),(152,'Migration20131106154023ComPublications.php','core/migrations','9c434a945305ec42b9631d8d7e0ef13b','up','2014-09-03 19:14:16','root','success'),(153,'Migration20131108091700ComBlog.php','core/migrations','43f3ad06466cda7efeaa18b542c73a0c','up','2014-09-03 19:14:16','root','success'),(154,'Migration20131108095500ComAnswers.php','core/migrations','4ca152ef5eb47fb0837edc14f2e87f25','up','2014-09-03 19:14:16','root','success'),(155,'Migration20131111165410Core.php','core/migrations','591f0d517a0529dee0b46e722a6f7115','up','2014-09-03 19:14:16','root','success'),(156,'Migration20131111200831ComCourses.php','core/migrations','6fcad5e995b581746f3f017ab894731f','up','2014-09-03 19:14:16','root','success'),(157,'Migration20131112130740ComUsage.php','core/migrations','b6139ffc3c111b8184a25ae10a7629d6','up','2014-09-03 19:14:16','root','success'),(158,'Migration20131112134513PlgCoursesStore.php','core/migrations','936b280d6b1af9c61b554563c88cd6ba','up','2014-09-03 19:14:16','root','success'),(159,'Migration20131113134600ComTags.php','core/migrations','88b8e752ca21b1bfd5686bab69591f99','up','2014-09-03 19:14:16','root','success'),(160,'Migration20131113143500ComSupport.php','core/migrations','b1c3ba67a3fd651d3a64c1074148cbe1','up','2014-09-03 19:14:16','root','success'),(161,'Migration20131113193815ComResources.php','core/migrations','323ff48a9a4efbaf43a0cf8415843045','up','2014-09-03 19:14:16','root','success'),(162,'Migration20131206231821ComCourses.php','core/migrations','7e95d9378e7ab5fb89c7d738a6089845','up','2014-09-03 19:14:16','root','success'),(163,'Migration20131209221353ComUsers.php','core/migrations','fc5a8ce93df3b0d4f5224502f6ddfe82','up','2014-09-03 19:14:16','root','success'),(164,'Migration20131216011106PlgCronCourses.php','core/migrations','eb3504126f6963e8bb3958bfb2ae6770','up','2014-09-03 19:14:16','root','success'),(165,'Migration20140108233318ComGroups.php','core/migrations','cdf56252657c7bd25fa10739c102856b','up','2014-09-03 19:14:16','root','success'),(166,'Migration20140108233319ComGroups.php','core/migrations','578bbbec8b2bcd11f39bddf3bad742e5','up','2014-09-03 19:14:16','root','success'),(167,'Migration20140108233320PlgEditorsCkeditor.php','core/migrations','abb903ceb45edab5976ff9f1d10a6b44','up','2014-09-03 19:14:16','root','success'),(168,'Migration20140108233321PlgGroupsMembers.php','core/migrations','eec9f4dc67f3e284a20fb932f3f656a9','up','2014-09-03 19:14:16','root','success'),(169,'Migration20140108233322PlgSystemSupergroup.php','core/migrations','8fecdaff1338a5e8cc01e5c60d4317f9','up','2014-09-03 19:14:16','root','success'),(170,'Migration20140108233323ModGroupPages.php','core/migrations','ab3761d5183d840358ef60b9fd0e4c1b','up','2014-09-03 19:14:16','root','success'),(171,'Migration20140109024336ComGroups.php','core/migrations','76aa9158d0d23651a3e0d0e40ef78f75','up','2014-09-03 19:14:16','root','success'),(172,'Migration20140109101723ComProjects.php','core/migrations','09238a379c605f3a3425ee8302aa8adf','up','2014-09-03 19:14:16','root','success'),(173,'Migration20140110125436ComWrapper.php','core/migrations','ff92a6b49c9dd2e70b36ff66456f9fa9','up','2014-09-03 19:14:16','root','success'),(174,'Migration20140110130812ComBanners.php','core/migrations','60a47eb91532a0233598e0c7e734ac0c','up','2014-09-03 19:14:17','root','success'),(175,'Migration20140110132217ComWeblinks.php','core/migrations','6cf15d40bb0bc226b5894324be84d578','up','2014-09-03 19:14:17','root','success'),(176,'Migration20140110132511ComContact.php','core/migrations','e27fd8406523f1de1e439b83b9a2223a','up','2014-09-03 19:14:17','root','success'),(177,'Migration20140110135511ComFinder.php','core/migrations','127cd73b24131a937794343d49c8bfb4','up','2014-09-03 19:14:17','root','success'),(178,'Migration20140113135231ComSearch.php','core/migrations','acddc88f38881626eeca91fb3fd228f3','up','2014-09-03 19:14:17','root','success'),(179,'Migration20140114091331PlgGeocode.php','core/migrations','54630e3e61b64fd809c643bae6c14465','up','2014-09-03 19:14:17','root','success'),(180,'Migration20140115171149PlgResourcesFindthistext.php','core/migrations','b4fb45a492e9bf5d8c6f962880f79c0c','up','2014-09-03 19:14:17','root','success'),(181,'Migration20140117212240ComCourses.php','core/migrations','4992169ed34a40e5be0848612d25828f','up','2014-09-03 19:14:18','root','success'),(182,'Migration20140121131313PlgCronProjects.php','core/migrations','f5b6a7391dbc07d958c33dcb587ebbfe','up','2014-09-03 19:14:18','root','success'),(183,'Migration20140121142313PlgCronPublications.php','core/migrations','5355a8d3e21c734047ba5b540dc3ee0c','up','2014-09-03 19:14:18','root','success'),(184,'Migration20140130105700ComAnswers.php','core/migrations','0a1f0101e6cd8c5efd81d9a5d19bf739','up','2014-09-03 19:14:18','root','success'),(185,'Migration20140131091600HubzeroComments.php','core/migrations','1f48e02b6efc5de9e86fe887cc8346e9','up','2014-09-03 19:14:18','root','success'),(186,'Migration20140206131800ComCitations.php','core/migrations','94067690ab427a2c68f51db7c0f787cf','up','2014-09-03 19:14:18','root','success'),(187,'Migration20140206141200ComCitations.php','core/migrations','ce584bed8964c698a474b5ff1aa543f3','up','2014-09-03 19:14:18','root','success'),(188,'Migration20140207091831PlgContent.php','core/migrations','d32e32abee14b548a73be929eb1ea36f','up','2014-09-03 19:14:18','root','success'),(189,'Migration20140211083020PlgEditorsWikitoolbar.php','core/migrations','2b6902258b464a2e91d8b063e81ac7b6','up','2014-09-03 19:14:18','root','success'),(190,'Migration20140211083120PlgEditorsWikiwyg.php','core/migrations','cb14c8925e18ee04e2d1e4504d4de131','up','2014-09-03 19:14:18','root','success'),(191,'Migration20140211154400PlgProjectsLinks.php','core/migrations','9144fee0d37b25722b2b1e9841864523','up','2014-09-03 19:14:18','root','success'),(192,'Migration20140212162812ComCourses.php','core/migrations','2b5f32e847322f54c2ed07f87ce3a44f','up','2014-09-03 19:14:18','root','success'),(193,'Migration20140217151012ComCourses.php','core/migrations','4ffce0e9b7e892007cd151dd066e36ee','up','2014-09-03 19:14:18','root','success'),(194,'Migration20140219221812ComCourses.php','core/migrations','deea404cc920735f53459b32a20319ab','up','2014-09-03 19:14:18','root','success'),(195,'Migration20140220183257ComCourses.php','core/migrations','98f3466f0101fa8d8d6fb4b5ff6d8c8d','up','2014-09-03 19:14:18','root','success'),(196,'Migration20140224112212PlgWiki.php','core/migrations','e28b09f1490d2293bcac04496bd248c8','up','2014-09-03 19:14:18','root','success'),(197,'Migration20140225094500ComGroups.php','core/migrations','4d002f8f0230f753cb0a6c7769d26948','up','2014-09-03 19:14:18','root','success'),(198,'Migration20140303123720PlgGroupsCourses.php','core/migrations','99258b842adf33a5dfccd4ed8bcac9f4','up','2014-09-03 19:14:18','root','success'),(199,'Migration20140305081020PlgUsageChart.php','core/migrations','ff49908bb41d0a83d9e890a02df80387','up','2014-09-03 19:14:18','root','success'),(200,'Migration20140305081320ComMembers.php','core/migrations','cd29eed09984a7e937e0bdf4612b9f2b','up','2014-09-03 19:14:18','root','success'),(201,'Migration20140305090721ComCron.php','core/migrations','00ec508fd29dd51dfbc6a404b8011a89','up','2014-09-03 19:14:18','root','success'),(202,'Migration20140305142845Core.php','core/migrations','f99ca841596a4146cf5ef7eba4b291cd','up','2014-09-03 19:14:19','root','success'),(203,'Migration20140310130202ComTags.php','core/migrations','74ef163a7db2e4110db114013c938aa1','up','2014-09-03 19:14:19','root','success'),(204,'Migration20140311150000ComFeedaggregator.php','core/migrations','f7f9b00e8d62a17d1a109f513ec6d088','up','2014-09-03 19:14:19','root','success'),(205,'Migration20140311160400ComFeedaggregator.php','core/migrations','1bc30baaba9e1b941c38fecd785187e9','up','2014-09-03 19:14:19','root','success'),(206,'Migration20140314080012PlgSupportPublications.php','core/migrations','8e31e1184dd896cc7c4b54a5e90ea9a3','up','2014-09-03 19:14:19','root','success'),(207,'Migration20140314131113ComKb.php','core/migrations','ee0066a58dc5431df923020985c881b4','up','2014-09-03 19:14:19','root','success'),(208,'Migration20140324161600ComResources.php','core/migrations','717eb7d8a95bb4782108ff02cf44a3d0','up','2014-09-03 19:14:19','root','success'),(209,'Migration20140325093000ComResources.php','core/migrations','cd2d13002c43366713b904e8fcd770f3','up','2014-09-03 19:14:19','root','success'),(210,'Migration20140407091900ComResources.php','core/migrations','13215b8be3e67cbcbb35f24ab98fae1b','up','2014-09-03 19:14:19','root','success'),(211,'Migration20140408121756ComCourses.php','core/migrations','e6de7ac64a9352175692c56c686f76e7','up','2014-09-03 19:14:19','root','success'),(212,'Migration20140408190610ComEvents.php','core/migrations','38526ffe9784e8da23545970d0b99a93','up','2014-09-03 19:14:19','root','success'),(213,'Migration20140410085610ComSupport.php','core/migrations','e2a46fb1de57373479c75b35511ebcd3','up','2014-09-03 19:14:19','root','success'),(214,'Migration20140415105610ComTopics.php','core/migrations','a422ed5de3500da8c332f817d21fd261','up','2014-09-03 19:14:19','root','success'),(215,'Migration20140416082740ComFeatures.php','core/migrations','38540f65cade947c02405814a8fc03a8','up','2014-09-03 19:14:20','root','success'),(216,'Migration20140417132300ComFeedaggregator.php','core/migrations','9450ad27cdfca0e878fef3682e2f1117','up','2014-09-03 19:14:20','root','success'),(217,'Migration20140417134640TplKameleonAdmin.php','core/migrations','dc12dc36261dbf9fd59b82b6513877d4','up','2014-09-03 19:14:20','root','success'),(218,'Migration20140417203615ComResources.php','core/migrations','a539d6ea0f8fbb7233ef6d5d6d620171','up','2014-09-03 19:14:20','root','success'),(219,'Migration20140421080012PlgTagsPublications.php','core/migrations','18d9da5aed4b26bdbba99c7ba2013551','up','2014-09-03 19:14:20','root','success'),(220,'Migration20140421112851ComTools.php','core/migrations','6993fc2600764e1e35b78b7a51a8569b','up','2014-09-03 19:14:20','root','success'),(221,'Migration20140421130020PlgHubzeroSystemplate.php','core/migrations','c736baf04657efcca3c222adc7ca33ee','up','2014-09-03 19:14:20','root','success'),(222,'Migration20140421130020PlgHubzeroSystickets.php','core/migrations','2fe9c4550151025d7f3e10de51bc45de','up','2014-09-03 19:14:20','root','success'),(223,'Migration20140421130020PlgHubzeroSysusers.php','core/migrations','1b912287e7ab93dec7efea1058e151e9','up','2014-09-03 19:14:20','root','success'),(224,'Migration20140421135022ComTools.php','core/migrations','c10911424e592d18b2cd1f62fb155dd8','up','2014-09-03 19:14:20','root','success'),(225,'Migration20140421182216Core.php','core/migrations','71f39cd9c5e52cc4ee38ac161a01f4bc','up','2014-09-03 19:14:20','root','success'),(226,'Migration20140422082422ComTools.php','core/migrations','ca662aede45dc4e2ea8c9a41dd0732cd','up','2014-09-03 19:14:20','root','success'),(227,'Migration20140423131112ComGroups.php','core/migrations','af8a0e03e971225764420712983dba4a','up','2014-09-03 19:14:20','root','success'),(228,'Migration20140428094910ComSupport.php','core/migrations','8d29f576b55a8e066c65a97df3961cdc','up','2014-09-03 19:14:20','root','success'),(229,'Migration20140428183704Core.php','core/migrations','58ae41533557b4e03b6c676eb74ffa99','up','2014-09-03 19:14:21','root','success'),(230,'Migration20140502184454Core.php','core/migrations','747dfaee88f169d90a4532022baf621d','up','2014-09-03 19:14:21','root','success'),(231,'Migration20140505141538ComTools.php','core/migrations','b5961d1e8b9a87f33464bce67e8a1782','up','2014-09-03 19:14:21','root','success'),(232,'Migration20140505160720PlgSupportTime.php','core/migrations','ed84ad1b74460c96b8a6db468adb9d5b','up','2014-09-03 19:14:21','root','success'),(233,'Migration20140506104910PlgMembersFavorites.php','core/migrations','13069051ff2d774ce0331a93e7a454ca','up','2014-09-03 19:14:21','root','success'),(234,'Migration20140508120000PlgMembersDashboard.php','core/migrations','878f103169d3e5f71268ae6adc2d9972','up','2014-09-03 19:14:21','root','success'),(235,'Migration20140508122800PlgMembersDashboard.php','core/migrations','1b7523a669dc229fd2d726e6d5b6d8c6','up','2014-09-03 19:14:21','root','success'),(236,'Migration20140509133410ComSupport.php','core/migrations','51257ab13c6dda7aaccd5ed5b2b0e642','up','2014-09-03 19:14:21','root','success'),(237,'Migration20140512120000ComPublications.php','core/migrations','45633a75e5997b41eeb0421d3a8a2a00','up','2014-09-03 19:14:21','root','success'),(238,'Migration20140515130000ComPublications.php','core/migrations','96f353949933804c367a4a26cef4f2b3','up','2014-09-03 19:14:21','root','success'),(239,'Migration20140519120000ComPublications.php','core/migrations','b3bf1b9b66b602c31c7d8c197a5593fe','up','2014-09-03 19:14:21','root','success'),(240,'Migration20140520200100ComUpdate.php','core/migrations','db6330986e43897a207b2a69d269ef46','up','2014-09-03 19:14:21','root','success'),(241,'Migration20140521141237ComNewsletter.php','core/migrations','5d3f829341d20dc72f3343e149244196','up','2014-09-03 19:14:21','root','success'),(242,'Migration20140521145232ComUsers.php','core/migrations','db1153ac28ecaca9e82b139a165458a9','up','2014-09-03 19:14:21','root','success'),(243,'Migration20140522100120PlgContentAntispam.php','core/migrations','3fec3a3a2fe8f6e688d8efb5a00b9935','up','2014-09-03 19:14:21','root','success'),(244,'Migration20140528145010ComRegister.php','core/migrations','3d0c48b1d3b1b78b078de325e01f929c','up','2014-09-03 19:14:21','root','success'),(245,'Migration20140529150000PlgMembersImpact.php','core/migrations','2c27e581ce5ee2757365895dfc2798b7','up','2014-09-03 19:14:22','root','success'),(246,'Migration20140529172125ComCourses.php','core/migrations','4cceede5063636ba9a894a96eb3fb549','up','2014-09-03 19:14:22','root','success'),(247,'Migration20140529192810ComCourses.php','core/migrations','d5faed53d7a308b544bf0e425fce3eeb','up','2014-09-03 19:14:22','root','success'),(248,'Migration20140603164434ComCourses.php','core/migrations','50170eb0e00664f571a656917862a52b','up','2014-09-03 19:14:22','root','success'),(249,'Migration20140605155804ComPublications.php','core/migrations','8af3b556322071425499649275e812a1','up','2014-09-03 19:14:22','root','success'),(250,'Migration20140606165053ComCourses.php','core/migrations','a686ee88116241670c9ea552af41e6ca','up','2014-09-03 19:14:22','root','success'),(251,'Migration20140609160011ComFeedback.php','core/migrations','99a67a2164361ff55c8c5f980dc09e44','up','2014-09-03 19:14:22','root','success'),(252,'Migration20140611102711ComCourses.php','core/migrations','7fc25caf3cfc2d18cbd2791b2be77e18','up','2014-09-03 19:14:22','root','success'),(253,'Migration20140611141603ComMembers.php','core/migrations','6252ca878b3c587d6ffe57303e6a24e0','up','2014-09-03 19:14:22','root','success'),(254,'Migration20140617153609ComTools.php','core/migrations','74d7bf2ef154f6448de7779141d4f54d','up','2014-09-03 19:14:22','root','success'),(255,'Migration20140623144900Core.php','core/migrations','9234d45e7361dcb8c4ecd7e4bb6ca77e','up','2014-09-03 19:14:22','root','success'),(256,'Migration20140624123157ComCitations.php','core/migrations','353651b7f7ba15800ae04290c240e4ff','up','2014-09-03 19:14:22','root','success'),(257,'Migration20140626100712PlgPublicationsGroups.php','core/migrations','843ac717207969fbc2124440bec55b93','up','2014-09-03 19:14:22','root','success'),(258,'Migration20140626155344ComUsers.php','core/migrations','cad0b846df2907cb0986f72426960d59','up','2014-09-03 19:14:22','root','success'),(259,'Migration20140627062357ComSupport.php','core/migrations','0e26ff5d015903a447ee39d89c9d46d4','up','2014-09-03 19:14:22','root','success'),(260,'Migration20140627091431ComSupport.php','core/migrations','817a8df1de833da30556dabef799266a','up','2014-09-03 19:14:22','root','success'),(261,'Migration20140627140011PlgResourcesReviews.php','core/migrations','e8427197e87ff3104f39fed8ee4f236e','up','2014-09-03 19:14:22','root','success'),(262,'Migration20140630084843ComCollections.php','core/migrations','dd4b14226292191927e8fba24006d2fb','up','2014-09-03 19:14:22','root','success'),(263,'Migration20140702071151ComBlog.php','core/migrations','da2a6aae5e9a318dcf29bc0d35bb64f5','up','2014-09-03 19:14:22','root','success'),(264,'Migration20140702115751ComForum.php','core/migrations','e0329449772180a87e8622a58cc01d3a','up','2014-09-03 19:14:22','root','success'),(265,'Migration20140702122251ComKb.php','core/migrations','1507677f5be9b06980ae4532d9ab4d1a','up','2014-09-03 19:14:22','root','success'),(266,'Migration20140702130951ComAnswers.php','core/migrations','ccd4fb8b9bd1f58935424989101a8e83','up','2014-09-03 19:14:22','root','success'),(267,'Migration20140702160951ComWishlist.php','core/migrations','166dde2a5560e6fded28b000593d2927','up','2014-09-03 19:14:22','root','success'),(268,'Migration20140703083327PlgResourcesReviews.php','core/migrations','6988d49f341dea191a049b6595763448','up','2014-09-03 19:14:22','root','success'),(269,'Migration20140703100727ComWiki.php','core/migrations','3b98a99fc27b7700708c912a14e3f591','up','2014-09-03 19:14:22','root','success'),(270,'Migration20140703163627PlgXmessageHandler.php','core/migrations','0edf3a6d6c02c5b425670c3a8718cf86','up','2014-09-03 19:14:22','root','success'),(271,'Migration20140709144527ComTags.php','core/migrations','f567d99d34b774bf0248e8016ca028dd','up','2014-09-03 19:14:22','root','success'),(272,'Migration20140709174727ModSupportactivity.php','core/migrations','05c8188c1dbddebe55a30aa7706ae54a','up','2014-09-03 19:14:22','root','success'),(273,'Migration20140714201025ComTime.php','core/migrations','2b4611b62bea6af6464dc0fa44040fe9','up','2014-09-03 19:14:22','root','success'),(274,'Migration20140716180300ComTools.php','core/migrations','f4bea1a995cfc0ba595097c344157115','up','2014-09-03 19:14:22','root','success'),(275,'Migration20140716182939Core.php','core/migrations','9a4f6fbf07cc092cf3c1b20730d20986','up','2014-09-03 19:14:22','root','success'),(276,'Migration20140721163818PlgTimeSummary.php','core/migrations','b87e562c9585c145c186c64659484db0','up','2014-09-03 19:14:22','root','success'),(277,'Migration20140722152439PlgAuthenticationHubzero.php','core/migrations','a03d6caa952a5f104974c820cf2056e1','up','2014-09-03 19:14:22','root','success'),(278,'Migration20140730153624ComUsers.php','core/migrations','fe303201fcbf7682e0ff3868eb00cfa9','up','2014-09-03 19:14:22','root','success'),(279,'Migration20140730181124PlgSystemHubzero.php','core/migrations','258f930c1046bc28433c552b93ede87e','up','2014-09-03 19:14:22','root','success'),(280,'Migration20140804153815Core.php','core/migrations','d91c99665160703676594596f4afaa29','up','2014-09-03 19:14:22','root','success'),(281,'Migration20140805185942ComMembers.php','core/migrations','94582da6a04ca7a0f6c4dc5f3cab7fb7','up','2014-09-03 19:14:22','root','success'),(282,'Migration20140805223444PlgGroupsBlog.php','core/migrations','67b85bdcb3f56032c473a3bb363465f0','up','2014-09-03 19:14:22','root','success'),(283,'Migration20140807143056ComMembers.php','core/migrations','8ea6301855f4704e70dd5d99435b1d0a','up','2014-09-03 19:14:22','root','success'),(284,'Migration20140807200026ComTime.php','core/migrations','db0002cf6ef15caf4f669aefb04a1353','up','2014-09-03 19:14:22','root','success'),(285,'Migration20140808195514ComTools.php','core/migrations','cc6ca2062f8b12869a1add55702c8b38','up','2014-09-03 19:14:22','root','success'),(286,'Migration20140813132614ComSupport.php','core/migrations','a0693170b8d8fc36659d186f961abb11','up','2014-09-03 19:14:22','root','success'),(287,'Migration20140813200031ComTools.php','core/migrations','e6565c74ce47739656b07aec9eeb6ba7','up','2014-09-03 19:14:22','root','success'),(288,'Migration20140814103014ComSupport.php','core/migrations','f42305fa77a0e85568fb24d3a32d36a4','up','2014-09-03 19:14:22','root','success'),(289,'Migration20140815061927ComSupport.php','core/migrations','a1d1ec3a729db33aa390b3f8c3069758','up','2014-09-03 19:14:23','root','success'),(290,'Migration20140815153140ComCourses.php','core/migrations','a433fa0af47d680ef8ec213e83a8c847','up','2014-09-03 19:14:23','root','success'),(291,'Migration20140818160255ComCitations.php','core/migrations','ed6748169df1d72672f641e6a3bcd3d6','up','2014-09-03 19:14:23','root','success'),(292,'Migration20140818160800ComSupport.php','core/migrations','e2834c531541bf93cc90e814add67a87','up','2014-09-03 19:14:23','root','success'),(293,'Migration20140818161500ComWishlist.php','core/migrations','f02263b0feb1c447629c1c3829d3059c','up','2014-09-03 19:14:23','root','success'),(294,'Migration20140818162220PlgTools.php','core/migrations','c1d7842636858e67d870f70c3c8c0ea5','up','2014-09-03 19:14:23','root','success'),(295,'Migration20140820171853ComEvents.php','core/migrations','b89c1b0b9a8b16acbb1c47e1abbfe452','up','2014-09-03 19:14:23','root','success'),(296,'Migration20140822132824ComUsers.php','core/migrations','b85443253a106a48485b00920d2fd386','up','2014-09-03 19:14:23','root','success'),(297,'Migration20140822153500PlgGroupsAnnouncements.php','core/migrations','c3022825b4ad406e7fd2cdbeae742e32','up','2014-09-03 19:14:23','root','success'),(298,'Migration20140822154400ComAnswers.php','core/migrations','a57759bfcbf23cbcc212f69464f769f8','up','2014-09-03 19:14:23','root','success'),(299,'Migration20140822154900ComBlog.php','core/migrations','6b7c9403edb226c9a0ad9ab8d64696d1','up','2014-09-03 19:14:23','root','success'),(300,'Migration20140822155500ComCollections.php','core/migrations','805e29f0df7e534634560e633d0b266d','up','2014-09-03 19:14:23','root','success'),(301,'Migration20140822155900ComCron.php','core/migrations','d6587c72ba29ec626972a1e509d11075','up','2014-09-03 19:14:23','root','success'),(302,'Migration20140822161100ComKb.php','core/migrations','185c7472518d0d76a3c520f1660fb219','up','2014-09-03 19:14:23','root','success'),(303,'Migration20140822161900PlgHubzeroComments.php','core/migrations','261fa5ec4534dceefa4c24a8f4dc3d43','up','2014-09-03 19:14:23','root','success'),(304,'Migration20140822203559ComPoll.php','core/migrations','c9594778fb9517a755c2a9cfad8d4294','up','2014-09-03 19:14:23','root','success'),(305,'Migration20140826120656ComEvents.php','core/migrations','3acd83ed9bc788374e22ce4f34484060','up','2014-09-03 19:14:23','root','success'),(306,'Migration20140827100656ComPublications.php','core/migrations','d2f3fce7ac5706f8ac30279937ba732d','up','2014-09-03 19:14:23','root','success'),(307,'Migration20140828150712PlgWhatsnewPublications.php','core/migrations','a255521250e0c84bc4534cabe32812d6','up','2014-09-03 19:14:23','root','success'),(308,'Migration20140829131016PlgMembersDashboard.php','core/migrations','0692e180dba74d8c185ec0d6baeee077','up','2014-09-03 19:14:23','root','success'),(309,'Migration20140829131400PlgMembersMessages.php','core/migrations','c1aa60f4d2fa2c9786a45fc8cd01b1e5','up','2014-09-03 19:14:23','root','success'),(310,'Migration20140829132200ComWiki.php','core/migrations','d76e6cd1dcee33d4313bc6ed13f8b382','up','2014-09-03 19:14:23','root','success'),(311,'Migration20140829142600ComCollections.php','core/migrations','e016899c6034e9663e9fbb6c15f20de5','up','2014-09-03 19:14:23','root','success'),(312,'Migration20140904174546ComKb.php','core/migrations','fad15f5c5ceda64f022ef1bc75ada55f','up','2014-09-20 17:22:57','root','success'),(313,'Migration20140922135214Core.php','core/migrations','e506b37f04680b0540937b984991a0e6','up','2014-09-22 13:55:41','root','success'),(314,'Migration20140925213032ComTools.php','core/migrations','82a01d29182bff4ebaf08f0ad246dc07','up','2014-09-25 21:37:26','root','success'),(315,'Migration20140806131000ModLogged.php','core/migrations','d3336ff30569e7e393b3f6980a8e4d5b','up','2015-03-11 18:27:58','root','success'),(316,'Migration20140806144415ModStatus.php','core/migrations','f1cbb8a833daf28fefa80fc1c5c2152c','up','2015-03-11 18:27:58','root','success'),(317,'Migration20140806152408ModXwhosonline.php','core/migrations','0f0b4fc4be20cb5c542981b00a2ebc05','up','2015-03-11 18:27:58','root','success'),(318,'Migration20140806152610ModWhosonline.php','core/migrations','4224376fae89a7ee9a4b4060c76e7534','up','2015-03-11 18:27:58','root','success'),(319,'Migration20140908193005ComGroups.php','core/migrations','c798006901f098f50162243719e6c374','up','2015-03-11 18:27:58','root','success'),(320,'Migration20140916140933ComCitations.php','core/migrations','2184572bcfa657e5f65614041f1fecb7','up','2015-03-11 18:27:58','root','success'),(321,'Migration20141004111111ComCitations.php','core/migrations','77a8c0db26a1dce7e445270c48a2d67c','up','2015-03-11 18:27:58','root','success'),(322,'Migration20141009072712ModCollect.php','core/migrations','d7252bc36b233d6cc9f32b4b9ad72f4f','up','2015-03-11 18:27:58','root','success'),(323,'Migration20141009154241Core.php','core/migrations','266dfbd2cf503c9982efa76afc4494ae','up','2015-03-11 18:27:58','root','success'),(324,'Migration20141009171309ComTools.php','core/migrations','d8920f3de4ff60bb08640ca63fc2ffeb','up','2015-03-11 18:27:58','root','success'),(325,'Migration20141009175833ComCourses.php','core/migrations','91229fd432bdf2c41346482660ecbd74','up','2015-03-11 18:27:58','root','success'),(326,'Migration20141009182840ComAnswers.php','core/migrations','4a3af152265b83bb2821fa58ea82a352','up','2015-03-11 18:27:58','root','success'),(327,'Migration20141009203743ComBlog.php','core/migrations','a1761e5e9aa9ebba1e3c7a47f7a7d852','up','2015-03-11 18:27:58','root','success'),(328,'Migration20141009204207ComSupport.php','core/migrations','aaff0924c1eaf0c8c30ff50202c7d90d','up','2015-03-11 18:27:58','root','success'),(329,'Migration20141009205234ComTags.php','core/migrations','bd6342b4aaddec878c7572db1052d768','up','2015-03-11 18:27:58','root','success'),(330,'Migration20141009205422ComUsers.php','core/migrations','ec12d6e3ea94ba699d83caf7cb8482e2','up','2015-03-11 18:27:58','root','success'),(331,'Migration20141010090013Imports.php','core/migrations','f056970e147c54681637dcf024a0e296','up','2015-03-11 18:27:58','root','success'),(332,'Migration20141010150100ComSupport.php','core/migrations','5cab691ac534cc5ba0954b5381745fd4','up','2015-03-11 18:27:58','root','success'),(333,'Migration20141021161308Core.php','core/migrations','aafdbc4dcfedf81e5c99bbf28dbd1d6a','up','2015-03-11 18:27:58','root','success'),(334,'Migration20141021164246Core.php','core/migrations','65dd11945ca90ba14914b1d427354f7d','up','2015-03-11 18:27:58','root','success'),(335,'Migration20141022103600PlgResourcesAbout.php','core/migrations','1ae4912f7423e56787787c01770f267c','up','2015-03-11 18:27:58','root','success'),(336,'Migration20141022110100ComSupport.php','core/migrations','741910662755b8adbeb659100c796291','up','2015-03-11 18:27:58','root','success'),(337,'Migration20141028094100ComPublications.php','core/migrations','359c6287a4f030e26bc9a8b8e3de6601','up','2015-03-11 18:27:58','root','success'),(338,'Migration20141029112543ComBlog.php','core/migrations','5ff8cdcb6d65bc027ae7d2f27d34549c','up','2015-03-11 18:27:58','root','success'),(339,'Migration20141029174920PlgUserContactcreator.php','core/migrations','8f7bc39fae673f4b6456f13b7df2dec1','up','2015-03-11 18:27:58','root','success'),(340,'Migration20141029185515Core.php','core/migrations','a72c8da3cfc0c7cf6c2f846bde6c3874','up','2015-03-11 18:27:58','root','success'),(341,'Migration20141029192338ComOaipmh.php','core/migrations','aad2f33356f1f29a5e426ab46701f01b','up','2015-03-11 18:27:58','root','success'),(342,'Migration20141029193053Core.php','core/migrations','c063aa10d5260cbcaf68736730a221c8','up','2015-03-11 18:27:58','root','success'),(343,'Migration20141030163700ComBlog.php','core/migrations','de1db44ab8206f1392d0bbacebf1a9f8','up','2015-03-11 18:27:58','root','success'),(344,'Migration20141105073734ComTags.php','core/migrations','e7aaff5113478454ef4c1c5a75768cac','up','2015-03-11 18:27:58','root','success'),(345,'Migration20141105142938ComUpdate.php','core/migrations','8dfaad338ffbb8578bb93b60ba97001b','up','2015-03-11 18:27:58','root','success'),(346,'Migration20141105145512PlgSystemIndent.php','core/migrations','fa35cc34d81489e70c9992a4428c86fd','up','2015-03-11 18:27:58','root','success'),(347,'Migration20141106184927PlgTimeCsv.php','core/migrations','66d6da14ab5ba3cda744c199b9ae63ad','up','2015-03-11 18:27:58','root','success'),(348,'Migration20141106202312ModCourses.php','core/migrations','94079e71e289698c6d93447a4ece532e','up','2015-03-11 18:27:58','root','success'),(349,'Migration20141110143234ComMembers.php','core/migrations','5bce1ba1bab1fd9d33e201552c63258a','up','2015-03-11 18:27:58','root','success'),(350,'Migration20141110232014ComMembers.php','core/migrations','5a0bc1557226c2637239e47689705f72','up','2015-03-11 18:27:58','root','success'),(351,'Migration20141111193301ComCollections.php','core/migrations','9fcb35dba181b441ef3a389e4d512759','up','2015-03-11 18:27:59','root','success'),(352,'Migration20141112142733ComCourses.php','core/migrations','a7cceb9d418e29ccf315414a38e16e8b','up','2015-03-11 18:27:59','root','success'),(353,'Migration20141112191247ComCourses.php','core/migrations','cf00988db7845167156ef18bd1975f9a','up','2015-03-11 18:27:59','root','success'),(354,'Migration20141112203625ComHubgraph.php','core/migrations','769025425da5df639fbca6126868dcae','up','2015-03-11 18:27:59','root','success'),(355,'Migration20141112203716ComResources.php','core/migrations','c749be411eaefcb82a7ecb166e8bcc97','up','2015-03-11 18:27:59','root','success'),(356,'Migration20141113215958ComCourses.php','core/migrations','b9c28008ab5fb91685d9b2e1b15482d8','up','2015-03-11 18:27:59','root','success'),(357,'Migration20141113222151ComCourses.php','core/migrations','4529429f38ea90ed6e21ec5bb4675568','up','2015-03-11 18:27:59','root','success'),(358,'Migration20141114195247ComHubgraph.php','core/migrations','1afdf2463f9863e732996d5265cde4f0','up','2015-03-11 18:27:59','root','success'),(359,'Migration20141114195313ComGroups.php','core/migrations','d17541b932134c69a8fb4eaa73b6f478','up','2015-03-11 18:27:59','root','success'),(360,'Migration20141117095313ComPublications.php','core/migrations','98b5c3f54bad9c387dabdc783fd755d1','up','2015-03-11 18:27:59','root','success'),(361,'Migration20141119145715ComUsers.php','core/migrations','57ecbec1f4c98511f9023e15eb330759','up','2015-03-11 18:27:59','root','success'),(362,'Migration20141119164113ComPublications.php','core/migrations','d0500db38342cacc04767348f1d3d97b','up','2015-03-11 18:27:59','root','success'),(363,'Migration20141119180000ComCitations.php','core/migrations','70e0785ad2bf3e253852b698feceb326','up','2015-03-11 18:27:59','root','success'),(364,'Migration20141120161609ComTime.php','core/migrations','22871ebccbc2ab011cd331ec3f18716a','up','2015-03-11 18:27:59','root','success'),(365,'Migration20141120215253ComHubgraph.php','core/migrations','8c97bbc1f873d68e01fe0fa9b798300b','up','2015-03-11 18:27:59','root','success'),(366,'Migration20141121132012ModMytodos.php','core/migrations','40a5430e75bd2c6ce2ae8e864385ead0','up','2015-03-11 18:27:59','root','success'),(367,'Migration20141121144051ComCollections.php','core/migrations','6da5ce15d1e83db00726d68c7491a227','up','2015-03-11 18:27:59','root','success'),(368,'Migration20141201142000PlgGroupsCitations.php','core/migrations','0401f306afe24358570b870ffe7ae381','up','2015-03-11 18:27:59','root','success'),(369,'Migration20141201151300ComCitations.php','core/migrations','0ddaf7b17d47d6e464771196699bfbe1','up','2015-03-11 18:27:59','root','success'),(370,'Migration20141201170547ComGroups.php','core/migrations','014416e087852fb24f13d9e42b016cf9','up','2015-03-11 18:27:59','root','success'),(371,'Migration20141202211549PlgMembersDashboard.php','core/migrations','2b01589053818e07fc3c308a97593b6a','up','2015-03-11 18:27:59','root','success'),(372,'Migration20141212142300ComCitations.php','core/migrations','65f2c83cc61a42f5c110eca0f6387545','up','2015-03-11 18:27:59','root','success'),(373,'Migration20141215165100ComCitations.php','core/migrations','b7723a5de312764f31b1ed571e0df663','up','2015-03-11 18:27:59','root','success'),(374,'Migration20141222135427ComTags.php','core/migrations','22388935f56d35b6e14732adc50e1d7c','up','2015-03-11 18:27:59','root','success'),(375,'Migration20150105220027ComWiki.php','core/migrations','7c1792a855e9351a3dc9f4c5ea91f071','up','2015-03-11 18:27:59','root','success'),(376,'Migration20150106211443ComCollections.php','core/migrations','392104429eefbbf5e8a693feb52b7aa0','up','2015-03-11 18:27:59','root','success'),(377,'Migration20150107021244PlgHubzeroRecaptcha.php','core/migrations','9c574e6f61fa87187f3bcbb600ea22bf','up','2015-03-11 18:27:59','root','success'),(378,'Migration20150107022822PlgHubzeroRecaptcha.php','core/migrations','8b4186db09388c1631046992127871f8','up','2015-03-11 18:27:59','root','success'),(379,'Migration20150108140000ComCitations.php','core/migrations','66e38b1fbc1cd62cc9430f3090c712e5','up','2015-03-11 18:27:59','root','success'),(380,'Migration20150108152843ComSupport.php','core/migrations','49dd52a49020910d3fdd9189633492a1','up','2015-03-11 18:27:59','root','success'),(381,'Migration20150109180705ComUsers.php','core/migrations','b2a566296ad95342844bcf9ca9cd0564','up','2015-03-11 18:27:59','root','success'),(382,'Migration20150109200952ComUsers.php','core/migrations','bcf46b62da94160f54a60c6126149c83','up','2015-03-11 18:27:59','root','success'),(383,'Migration20150112212929PlgSystemCertificate.php','core/migrations','e8b35023446a72b47095e73307615fbe','up','2015-03-11 18:27:59','root','success'),(384,'Migration20150112212939PlgAuthenticationCertificate.php','core/migrations','47956a5ca948992d8112b1e596639f6d','up','2015-03-11 18:27:59','root','success'),(385,'Migration20150115234546PlgGroupsWishlist.php','core/migrations','909802a145fd15f485c31b77587fbc2c','up','2015-03-11 18:27:59','root','success'),(386,'Migration20150116111000ComPublications.php','core/migrations','d2d4a2d9d00f9903e09f8dad3582016a','up','2015-03-11 18:27:59','root','success'),(387,'Migration20150119120000ModMycuration.php','core/migrations','d0acc6307e03d5719f232e957e7258c2','up','2015-03-11 18:27:59','root','success'),(388,'Migration20150122165523ComSupport.php','core/migrations','90e7b0504a5370f7d8ae3868b26c923c','up','2015-03-11 18:27:59','root','success'),(389,'Migration20150122170000ComPublications.php','core/migrations','c481f07903d82e600ac0a4eb2dc49f80','up','2015-03-11 18:27:59','root','success'),(390,'Migration20150123133439PlgUserMiddleware.php','core/migrations','adf157b0c8e08f0c2e917bc2663281d1','up','2015-03-11 18:27:59','root','success'),(391,'Migration20150123134039ComMembers.php','core/migrations','1e4c65d58e9d1a280e823dabc613fc0d','up','2015-03-11 18:27:59','root','success'),(392,'Migration20150126193709ComWishlist.php','core/migrations','94462325a8d030e6c580348fd9360801','up','2015-03-11 18:27:59','root','success'),(393,'Migration20150204181025ComMembers.php','core/migrations','a6f908df1df77d64de86d03af5d217a1','up','2015-03-11 18:27:59','root','success'),(394,'Migration20150210234536ComMembers.php','core/migrations','8c13afc1ccc5a5462673f7434c481a2b','up','2015-03-11 18:27:59','root','success'),(395,'Migration20150211164131ComUsers.php','core/migrations','55bd298d7212c9527670a1fa7e8425fe','up','2015-03-11 18:27:59','root','success'),(396,'Migration20150218105200PlgGroupsForum.php','core/migrations','5a9e6c935ee10e5aaac6822e87b9596e','up','2015-03-11 18:27:59','root','success'),(397,'Migration20150218180139PlgOaipmh.php','core/migrations','d659d80c45c822aa7265c4e7d49745db','up','2015-03-11 18:27:59','root','success'),(398,'Migration20150218183139ComMenus.php','core/migrations','8aa17d17c4851ba39b66c4a34a05f391','up','2015-03-11 18:27:59','root','success'),(399,'Migration20150224205200PlgContent.php','core/migrations','51f3a4e61c040708ab7bfd5cc81d3a38','up','2015-03-11 18:27:59','root','success'),(400,'Migration20150225144415PlgUserGeo.php','core/migrations','533642c67319a2e06a4f92a55d60e971','up','2015-03-11 18:27:59','root','success'),(401,'Migration20150225150953ComTools.php','core/migrations','af44b4ad0ed116fd5cbeced64e8e70df','up','2015-03-11 18:27:59','root','success'),(402,'Migration20150305100000ComPublications.php','core/migrations','d188399b3df2b5e17e666e1560fc028b','up','2015-03-11 18:27:59','root','success'),(403,'Migration20150109190645ComTime.php','core/migrations','2d5d7e7c586d9efce5978f912a72156a','up','2015-09-13 18:36:53','root','success'),(404,'Migration20150113125313ComPublications.php','core/migrations','a19f616edd8dc34ee2445ea88ac37795','up','2015-09-13 18:36:53','root','success'),(405,'Migration20150113130000ComPublications.php','core/migrations','c6be18d592f3c97c10e09621473a2a3a','up','2015-09-13 18:36:53','root','success'),(406,'Migration20150113134000ComPublications.php','core/migrations','23ab8404887a332d2f43e2f14aabc7f8','up','2015-09-13 18:36:53','root','success'),(407,'Migration20150114122012ModTagcloud.php','core/migrations','54ebbf01eae2dedb8d2db03b9c4868ef','up','2015-09-13 18:36:53','root','success'),(408,'Migration20150121104223ModMenu.php','core/migrations','32bef1ccaf3cd4bfdc8441733265fd33','up','2015-09-13 18:36:53','root','success'),(409,'Migration20150202134839PlgAntispam.php','core/migrations','9d61b0b11025e716268aada83362fdb2','up','2015-09-13 18:36:53','root','success'),(410,'Migration20150206191525ComRedirect.php','core/migrations','5e23fb3b89ad17c269b5b88336afe7d4','up','2015-09-13 18:36:53','root','success'),(411,'Migration20150210203958ComMembers.php','core/migrations','abe693012a30bd15bee23d9797bc583a','up','2015-09-13 18:36:53','root','success'),(412,'Migration20150216135336LibJoomla.php','core/migrations','584640dee0cc8b4021f3109e47158b43','up','2015-09-13 18:36:53','root','success'),(413,'Migration20150216140100ComKb.php','core/migrations','f5bbd3eedd73413cf590aba51185dea7','up','2015-09-13 18:36:53','root','success'),(414,'Migration20150306110808ComBillboards.php','core/migrations','1d624e99cdce6b5a2fe6db1487184ce3','up','2015-09-13 18:36:53','root','success'),(415,'Migration20150306115852ComMembers.php','core/migrations','6caae3b193336fe2eeaa174701308426','up','2015-09-13 18:36:53','root','success'),(416,'Migration20150312120000ComResources.php','core/migrations','cab64f93046fdf9563ee39739ee351c1','up','2015-09-13 18:36:53','root','success'),(417,'Migration20150312140000PlgCronResources.php','core/migrations','45482ff95767fb4f6b4b3b37128a639e','up','2015-09-13 18:36:53','root','success'),(418,'Migration20150317211600ComTools.php','core/migrations','f2ff4739a3e8139994b92242e2899f6a','up','2015-09-13 18:36:53','root','success'),(419,'Migration20150326183839ComTools.php','core/migrations','be06ddd97367b7a147b8e0af2af0a3b9','up','2015-09-13 18:36:53','root','success'),(420,'Migration20150327144022ComStorefront.php','core/migrations','d8b0bbd015369f41469f97c83d2d6c0b','up','2015-09-13 18:36:53','root','success'),(421,'Migration20150330124145Core.php','core/migrations','ae6b2d2c2c972652a15a41b006299df4','up','2015-09-13 18:36:53','root','success'),(422,'Migration20150330140000ComProjects.php','core/migrations','d92911653e688a6a84e47bee7f2ef58f','up','2015-09-13 18:36:53','root','success'),(423,'Migration20150330174214ComTools.php','core/migrations','c679e7f6abfa53b5879cad007b3e1b69','up','2015-09-13 18:36:53','root','success'),(424,'Migration20150401110000ComProjects.php','core/migrations','4421a71b7fa0d1fbe87c4cd9751b11a4','up','2015-09-13 18:36:53','root','success'),(425,'Migration20150402202533ComJoomlaupdate.php','core/migrations','1b7d9c49a05d9b907ff8a24805263c26','up','2015-09-13 18:36:53','root','success'),(426,'Migration20150406140000ComProjects.php','core/migrations','14fcb64f8f24e86c1f6027c1810e4345','up','2015-09-13 18:36:53','root','success'),(427,'Migration20150406184922PlgHubzeroRecaptcha.php','core/migrations','6688ef9f2f2afa684d145c4f72f9ac7e','up','2015-09-13 18:36:53','root','success'),(428,'Migration20150414183059ComTools.php','core/migrations','744c8cdfacd4c3190167f615c46cb6ab','up','2015-09-13 18:36:53','root','success'),(429,'Migration20150421143100PlgTagsCollections.php','core/migrations','cb7dc9593233cb42dc736712f6eae7b8','up','2015-09-13 18:36:53','root','success'),(430,'Migration20150421213243PlgSystemAuthfactors.php','core/migrations','af9230023960e4b16f583915c9e458e9','up','2015-09-13 18:36:53','root','success'),(431,'Migration20150421213254PlgAuthfactorsCertificate.php','core/migrations','3f227f250c8aa1e0378e4f5bfe0146b9','up','2015-09-13 18:36:53','root','success'),(432,'Migration20150423035158ComTools.php','core/migrations','57fee87db1caf474330f166fa3e347b4','up','2015-09-13 18:36:53','root','success'),(433,'Migration20150427221158ComSupport.php','core/migrations','ce0c898eb2b7e9bf4281b55469d437d5','up','2015-09-13 18:36:53','root','success'),(434,'Migration20150428103217ComCategories.php','core/migrations','c4ca97811a1696614f1281de6fdd561a','up','2015-09-13 18:36:53','root','success'),(435,'Migration20150428144853ComPdf2form.php','core/migrations','ea936b9abf841ff71b73e7bec5e0bbaf','up','2015-09-13 18:36:53','root','success'),(436,'Migration20150508103212ModMegamenu.php','core/migrations','026cb0c1deddc27b1cd12295a8dee7d0','up','2015-09-13 18:36:53','root','success'),(437,'Migration20150511160714PlgAuthfactorsAuthy.php','core/migrations','32686a82f5f9fdaccfdac75daba31dc4','up','2015-09-13 18:36:53','root','success'),(438,'Migration20150514162230ComGroups.php','core/migrations','e739a36114c257f17295f2c8f5dc3c2b','up','2015-09-13 18:36:53','root','success'),(439,'Migration20150515194608PlgCronForum.php','core/migrations','64d83e38921382f46cb6dff5d5098b05','up','2015-09-13 18:36:53','root','success'),(440,'Migration20150518175926PlgMailMandrill.php','core/migrations','0cdc507ef61b9b0717a5765694671553','up','2015-09-13 18:36:53','root','success'),(441,'Migration20150518180000PlgPublicationsWatch.php','core/migrations','074087dc53f2cd9833ec7f8b70eefc03','up','2015-09-13 18:36:53','root','success'),(442,'Migration20150518181100ComPublications.php','core/migrations','f05258eb12c26e3350b0e6cfe019f2bb','up','2015-09-13 18:36:53','root','success'),(443,'Migration20150518190000ComPublications.php','core/migrations','671a422d3481a2cadf4aa3c34fd196f3','up','2015-09-13 18:36:53','root','success'),(444,'Migration20150520110000ComPublications.php','core/migrations','68bbc43e37b7bf7035207ac0c241d04f','up','2015-09-13 18:36:53','root','success'),(445,'Migration20150521144930PlgContentAntispam.php','core/migrations','4ea6d50bdbeb584370076c1e3ef0561c','up','2015-09-13 18:36:53','root','success'),(446,'Migration20150521150730ModWhosonline.php','core/migrations','e3b41718d93024c527efeb313ed03fbd','up','2015-09-13 18:36:53','root','success'),(447,'Migration20150529141543ComCollections.php','core/migrations','93033a76aba81fa92a9aa1cdcfc8dc9e','up','2015-09-13 18:36:53','root','success'),(448,'Migration20150601185958ComSupport.php','core/migrations','99fe48225752fade1bf3e2ac61da8228','up','2015-09-13 18:36:53','root','success'),(449,'Migration20150609125958ComDeveloper.php','core/migrations','6c4cd5af750bfb8c42be5f5e00114c2d','up','2015-09-13 18:36:53','root','success'),(450,'Migration20150610123746ComDeveloper.php','core/migrations','5b4684f4a3580e7fdf95b9e9157af299','up','2015-09-13 18:36:53','root','success'),(451,'Migration20150610140035PlgAntispamBabajispam.php','core/migrations','a7544f3a69ef4ee350a322f67ad508ae','up','2015-09-13 18:36:53','root','success'),(452,'Migration20150612203219Migrations.php','core/migrations','fe81858422d423034108c6146008f833','up','2015-09-13 18:36:53','root','success'),(453,'Migration20150617181839PlgAntispamBlacklist.php','core/migrations','7c94525d4e700ed4d1fb7401096406f7','up','2015-09-13 18:36:53','root','success'),(454,'Migration20150623105812Mod.php','core/migrations','a27797b893cd3e6a9c5a9ee8fa987e73','up','2015-09-13 18:36:53','root','success'),(455,'Migration20150623144037ComUsers.php','core/migrations','e50d647fcd2b95eee7c0d72db24126be','up','2015-09-13 18:36:53','root','success'),(456,'Migration20150623152144ComDeveloper.php','core/migrations','a0a0aab82bb075b6ea340d6b5f1b36d9','up','2015-09-13 18:36:53','root','success'),(457,'Migration20150623155836PlgSystemSpamjail.php','core/migrations','baabf7b43b62d946dc5f61e2af21fe9a','up','2015-09-13 18:36:53','root','success'),(458,'Migration20150624125940TplKameleonSite.php','core/migrations','4154a51772a466ba289595d1a018ad44','up','2015-09-13 18:36:53','root','success'),(459,'Migration20150624164611TplHubbasicadmin.php','core/migrations','d34808a91263e3f631284f46d0b68125','up','2015-09-13 18:36:53','root','success'),(460,'Migration20150624171211TplHubbasic.php','core/migrations','3988b97c8298cc82a3cc93bafb16c459','up','2015-09-13 18:36:53','root','success'),(461,'Migration20150625010817PlgSystemUserconsent.php','core/migrations','5fbf26a47e49c848522a3e23d8fa9ec4','up','2015-09-13 18:36:53','root','success'),(462,'Migration20150626141512Core.php','core/migrations','0b465f18611d0acc93877111a9978280','up','2015-09-13 18:36:53','root','success'),(463,'Migration20150626173412PlgSystemPassword.php','core/migrations','fc21556a21e0975ef6208972845360d3','up','2015-09-13 18:36:53','root','success'),(464,'Migration20150626190717PlgSystemUnapproved.php','core/migrations','d531988d7995913e53f83963d443c3ed','up','2015-09-13 18:36:53','root','success'),(465,'Migration20150629100000ComGeosearch.php','core/migrations','411de4cfd8953e86f4b90cf72e78f4a2','up','2015-09-13 18:36:53','root','success'),(466,'Migration20150630192615PlgSystemUnconfirmed.php','core/migrations','6492df4460fad5930dcb28aa3dc9ae80','up','2015-09-13 18:36:53','root','success'),(467,'Migration20150630195749PlgSystemIncomplete.php','core/migrations','992c2a1b04437716f571e68ddd8c32c0','up','2015-09-13 18:36:53','root','success'),(468,'Migration20150630201210Core.php','core/migrations','f8c6422873c6f0f8d3cae740ef948cb7','up','2015-09-13 18:36:53','root','success'),(469,'Migration20150701060000PlgMembersTodo.php','core/migrations','383bf299a95212e4a74f72d57a3e07f6','up','2015-09-13 18:36:53','root','success'),(470,'Migration20150706163604PlgAuthenticationOrcid.php','core/migrations','a8ce3531f2dae9436a67f154e7617b44','up','2015-09-13 18:36:53','root','success'),(471,'Migration20150715123430ComAnswers.php','core/migrations','a8d9eb378303ca6b033d581a23a2f8e2','up','2015-09-13 18:36:53','root','success'),(472,'Migration20150717100000PlgProjectsWatch.php','core/migrations','e1ea23763eabd685297ac37f894fdbfd','up','2015-09-13 18:36:53','root','success'),(473,'Migration20150720105039PlgAntispam.php','core/migrations','ee6ad0ca78b91298a8c06f3a17acf53b','up','2015-09-13 18:36:53','root','success'),(474,'Migration20150721135541ComUsers.php','core/migrations','cb9dc8261592e594ec2a5f023bf98535','up','2015-09-13 18:36:53','root','success'),(475,'Migration20150722080000ComPublications.php','core/migrations','c8041d6a43f19c9abff313a99b994f5d','up','2015-09-13 18:36:53','root','success'),(476,'Migration20150722090000ComPublications.php','core/migrations','d1a39d83f00cc74b8f22b92e52e9f979','up','2015-09-13 18:36:53','root','success'),(477,'Migration20150722155100PlgCronGeosearch.php','core/migrations','5966f7070882affd3916c600c620e00e','up','2015-09-13 18:36:53','root','success'),(478,'Migration20150813115100PlgSystemMemberhome.php','core/migrations','f4770946c33288d942d303a7fe5f706c','up','2015-09-13 18:36:53','root','success'),(479,'Migration20150814194700PlgMembersCitations.php','core/migrations','42e2432c289ad49ba4dcc7ea82274400','up','2015-09-13 18:36:53','root','success'),(480,'Migration20150820154213ComCitations.php','core/migrations','3d6de043dca0280c5db3b6a9b2a9a2ed','up','2015-09-13 18:36:53','root','success'),(481,'Migration20150821152140TplKimeraSite.php','core/migrations','ae729fc22f058bd7c9c32571aca47ab2','up','2015-09-13 18:36:53','root','success'),(482,'Migration20150901115230ComResources.php','core/migrations','13dd7d4a45bf60527927cf60db66905a','up','2015-09-13 18:36:53','root','success'),(483,'Migration20150901171816PlgContentOpengraph.php','core/migrations','51b1ddd79b3f341dc43b273abc9df896','up','2015-09-13 18:36:53','root','success'),(484,'Migration20150902104232ComContent.php','core/migrations','abf87c1f9bbddbe6ff178dfaa79a843f','up','2015-09-13 18:36:53','root','success'),(485,'Migration20150902133259ComJobs.php','core/migrations','d4ed9f3261f2b5bf4381f43f0398549f','up','2015-09-13 18:36:53','root','success'),(486,'Migration20150904102958ComGeoSearch.php','core/migrations','199addbd61392c440ab9bc5ce3adb9ee','up','2015-09-13 18:36:53','root','success'),(487,'Migration20150904103241Extensions.php','core/migrations','0777e674af1dc1eebfae850e382f4b7c','up','2015-09-13 18:36:53','root','success'),(488,'Migration20150904201013PlgFilesystemLocal.php','core/migrations','90cf66cf4d2863e93da43652c60c12aa','up','2015-09-13 18:36:53','root','success'),(489,'Migration20150904235936ComUsage.php','core/migrations','bdc540f02efd37282cf4068cd94f9cd9','up','2015-09-13 18:36:54','root','success'),(490,'Migration20150331131922PlgAuthenticationShibboleth.php','core/migrations','9c6e32740387aeecd5eb33982e567f77','up','2016-04-09 19:48:08','vagrant','success'),(491,'Migration20150918121036ComMembers.php','core/migrations','1258214211812f9ed4b17afcfb017674','up','2016-04-09 19:48:08','vagrant','success'),(492,'Migration20151004090000ComPublications.php','core/migrations','efb09d8edacf229233b8d6c28b717aa7','up','2016-04-09 19:48:08','vagrant','success'),(493,'Migration20151006204314Core.php','core/migrations','b68ddf734e892565232ed0f37f2e84bf','up','2016-04-09 19:48:08','vagrant','success'),(494,'Migration20151014171203Core.php','core/migrations','3489266d5fe35f88b5edc378df46b4c5','up','2016-04-09 19:48:08','vagrant','success'),(495,'Migration20151026173235ComKb.php','core/migrations','cde73fb0c89dcf836f1a5ab2cb0f5db5','up','2016-04-09 19:48:09','vagrant','success'),(496,'Migration20151028151331ComGeosearch.php','core/migrations','ab29bdee66bf4e0d891218d3ad865dde','up','2016-04-09 19:48:09','vagrant','success'),(497,'Migration20151030150411ComProjects.php','core/migrations','295754c54dda38a8575865fe29850491','up','2016-04-09 19:48:09','vagrant','success'),(498,'Migration20151105145500PlgGroupsFiles.php','core/migrations','66454b13cf0b239f909268756de8c19f','up','2016-04-09 19:48:09','vagrant','success'),(499,'Migration20151106141855ComPublications.php','core/migrations','fae2cd04ea4cd158babed93b692244d3','up','2016-04-09 19:48:09','vagrant','success'),(500,'Migration20151116000001ComCart.php','core/migrations','10cf51a7a71a1e95bfdcbdcbc8208d23','up','2016-04-09 19:48:09','vagrant','success'),(501,'Migration20151202000001ComCart.php','core/migrations','56f1f63699fac6dbd11038f16e4cc35f','up','2016-04-09 19:48:09','vagrant','success'),(502,'Migration20151215155336ComSupport.php','core/migrations','7bef06c215d5a95b764a5f07a3f21ae2','up','2016-04-09 19:48:09','vagrant','success'),(503,'Migration20151216123223PlgUpdateSupport.php','core/migrations','1dbdad667f2ec8706083548c21a74da4','up','2016-04-09 19:48:09','vagrant','success'),(504,'Migration20151216124223PlgUpdateCache.php','core/migrations','fd04d34c7a3c2111dac58434e706836b','up','2016-04-09 19:48:09','vagrant','success'),(505,'Migration20160104220531ModFeedaggregator.php','core/migrations','bc9259ac899c88ff5a275f6761b5bdcc','up','2016-04-09 19:48:09','vagrant','success'),(506,'Migration20160108151435PlgHandlersPdf.php','core/migrations','4be5fd5e08c3ae780e81ff5109474a84','up','2016-04-09 19:48:09','vagrant','success'),(507,'Migration20160108151612PlgHandlersLatex.php','core/migrations','b4f093e34899acfca5730459539c43f4','up','2016-04-09 19:48:09','vagrant','success'),(508,'Migration20160108151659PlgHandlersHubpresenter.php','core/migrations','d1d9e2c676c113d240596d6208327b84','up','2016-04-09 19:48:09','vagrant','success'),(509,'Migration20160111200400ComCitations.php','core/migrations','aca93147213965263e7eb653379213c5','up','2016-04-09 19:48:09','vagrant','success'),(510,'Migration20160129154900ComNewsletter.php','core/migrations','424aa59db15252f7b6d2073a0ca5879c','up','2016-04-09 19:48:09','vagrant','success'),(511,'Migration201602051319501ComGeosearch.php','core/migrations','6cbff663495036de091991d10ed65015','up','2016-04-09 19:48:09','vagrant','success'),(512,'Migration20160205162525Core.php','core/migrations','22bc03a45ad71ba154c699c61006bb01','up','2016-04-09 19:48:09','vagrant','success'),(513,'Migration20160208183103ComFeedaggregator.php','core/migrations','756e294424d6a966c344c10bbc38fd00','up','2016-04-09 19:48:09','vagrant','success'),(514,'Migration20160216115900ComNewsletter.php','core/migrations','20fc142a38df8ef14c2c16216a0778d6','up','2016-04-09 19:48:09','vagrant','success'),(515,'Migration20160217014424ComTools.php','core/migrations','b7fc90f24ecc6b08a916b5f6f46657a2','up','2016-04-09 19:48:09','vagrant','success'),(516,'Migration20160301152243ComNewsletter.php','core/migrations','53adefcaba4606a65dd8f472d40ff431','up','2016-04-09 19:48:09','vagrant','success'),(517,'Migration20160302141138PlgTimeWeeklybar.php','core/migrations','986f54e28dcdd9a41ad71034fd668b28','up','2016-04-09 19:48:09','vagrant','success'),(518,'Migration20160307191342PlgProjectsFiles.php','core/migrations','c406fe79610f94c3cafb4096adbd84be','up','2016-04-09 19:48:09','vagrant','success'),(519,'Migration201603091905401ComNewsletter.php','core/migrations','82f75c718bd8b501e1d5892b1e8244c4','up','2016-04-09 19:48:09','vagrant','success'),(520,'Migration20160321145900ComResources.php','core/migrations','5f258621972b3d9891abad798c746f4e','up','2016-04-09 19:48:09','vagrant','success'),(521,'Migration20160328133847ComCitations.php','core/migrations','385101f483ffe07f5046619748c6ba3f','up','2016-04-09 19:48:09','vagrant','success'),(522,'Migration20160328155038PlgMetadataLocal.php','core/migrations','3fbff2cba64c2dd0898a651f00e50e4c','up','2016-04-09 19:48:09','vagrant','success'),(523,'Migration20160331154738PlgResourcesWindowstools.php','core/migrations','b6e54ef55406483b650335bb8b709e2c','up','2016-04-09 19:48:09','vagrant','success'),(524,'Migration20160401212121PlgTools.php','core/migrations','753c780686fd168d53a497baa9848d59','up','2016-04-09 19:48:09','vagrant','success'),(525,'Migration20150626201931Core.php','core/migrations','3639eb7d34dce84f4315967ec9746c51','up','2017-06-29 02:02:51','root','success'),(526,'Migration20150729164314ComStorefront.php','core/migrations','b86dcf76f12a9aa510e529bfe13958d3','up','2017-06-29 02:02:51','root','success'),(527,'Migration20150826205631PlgResourcesAbout.php','core/migrations','c36b4902e521bfd5c54fabd61bf9d856','up','2017-06-29 02:02:51','root','success'),(528,'Migration20150826208413ComContent.php','core/migrations','ceaaeacf1eaa94807fd3f586571510b0','up','2017-06-29 02:02:51','root','success'),(529,'Migration20150826245312Core.php','core/migrations','f76ab487ed023d50332a354ef2c27761','up','2017-06-29 02:02:51','root','success'),(530,'Migration201508281131531Core.php','core/migrations','7ef10640f0f7bbc86be0ffb261098740','up','2017-06-29 02:02:51','root','success'),(531,'Migration201508281528321Core.php','core/migrations','06cab16d65eb778adbef38038e469d3f','up','2017-06-29 02:02:51','root','success'),(532,'Migration20150916164629ComStorefront.php','core/migrations','e4fd15ee67c92a116f08e316338eeda5','up','2017-06-29 02:02:51','root','success'),(533,'Migration20150923000001ComStorefront.php','core/migrations','ccff232d5053bc3bfb62abd0d7909667','up','2017-06-29 02:02:51','root','success'),(534,'Migration20150924000001ComStorefront.php','core/migrations','df630fc81ba5a8354fe290e33584f1d7','up','2017-06-29 02:02:51','root','success'),(535,'Migration20150924000002ComStorefront.php','core/migrations','0a3ab8cf9f8ca63f499b5e08ca2385e1','up','2017-06-29 02:02:51','root','success'),(536,'Migration20151001185523ComKb.php','core/migrations','7f052909c159f6a2aa62513afce21abf','up','2017-06-29 02:02:51','root','success'),(537,'Migration20151007181841ComBlog.php','core/migrations','5e07b412d19fd1677dcdb1fc57f13ef0','up','2017-06-29 02:02:51','root','success'),(538,'Migration20151023000001ComStorefront.php','core/migrations','182bc2052e755a7a6d93a1de8da2eefe','up','2017-06-29 02:02:51','root','success'),(539,'Migration20151030000001ComCart.php','core/migrations','d7bf8b7abef2d10bc835145c677f93e7','up','2017-06-29 02:02:51','root','success'),(540,'Migration20151118164723ComAnswers.php','core/migrations','af3908fc415bd8188c5675d136ab10a1','up','2017-06-29 02:02:51','root','success'),(541,'Migration20160210031035Core.php','core/migrations','bf724a60ea46374e69cea8e637046532','up','2017-06-29 02:02:51','root','success'),(542,'Migration20160212200400ComTags.php','core/migrations','8060a6f59fd6ac46e4fbfb4191fad657','up','2017-06-29 02:02:51','root','success'),(543,'Migration20160222153539PlgCaptcha.php','core/migrations','8e0104104b45c29013bcc7dcc02ba191','up','2017-06-29 02:02:52','root','success'),(544,'Migration20160322131915PlgFilesystemDropbox.php','core/migrations','b91648cd1885c28c977c7b11667b1b3e','up','2017-06-29 02:02:52','root','success'),(545,'Migration20160324151513PlgFilesystemGithub.php','core/migrations','30366047d12e92b8d13cd92e4de71cc3','up','2017-06-29 02:02:52','root','success'),(546,'Migration20160325174400ComForum.php','core/migrations','517ab68a7c3c33189ed3d20283323863','up','2017-06-29 02:02:52','root','success'),(547,'Migration20160412173638PlgResources.php','core/migrations','70a5bd5db81128b20c8ec6130745a2ce','up','2017-06-29 02:02:52','root','success'),(548,'Migration20160412200438PlgPublications.php','core/migrations','75731716ec6885530e14211190fa9e27','up','2017-06-29 02:02:52','root','success'),(549,'Migration20160412201638PlgResourcesGooglescholar.php','core/migrations','9c04c2dd9ed8a2b50f5db4c176de004b','up','2017-06-29 02:02:52','root','success'),(550,'Migration20160415105038CoreActivity.php','core/migrations','36d5b31334d335a6730715fa16efde43','up','2017-06-29 02:02:52','root','success'),(551,'Migration20160415110900PlgActivity.php','core/migrations','5ac4d83ba21f61872135ea285e3a4761','up','2017-06-29 02:02:52','root','success'),(552,'Migration20160418114900ComCollections.php','core/migrations','bfe406bdef04c3288605e95de9d8b458','up','2017-06-29 02:02:52','root','success'),(553,'Migration20160419144221ComGroups.php','core/migrations','896dee9c0733020b1ba799648d6999d9','up','2017-06-29 02:02:52','root','success'),(554,'Migration20160422095100ComUsers.php','core/migrations','180e69bf32fc4bebb7bd5655efe186da','up','2017-06-29 02:02:52','root','success'),(555,'Migration20160422152647ComSupport.php','core/migrations','662bfe09c41b54d01e115034636c3a8a','up','2017-06-29 02:02:52','root','success'),(556,'Migration20160425154200ComPoll.php','core/migrations','069383853d4f5d05eb60555b2304af94','up','2017-06-29 02:02:52','root','success'),(557,'Migration20160428141300ComUsers.php','core/migrations','14b4dab60c07786cdfef84bc8027f9f3','up','2017-06-29 02:02:52','root','success'),(558,'Migration20160502173600ComUsers.php','core/migrations','bfe86ea52661efcad03b128ba0e4eb36','up','2017-06-29 02:02:52','root','success'),(559,'Migration20160508203200ComWiki.php','core/migrations','52f67049bc3b318f81fd053587d5e118','up','2017-06-29 02:02:52','root','success'),(560,'Migration20160510121901ComMembers.php','core/migrations','97754d8c0a0dd446fb826004a3871d86','up','2017-06-29 02:02:52','root','success'),(561,'Migration20160511142701ComMembers.php','core/migrations','a269155d2d4f50c2b9ca8f1bb1015d93','up','2017-06-29 02:02:52','root','success'),(562,'Migration20160512000001ComStorefront.php','core/migrations','2883a5059f811d7d9775cb834a9ff4e6','up','2017-06-29 02:02:52','root','success'),(563,'Migration20160513140417ComMembers.php','core/migrations','9ca94676919b2ff95cd3de1468d6514e','up','2017-06-29 02:02:52','root','success'),(564,'Migration20160513211701ComMembers.php','core/migrations','e2464a0b7f462e9ff9eea883d2e569b2','up','2017-06-29 02:02:52','root','success'),(565,'Migration20160516000001ComStorefront.php','core/migrations','0a41fb25239720b36853c05575c97fe6','up','2017-06-29 02:02:52','root','success'),(566,'Migration20160517203900PlgCoursesMemberoptions.php','core/migrations','1c3f1e77b9a87b2da693c0237e05fde9','up','2017-06-29 02:02:52','root','success'),(567,'Migration20160518143900PlgContentCategories.php','core/migrations','445de1b5eade436247733b150913346a','up','2017-06-29 02:02:52','root','success'),(568,'Migration20160519200127PlgSupportSlack.php','core/migrations','9d38dc6a8cd650eaaafa372a2f2af134','up','2017-06-29 02:02:52','root','success'),(569,'Migration20160522113201ComMembers.php','core/migrations','61ef0ea8c79a062e00be10f2e76929bc','up','2017-06-29 02:02:52','root','success'),(570,'Migration20160524000001ComStorefront.php','core/migrations','6481bce7eed9c3dfd8599ce198c7639b','up','2017-06-29 02:02:52','root','success'),(571,'Migration20160602102201ComWiki.php','core/migrations','65499067a8a02bc65c2936c1578f4659','up','2017-06-29 02:02:52','root','success'),(572,'Migration20160603173202ComProjects.php','core/migrations','41cabc9da0f4db29c78981d2ce42a503','up','2017-06-29 02:02:52','root','success'),(573,'Migration20160606162915ComSearch.php','core/migrations','fa7d6a0781a494470d562fa5d55ae429','up','2017-06-29 02:02:52','root','success'),(574,'Migration20160610231100ComWiki.php','core/migrations','3bdb6f06ca7e266fc2410b7a71698a9a','up','2017-06-29 02:02:52','root','success'),(575,'Migration20160620151602ComCart.php','core/migrations','961213853af64f3fc7990a535e2b6a69','up','2017-06-29 02:02:52','root','success'),(576,'Migration20160620170127ComStorefront.php','core/migrations','71e4392f95ca81ee700c4975ca55392e','up','2017-06-29 02:02:52','root','success'),(577,'Migration20160620171427ComCart.php','core/migrations','d2fc9612f0e16fcc419257b001f1d299','up','2017-06-29 02:02:52','root','success'),(578,'Migration20160620172827ComStorefront.php','core/migrations','8c2e2a3648176df5fa95938d71f7332c','up','2017-06-29 02:02:52','root','success'),(579,'Migration20160623112527ComStorefront.php','core/migrations','5aeae4cf4382a28b2fb57a8b0f640d8d','up','2017-06-29 02:02:52','root','success'),(580,'Migration20160623113106ComStorefront.php','core/migrations','73e84607be9047b5500124d81474b6af','up','2017-06-29 02:02:52','root','success'),(581,'Migration20160624123301ComMembers.php','core/migrations','e8de99e2d9834c045058c747c6de4e94','up','2017-06-29 02:02:52','root','success'),(582,'Migration20160629140839ComStorefront.php','core/migrations','9c7afc293285bf208131094020dcedd2','up','2017-06-29 02:02:52','root','success'),(583,'Migration20160629215021ComSearch.php','core/migrations','c8428376bbdfd91a99917c59caa2bf74','up','2017-06-29 02:02:52','root','success'),(584,'Migration20160630134818ComStorefront.php','core/migrations','2025f21211a86ad5d2121e6d304b22ac','up','2017-06-29 02:02:52','root','success'),(585,'Migration20160712140127PlgAuthenticationShibboleth.php','core/migrations','0bac6857009868156e0341665f4c0930','up','2017-06-29 02:02:52','root','success'),(586,'Migration20160715100931PlgHubzeroComments.php','core/migrations','c0bdae056f1fd5f05102e1a23240613e','up','2017-06-29 02:02:52','root','success'),(587,'Migration20160725142238PlgResourcesWatch.php','core/migrations','266cd297a55dbcd8e619e0e7310234e0','up','2017-06-29 02:02:52','root','success'),(588,'Migration20160729201752PlgCronSearch.php','core/migrations','142be1aa437f93037629d97d766f9d03','up','2017-06-29 02:02:52','root','success'),(589,'Migration20160729202716ComSearch.php','core/migrations','58e832a0081ba5f0a4cd4d55bc4f1eb3','up','2017-06-29 02:02:53','root','success'),(590,'Migration20160802162652PlgCronActivity.php','core/migrations','f0c777e0b62aad83bb0919dc3e0d28c9','up','2017-06-29 02:02:53','root','success'),(591,'Migration20160802170610PlgMembersActivity.php','core/migrations','00bde6f58a26d271a8ffa2948d91e58e','up','2017-06-29 02:02:53','root','success'),(592,'Migration20160805180813ComSearch.php','core/migrations','09a479eab3819381818d2cd2f6051a32','up','2017-06-29 02:02:53','root','success'),(593,'Migration20160808124602ComUsers.php','core/migrations','67d4e8ca73c99a2b77ecc76ae8ffc300','up','2017-06-29 02:02:53','root','success'),(594,'Migration20160808143522ComSupport.php','core/migrations','7152430f41ee77ae2c9c50b79538d6d3','up','2017-06-29 02:02:53','root','success'),(595,'Migration20160809152100ComRedirect.php','core/migrations','8c4b0408e3cd4cbf89fa4a474af706b4','up','2017-06-29 02:02:53','root','success'),(596,'Migration20160810121746PlgContentFormathtml.php','core/migrations','9981d1974e1e8acba1a71a0822a2856a','up','2017-06-29 02:02:53','root','success'),(597,'Migration20160817174610PlgResourcesWindowstools.php','core/migrations','d0c4cf9f177a4aaf93956cd162490832','up','2017-06-29 02:02:53','root','success'),(598,'Migration20160818061637Core.php','core/migrations','7ace0231eef4b4c35c5e8166e3410605','up','2017-06-29 02:02:53','root','success'),(599,'Migration20160824181200ComWiki.php','core/migrations','33a61588ed5bfc25dd79613a16a1ae08','up','2017-06-29 02:02:53','root','success'),(600,'Migration20160825000001ComCart.php','core/migrations','6b97bd1f1032134edfd454c645e2d97c','up','2017-06-29 02:02:53','root','success'),(601,'Migration20160830165511ComSupport.php','core/migrations','2c4df70a564047823061d6cb1f30a493','up','2017-06-29 02:02:53','root','success'),(602,'Migration20160902134802ComUsers.php','core/migrations','43813e5fc3c2d63d5fe2f6b7b2dad517','up','2017-06-29 02:02:53','root','success'),(603,'Migration2016090510300000Core.php','core/migrations','8ba92dc21e3342dcd134a021435a3313','up','2017-06-29 02:02:53','root','success'),(604,'Migration2016090511300000Core.php','core/migrations','2381037656e896bd7e761ee03ddd25fd','up','2017-06-29 02:02:53','root','success'),(605,'Migration2016090610030000ComTools.php','core/migrations','ee2c594716c498b43c570d54f5be4784','up','2017-06-29 02:02:53','root','success'),(606,'Migration2016090610110000Core.php','core/migrations','b9c1b817f6867d223a5d763e73a61a88','up','2017-06-29 02:02:53','root','success'),(607,'Migration2016090710240000ComCourses.php','core/migrations','0eb1108cc1f52274c57305adb9a5ff51','up','2017-06-29 02:02:53','root','success'),(608,'Migration2016090710280000ComCategories.php','core/migrations','6fc096a4cb278c386fe1d6ac0459790c','up','2017-06-29 02:02:53','root','success'),(609,'Migration2016090710350000ComBillboards.php','core/migrations','cf245b02ce74d3b11e6fa7cb03c1386b','up','2017-06-29 02:02:53','root','success'),(610,'Migration2016090710430000ComCart.php','core/migrations','2a9f786078c573547241f6b92d20e154','up','2017-06-29 02:02:53','root','success'),(611,'Migration2016090710490000Core.php','core/migrations','368a20eda88157e7b1bdc46d3af06716','up','2017-06-29 02:02:53','root','success'),(612,'Migration2016090710530000ComUsers.php','core/migrations','138ddac1bdb7bc42821b6ecfe3ec41f2','up','2017-06-29 02:02:53','root','success'),(613,'Migration2016090710560000ComSupport.php','core/migrations','ab6e7e1c4c8d809b94f5e815a7da4166','up','2017-06-29 02:02:53','root','success'),(614,'Migration2016090711260000Core.php','core/migrations','451830b817dc186e4a3324c4345a2c7a','up','2017-06-29 02:02:53','root','success'),(615,'Migration20160907185952PlgProjects.php','core/migrations','05e5268ef6b67f7e75d04568c45e08cb','up','2017-06-29 02:02:53','root','success'),(616,'Migration20160911000001ComCart.php','core/migrations','614c00bac84ea284d6f2d0846e34b2eb','up','2017-06-29 02:02:53','root','success'),(617,'Migration20160914183602ComProjects.php','core/migrations','c3223410d6f6c7b8feedf443919dc5bb','up','2017-06-29 02:02:54','root','success'),(618,'Migration201609151104002ComMembers.php','core/migrations','06dad0e58cdbdad8a8b8da3306739248','up','2017-06-29 02:02:54','root','success'),(619,'Migration20160927193030ComProjects.php','core/migrations','fa42f74ead925b6c9d06905def2bea60','up','2017-06-29 02:02:54','root','success'),(620,'Migration20161003151102ComTools.php','core/migrations','06b35713cca341b9d377ec0f27577c65','up','2017-06-29 02:02:54','root','success'),(621,'Migration20161004103718ComStorefront.php','core/migrations','70bb7ae225e8d5003aa2ca0edfd83c21','up','2017-06-29 02:02:54','root','success'),(622,'Migration20161005104752ComWiki.php','core/migrations','ac360843b0fc6f18baffc0de323c29a7','up','2017-06-29 02:02:54','root','success'),(623,'Migration20161017133711ComMembers.php','core/migrations','fd5ff0b1c756a7eca478c2993390047f','up','2017-06-29 02:02:54','root','success'),(624,'Migration20161018093917Core.php','core/migrations','3ad361878e8a27120db404c922e61fce','up','2017-06-29 02:02:54','root','success'),(625,'Migration20161021110502ComUsers.php','core/migrations','e7925e65ad2547d6499f43c2ca15ea1e','up','2017-06-29 02:02:54','root','success'),(626,'Migration20161021135212ComUsers.php','core/migrations','58084b1ffaf2c5d5d9fe9323c7ac6661','up','2017-06-29 02:02:54','root','success'),(627,'Migration20161026000001PlgAuthenticationSciStarter.php','core/migrations','dc359a0eb1574d97b314c1cc10b67801','up','2017-06-29 02:02:54','root','success'),(628,'Migration20161111173852PlgSystemCache.php','core/migrations','aa37aa382c9c68a877cf7d1c9cee5ab2','up','2017-06-29 02:02:54','root','success'),(629,'Migration20161128165818Core.php','core/migrations','5f00760e1a92d21a1c8074ac1ac0d780','up','2017-06-29 02:02:54','root','success'),(630,'Migration20161205000001PlgCronStorefront.php','core/migrations','776952e184b157339438669c356559d8','up','2017-06-29 02:02:54','root','success'),(631,'Migration20161206114718ComProjects.php','core/migrations','c3a37784f4a5304b5aef4939befbadc2','up','2017-06-29 02:02:54','root','success'),(632,'Migration20161209133804ComSearch.php','core/migrations','f22a6a28c09e2db52e54eb643ae1a168','up','2017-06-29 02:02:54','root','success'),(633,'Migration20161212181802ComSearch.php','core/migrations','e770b957de1fb4e4c0926368b7fecf95','up','2017-06-29 02:02:54','root','success'),(634,'Migration20161213132518PlgSearchSolr.php','core/migrations','01f4dc97a7fb951f0b4ae72cc8226218','up','2017-06-29 02:02:54','root','success'),(635,'Migration20161213133713PlgSystemContent.php','core/migrations','adb3bd59845d5acd8314eb0a9f612360','up','2017-06-29 02:02:54','root','success'),(636,'Migration20161214180653ComSystem.php','core/migrations','971ae26cdc0cf3dd32fb13db3205c864','up','2017-06-29 02:02:54','root','success'),(637,'Migration20161220173600PlgResourcesReviews.php','core/migrations','ee9a3b72e3fcbf2dd1f31a15b2581a24','up','2017-06-29 02:02:54','root','success'),(638,'Migration20170112000001ComStorefront.php','core/migrations','9650c80ae6f2a899e09d14ac5abb53e6','up','2017-06-29 02:02:54','root','success'),(639,'Migration20170117114147ComProjects.php','core/migrations','3a51b41cd6b13db45ddba2b80689a6bf','up','2017-06-29 02:02:54','root','success'),(640,'Migration20170124114147ComGroups.php','core/migrations','954300cd66a743bd6e30386269e94c8b','up','2017-06-29 02:02:54','root','success'),(641,'Migration20170124151456ComSupport.php','core/migrations','d898295f0c8d0b447d9b09cb271907d0','up','2017-06-29 02:02:54','root','success'),(642,'Migration20170124175120ComBillboards.php','core/migrations','dcda2e4dc5f370e8e3cf5e3338f3bec4','up','2017-06-29 02:02:54','root','success'),(643,'Migration20170124191209ComCitations.php','core/migrations','f810c3f02eaedf34ac0a4ae134891697','up','2017-06-29 02:02:54','root','success'),(644,'Migration20170129140423PlgXmessage.php','core/migrations','33ca8bb8e7503c494efbff15711d693e','up','2017-06-29 02:02:54','root','success'),(645,'Migration20170201125723ComPublications.php','core/migrations','b532bcf71c15ccf2cc33a558eeedd14b','up','2017-06-29 02:02:54','root','success'),(646,'Migration20170203204306PlgFilesystemGoogledrive.php','core/migrations','8f1b714f7bdff730d2b4b27b89b2c080','up','2017-06-29 02:02:54','root','success'),(647,'Migration20170206140017PlgTagsCourses.php','core/migrations','d96640d77464a7b657686945f0490e4f','up','2017-06-29 02:02:54','root','success'),(648,'Migration20170207025659PlgFilesystemDropbox.php','core/migrations','7a32fa08843764310b9ee3bd13159e2c','up','2017-06-29 02:02:54','root','success'),(649,'Migration20170207025712PlgFilesystemGithub.php','core/migrations','1ba9fcbc753cc6ae88df75ea2dd78826','up','2017-06-29 02:02:54','root','success'),(650,'Migration20170208180603PlgXmessageHandler.php','core/migrations','bd051f11f79884b576a9144ea2e2bc67','up','2017-06-29 02:02:54','root','success'),(651,'Migration20170209150806ComSupport.php','core/migrations','aa67102305fa4f2f89ecb81aac9775ce','up','2017-06-29 02:02:54','root','success'),(652,'Migration20170220041701ComSearch.php','core/migrations','825e057b82a00bf19fbb284c3193715f','up','2017-06-29 02:02:54','root','success'),(653,'Migration20170220190109ComTime.php','core/migrations','5d383c8f441c0bf68a84432a1d70fc9f','up','2017-06-29 02:02:55','root','success'),(654,'Migration20170228000001ComStorefront.php','core/migrations','2ffac32fe1810cde56da00b0d9082a85','up','2017-06-29 02:02:55','root','success'),(655,'Migration20170228095518PlgFilesystemAwss3.php','core/migrations','017c03723edc78d80f8c43568f25b3a7','up','2017-06-29 02:02:55','root','success'),(656,'Migration20170306114718ComMembers.php','core/migrations','b16f50b38410762a74e5ed31d5805868','up','2017-06-29 02:02:55','root','success'),(657,'Migration20170322093811ComResources.php','core/migrations','4abb44b79d8be274b96e3fb886c72459','up','2017-06-29 02:02:55','root','success'),(658,'Migration20170405140417ComMembers.php','core/migrations','0a03658cbf5e92eeabfee17ab16cc4b7','up','2017-06-29 02:02:55','root','success'),(659,'Migration20170406114718ComMembers.php','core/migrations','543a257da4d434f482e8d8d1b6d66a9e','up','2017-06-29 02:02:55','root','success'),(660,'Migration20170426184100ComSearch.php','core/migrations','89ccfb6c87ed53834d0bf468e503c6f1','up','2017-06-29 02:02:55','root','success'),(661,'Migration20170512150115ComTime.php','core/migrations','60fd80c4206b6d2f131c571833a4ac05','up','2017-06-29 02:02:55','root','success'),(662,'Migration20170512162652ModSpotlight.php','core/migrations','0c1906861eccb506fd9af20e6743d409','up','2017-06-29 02:02:55','root','success'),(663,'Migration20170518102512PlgAuthenticationFacebook.php','core/migrations','dbe4e10a5bbeda3901e7096dc5881f6d','up','2017-06-29 02:02:55','root','success'),(664,'Migration20170602135253PlgSearchCron.php','core/migrations','125cbb45225c434e327eb2d733c33ba8','up','2017-06-29 02:02:55','root','success'),(665,'Migration20170623162652PlgPublicationsForks.php','core/migrations','79bcee2fb68a474b96463c1b3825166e','up','2017-06-29 02:02:55','root','success'),(666,'Migration20170627153900ComHubgraph.php','core/migrations','117108b7a98c14e4cf297d4e5fe6df0b','up','2017-06-29 02:02:55','root','success'),(667,'Migration20170627153923ComHubgraph.php','core/migrations','aae9200e6c515acbceced74b4c7ce07c','up','2017-06-29 02:02:55','root','success');
/*!40000 ALTER TABLE `jos_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_modules`
--

DROP TABLE IF EXISTS `jos_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_modules`
--

LOCK TABLES `jos_modules` WRITE;
/*!40000 ALTER TABLE `jos_modules` DISABLE KEYS */;
INSERT INTO `jos_modules` VALUES (1,'Main Menu','','',1,'user3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,0,'{\"menutype\":\"mainmenu\",\"menu_style\":\"list\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"window_open\":\"\",\"show_whitespace\":\"0\",\"cache\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"moduleclass_sfx\":\"_menu\",\"maxdepth\":\"10\",\"menu_images\":\"0\",\"menu_images_align\":\"0\",\"menu_images_link\":\"0\",\"expand_menu\":\"0\",\"activate_parent\":\"0\",\"full_active_id\":\"0\",\"indent_image\":\"0\",\"indent_image1\":\"\",\"indent_image2\":\"\",\"indent_image3\":\"\",\"indent_image4\":\"\",\"indent_image5\":\"\",\"indent_image6\":\"\",\"spacer\":\"\",\"end_spacer\":\"\"}',0,'*'),(2,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_adminlogin',1,1,'',1,'*'),(3,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(4,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(8,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*'),(9,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_quickicon',3,1,'',1,'*'),(12,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_adminmenu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),(13,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*'),(15,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*'),(16,'Login Form','','',7,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"greeting\":\"1\",\"name\":\"0\"}',0,'*'),(17,'Breadcrumbs','','',1,'breadcrumbs',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_breadcrumbs',1,1,'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"Home\",\"showComponent\":\"1\",\"separator\":\"/\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(79,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(86,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(18,'Groups','','',7,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_groups',1,1,'{\"type\":\"1\",\"cache\":\"1\"}',1,''),(19,'Events Calendar','','',0,'eventsLeft',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_events_cal',1,0,'{\"moduleclass_sfx\":\"\",\"show_nav_prev_month\":\"1\",\"start_day\":\"0\",\"display_last_month\":\"NO\",\"display_last_month_days\":\"0\",\"show_nav_next_month\":\"1\",\"display_next_month\":\"NO\",\"display_next_month_days\":\"0\",\"cache\":\"0\",\"cache_time\":\"900\"}',0,''),(20,'Latest Events','','',0,'eventsRight',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_events_latest',1,1,'{\"moduleclass_sfx\":\"\",\"startday\":\"0\",\"max_events\":\"10\",\"mode\":\"2\",\"announcements\":\"0\",\"days\":\"365\",\"display_links\":\"0\",\"display_year\":\"0\",\"display_date_style\":\"0\",\"display_title_style\":\"0\",\"no_repeat\":\"1\",\"char_limit\":\"150\",\"cache\":\"0\",\"cache_time\":\"900\"}',0,''),(21,'Featured Resource','','',0,'featureLeft',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_featuredresource',1,1,'{\"catid\":\"\",\"moduleclass_sfx\":\"featured-resource\",\"txt_length\":\"200\",\"minranking\":\"0\",\"tag\":\"\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,''),(22,'Community Poll','','',0,'featureMiddle',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_poll',1,1,'{\"formid\":\"\",\"cache\":\"1\"}',0,''),(23,'Featured Tool','','',0,'featureRight',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_featuredresource',1,1,'{\"catid\":\"\",\"moduleclass_sfx\":\"featured-resource\",\"txt_length\":\"200\",\"type\":\"tools\",\"minranking\":\"0\",\"tag\":\"\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,''),(24,'Hub Footer','','<h2>Helpful Links</h2>\r\n<div id=\"ancillary\" class=\"grid cf\">\r\n\r\n	<div class=\"col span-quarter\">\r\n		<h3>Get Help</h3>\r\n		<ul>\r\n			<li><a href=\"/feedback\">Feedback</a></li>\r\n			<li><a href=\"/login/remind\">Forgot username?</a></li>\r\n			<li><a href=\"/login/reset\">Lost password?</a></li>\r\n			<li><a href=\"/legal/accessibility\">Accessibility Issues</a></li>\r\n			<li><a href=\"/about/contact\">Contact us</a></li>\r\n		</ul>\r\n	</div>\r\n	<div class=\"col span-quarter\">\r\n		<h3>Participate</h3>\r\n		<ul>\r\n			<li><a href=\"/resources/new\">Submit a resource</a></li>\r\n			<li><a href=\"/groups/new\">Create a group</a></li>\r\n			<li><a href=\"/answers\"><span>Answer questions</span></a></li>\r\n			<li><a href=\"/wishlist\"><span>Make a wish</span></a></li>\r\n			<li><a href=\"/forum\"><span>Join the discussion</span></a></li>\r\n		</ul>\r\n	</div>\r\n	<div class=\"col span-quarter\">\r\n		<h3>Discover</h3>\r\n		<ul>\r\n			<li><a href=\"/whatsnew\"><span>What\'s New</span></a></li>\r\n			<li><a href=\"/resources\"><span>Resources</span></a></li>\r\n			<li><a href=\"/wiki\"><span>Wiki</span></a></li>\r\n			<li><a href=\"/tags\"><span>Tags</span></a></li>\r\n			<li><a href=\"/kb\"><span>Knowledge Base</span></a></li>\r\n		</ul>\r\n	</div>\r\n	<div class=\"col span-quarter omega\">\r\n		<h3>About Us</h3>\r\n		<ul>\r\n			<li><a href=\"/about\">Who we are</a></li>\r\n			<li><a href=\"/legal/terms\">Terms of use</a></li>\r\n			<li><a href=\"/legal/privacy\">Privacy Policy</a></li>\r\n			<li><a href=\"/legal/abuse\">Abuse Policy</a></li>\r\n			<li><a href=\"/about/dmcapolicy\">Copyright Infringement</a></li>\r\n		</ul>\r\n	</div>\r\n\r\n</div><!-- / footer nav -->\r\n<div class=\"inner\">\r\n<ul id=\"legalese\">\r\n	<li class=\"policy\">Copyright &copy; 2012 Hubzilla</li>\r\n	<li>Powered by <a href=\"http://hubzero.org\" rel=\"external\">HUBzero<sup>&reg;</sup></a>, a <a href=\"http://www.purdue.edu\" title=\"Purdue University\" rel=\"external\">Purdue</a> project</li>\r\n</ul><!-- / footer #legalese -->\r\n</div>',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(25,'Trouble Report','','',0,'helppane',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_reportproblems',1,0,'{\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',0,''),(26,'Support Tickets','','',0,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_supporttickets',1,1,'{\"cache\":\"1\"}',1,''),(27,'Resources','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_resources',1,1,'{\"cache\":\"1\"}',1,''),(28,'Wish List','','',2,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_wishlist',1,1,'{\"wishlist\":\"\",\"showMine\":\"0\",\"cache\":\"1\"}',1,''),(29,'Questions & Answers','','',3,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_answers',1,1,'{\"showMine\":\"0\",\"cache\":\"1\"}',1,''),(31,'About','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"about\",\"menu_style\":\"list\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"window_open\":\"\",\"show_whitespace\":\"0\",\"cache\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"moduleclass_sfx\":\"\",\"maxdepth\":\"10\",\"menu_images\":\"0\",\"menu_images_align\":\"0\",\"menu_images_link\":\"0\",\"expand_menu\":\"0\",\"activate_parent\":\"0\",\"full_active_id\":\"0\",\"indent_image\":\"0\",\"indent_image1\":\"\",\"indent_image2\":\"\",\"indent_image3\":\"\",\"indent_image4\":\"\",\"indent_image5\":\"\",\"indent_image6\":\"\",\"spacer\":\"\",\"end_spacer\":\"\"}',0,''),(32,'Legal Menu','','',1,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"legal\",\"menu_style\":\"list\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"window_open\":\"\",\"show_whitespace\":\"0\",\"cache\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"moduleclass_sfx\":\"\",\"maxdepth\":\"10\",\"menu_images\":\"0\",\"menu_images_align\":\"0\",\"menu_images_link\":\"0\",\"expand_menu\":\"0\",\"activate_parent\":\"0\",\"full_active_id\":\"0\",\"indent_image\":\"0\",\"indent_image1\":\"\",\"indent_image2\":\"\",\"indent_image3\":\"\",\"indent_image4\":\"\",\"indent_image5\":\"\",\"indent_image6\":\"\",\"spacer\":\"\",\"end_spacer\":\"\"}',0,''),(33,'My Groups','','',0,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mygroups',1,0,'',0,''),(34,'My Drafts','','',6,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mycontributions',1,0,'{\"show_tools\":\"1\",\"get_questions\":\"1\",\"get_wishes\":\"1\",\"get_tickets\":\"1\",\"limit_tools\":\"10\",\"limit_other\":\"10\"}',0,''),(35,'My Points','','',8,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mypoints',1,1,'',0,''),(36,'My Tools','','',3,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mytools',1,0,'',0,''),(37,'My Tickets','','',4,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mytickets',1,1,'',0,''),(38,'My Questions','','',9,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_myquestions',1,0,'',0,''),(39,'My Wishes','','',7,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mywishes',1,0,'',0,''),(40,'My Messages','','',5,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mymessages',1,0,'',0,''),(41,'My Sessions','','',1,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mysessions',1,0,'{\"show_storage\": \"1\", \"hubvnc\": \"\", \"moduleclass_sfx\": \"\"}',0,''),(42,'My Projects','','',2,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_myprojects',1,1,'{\"moduleclass\":\"md-projects\",\"limit\":\"5\"}',0,''),(43,'Resources','','<ul>\r\n	<li><a href=\"/resources/tools\">Simulation Tools</a></li>\r\n	<li><a href=\"/resources/seminars\">Seminars</a></li>\r\n	<li><a href=\"/resources/workshops\">Workshops</a></li>\r\n	<li><a href=\"/resources/courses\">Courses</a></li>\r\n	<li><a href=\"/resources/teachingmaterials\">Teaching Materials</a></li>\r\n	<li><a href=\"/resources/publications\">Publications</a></li>\r\n	<li><a href=\"/resources/downloads\">Downloads</a></li>\r\n</ul>',10,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"moduleclass_sfx\":\"\"}',0,''),(44,'Dashboard Introduction','','<p>Welcome to your customizable dashboard page!</p>\r\n\r\n<p>To get started, click the \"Personalize\" button towards the top of this page. You will then be presented with a list of modules you may add to your page. You may also, at that time, remove any unwanted modules or rearrange the current modules by drag-and-drop!</p>',11,'memberDashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"moduleclass_sfx\":\"\"}',0,''),(45,'Notices','','',0,'notices',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_notices',1,0,'{\"start_publishing\":\"0000-00-00 00:00:00\",\"stop_publishing\":\"0000-00-00 00:00:00\",\"alertlevel\":\"low\",\"moduleid\":\"\",\"message\":\"\",\"allowClose\":\"0\"}',0,''),(46,'Quotes','','',1,'quotes',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quotes',1,0,'{\"cache\":\"0\",\"moduleclass_sfx\":\"\",\"maxquotes\":\"\"}',0,''),(47,'Search','','',0,'search',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_search',1,0,'{\"moduleclass_sfx\":\"\",\"width\":\"20\",\"text\":\"Search\",\"button\":\"\",\"button_pos\":\"right\",\"imagebutton\":\"\",\"button_text\":\"Go\",\"set_itemid\":\"\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,''),(48,'My Submissions','','',7,'submissions',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_mysubmissions',1,0,'',0,''),(49,'Browse Content by Tags','','',0,'toptags',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toptags',1,1,'{\"numtags\":\"25\",\"exclude\":\"\",\"message\":\"\",\"sortby\":\"alphabeta\",\"morelnk\":\"0\",\"cache\":\"0\",\"cache_time\":\"900\"}',0,''),(50,'Congratulations','','<div id=\"congrats\">\r\n<h2>Welcome to HUBzero!</h2>\r\n<p>Congratulations! Your new hub is up and running. This is a skeleton site and basic template to serve as a starting point for you to begin building your hub.</p>\r\n</div>',0,'welcome',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"moduleclass_sfx\":\"\"}',0,''),(51,'Welcome','','<div id=\"welcome\">\r\n<h2>Welcome to our site!</h2>\r\n<p>\r\nThis project has an <a href=\"/about\">important mission</a> of revolutionizing scientific research and educational activities.\r\n</p>\r\n</div>',1,'welcome',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"moduleclass_sfx\":\"\"}',0,''),(52,'Accessibility Contact','','',1,'accessibilitycontact',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_rapid_contact',1,1,'{\"name_label\":\"Name:\",\"email_label\":\"Email:\",\"subject_label\":\"Subject:\",\"message_label\":\"Message:\",\"email_recipient\":\"\",\"button_text\":\"Send Message\",\"page_text\":\"Thank you for your contact.\",\"error_text\":\"Your message could not be sent. Please try again.\",\"no_email\":\"Please write your email\",\"invalid_email\":\"Please write a valid email\",\"from_name\":\"\",\"from_email\":\"\",\"exact_url\":\"1\",\"disable_https\":\"0\",\"pre_text\":\"We welcome your feedback and invite you to let us know if you have trouble accessing this site. Please send us an email using this form and describe the problem in as much detail as possible, including the URL of the page you were on, the type of problem, and any other information that you would deem necessary for us to better diagnose and resolve the issue.\",\"fixed_url\":\"0\",\"fixed_url_address\":\"\",\"enable_anti_spam\":\"1\",\"anti_spam_q\":\"How many eyes has a typical person?\",\"anti_spam_a\":\"2\",\"moduleclass_sfx\":\"\"}',0,'*'),(53,'Members','','',6,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_members',1,1,'{\"cache\":\"1\"}',1,'*'),(54,'Who\'s Online','','',5,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_whosonline',1,1,'{\"display_limit\":\"25\"}',1,'*'),(87,'Collect','','',2,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_collect',1,0,'\"\"',0,'');
/*!40000 ALTER TABLE `jos_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_modules_menu`
--

DROP TABLE IF EXISTS `jos_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_modules_menu`
--

LOCK TABLES `jos_modules_menu` WRITE;
/*!40000 ALTER TABLE `jos_modules_menu` DISABLE KEYS */;
INSERT INTO `jos_modules_menu` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(11,0),(12,0),(13,0),(15,0),(16,0),(17,0),(18,0),(19,100),(20,100),(21,100),(22,100),(23,100),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(31,7),(31,9),(31,10),(31,15),(31,17),(31,19),(31,46),(31,65),(31,66),(31,67),(31,68),(31,97),(32,69),(32,70),(32,71),(32,72),(32,73),(32,74),(32,75),(32,96),(45,0),(46,12),(47,0),(49,100),(50,95),(51,100),(52,75),(53,0),(54,0),(87,0);
/*!40000 ALTER TABLE `jos_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsfeeds`
--

DROP TABLE IF EXISTS `jos_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsfeeds`
--

LOCK TABLES `jos_newsfeeds` WRITE;
/*!40000 ALTER TABLE `jos_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_mailing_recipient_actions`
--

DROP TABLE IF EXISTS `jos_newsletter_mailing_recipient_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_mailing_recipient_actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mailingid` int(11) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `action_vars` text,
  `email` varchar(255) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `countrySHORT` char(2) DEFAULT NULL,
  `countryLONG` varchar(64) DEFAULT NULL,
  `ipREGION` varchar(128) DEFAULT NULL,
  `ipCITY` varchar(128) DEFAULT NULL,
  `ipLATITUDE` double DEFAULT NULL,
  `ipLONGITUDE` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mailingid` (`mailingid`),
  KEY `idx_action` (`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_mailing_recipient_actions`
--

LOCK TABLES `jos_newsletter_mailing_recipient_actions` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_mailing_recipient_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_mailing_recipient_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_mailing_recipients`
--

DROP TABLE IF EXISTS `jos_newsletter_mailing_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_mailing_recipients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`mid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_mailing_recipients`
--

LOCK TABLES `jos_newsletter_mailing_recipients` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_mailing_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_mailing_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_mailinglist_emails`
--

DROP TABLE IF EXISTS `jos_newsletter_mailinglist_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_mailinglist_emails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `confirmed` int(11) DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`mid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_mailinglist_emails`
--

LOCK TABLES `jos_newsletter_mailinglist_emails` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_mailinglist_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_mailinglist_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_mailinglist_unsubscribes`
--

DROP TABLE IF EXISTS `jos_newsletter_mailinglist_unsubscribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_mailinglist_unsubscribes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `reason` text,
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_mailinglist_unsubscribes`
--

LOCK TABLES `jos_newsletter_mailinglist_unsubscribes` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_mailinglist_unsubscribes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_mailinglist_unsubscribes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_mailinglists`
--

DROP TABLE IF EXISTS `jos_newsletter_mailinglists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_mailinglists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `private` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_private` (`private`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_mailinglists`
--

LOCK TABLES `jos_newsletter_mailinglists` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_mailinglists` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_mailinglists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_mailings`
--

DROP TABLE IF EXISTS `jos_newsletter_mailings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_mailings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `html_body` longtext,
  `plain_body` longtext,
  `headers` text,
  `args` text,
  `tracking` int(11) DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nid` (`nid`),
  KEY `idx_lid` (`lid`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_mailings`
--

LOCK TABLES `jos_newsletter_mailings` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_mailings` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_mailings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_primary_story`
--

DROP TABLE IF EXISTS `jos_newsletter_primary_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_primary_story` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `story` text,
  `readmore_title` varchar(100) DEFAULT NULL,
  `readmore_link` varchar(200) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nid` (`nid`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_primary_story`
--

LOCK TABLES `jos_newsletter_primary_story` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_primary_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_primary_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_secondary_story`
--

DROP TABLE IF EXISTS `jos_newsletter_secondary_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_secondary_story` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `story` text,
  `readmore_title` varchar(100) DEFAULT NULL,
  `readmore_link` varchar(200) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nid` (`nid`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_secondary_story`
--

LOCK TABLES `jos_newsletter_secondary_story` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_secondary_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletter_secondary_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletter_templates`
--

DROP TABLE IF EXISTS `jos_newsletter_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletter_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `editable` int(11) DEFAULT '1',
  `name` varchar(100) DEFAULT NULL,
  `template` text,
  `primary_title_color` varchar(255) DEFAULT NULL,
  `primary_text_color` varchar(255) DEFAULT NULL,
  `secondary_title_color` varchar(255) DEFAULT NULL,
  `secondary_text_color` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletter_templates`
--

LOCK TABLES `jos_newsletter_templates` WRITE;
/*!40000 ALTER TABLE `jos_newsletter_templates` DISABLE KEYS */;
INSERT INTO `jos_newsletter_templates` VALUES (1,0,'Default HTML Email Template','<html>\n <head>\n    <title>{{TITLE}}</title>\n  </head>\n <body>\n    <table width=\"100%\" border=\"0\" cellspacing=\"0\">\n     <tr>\n        <td align=\"center\">\n         \n          <table width=\"700\" border=\"0\" cellpadding=\"20\" cellspacing=\"0\">\n           <tr class=\"display-browser\">\n              <td colspan=\"2\" style=\"font-size:10px;padding:0 0 5px 0;\" align=\"center\">\n               Email not displaying correctly? <a href=\"{{LINK}}\">View in a Web Browser</a>\n              </td>\n           </tr>\n           <tr>\n              <td colspan=\"2\" style=\"background:#000000;\">\n                <h1 style=\"color:#FFFFFF;\">HUB Campaign Template</h1>\n               <h3 style=\"color:#888888;\">{{TITLE}}</h3>\n             </td>\n           <tr>\n              <td width=\"500\" valign=\"top\" style=\"font-size:14px;color:#222222;border-left:1px solid #000000;\">\n               <span style=\"display:block;color:#CCCCCC;margin-bottom:20px;\">Issue {{ISSUE}}</span>\n                {{PRIMARY_STORIES}}\n             </td>\n             <td width=\"200\" valign=\"top\" style=\"font-size:12px;color:#555555;border-left:1px solid #AAAAAA;border-right:1px solid #000000;\">\n                {{SECONDARY_STORIES}}\n             </td>\n           </tr>\n           <tr>\n              <td colspan=\"2\" align=\"center\" style=\"background:#000000;color:#FFFFFF;\">\n               Copyright &copy; {{COPYRIGHT}} HUB. All Rights reserved.\n              </td>\n           </tr>\n         </table>\n        \n        </td>\n     </tr>\n   </table>\n  </body>\n</html>  ','','','','',0),(2,0,'Default Plain Text Email Template','View In Browser - {{LINK}}\n=====================================\n{{TITLE}} - {{ISSUE}}\n=====================================\n\n{{PRIMARY_STORIES}}\n\n--------------------------------------------------\n\n{{SECONDARY_STORIES}}\n\n--------------------------------------------------\n\nUnsubscribe - {{UNSUBSCRIBE_LINK}}\nCopyright - {{COPYRIGHT}}',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `jos_newsletter_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsletters`
--

DROP TABLE IF EXISTS `jos_newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsletters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `issue` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'html',
  `template` int(11) DEFAULT NULL,
  `published` int(11) DEFAULT '1',
  `sent` int(11) DEFAULT '0',
  `html_content` mediumtext,
  `plain_content` mediumtext,
  `tracking` int(11) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `params` text,
  `autogen` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`),
  KEY `idx_sent` (`sent`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsletters`
--

LOCK TABLES `jos_newsletters` WRITE;
/*!40000 ALTER TABLE `jos_newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_oauthp_consumers`
--

DROP TABLE IF EXISTS `jos_oauthp_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_oauthp_consumers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(4) NOT NULL,
  `token` varchar(250) NOT NULL,
  `secret` varchar(250) NOT NULL,
  `callback_url` varchar(250) NOT NULL,
  `xauth` tinyint(4) NOT NULL,
  `xauth_grant` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_oauthp_consumers`
--

LOCK TABLES `jos_oauthp_consumers` WRITE;
/*!40000 ALTER TABLE `jos_oauthp_consumers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_oauthp_consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_oauthp_nonces`
--

DROP TABLE IF EXISTS `jos_oauthp_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_oauthp_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonce` varchar(250) NOT NULL,
  `stamp` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_nonce_stamp` (`nonce`,`stamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_oauthp_nonces`
--

LOCK TABLES `jos_oauthp_nonces` WRITE;
/*!40000 ALTER TABLE `jos_oauthp_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_oauthp_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_oauthp_tokens`
--

DROP TABLE IF EXISTS `jos_oauthp_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_oauthp_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `token` varchar(250) NOT NULL,
  `token_secret` varchar(250) NOT NULL,
  `callback_url` varchar(250) NOT NULL,
  `verifier` varchar(250) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_oauthp_tokens`
--

LOCK TABLES `jos_oauthp_tokens` WRITE;
/*!40000 ALTER TABLE `jos_oauthp_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_oauthp_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_order_items`
--

DROP TABLE IF EXISTS `jos_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_order_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `itemid` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `selections` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_order_items`
--

LOCK TABLES `jos_order_items` WRITE;
/*!40000 ALTER TABLE `jos_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_orders`
--

DROP TABLE IF EXISTS `jos_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `details` text,
  `email` varchar(150) DEFAULT NULL,
  `ordered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_changed` datetime DEFAULT '0000-00-00 00:00:00',
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_orders`
--

LOCK TABLES `jos_orders` WRITE;
/*!40000 ALTER TABLE `jos_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_overrider`
--

DROP TABLE IF EXISTS `jos_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_overrider`
--

LOCK TABLES `jos_overrider` WRITE;
/*!40000 ALTER TABLE `jos_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_password_blacklist`
--

DROP TABLE IF EXISTS `jos_password_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_password_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_password_blacklist`
--

LOCK TABLES `jos_password_blacklist` WRITE;
/*!40000 ALTER TABLE `jos_password_blacklist` DISABLE KEYS */;
INSERT INTO `jos_password_blacklist` VALUES (1,'hubzero'),(2,'test'),(3,'password'),(4,'secret');
/*!40000 ALTER TABLE `jos_password_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_password_character_class`
--

DROP TABLE IF EXISTS `jos_password_character_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_password_character_class` (
  `flag` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `regex` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_password_character_class`
--

LOCK TABLES `jos_password_character_class` WRITE;
/*!40000 ALTER TABLE `jos_password_character_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_password_character_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_password_rule`
--

DROP TABLE IF EXISTS `jos_password_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_password_rule` (
  `class` char(255) DEFAULT NULL,
  `description` char(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `failuremsg` char(255) DEFAULT NULL,
  `grp` char(32) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rule` char(255) DEFAULT NULL,
  `value` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_password_rule`
--

LOCK TABLES `jos_password_rule` WRITE;
/*!40000 ALTER TABLE `jos_password_rule` DISABLE KEYS */;
INSERT INTO `jos_password_rule` VALUES ('','Must be changed at least every 120 days',0,'Must be changed at least every 120 days','hub',20,10,'notStale','120'),('','Must be different than the previous password (re-use of the same password will not be allowed for one (1) year)',0,'Must be different than the previous password (re-use of the same password will not be allowed for one (1) year)','hub',19,9,'notReused','365'),('','Must not contain your username',0,'Must not contain your username','hub',18,8,'notUsernameBased',''),('','Must not contain your name or parts of your name',0,'Must not contain your name or parts of your name','hub',17,7,'notNameBased',''),('','Must not contain easily guessed words',1,'Must not contain easily guessed words','hub',16,6,'notBlacklisted',''),('','Must contain more than 4 unique characters',1,'Must contain more than 4 unique characters','hub',15,5,'minUniqueCharacters','5'),('','Must be no longer than 16 characters',1,'Must be no longer than 16 characters','hub',14,4,'maxPasswordLength','16'),('','Must be at least 8 characters long',1,'Must be at least 8 characters long','hub',13,3,'minPasswordLength','8'),('nonalpha','Must contain at least 1 number or punctuation mark',1,'Must contain at least 1 number or punctuation mark','hub',12,2,'minClassCharacters','1'),('alpha','Must contain at least 1 letter',1,'Must contain at least 1 letter','hub',11,1,'minClassCharacters','1');
/*!40000 ALTER TABLE `jos_password_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_plugin_params`
--

DROP TABLE IF EXISTS `jos_plugin_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_plugin_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0',
  `folder` varchar(100) DEFAULT NULL,
  `element` varchar(100) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_plugin_params`
--

LOCK TABLES `jos_plugin_params` WRITE;
/*!40000 ALTER TABLE `jos_plugin_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_plugin_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_poll_dates`
--

DROP TABLE IF EXISTS `jos_poll_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_poll_dates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `voter_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_poll_dates`
--

LOCK TABLES `jos_poll_dates` WRITE;
/*!40000 ALTER TABLE `jos_poll_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_poll_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_poll_menus`
--

DROP TABLE IF EXISTS `jos_poll_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_poll_menus` (
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_poll_menus`
--

LOCK TABLES `jos_poll_menus` WRITE;
/*!40000 ALTER TABLE `jos_poll_menus` DISABLE KEYS */;
INSERT INTO `jos_poll_menus` VALUES (1,0);
/*!40000 ALTER TABLE `jos_poll_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_poll_options`
--

DROP TABLE IF EXISTS `jos_poll_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_poll_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pollid_text` (`poll_id`,`text`(1))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_poll_options`
--

LOCK TABLES `jos_poll_options` WRITE;
/*!40000 ALTER TABLE `jos_poll_options` DISABLE KEYS */;
INSERT INTO `jos_poll_options` VALUES (1,1,'Graduate student',0),(2,1,'Undergraduate student',0),(3,1,'High school or elementary student',0),(4,1,'College faculty',0),(5,1,'Professional scientist/engineer',0),(6,1,'Retired, but still curious',0);
/*!40000 ALTER TABLE `jos_poll_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_polls`
--

DROP TABLE IF EXISTS `jos_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  `opened` date DEFAULT NULL,
  `closed` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_polls`
--

LOCK TABLES `jos_polls` WRITE;
/*!40000 ALTER TABLE `jos_polls` DISABLE KEYS */;
INSERT INTO `jos_polls` VALUES (1,'Who are you?','',0,0,'0000-00-00 00:00:00',1,0,86400,1,NULL,NULL);
/*!40000 ALTER TABLE `jos_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_profile_completion_awards`
--

DROP TABLE IF EXISTS `jos_profile_completion_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_profile_completion_awards` (
  `user_id` int(11) NOT NULL,
  `name` tinyint(4) NOT NULL DEFAULT '0',
  `orgtype` tinyint(4) NOT NULL DEFAULT '0',
  `organization` tinyint(4) NOT NULL DEFAULT '0',
  `countryresident` tinyint(4) NOT NULL DEFAULT '0',
  `countryorigin` tinyint(4) NOT NULL DEFAULT '0',
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `url` tinyint(4) NOT NULL DEFAULT '0',
  `reason` tinyint(4) NOT NULL DEFAULT '0',
  `race` tinyint(4) NOT NULL DEFAULT '0',
  `phone` tinyint(4) NOT NULL DEFAULT '0',
  `picture` tinyint(4) NOT NULL DEFAULT '0',
  `opted_out` tinyint(4) NOT NULL DEFAULT '0',
  `logins` int(11) NOT NULL DEFAULT '1',
  `invocations` int(11) NOT NULL DEFAULT '0',
  `last_bothered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bothered_times` int(11) NOT NULL DEFAULT '0',
  `edited_profile` tinyint(4) NOT NULL DEFAULT '0',
  `mailPreferenceOption` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_profile_completion_awards`
--

LOCK TABLES `jos_profile_completion_awards` WRITE;
/*!40000 ALTER TABLE `jos_profile_completion_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_profile_completion_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_activity`
--

DROP TABLE IF EXISTS `jos_project_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `referenceid` varchar(255) NOT NULL DEFAULT '0',
  `managers_only` tinyint(2) DEFAULT '0',
  `admin` tinyint(2) DEFAULT '0',
  `commentable` tinyint(2) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `recorded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activity` varchar(255) NOT NULL DEFAULT '',
  `highlighted` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `class` varchar(150) DEFAULT NULL,
  `preview` text,
  PRIMARY KEY (`id`),
  KEY `idx_projectid` (`projectid`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_activity`
--

LOCK TABLES `jos_project_activity` WRITE;
/*!40000 ALTER TABLE `jos_project_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_comments`
--

DROP TABLE IF EXISTS `jos_project_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `activityid` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `parent_activity` int(11) DEFAULT '0',
  `anonymous` tinyint(2) DEFAULT '0',
  `admin` tinyint(2) DEFAULT '0',
  `tbl` varchar(50) NOT NULL DEFAULT 'blog',
  PRIMARY KEY (`id`),
  KEY `idx_itemid` (`itemid`),
  KEY `idx_activityid` (`activityid`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_comments`
--

LOCK TABLES `jos_project_comments` WRITE;
/*!40000 ALTER TABLE `jos_project_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_database_versions`
--

DROP TABLE IF EXISTS `jos_project_database_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_database_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `database_name` varchar(64) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `data_definition` text,
  PRIMARY KEY (`id`,`database_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_database_versions`
--

LOCK TABLES `jos_project_database_versions` WRITE;
/*!40000 ALTER TABLE `jos_project_database_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_database_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_databases`
--

DROP TABLE IF EXISTS `jos_project_databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_databases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` int(11) NOT NULL,
  `database_name` varchar(64) NOT NULL,
  `title` varchar(127) NOT NULL DEFAULT '',
  `source_file` varchar(127) NOT NULL,
  `source_dir` varchar(127) NOT NULL,
  `source_revision` varchar(56) NOT NULL,
  `description` text,
  `data_definition` text,
  `revision` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_databases`
--

LOCK TABLES `jos_project_databases` WRITE;
/*!40000 ALTER TABLE `jos_project_databases` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_databases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_description_fields`
--

DROP TABLE IF EXISTS `jos_project_description_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_description_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `placeholder` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(10) NOT NULL DEFAULT '0',
  `option_other` tinyint(2) NOT NULL DEFAULT '0',
  `option_blank` tinyint(2) NOT NULL DEFAULT '0',
  `action_create` tinyint(2) NOT NULL DEFAULT '1',
  `action_update` tinyint(2) NOT NULL DEFAULT '1',
  `action_edit` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_description_fields`
--

LOCK TABLES `jos_project_description_fields` WRITE;
/*!40000 ALTER TABLE `jos_project_description_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_description_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_description_options`
--

DROP TABLE IF EXISTS `jos_project_description_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_description_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `checked` tinyint(2) NOT NULL DEFAULT '0',
  `dependents` tinytext,
  PRIMARY KEY (`id`),
  KEY `idx_field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_description_options`
--

LOCK TABLES `jos_project_description_options` WRITE;
/*!40000 ALTER TABLE `jos_project_description_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_description_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_descriptions`
--

DROP TABLE IF EXISTS `jos_project_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_descriptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `description_key` varchar(100) NOT NULL DEFAULT '',
  `description_value` text NOT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_descriptions`
--

LOCK TABLES `jos_project_descriptions` WRITE;
/*!40000 ALTER TABLE `jos_project_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_logs`
--

DROP TABLE IF EXISTS `jos_project_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectid` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `ajax` tinyint(1) DEFAULT '0',
  `owner` int(11) unsigned DEFAULT '0',
  `ip` varchar(15) DEFAULT '0',
  `section` varchar(100) DEFAULT 'general',
  `layout` varchar(100) DEFAULT '',
  `action` varchar(100) DEFAULT '',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `request_uri` tinytext,
  PRIMARY KEY (`id`),
  KEY `idx_projectid` (`projectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_logs`
--

LOCK TABLES `jos_project_logs` WRITE;
/*!40000 ALTER TABLE `jos_project_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_microblog`
--

DROP TABLE IF EXISTS `jos_project_microblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_microblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogentry` text,
  `posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `posted_by` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(2) DEFAULT '0',
  `params` tinytext,
  `projectid` int(11) NOT NULL DEFAULT '0',
  `activityid` int(11) NOT NULL DEFAULT '0',
  `managers_only` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_projectid` (`projectid`),
  KEY `idx_state` (`state`),
  FULLTEXT KEY `ftidx_blogentry` (`blogentry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_microblog`
--

LOCK TABLES `jos_project_microblog` WRITE;
/*!40000 ALTER TABLE `jos_project_microblog` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_microblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_owners`
--

DROP TABLE IF EXISTS `jos_project_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `groupid` int(11) DEFAULT '0',
  `invited_name` varchar(100) DEFAULT NULL,
  `invited_email` varchar(100) DEFAULT NULL,
  `invited_code` varchar(10) DEFAULT NULL,
  `added` datetime NOT NULL,
  `lastvisit` datetime DEFAULT NULL,
  `prev_visit` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `num_visits` int(11) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL DEFAULT '0',
  `native` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`),
  KEY `idx_projectid` (`projectid`),
  KEY `idx_userid` (`userid`),
  KEY `idx_groupid` (`groupid`),
  KEY `idx_status` (`status`),
  KEY `idx_role` (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_owners`
--

LOCK TABLES `jos_project_owners` WRITE;
/*!40000 ALTER TABLE `jos_project_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_public_stamps`
--

DROP TABLE IF EXISTS `jos_project_public_stamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_public_stamps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stamp` varchar(30) NOT NULL DEFAULT '0',
  `projectid` int(11) NOT NULL DEFAULT '0',
  `listed` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'files',
  `reference` text NOT NULL,
  `expires` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_stamp` (`stamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_public_stamps`
--

LOCK TABLES `jos_project_public_stamps` WRITE;
/*!40000 ALTER TABLE `jos_project_public_stamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_public_stamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_remote_files`
--

DROP TABLE IF EXISTS `jos_project_remote_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_remote_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) DEFAULT '0',
  `paired` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `synced` datetime DEFAULT NULL,
  `local_path` varchar(255) NOT NULL,
  `original_path` varchar(255) NOT NULL,
  `original_format` varchar(200) NOT NULL,
  `local_dirpath` varchar(255) NOT NULL DEFAULT '',
  `local_format` varchar(200) DEFAULT NULL,
  `local_md5` varchar(32) DEFAULT NULL,
  `service` varchar(50) NOT NULL,
  `type` varchar(25) NOT NULL DEFAULT 'file',
  `remote_editing` tinyint(1) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) NOT NULL,
  `original_id` varchar(100) NOT NULL,
  `remote_parent` varchar(100) DEFAULT NULL,
  `remote_title` varchar(140) DEFAULT NULL,
  `remote_md5` varchar(32) DEFAULT NULL,
  `remote_format` varchar(200) DEFAULT NULL,
  `remote_author` varchar(100) DEFAULT NULL,
  `remote_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_remote_files`
--

LOCK TABLES `jos_project_remote_files` WRITE;
/*!40000 ALTER TABLE `jos_project_remote_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_remote_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_repos`
--

DROP TABLE IF EXISTS `jos_project_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_repos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `about` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `engine` varchar(100) NOT NULL DEFAULT 'git',
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo` (`project_id`,`name`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_repos`
--

LOCK TABLES `jos_project_repos` WRITE;
/*!40000 ALTER TABLE `jos_project_repos` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_repos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_stats`
--

DROP TABLE IF EXISTS `jos_project_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `month` int(2) DEFAULT NULL,
  `year` int(2) DEFAULT NULL,
  `week` int(2) DEFAULT NULL,
  `processed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stats` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_stats`
--

LOCK TABLES `jos_project_stats` WRITE;
/*!40000 ALTER TABLE `jos_project_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_todo`
--

DROP TABLE IF EXISTS `jos_project_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NOT NULL DEFAULT '0',
  `todolist` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `assigned_to` int(11) DEFAULT '0',
  `closed_by` int(11) DEFAULT '0',
  `priority` int(11) DEFAULT '0',
  `activityid` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `milestone` tinyint(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `details` text,
  `content` varchar(255) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_todo`
--

LOCK TABLES `jos_project_todo` WRITE;
/*!40000 ALTER TABLE `jos_project_todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_tool_instances`
--

DROP TABLE IF EXISTS `jos_project_tool_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_tool_instances` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `parent_name` varchar(64) NOT NULL DEFAULT '',
  `instance` varchar(100) NOT NULL DEFAULT '',
  `revision` int(11) NOT NULL,
  `commit` varchar(255) NOT NULL,
  `access` varchar(16) NOT NULL,
  `state` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `svntool_version_id` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `toolname` (`parent_name`,`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_tool_instances`
--

LOCK TABLES `jos_project_tool_instances` WRITE;
/*!40000 ALTER TABLE `jos_project_tool_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_tool_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_tool_logs`
--

DROP TABLE IF EXISTS `jos_project_tool_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_tool_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `parent_name` varchar(64) NOT NULL DEFAULT '',
  `instance_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `actor` int(15) NOT NULL,
  `recorded` datetime NOT NULL,
  `project_activity_id` int(15) NOT NULL DEFAULT '0',
  `status_changed` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `access` tinyint(1) NOT NULL DEFAULT '0',
  `log` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_tool_logs`
--

LOCK TABLES `jos_project_tool_logs` WRITE;
/*!40000 ALTER TABLE `jos_project_tool_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_tool_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_tool_statuses`
--

DROP TABLE IF EXISTS `jos_project_tool_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_tool_statuses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL DEFAULT '',
  `status_about` text,
  `next` varchar(100) NOT NULL DEFAULT '',
  `next_admin` varchar(100) NOT NULL DEFAULT '',
  `next_about` text,
  `next_actor` tinyint(1) NOT NULL DEFAULT '0',
  `wait_time` varchar(100) NOT NULL DEFAULT '',
  `options` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_tool_statuses`
--

LOCK TABLES `jos_project_tool_statuses` WRITE;
/*!40000 ALTER TABLE `jos_project_tool_statuses` DISABLE KEYS */;
INSERT INTO `jos_project_tool_statuses` VALUES (1,'created','','upload your code and request install','wait for develper to upload code','You need to upload your code into the tool <a href=\"{app-source}\">repository</a>. When your code is ready for install, notify administrator via this screen.',0,'','{\"option-message\":\"1\",\"option-cancel\":\"1\"}'),(2,'deleted','','','','',2,'',''),(3,'uploaded','','wait for admin to install latest code','install developer code','Administrator need to intsall your uploaded code. You will get notified when the code is installed.',1,'24hrs','{\"option-message\":\"1\"}'),(4,'installed','','test installed code','wait for develper to test code','Test your code to make sure it is working as expected. Make further changes and request install if needed, or let administrator know the tool is working properly.',0,'','{\"option-message\":\"1\"}'),(5,'broken','','fix the code','wait for develper to fix code','There is a problem with your code that needs to be fixed before it can be installed.',0,'','{\"option-message\":\"1\"}'),(7,'working','','','','The tool is working and can now be published. If you need administrator to install an update, request install via this screen.',2,'','{\"option-message\":\"1\"}'),(8,'retired','','','','You tool is retired. ',2,'','{\"option-message\":\"1\"}');
/*!40000 ALTER TABLE `jos_project_tool_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_tool_views`
--

DROP TABLE IF EXISTS `jos_project_tool_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_tool_views` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `userid` int(15) NOT NULL,
  `viewed` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_tool_views`
--

LOCK TABLES `jos_project_tool_views` WRITE;
/*!40000 ALTER TABLE `jos_project_tool_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_tool_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_tools`
--

DROP TABLE IF EXISTS `jos_project_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_tools` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(127) NOT NULL DEFAULT '',
  `repotype` tinyint(1) NOT NULL DEFAULT '1',
  `repopath` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `status_changed` varchar(31) NOT NULL,
  `status_changed_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `svntool_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `opendev` tinyint(1) NOT NULL DEFAULT '0',
  `opensource` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `toolname` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_tools`
--

LOCK TABLES `jos_project_tools` WRITE;
/*!40000 ALTER TABLE `jos_project_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_project_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_project_types`
--

DROP TABLE IF EXISTS `jos_project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_project_types`
--

LOCK TABLES `jos_project_types` WRITE;
/*!40000 ALTER TABLE `jos_project_types` DISABLE KEYS */;
INSERT INTO `jos_project_types` VALUES (1,'General','Individual or collaborative projects of general nature','apps_dev=0\npublications_public=1\nteam_public=1\nallow_invite=0'),(2,'Content publication','Projects created with the purpose to publish data as a resource or a collection of related resources','apps_dev=0\npublications_public=1\nteam_public=1\nallow_invite=0'),(3,'Application development','Projects created with the purpose to develop and publish a simulation tool or a code library','apps_dev=1\npublications_public=1\nteam_public=1\nallow_invite=0');
/*!40000 ALTER TABLE `jos_project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_projects`
--

DROP TABLE IF EXISTS `jos_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `picture` varchar(255) DEFAULT '',
  `about` text,
  `state` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `provisioned` int(11) NOT NULL DEFAULT '0',
  `private` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `owned_by_user` int(11) NOT NULL DEFAULT '0',
  `created_by_user` int(11) NOT NULL,
  `owned_by_group` int(11) DEFAULT '0',
  `modified_by` int(11) DEFAULT '0',
  `setup_stage` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `admin_notes` text,
  `sync_group` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_alias` (`alias`),
  KEY `idx_sync_group` (`sync_group`),
  FULLTEXT KEY `idx_fulltxt_alias_title_about` (`alias`,`title`,`about`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_projects`
--

LOCK TABLES `jos_projects` WRITE;
/*!40000 ALTER TABLE `jos_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_projects_connection_providers`
--

DROP TABLE IF EXISTS `jos_projects_connection_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_projects_connection_providers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_projects_connection_providers`
--

LOCK TABLES `jos_projects_connection_providers` WRITE;
/*!40000 ALTER TABLE `jos_projects_connection_providers` DISABLE KEYS */;
INSERT INTO `jos_projects_connection_providers` VALUES (1,'googledrive','Google Drive'),(2,'dropbox','Dropbox'),(3,'github','Github'),(4,'awss3','AWS S3');
/*!40000 ALTER TABLE `jos_projects_connection_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_projects_connections`
--

DROP TABLE IF EXISTS `jos_projects_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_projects_connections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_projects_connections`
--

LOCK TABLES `jos_projects_connections` WRITE;
/*!40000 ALTER TABLE `jos_projects_connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_projects_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_access`
--

DROP TABLE IF EXISTS `jos_publication_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_version_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_access`
--

LOCK TABLES `jos_publication_access` WRITE;
/*!40000 ALTER TABLE `jos_publication_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_attachments`
--

DROP TABLE IF EXISTS `jos_publication_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_version_id` int(11) NOT NULL DEFAULT '0',
  `publication_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) DEFAULT '0',
  `object_id` int(11) DEFAULT '0',
  `object_name` varchar(64) DEFAULT '0',
  `object_instance` int(11) DEFAULT '0',
  `object_revision` int(11) DEFAULT '0',
  `role` tinyint(1) DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `vcs_hash` varchar(255) DEFAULT NULL,
  `vcs_revision` varchar(255) DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'file',
  `params` text,
  `attribs` text,
  `ordering` int(11) DEFAULT '0',
  `content_hash` varchar(255) DEFAULT NULL,
  `element_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_publication_id` (`publication_id`),
  KEY `idx_publication_version_id` (`publication_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_attachments`
--

LOCK TABLES `jos_publication_attachments` WRITE;
/*!40000 ALTER TABLE `jos_publication_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_audience`
--

DROP TABLE IF EXISTS `jos_publication_audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_audience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_id` int(11) NOT NULL DEFAULT '0',
  `publication_version_id` int(11) DEFAULT '0',
  `level0` tinyint(2) NOT NULL DEFAULT '0',
  `level1` tinyint(2) NOT NULL DEFAULT '0',
  `level2` tinyint(2) NOT NULL DEFAULT '0',
  `level3` tinyint(2) NOT NULL DEFAULT '0',
  `level4` tinyint(2) NOT NULL DEFAULT '0',
  `level5` tinyint(2) NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_audience`
--

LOCK TABLES `jos_publication_audience` WRITE;
/*!40000 ALTER TABLE `jos_publication_audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_audience_levels`
--

DROP TABLE IF EXISTS `jos_publication_audience_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_audience_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_audience_levels`
--

LOCK TABLES `jos_publication_audience_levels` WRITE;
/*!40000 ALTER TABLE `jos_publication_audience_levels` DISABLE KEYS */;
INSERT INTO `jos_publication_audience_levels` VALUES (1,'level0','K12','Middle/High School'),(2,'level1','Easy','Freshmen/Sophomores'),(3,'level2','Intermediate','Juniors/Seniors'),(4,'level3','Advanced','Graduate Students'),(5,'level4','Expert','PhD Experts'),(6,'level5','Professional','Beyond PhD');
/*!40000 ALTER TABLE `jos_publication_audience_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_authors`
--

DROP TABLE IF EXISTS `jos_publication_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_authors` (
  `publication_version_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_owner_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `repository_contact` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_publication_version_id` (`publication_version_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_project_owner_id` (`project_owner_id`),
  KEY `idx_status` (`status`),
  KEY `idx_repository_contact` (`repository_contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_authors`
--

LOCK TABLES `jos_publication_authors` WRITE;
/*!40000 ALTER TABLE `jos_publication_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_blocks`
--

DROP TABLE IF EXISTS `jos_publication_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block` varchar(100) NOT NULL DEFAULT '',
  `label` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `minimum` int(11) NOT NULL DEFAULT '0',
  `maximum` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `manifest` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `block` (`block`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_blocks`
--

LOCK TABLES `jos_publication_blocks` WRITE;
/*!40000 ALTER TABLE `jos_publication_blocks` DISABLE KEYS */;
INSERT INTO `jos_publication_blocks` VALUES (1,'content','Content','Publication Content',1,1,5,1,'',''),(2,'description','Description','Publication Description',1,1,5,2,'',''),(3,'authors','Authors','Publication Authors',1,1,1,3,'',''),(4,'extras','Extras','Publication Extra Content',1,0,1,4,'default=1',''),(5,'license','License','Publication Tags',1,0,1,5,'default=1',''),(6,'tags','Tags','Publication Tags',1,0,1,6,'default=1',''),(7,'notes','Notes','Version Release Notes',1,0,1,8,'default=1',''),(8,'review','Review','Publication Review',1,1,1,9,'default=1',''),(9,'citations','Citations','Publication Citations',1,0,0,1,'7','');
/*!40000 ALTER TABLE `jos_publication_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_categories`
--

DROP TABLE IF EXISTS `jos_publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `dc_type` varchar(200) NOT NULL DEFAULT 'Dataset',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `url_alias` varchar(200) NOT NULL DEFAULT '',
  `description` tinytext,
  `contributable` int(2) DEFAULT '1',
  `state` tinyint(1) DEFAULT '1',
  `customFields` text,
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_name` (`name`),
  UNIQUE KEY `uidx_alias` (`alias`),
  UNIQUE KEY `uidx_url_alias` (`url_alias`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_categories`
--

LOCK TABLES `jos_publication_categories` WRITE;
/*!40000 ALTER TABLE `jos_publication_categories` DISABLE KEYS */;
INSERT INTO `jos_publication_categories` VALUES (1,'Datasets','Dataset','dataset','datasets','A collection of research data',1,1,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1\nplg_wishlist=1\nplg_citations=1\nplg_usage = 1'),(2,'Workshops','Event','workshop','workshops','A collection of lectures, seminars, and materials that were presented at a workshop.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(3,'Publications','Dataset','publication','publications','A publication is a paper relevant to the community that has been published in some manner.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(4,'Learning Modules','InteractiveResource','learning module','learningmodules','A combination of presentations, tools, assignments, etc. geared toward teaching a specific concept.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(5,'Animations','MovingImage','animation','animations','An animation is a Flash-based demo or short movie that illustrates some concept.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(6,'Courses','Collection','course','courses','University courses that make videos of lectures and associated teaching materials available.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(7,'Tools','Software','tool','tools','A simulation tool is software that allows users to run a specific type of calculation.',0,1,'poweredby=Powered by=textarea=0\nbio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(9,'Downloads','PhysicalObject','download','downloads','A download is a type of resource that users can download and use on their own computer.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(10,'Notes','Text','note','notes','Notes are typically a category for any resource that might not fit any of the other categories.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(11,'Series','Collection','series','series','Series are collections of other resources, typically online presentations, that cover a specific topic.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1'),(12,'Teaching Materials','Text','teaching material','teachingmaterials','Supplementary materials (study notes, guides, etc.) that don\'t quite fit into any of the other categories.',0,0,'bio=Bio=textarea=0\ncredits=Credits=textarea=0\ncitations=Citations=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0\npublications=Publications=textarea=0','plg_reviews=1\nplg_questions=1\nplg_supportingdocs=1\nplg_versions=1');
/*!40000 ALTER TABLE `jos_publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_curation`
--

DROP TABLE IF EXISTS `jos_publication_curation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_curation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_id` int(11) NOT NULL DEFAULT '0',
  `publication_version_id` int(11) NOT NULL DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT '0',
  `update` text,
  `reviewed` datetime DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT '0',
  `review` text,
  `review_status` int(11) NOT NULL DEFAULT '0',
  `block` varchar(100) NOT NULL DEFAULT '',
  `step` int(11) DEFAULT '0',
  `element` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_publication_id` (`publication_id`),
  KEY `idx_publication_version_id` (`publication_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_curation`
--

LOCK TABLES `jos_publication_curation` WRITE;
/*!40000 ALTER TABLE `jos_publication_curation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_curation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_curation_history`
--

DROP TABLE IF EXISTS `jos_publication_curation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_curation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_version_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `changelog` text NOT NULL,
  `curator` tinyint(3) NOT NULL DEFAULT '0',
  `oldstatus` int(11) NOT NULL DEFAULT '0',
  `newstatus` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_curation_history`
--

LOCK TABLES `jos_publication_curation_history` WRITE;
/*!40000 ALTER TABLE `jos_publication_curation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_curation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_curation_versions`
--

DROP TABLE IF EXISTS `jos_publication_curation_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_curation_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `version_number` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `curation` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type_id_version_number` (`type_id`,`version_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_curation_versions`
--

LOCK TABLES `jos_publication_curation_versions` WRITE;
/*!40000 ALTER TABLE `jos_publication_curation_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_curation_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_handler_assoc`
--

DROP TABLE IF EXISTS `jos_publication_handler_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_handler_assoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_version_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `handler_id` int(11) NOT NULL,
  `params` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_handler_assoc`
--

LOCK TABLES `jos_publication_handler_assoc` WRITE;
/*!40000 ALTER TABLE `jos_publication_handler_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_handler_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_handlers`
--

DROP TABLE IF EXISTS `jos_publication_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_handlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `label` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `about` text,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_handlers`
--

LOCK TABLES `jos_publication_handlers` WRITE;
/*!40000 ALTER TABLE `jos_publication_handlers` DISABLE KEYS */;
INSERT INTO `jos_publication_handlers` VALUES (1,'imageviewer','Image Viewer','Image Gallery Presenter',1,'','');
/*!40000 ALTER TABLE `jos_publication_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_licenses`
--

DROP TABLE IF EXISTS `jos_publication_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `text` text,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `info` text,
  `ordering` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `main` int(11) NOT NULL DEFAULT '0',
  `agreement` int(11) DEFAULT '0',
  `customizable` int(11) DEFAULT '0',
  `icon` varchar(250) DEFAULT NULL,
  `opensource` tinyint(1) NOT NULL DEFAULT '0',
  `restriction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_active` (`active`),
  KEY `idx_main` (`main`),
  KEY `idx_agreement` (`agreement`),
  KEY `idx_customizable` (`customizable`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_licenses`
--

LOCK TABLES `jos_publication_licenses` WRITE;
/*!40000 ALTER TABLE `jos_publication_licenses` DISABLE KEYS */;
INSERT INTO `jos_publication_licenses` VALUES (1,'custom','[ONE LINE DESCRIPTION]\r\nCopyright (C) [YEAR] [OWNER]','Custom','http://creativecommons.org/about/cc0','Custom license',3,1,0,0,1,'/components/com_publications/assets/img/logos/license.gif',0,NULL),(2,'cc','','CC0 - Creative Commons','http://creativecommons.org/about/cc0','CC0 enables scientists, educators, artists and other creators and owners of copyright- or database-protected content to waive those interests in their works and thereby place them as completely as possible in the public domain, so that others may freely build upon, enhance and reuse the works for any purposes without restriction under copyright or database law.',2,1,1,1,0,'/components/com_publications/assets/img/logos/cc.gif',0,NULL),(3,'standard','All rights reserved.','Standard HUB License','http://nanohub.org','Standard HUB license.',1,0,0,0,0,'/components/com_publications/images/logos/license.gif',0,NULL);
/*!40000 ALTER TABLE `jos_publication_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_logs`
--

DROP TABLE IF EXISTS `jos_publication_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` int(11) NOT NULL,
  `publication_version_id` int(11) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(2) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `page_views` int(11) DEFAULT '0',
  `primary_accesses` int(11) DEFAULT '0',
  `support_accesses` int(11) DEFAULT '0',
  `page_views_unfiltered` int(11) DEFAULT NULL,
  `primary_accesses_unfiltered` int(11) DEFAULT NULL,
  `page_views_unique` int(11) DEFAULT NULL,
  `primary_accesses_unique` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_publication_id` (`publication_id`),
  KEY `idx_publication_version_id` (`publication_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_logs`
--

LOCK TABLES `jos_publication_logs` WRITE;
/*!40000 ALTER TABLE `jos_publication_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_master_types`
--

DROP TABLE IF EXISTS `jos_publication_master_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_master_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL DEFAULT '',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `description` tinytext,
  `contributable` int(2) DEFAULT '0',
  `supporting` int(2) DEFAULT '0',
  `ordering` int(2) DEFAULT '0',
  `params` text,
  `curation` text,
  `curatorgroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_alias` (`alias`),
  KEY `idx_contributable` (`contributable`),
  KEY `idx_supporting` (`supporting`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_master_types`
--

LOCK TABLES `jos_publication_master_types` WRITE;
/*!40000 ALTER TABLE `jos_publication_master_types` DISABLE KEYS */;
INSERT INTO `jos_publication_master_types` VALUES (1,'File(s)','files','uploaded material',1,1,1,'peer_review=1',NULL,NULL),(2,'Link','links','external content',0,0,3,'',NULL,NULL),(3,'Wiki','notes','from project notes',0,0,5,'',NULL,NULL),(4,'Application','apps','simulation tool',0,0,4,'',NULL,NULL),(5,'Series','series','publication collection',0,0,6,'',NULL,NULL),(6,'Gallery','gallery','image/photo gallery',0,0,7,'',NULL,NULL),(7,'Databases','databases','project database',0,0,2,'',NULL,NULL);
/*!40000 ALTER TABLE `jos_publication_master_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_ratings`
--

DROP TABLE IF EXISTS `jos_publication_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_id` int(11) NOT NULL DEFAULT '0',
  `publication_version_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `rating` decimal(2,1) NOT NULL DEFAULT '0.0',
  `comment` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `anonymous` tinyint(3) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_publication_id` (`publication_id`),
  KEY `idx_publication_version_id` (`publication_version_id`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_ratings`
--

LOCK TABLES `jos_publication_ratings` WRITE;
/*!40000 ALTER TABLE `jos_publication_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_screenshots`
--

DROP TABLE IF EXISTS `jos_publication_screenshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_screenshots` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `publication_version_id` int(11) NOT NULL DEFAULT '0',
  `publication_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(127) DEFAULT '',
  `ordering` int(11) DEFAULT '0',
  `filename` varchar(100) NOT NULL,
  `srcfile` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created_by` varchar(127) DEFAULT NULL,
  `modified_by` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_publication_id` (`publication_id`),
  KEY `idx_publication_version_id` (`publication_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_screenshots`
--

LOCK TABLES `jos_publication_screenshots` WRITE;
/*!40000 ALTER TABLE `jos_publication_screenshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_screenshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_stats`
--

DROP TABLE IF EXISTS `jos_publication_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `publication_version` tinyint(4) DEFAULT NULL,
  `users` bigint(20) DEFAULT NULL,
  `downloads` bigint(20) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period` tinyint(4) NOT NULL DEFAULT '-1',
  `processed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_publication_id_datetime_period` (`publication_id`,`datetime`,`period`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_stats`
--

LOCK TABLES `jos_publication_stats` WRITE;
/*!40000 ALTER TABLE `jos_publication_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publication_versions`
--

DROP TABLE IF EXISTS `jos_publication_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publication_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_id` int(11) NOT NULL DEFAULT '0',
  `main` int(1) NOT NULL DEFAULT '0',
  `doi` varchar(255) DEFAULT '',
  `state` int(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `abstract` text NOT NULL,
  `metadata` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `published_up` datetime DEFAULT '0000-00-00 00:00:00',
  `published_down` datetime DEFAULT NULL,
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `accepted` datetime DEFAULT '0000-00-00 00:00:00',
  `archived` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `submitted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) DEFAULT '0',
  `version_label` varchar(100) NOT NULL DEFAULT '1.0',
  `secret` varchar(10) NOT NULL DEFAULT '',
  `version_number` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `release_notes` text,
  `license_text` text,
  `license_type` int(11) DEFAULT NULL,
  `access` int(11) NOT NULL DEFAULT '0',
  `rating` decimal(2,1) NOT NULL DEFAULT '0.0',
  `times_rated` int(11) NOT NULL DEFAULT '0',
  `ranking` float NOT NULL DEFAULT '0',
  `curation` text,
  `reviewed` datetime DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  `curator` int(11) DEFAULT NULL,
  `curation_version_id` int(11) DEFAULT NULL,
  `forked_from` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_publication_id` (`publication_id`),
  KEY `idx_main` (`main`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_version_number` (`version_number`),
  FULLTEXT KEY `idx_fulltxt_title_description_abstract` (`title`,`description`,`abstract`),
  FULLTEXT KEY `ftidx_title` (`title`),
  FULLTEXT KEY `ftidx_abstract_description` (`abstract`,`description`),
  FULLTEXT KEY `ftidx_title_abstract_description` (`title`,`abstract`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publication_versions`
--

LOCK TABLES `jos_publication_versions` WRITE;
/*!40000 ALTER TABLE `jos_publication_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publication_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_publications`
--

DROP TABLE IF EXISTS `jos_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '0',
  `master_type` int(11) NOT NULL DEFAULT '1',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` decimal(2,1) NOT NULL DEFAULT '0.0',
  `times_rated` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `ranking` float NOT NULL DEFAULT '0',
  `group_owner` int(11) NOT NULL DEFAULT '0',
  `master_doi` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_master_type` (`master_type`),
  KEY `idx_project_id` (`project_id`),
  KEY `idx_category` (`category`),
  KEY `idx_group_owner` (`group_owner`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_publications`
--

LOCK TABLES `jos_publications` WRITE;
/*!40000 ALTER TABLE `jos_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_recent_tools`
--

DROP TABLE IF EXISTS `jos_recent_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_recent_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `tool` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_recent_tools`
--

LOCK TABLES `jos_recent_tools` WRITE;
/*!40000 ALTER TABLE `jos_recent_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_recent_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_recommendation`
--

DROP TABLE IF EXISTS `jos_recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_recommendation` (
  `fromID` int(11) NOT NULL,
  `toID` int(11) NOT NULL,
  `contentScore` float unsigned zerofill DEFAULT NULL,
  `tagScore` float unsigned zerofill DEFAULT NULL,
  `titleScore` float unsigned zerofill DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fromID`,`toID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_recommendation`
--

LOCK TABLES `jos_recommendation` WRITE;
/*!40000 ALTER TABLE `jos_recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_redirect_links`
--

DROP TABLE IF EXISTS `jos_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_redirect_links`
--

LOCK TABLES `jos_redirect_links` WRITE;
/*!40000 ALTER TABLE `jos_redirect_links` DISABLE KEYS */;
INSERT INTO `jos_redirect_links` VALUES (1,'http://192.168.33.10/','','','',1,0,'2016-04-09 19:47:48','0000-00-00 00:00:00'),(2,'https://192.168.33.10/','','','',1,0,'2016-04-09 20:05:25','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `jos_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_assoc`
--

DROP TABLE IF EXISTS `jos_resource_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_assoc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `child_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `grouping` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_parent_id_child_id` (`parent_id`,`child_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_assoc`
--

LOCK TABLES `jos_resource_assoc` WRITE;
/*!40000 ALTER TABLE `jos_resource_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `jos_resource_contributors_view`
--

DROP TABLE IF EXISTS `jos_resource_contributors_view`;
/*!50001 DROP VIEW IF EXISTS `jos_resource_contributors_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jos_resource_contributors_view` (
  `uidNumber` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jos_resource_import_hooks`
--

DROP TABLE IF EXISTS `jos_resource_import_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_import_hooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(25) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` text,
  `file` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_import_hooks`
--

LOCK TABLES `jos_resource_import_hooks` WRITE;
/*!40000 ALTER TABLE `jos_resource_import_hooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_import_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_import_runs`
--

DROP TABLE IF EXISTS `jos_resource_import_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_import_runs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` int(11) DEFAULT NULL,
  `processed` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `ran_by` int(11) DEFAULT NULL,
  `ran_at` datetime DEFAULT NULL,
  `dry_run` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_import_runs`
--

LOCK TABLES `jos_resource_import_runs` WRITE;
/*!40000 ALTER TABLE `jos_resource_import_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_import_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_imports`
--

DROP TABLE IF EXISTS `jos_resource_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_imports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `notes` text,
  `file` varchar(255) DEFAULT '',
  `count` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `mode` varchar(10) DEFAULT 'UPDATE',
  `params` text,
  `hooks` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_imports`
--

LOCK TABLES `jos_resource_imports` WRITE;
/*!40000 ALTER TABLE `jos_resource_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_licenses`
--

DROP TABLE IF EXISTS `jos_resource_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `text` text,
  `title` varchar(100) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `apps_only` tinyint(3) NOT NULL DEFAULT '0',
  `main` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agreement` tinyint(2) NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_licenses`
--

LOCK TABLES `jos_resource_licenses` WRITE;
/*!40000 ALTER TABLE `jos_resource_licenses` DISABLE KEYS */;
INSERT INTO `jos_resource_licenses` VALUES (1,'cc25-by-nc-sa','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\nto Remix — to adapt the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\nNoncommercial — You may not use this work for commercial purposes.\r\n\r\nShare Alike — If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.\r\n\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\n- The author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.\r\n\r\nNotice — For any reuse or distribution, you must make clear to others the license terms of this work. The best way to do this is with a link to this web page.','Creative Commons BY-NC-SA 2.5',6,0,NULL,NULL,'http://creativecommons.org/licenses/by-nc-sa/2.5/',0,NULL),(2,'cc30-by-nc-sa','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\nto Remix — to adapt the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\n\r\nNoncommercial — You may not use this work for commercial purposes.\r\n\r\nShare Alike — If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.\r\n\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\n- The author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.','Creative Commons BY-NC-SA 3.0',7,0,NULL,NULL,'http://creativecommons.org/licenses/by-nc-sa/3.0/',0,NULL),(3,'cc','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\nto Remix — to adapt the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\nNoncommercial — You may not use this work for commercial purposes.\r\n\r\nShare Alike — If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.\r\n\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\n- The author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.\r\n\r\nNotice — For any reuse or distribution, you must make clear to others the license terms of this work. The best way to do this is with a link to this web page.','Creative Commons',1,0,NULL,NULL,'http://creativecommons.org/licenses/by-nc-sa/2.5/',0,NULL),(4,'cc30-by-nc-nd','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\n\r\nNoncommercial — You may not use this work for commercial purposes.\r\n\r\nNo Derivative Works — You may not alter, transform, or build upon this work.\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\n- The author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.','Creative Commons BY-NC-ND 3.0',8,0,NULL,NULL,'http://creativecommons.org/licenses/by-nc-nd/3.0/',0,NULL),(5,'cc30-by','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\nto Remix — to adapt the work\r\nto make commercial use of the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\n- The author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.','Creative Commons BY 3.0',2,0,NULL,NULL,'http://creativecommons.org/licenses/by/3.0/',0,NULL),(6,'cc30-by-sa','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\nto Remix — to adapt the work\r\nto make commercial use of the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\n\r\nShare Alike — If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\n- The author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.','Creative Commons BY-SA 3.0',3,0,NULL,NULL,'http://creativecommons.org/licenses/by-sa/3.0/',0,NULL),(7,'cc30-by-nd','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\nto make commercial use of the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\n\r\nNo Derivative Works — You may not alter, transform, or build upon this work.\r\n\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\nThe author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.','Creative Commons BY-ND 3.0',4,0,NULL,NULL,'http://creativecommons.org/licenses/by-nd/3.0/',0,NULL),(8,'cc30-by-nc','You are free:\r\n\r\nto Share — to copy, distribute and transmit the work\r\nto Remix — to adapt the work\r\n\r\nUnder the following conditions:\r\n\r\nAttribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).\r\n\r\nNoncommercial — You may not use this work for commercial purposes.\r\n\r\nWith the understanding that:\r\n\r\nWaiver — Any of the above conditions can be waived if you get permission from the copyright holder.\r\n\r\nPublic Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.\r\n\r\nOther Rights — In no way are any of the following rights affected by the license:\r\n- Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations;\r\n- The author\'s moral rights;\r\n- Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.','Creative Commons BY-NC 3.0',5,0,NULL,NULL,'http://creativecommons.org/licenses/by-nc/3.0/',0,NULL),(9,'cc40-by-nc-sa','You are free:\n\nto Share — copy and redistribute the material in any medium or format\nto Adapt — remix, transform, and build upon the material\n\nThe licensor cannot revoke these freedoms as long as you follow the license terms.\nUnder the following terms:\n\nAttribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.\nNonCommercial — You may not use the material for commercial purposes.\nShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.\nNo additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.\n\nNotices:\nYou do not have to comply with the license for elements of the material in the public domain or where your use is permitted by an applicable exception or limitation.\nNo warranties are given. The license may not give you all of the permissions necessary for your intended use. For example, other rights such as publicity, privacy, or moral rights may limit how you use the material. \n\nFor more information visit http://creativecommons.org/licenses/by-nc-sa/4.0/legalcode.','Creative Commons BY-NC-SA 4.0',9,0,NULL,NULL,'http://creativecommons.org/licenses/by-nc-sa/4.0/',0,NULL);
/*!40000 ALTER TABLE `jos_resource_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_pages`
--

DROP TABLE IF EXISTS `jos_resource_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `plugin` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plugin` (`plugin`),
  KEY `idx_resource_id` (`resource_id`),
  KEY `idx_state` (`state`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_pages`
--

LOCK TABLES `jos_resource_pages` WRITE;
/*!40000 ALTER TABLE `jos_resource_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_ratings`
--

DROP TABLE IF EXISTS `jos_resource_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `rating` decimal(2,1) NOT NULL DEFAULT '0.0',
  `comment` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `anonymous` tinyint(3) NOT NULL DEFAULT '0',
  `state` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_ratings`
--

LOCK TABLES `jos_resource_ratings` WRITE;
/*!40000 ALTER TABLE `jos_resource_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_sponsors`
--

DROP TABLE IF EXISTS `jos_resource_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_sponsors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_sponsors`
--

LOCK TABLES `jos_resource_sponsors` WRITE;
/*!40000 ALTER TABLE `jos_resource_sponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_stats`
--

DROP TABLE IF EXISTS `jos_resource_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resid` bigint(20) NOT NULL,
  `restype` int(11) DEFAULT NULL,
  `users` bigint(20) DEFAULT NULL,
  `jobs` bigint(20) DEFAULT NULL,
  `avg_wall` int(20) DEFAULT NULL,
  `tot_wall` int(20) DEFAULT NULL,
  `avg_cpu` int(20) DEFAULT NULL,
  `tot_cpu` int(20) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period` tinyint(4) NOT NULL DEFAULT '-1',
  `processed_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_resid_restype_datetime_period` (`resid`,`restype`,`datetime`,`period`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_stats`
--

LOCK TABLES `jos_resource_stats` WRITE;
/*!40000 ALTER TABLE `jos_resource_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_stats_clusters`
--

DROP TABLE IF EXISTS `jos_resource_stats_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_stats_clusters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cluster` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(32) NOT NULL DEFAULT '',
  `uidNumber` int(11) NOT NULL DEFAULT '0',
  `toolname` varchar(80) NOT NULL DEFAULT '',
  `resid` int(11) NOT NULL DEFAULT '0',
  `clustersize` varchar(255) NOT NULL DEFAULT '',
  `cluster_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cluster_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_cluster` (`cluster`),
  KEY `idx_username` (`username`),
  KEY `idx_uidNumber` (`uidNumber`),
  KEY `idx_toolname` (`toolname`),
  KEY `idx_resid` (`resid`),
  KEY `idx_clustersize` (`clustersize`),
  KEY `idx_cluster_start` (`cluster_start`),
  KEY `idx_cluster_end` (`cluster_end`),
  KEY `idx_institution` (`institution`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_stats_clusters`
--

LOCK TABLES `jos_resource_stats_clusters` WRITE;
/*!40000 ALTER TABLE `jos_resource_stats_clusters` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_stats_clusters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_stats_tools`
--

DROP TABLE IF EXISTS `jos_resource_stats_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_stats_tools` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resid` bigint(20) NOT NULL,
  `restype` int(11) NOT NULL,
  `users` bigint(20) DEFAULT NULL,
  `sessions` bigint(20) DEFAULT NULL,
  `simulations` bigint(20) DEFAULT NULL,
  `jobs` bigint(20) DEFAULT NULL,
  `avg_wall` double unsigned DEFAULT '0',
  `tot_wall` double unsigned DEFAULT '0',
  `avg_cpu` double unsigned DEFAULT '0',
  `tot_cpu` double unsigned DEFAULT '0',
  `avg_view` double unsigned DEFAULT '0',
  `tot_view` double unsigned DEFAULT '0',
  `avg_wait` double unsigned DEFAULT '0',
  `tot_wait` double unsigned DEFAULT '0',
  `avg_cpus` int(20) DEFAULT NULL,
  `tot_cpus` int(20) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period` tinyint(4) NOT NULL DEFAULT '-1',
  `processed_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_stats_tools`
--

LOCK TABLES `jos_resource_stats_tools` WRITE;
/*!40000 ALTER TABLE `jos_resource_stats_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_stats_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_stats_tools_tops`
--

DROP TABLE IF EXISTS `jos_resource_stats_tools_tops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_stats_tools_tops` (
  `top` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `valfmt` tinyint(4) NOT NULL DEFAULT '0',
  `size` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`top`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_stats_tools_tops`
--

LOCK TABLES `jos_resource_stats_tools_tops` WRITE;
/*!40000 ALTER TABLE `jos_resource_stats_tools_tops` DISABLE KEYS */;
INSERT INTO `jos_resource_stats_tools_tops` VALUES (1,'Users By Country Of Residence',1,5),(2,'Top Domains By User Count',1,5),(3,'Users By Organization Type',1,5);
/*!40000 ALTER TABLE `jos_resource_stats_tools_tops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_stats_tools_topvals`
--

DROP TABLE IF EXISTS `jos_resource_stats_tools_topvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_stats_tools_topvals` (
  `id` bigint(20) NOT NULL,
  `top` tinyint(4) NOT NULL DEFAULT '0',
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `value` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_stats_tools_topvals`
--

LOCK TABLES `jos_resource_stats_tools_topvals` WRITE;
/*!40000 ALTER TABLE `jos_resource_stats_tools_topvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_stats_tools_topvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_stats_tools_users`
--

DROP TABLE IF EXISTS `jos_resource_stats_tools_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_stats_tools_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resid` bigint(20) NOT NULL,
  `restype` int(11) NOT NULL,
  `user` varchar(32) NOT NULL DEFAULT '',
  `sessions` bigint(20) DEFAULT NULL,
  `simulations` bigint(20) DEFAULT NULL,
  `jobs` bigint(20) DEFAULT NULL,
  `tot_wall` double unsigned DEFAULT '0',
  `tot_cpu` double unsigned DEFAULT '0',
  `tot_view` double unsigned DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_stats_tools_users`
--

LOCK TABLES `jos_resource_stats_tools_users` WRITE;
/*!40000 ALTER TABLE `jos_resource_stats_tools_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_stats_tools_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_taxonomy_audience`
--

DROP TABLE IF EXISTS `jos_resource_taxonomy_audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_taxonomy_audience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `versionid` int(11) DEFAULT '0',
  `level0` tinyint(2) NOT NULL DEFAULT '0',
  `level1` tinyint(2) NOT NULL DEFAULT '0',
  `level2` tinyint(2) NOT NULL DEFAULT '0',
  `level3` tinyint(2) NOT NULL DEFAULT '0',
  `level4` tinyint(2) NOT NULL DEFAULT '0',
  `level5` tinyint(2) NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT '',
  `added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `addedBy` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_taxonomy_audience`
--

LOCK TABLES `jos_resource_taxonomy_audience` WRITE;
/*!40000 ALTER TABLE `jos_resource_taxonomy_audience` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_taxonomy_audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_taxonomy_audience_levels`
--

DROP TABLE IF EXISTS `jos_resource_taxonomy_audience_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_taxonomy_audience_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_taxonomy_audience_levels`
--

LOCK TABLES `jos_resource_taxonomy_audience_levels` WRITE;
/*!40000 ALTER TABLE `jos_resource_taxonomy_audience_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_resource_taxonomy_audience_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resource_types`
--

DROP TABLE IF EXISTS `jos_resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resource_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(100) DEFAULT NULL,
  `type` varchar(200) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT '0',
  `description` tinytext,
  `contributable` int(2) DEFAULT '1',
  `customFields` text,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resource_types`
--

LOCK TABLES `jos_resource_types` WRITE;
/*!40000 ALTER TABLE `jos_resource_types` DISABLE KEYS */;
INSERT INTO `jos_resource_types` VALUES (1,'seminars','Seminars',27,'A lecture of some sort, usually recorded with voice or video.  It may be a graduate or undergraduate level seminar, a lecture for a class, or a tutorial presentation.',1,'{\"fields\":[{\"default\":\"\",\"name\":\"bio\",\"label\":\"Bio\",\"type\":\"textarea\",\"required\":\"0\"},{\"default\":\"\",\"name\":\"credits\",\"label\":\"Credits\",\"type\":\"textarea\",\"required\":\"0\"},{\"default\":\"\",\"name\":\"sponsoredby\",\"label\":\"Sponsored by\",\"type\":\"textarea\",\"required\":\"0\"}]}','plg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=1\nplg_abouttool=0'),(2,'workshops','Workshops',27,'A collection of lectures, seminars, and materials that were presented at a workshop.',0,'credits=Credits=textarea=0\nsponsoredby=Sponsored by=textarea=0','plg_citations=0\nplg_questions=0\nplg_recommendations=1\nplg_related=1\nplg_reviews=1\nplg_usage=0\nplg_versions=0\nplg_favorite=1\nplg_share=1\nplg_wishlist=0\nplg_supportingdocs=1\nplg_about=1\nplg_abouttool=0'),(3,'Documents','Documents',27,'Articles, technical reports, theses, and other documents, usually in PDF or DOC format.',1,'acknowledgments=Acknowledgments=textarea=0\nreferences=References=textarea=0','plg_citations=0\nplg_questions=0\nplg_recommendations=1\nplg_related=1\nplg_reviews=1\nplg_usage=0\nplg_versions=0\nplg_favorite=1\nplg_share=1\nplg_wishlist=0\nplg_supportingdocs=1\nplg_about=1\nplg_abouttool=0'),(7,'tools','Tools',27,'Simulation and modeling tools that can be accessed via a web browser.',1,'poweredby=Powered by=textarea=0\ncredits=Credits=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0','plg_citations=1\nplg_questions=1\nplg_recommendations=1\nplg_related=1\nplg_reviews=1\nplg_usage=1\nplg_versions=1\nplg_favorite=1\nplg_share=1\nplg_wishlist=1\nplg_supportingdocs=1\nplg_about=0\nplg_abouttool=1'),(9,'datasets','datasets',27,'Spreadsheets and other data related lists that are available for download but don\\\'t fit into other categories.',1,'{\"fields\":[{\"default\":\"\",\"name\":\"credits\",\"label\":\"Credits\",\"type\":\"textarea\",\"required\":\"0\"},{\"default\":\"\",\"name\":\"sponsoredby\",\"label\":\"Sponsored by\",\"type\":\"textarea\",\"required\":\"0\"},{\"default\":\"\",\"name\":\"references\",\"label\":\"References\",\"type\":\"text\",\"required\":\"0\"}]}','plg_share=1\nplg_favorite=1\nplg_versions=0\nplg_reviews=1\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=1\nplg_recommendations=1\nplg_citations=0\nplg_supportingdocs=1\nplg_usagenew=0\nplg_about=1\nplg_abouttool=0'),(11,'elink','External Link',30,NULL,1,NULL,NULL),(12,'ilink','Internal Link',30,NULL,1,NULL,NULL),(13,'file','File',30,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(14,'presentationslides','Presentation Slides',28,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(15,'quicktime','Quicktime',30,NULL,1,NULL,NULL),(19,'presentation','Presentation (without audio)',28,NULL,1,NULL,NULL),(20,'presentation_audio','Presentation (with audio)',28,NULL,1,NULL,NULL),(21,'subtype','Sub Type',0,NULL,1,NULL,NULL),(22,'researchseminars','Research Seminars',21,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(26,'flash_paper','Flash Paper',30,NULL,1,NULL,NULL),(27,'maintypes','Main Types',0,NULL,1,NULL,NULL),(28,'logicaltype','Logical Type',0,NULL,1,NULL,NULL),(29,'group','Group',0,NULL,1,NULL,NULL),(30,'type','Type',0,NULL,1,NULL,NULL),(31,'series','Series',27,'Series are collections of lectures, publications, and other resources presented as a list.  Each series is available as a podcast feed.',0,'credits=Credits=textarea=0\nsponsoredby=Sponsored by=textarea=0\nreferences=References=textarea=0','plg_citations=0\nplg_questions=0\nplg_recommendations=1\nplg_related=1\nplg_reviews=1\nplg_usage=0\nplg_versions=0\nplg_favorite=1\nplg_share=1\nplg_wishlist=0\nplg_supportingdocs=1\nplg_about=1\nplg_abouttool=0'),(32,'breeze','Breeze',30,NULL,1,NULL,NULL),(33,'pdf','PDF',30,NULL,1,NULL,NULL),(34,'quiz','Quiz',28,NULL,1,NULL,NULL),(35,'powerpoint','PowerPoint',30,NULL,1,NULL,NULL),(36,'poster','Poster',28,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(37,'player','Media Player',30,NULL,1,NULL,NULL),(38,'package','Package',30,NULL,1,NULL,NULL),(39,'teachingmaterials','Teaching Materials',27,'Supplementary materials (study notes, guides, etc.) that don\\\'t quite fit into any of the other categories.',1,'references=References=textarea=0','plg_citations=0\nplg_questions=0\nplg_recommendations=1\nplg_related=1\nplg_reviews=1\nplg_usage=0\nplg_versions=0\nplg_favorite=1\nplg_share=1\nplg_wishlist=0\nplg_supportingdocs=1\nplg_about=1\nplg_abouttool=0'),(40,'video_stream','Video Stream',28,NULL,1,NULL,NULL),(41,'video','Video',30,NULL,1,NULL,NULL),(48,'tutorials','Tutorials',21,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(49,'podcastaudio','Podcast (audio)',28,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(50,'podcastvideo','Podcast (video)',28,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(51,'homeworkassignment','Homework Assignment',28,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(54,'courselectures','Course Lectures',21,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(55,'thesis','Ph.D. Thesis',28,NULL,1,NULL,NULL),(56,'publicationpreprint','Publication Preprint',28,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(57,'handout','Handout',28,NULL,1,NULL,NULL),(58,'undergraduatepresentation','Undergraduate Presentation',21,'',1,'{\"fields\":[]}','linkAction=extension\nplg_share=0\nplg_favorite=0\nplg_versions=0\nplg_reviews=0\nplg_questions=0\nplg_wishlist=0\nplg_usage=0\nplg_related=0\nplg_recommendations=0\nplg_citations=0\nplg_supportingdocs=0\nplg_usagenew=0\nplg_about=0\nplg_abouttool=0'),(59,'manual','Manual',28,NULL,1,NULL,NULL),(60,'software_download','Software Download',28,NULL,1,NULL,NULL),(62,'hubpresenter','HUBpresenter',30,'HTML5 Breeze Replacement',1,NULL,NULL),(63,'html5video','HTML5 Video',28,'HTML5 Video with Subtitle support!',1,NULL,NULL),(64,'windowstools','Tools (Windows)',27,'<p>A simulation tool is software that allows users to run a specific type of calculation. These are (MS) Windows-based.</p>',0,'{\"fields\":[{\"default\":\"\",\"name\":\"credits\",\"label\":\"Credits\",\"type\":\"textarea\",\"required\":\"0\"},{\"default\":\"\",\"name\":\"sponsoredby\",\"label\":\"Sponsors\",\"type\":\"textarea\",\"required\":\"0\"},{\"default\":\"\",\"name\":\"references\",\"label\":\"References\",\"type\":\"textarea\",\"required\":\"0\"}]}','{\"plg_about\":\"1\",\"plg_citations\":\"0\",\"plg_findthistext\":\"0\",\"plg_groups\":\"1\",\"plg_questions\":\"1\",\"plg_related\":\"0\",\"plg_reviews\":\"1\",\"plg_share\":\"1\",\"plg_sponsors\":\"1\",\"plg_supportingdocs\":\"0\",\"plg_usage\":\"0\",\"plg_versions\":\"0\",\"plg_wishlist\":\"1\"}');
/*!40000 ALTER TABLE `jos_resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_resources`
--

DROP TABLE IF EXISTS `jos_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `logical_type` int(11) NOT NULL DEFAULT '0',
  `introtext` text NOT NULL,
  `fulltxt` text NOT NULL,
  `footertext` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `path` varchar(200) NOT NULL DEFAULT '',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `standalone` tinyint(1) NOT NULL DEFAULT '0',
  `group_owner` varchar(250) NOT NULL DEFAULT '',
  `group_access` text,
  `rating` decimal(2,1) NOT NULL DEFAULT '0.0',
  `times_rated` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `attribs` text,
  `alias` varchar(100) NOT NULL DEFAULT '',
  `ranking` float NOT NULL DEFAULT '0',
  `master_doi` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ftidx_title` (`title`),
  FULLTEXT KEY `ftidx_introtext_fulltxt` (`introtext`,`fulltxt`),
  FULLTEXT KEY `ftidx_title_introtext_fulltxt` (`title`,`introtext`,`fulltxt`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_resources`
--

LOCK TABLES `jos_resources` WRITE;
/*!40000 ALTER TABLE `jos_resources` DISABLE KEYS */;
INSERT INTO `jos_resources` VALUES (1,'workspace',7,0,'workspace','workspace','','2015-09-13 14:50:14',62,'2015-09-13 14:50:14',62,1,'2015-09-13 14:50:14','0000-00-00 00:00:00',0,0,'',0,'0000-00-00 00:00:00',1,'',NULL,0.0,0,'','','workspace',0,'');
/*!40000 ALTER TABLE `jos_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_schemas`
--

DROP TABLE IF EXISTS `jos_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_schemas`
--

LOCK TABLES `jos_schemas` WRITE;
/*!40000 ALTER TABLE `jos_schemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_screenshots`
--

DROP TABLE IF EXISTS `jos_screenshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_screenshots` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `versionid` int(11) DEFAULT '0',
  `title` varchar(127) DEFAULT '',
  `ordering` int(11) DEFAULT '0',
  `filename` varchar(100) NOT NULL,
  `resourceid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_screenshots`
--

LOCK TABLES `jos_screenshots` WRITE;
/*!40000 ALTER TABLE `jos_screenshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_screenshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_search_blacklist`
--

DROP TABLE IF EXISTS `jos_search_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_search_blacklist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_search_blacklist`
--

LOCK TABLES `jos_search_blacklist` WRITE;
/*!40000 ALTER TABLE `jos_search_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_search_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_session`
--

DROP TABLE IF EXISTS `jos_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_session`
--

LOCK TABLES `jos_session` WRITE;
/*!40000 ALTER TABLE `jos_session` DISABLE KEYS */;
INSERT INTO `jos_session` VALUES ('6d98ced3bb19f78d2e4c68139c5c66e6',4,1,'1498702178',NULL,0,'','','192.168.33.1'),('be9cc20b39cd3df042834779c51c631f',4,1,'1498702179',NULL,0,'','','192.168.33.1'),('30ff11484ac4665459a5d963f5a12390',4,1,'1498702181',NULL,0,'','','192.168.33.1'),('83e9f20302d5a27c584773b7e746ee10',4,1,'1498702183',NULL,0,'','','192.168.33.1'),('855b7f7423c6d7f17a9a4adf8e5681f0',4,1,'1498702184',NULL,0,'','','192.168.33.1'),('7432bae1b012ec7812dfdcdf554702fb',4,1,'1498702189',NULL,0,'','','192.168.33.1'),('6ba093dace49e1a38b405bfc36789fd3',4,1,'1498702189',NULL,0,'','','192.168.33.1'),('a57d06dec5f920e3965f84ab7d5cccb8',4,1,'1498702190',NULL,0,'','','192.168.33.1'),('148e9336e922b69cbcfe666df331bfb3',4,1,'1498702191',NULL,0,'','','192.168.33.1'),('942a048d783a9266be8b713a7b5715db',4,1,'1498702196',NULL,0,'','','192.168.33.1'),('d252757f047c8fbab9d35726bf1a356b',4,1,'1498702329',NULL,0,'','','192.168.33.1'),('83921a4831530bb6b4165251d79ba0dc',4,1,'1498702197',NULL,0,'','','192.168.33.1'),('ac2420f7d49e0c1126d3bb59492c75c2',4,1,'1498702197',NULL,0,'','','192.168.33.1'),('f5fa5b2c6140cdbfdecfc37cf091addf',4,1,'1498702198',NULL,0,'','','192.168.33.1'),('ed4ee46ba9adb9e9aadbc38a96b10539',4,1,'1498702195',NULL,0,'','','192.168.33.1'),('c1eb81149a0fcec40e4111e16d2ee268',4,1,'1498702150',NULL,0,'','','192.168.33.1'),('b4f92ac4f1fd7668b3d7bd3565b18af8',4,1,'1498702169',NULL,0,'','','192.168.33.1'),('415d535626e645c5f663809f3d5577f3',4,1,'1498702152',NULL,0,'','','192.168.33.1'),('bf01cd3fc26099ac4ce509cc5c647012',4,1,'1498702153',NULL,0,'','','192.168.33.1'),('51f1732a43ae0fa6f08f69d583919f11',4,1,'1498702154',NULL,0,'','','192.168.33.1'),('545ce468df0f22221da762068bc4e93f',4,1,'1498702182',NULL,0,'','','192.168.33.1'),('966d42023057ebac34726e965561d35b',4,1,'1498702156',NULL,0,'','','192.168.33.1'),('fa5f8100738128a2bf0d9e983082b7ff',4,1,'1498702158',NULL,0,'','','192.168.33.1'),('f6bfd362b580137bd01e67f53acdd33f',4,1,'1498702158',NULL,0,'','','192.168.33.1'),('61d5d68cb7769c85e761f7671af720bc',4,1,'1498702161',NULL,0,'','','192.168.33.1'),('bf59905eb90ab1891eb9cf02fcd097e6',4,1,'1498702161',NULL,0,'','','192.168.33.1'),('ec26395af0a6fca2b46ccb7e6089ade5',4,1,'1498702187',NULL,0,'','','192.168.33.1'),('5de7c2dc9786ee131ac039b89bf3b3d8',4,1,'1498702164',NULL,0,'','','192.168.33.1'),('254d9fbf41ad38a8309297fa27815f68',4,1,'1498702164',NULL,0,'','','192.168.33.1'),('cddaf31fa06b81d8c6cafad0a8758623',4,1,'1498702189',NULL,0,'','','192.168.33.1'),('3e85d5a1ce093d12c281ee1682804576',4,1,'1498702170',NULL,0,'','','192.168.33.1'),('be6ae7f7d9b9d1ee2af64bc7fb00d11b',4,1,'1498702171',NULL,0,'','','192.168.33.1'),('df9065956bc14797cdf074971202ce87',4,1,'1498702171',NULL,0,'','','192.168.33.1'),('7c9816cf4445b0d5d464b546d153f47d',4,1,'1498702172',NULL,0,'','','192.168.33.1'),('28de48ba4264680e1120c30049dbd11c',4,1,'1498702174',NULL,0,'','','192.168.33.1'),('e45c0efca9617bc94ae360b3ffda1c5c',4,1,'1498702177',NULL,0,'','','192.168.33.1'),('d9916386875b0e64bbbcb09bbe0b8db8',4,1,'1498702177',NULL,0,'','','192.168.33.1'),('957ab2909fbe91736164ee8f9d67e2a7',6,1,'1498701765',NULL,0,'','',NULL),('96022498cae2ecb66e9202a922670985',1,0,'1498702485','__default|a:17:{s:15:\"session.counter\";i:27;s:19:\"session.timer.start\";i:1498702002;s:18:\"session.timer.last\";i:1498702482;s:17:\"session.timer.now\";i:1498702484;s:8:\"registry\";O:23:\"Hubzero\\Config\\Registry\":2:{s:7:\"\0*\0data\";O:8:\"stdClass\":8:{s:1:\"0\";s:7:\"session\";s:11:\"application\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}s:13:\"com_installer\";O:8:\"stdClass\":2:{s:7:\"message\";s:0:\"\";s:17:\"extension_message\";s:0:\"\";}s:31:\"com_components\\installer\\admin\\\";O:8:\"stdClass\":1:{s:8:\"s\\manage\";O:8:\"stdClass\":4:{s:4:\"data\";a:1:{s:7:\"filters\";a:5:{s:6:\"search\";s:5:\"debug\";s:9:\"client_id\";s:0:\"\";s:6:\"status\";s:0:\"\";s:4:\"type\";s:0:\"\";s:5:\"group\";s:0:\"\";}}s:10:\"limitstart\";s:1:\"0\";s:8:\"ordercol\";s:4:\"name\";s:9:\"orderdirn\";s:3:\"asc\";}}s:6:\"global\";O:8:\"stdClass\":1:{s:4:\"list\";O:8:\"stdClass\":1:{s:5:\"limit\";s:2:\"20\";}}s:6:\"Member\";O:8:\"stdClass\":2:{s:5:\"start\";d:0;s:5:\"limit\";i:20;}s:7:\"Hubzero\";O:8:\"stdClass\":2:{s:6:\"Access\";O:8:\"stdClass\":1:{s:5:\"Group\";O:8:\"stdClass\":2:{s:7:\"orderby\";s:3:\"lft\";s:8:\"orderdir\";s:3:\"asc\";}}s:7:\"Message\";O:8:\"stdClass\":1:{s:9:\"Component\";O:8:\"stdClass\":2:{s:7:\"orderby\";s:9:\"component\";s:8:\"orderdir\";s:3:\"asc\";}}}s:10:\"Components\";O:8:\"stdClass\":1:{s:7:\"Members\";O:8:\"stdClass\":1:{s:6:\"Models\";O:8:\"stdClass\":1:{s:7:\"Profile\";O:8:\"stdClass\":3:{s:5:\"Field\";O:8:\"stdClass\":2:{s:7:\"orderby\";s:8:\"ordering\";s:8:\"orderdir\";s:3:\"asc\";}s:7:\"orderby\";s:8:\"ordering\";s:8:\"orderdir\";s:3:\"asc\";}}}}}s:9:\"separator\";s:1:\".\";}s:4:\"user\";C:17:\"Hubzero\\User\\User\":867:{a:25:{s:2:\"id\";s:4:\"1000\";s:4:\"name\";s:11:\"CMS Manager\";s:9:\"givenName\";s:3:\"CMS\";s:10:\"middleName\";s:0:\"\";s:7:\"surname\";s:7:\"Manager\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:21:\"webmaster@example.com\";s:8:\"password\";s:105:\"{CRYPT}$6$fW0UrFPK$jg68R6xtLfWNvGJUi82ErwJVsXUMK1FIPh9bD4KO8wYV9KxTZPtBq3boLORjRoY1dq7rF3GQ8tfIFHv2II8C9.\";s:8:\"usertype\";s:10:\"deprecated\";s:5:\"block\";s:1:\"0\";s:8:\"approved\";s:1:\"2\";s:9:\"sendEmail\";s:1:\"0\";s:12:\"registerDate\";s:19:\"2015-09-13 14:36:26\";s:10:\"registerIP\";s:0:\"\";s:13:\"lastvisitDate\";s:19:\"2016-04-09 20:11:00\";s:10:\"activation\";s:1:\"1\";s:6:\"params\";s:2:\"{}\";s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:6:\"access\";s:1:\"5\";s:14:\"usageAgreement\";s:1:\"1\";s:13:\"homeDirectory\";s:19:\"/home/example/admin\";s:10:\"loginShell\";s:9:\"/bin/bash\";s:8:\"ftpShell\";s:20:\"/usr/lib/sftp-server\";s:5:\"guest\";i:0;}}s:15:\"tracker.user_id\";s:4:\"1000\";s:16:\"tracker.username\";s:5:\"admin\";s:12:\"tracker.psid\";s:32:\"96022498cae2ecb66e9202a922670985\";s:11:\"tracker.sid\";s:32:\"96022498cae2ecb66e9202a922670985\";s:12:\"tracker.ssid\";s:32:\"ae261e6bbb371e219df07392dc6476cc\";s:12:\"tracker.rsid\";s:32:\"ae261e6bbb371e219df07392dc6476cc\";s:13:\"session.token\";s:32:\"47639b33553c270604cde8e7c27befa9\";s:15:\"expiredpassword\";s:1:\"1\";s:21:\"session.authenticator\";s:7:\"hubzero\";s:14:\"session.source\";s:4:\"user\";s:23:\"registration.incomplete\";b:1;}',1000,'admin','','192.168.33.1'),('9fc25f77e9d94d06ca7b41f101d815bd',4,1,'1498702330',NULL,0,'','','192.168.33.1'),('b6a3b5404aab72f1646a1f177bb77115',4,1,'1498702330',NULL,0,'','','192.168.33.1'),('9fe14689e0ce7e5139bb4b7a2ee8fa23',4,1,'1498702331',NULL,0,'','','192.168.33.1'),('0de3e3c8b74de50477dfd456cdcd197d',4,1,'1498702332',NULL,0,'','','192.168.33.1'),('585163c09e2aced7f5e2fa6a52b34ffa',4,1,'1498702333',NULL,0,'','','192.168.33.1'),('f223162f8ad39c5665acd84b31acb979',4,1,'1498702334',NULL,0,'','','192.168.33.1'),('c9c373cba21ea73f6026a121f987c079',4,1,'1498702335',NULL,0,'','','192.168.33.1'),('de5198366d15d802c91de33748a43d7d',4,1,'1498702432',NULL,0,'','','192.168.33.1'),('f3e768a4bbfb042187ef621bbbc86a0d',4,1,'1498702433',NULL,0,'','','192.168.33.1'),('a914a871a84285d605c694e638869f2f',4,1,'1498702434',NULL,0,'','','192.168.33.1'),('e7af86a5a0b1cda0ff25c3194db1c51c',4,1,'1498702435',NULL,0,'','','192.168.33.1'),('40416896f289d76933d51d07a9748af8',4,1,'1498702436',NULL,0,'','','192.168.33.1'),('30d7e5cf6a35df67573a77dbdafe709a',4,1,'1498702437',NULL,0,'','','192.168.33.1'),('e02f3616a4e830c56b4e2f771a424a40',4,1,'1498702473',NULL,0,'','','192.168.33.1'),('c7d6d3f6f4a38f8d0615840d3bcc8199',4,1,'1498702474',NULL,0,'','','192.168.33.1'),('636ddb855e359b7063a564c4f9d5dda6',4,1,'1498702475',NULL,0,'','','192.168.33.1'),('4f4c34db18b4f1d7a83aeee7ea8b521e',4,1,'1498702476',NULL,0,'','','192.168.33.1'),('dc0e76dff3ab719b40f8d92b12395e6a',4,1,'1498702477',NULL,0,'','','192.168.33.1'),('0b4ced0d8ab1cc034fdeff5bd8af32a7',4,1,'1498702478',NULL,0,'','','192.168.33.1'),('023c5a13fa2c1025d76774f20de5f4f2',4,1,'1498702478',NULL,0,'','','192.168.33.1'),('f1c291f193f52491404992ed4b061797',4,1,'1498702481',NULL,0,'','','192.168.33.1'),('5fdaae40ff44b66de28868200571e540',1,0,'1498702974','__default|a:16:{s:15:\"session.counter\";i:19;s:19:\"session.timer.start\";i:1498702869;s:18:\"session.timer.last\";i:1498702969;s:17:\"session.timer.now\";i:1498702973;s:8:\"registry\";O:23:\"Hubzero\\Config\\Registry\":2:{s:7:\"\0*\0data\";O:8:\"stdClass\":5:{s:1:\"0\";s:7:\"session\";s:11:\"application\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}s:6:\"Member\";O:8:\"stdClass\":2:{s:5:\"start\";d:0;s:5:\"limit\";i:20;}s:7:\"Hubzero\";O:8:\"stdClass\":2:{s:6:\"Access\";O:8:\"stdClass\":1:{s:5:\"Group\";O:8:\"stdClass\":2:{s:7:\"orderby\";s:3:\"lft\";s:8:\"orderdir\";s:3:\"asc\";}}s:7:\"Message\";O:8:\"stdClass\":1:{s:9:\"Component\";O:8:\"stdClass\":2:{s:7:\"orderby\";s:9:\"component\";s:8:\"orderdir\";s:3:\"asc\";}}}s:10:\"Components\";O:8:\"stdClass\":1:{s:7:\"Members\";O:8:\"stdClass\":1:{s:6:\"Models\";O:8:\"stdClass\":1:{s:7:\"Profile\";O:8:\"stdClass\":3:{s:5:\"Field\";O:8:\"stdClass\":2:{s:7:\"orderby\";s:8:\"ordering\";s:8:\"orderdir\";s:3:\"asc\";}s:7:\"orderby\";s:8:\"ordering\";s:8:\"orderdir\";s:3:\"asc\";}}}}}s:9:\"separator\";s:1:\".\";}s:4:\"user\";C:17:\"Hubzero\\User\\User\":961:{a:25:{s:2:\"id\";s:4:\"1000\";s:4:\"name\";s:11:\"CMS Manager\";s:9:\"givenName\";s:3:\"CMS\";s:10:\"middleName\";s:0:\"\";s:7:\"surname\";s:7:\"Manager\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:21:\"webmaster@example.com\";s:8:\"password\";s:105:\"{CRYPT}$6$tqLPZ7rY$JaNgLctVOeYsGclf0XXTDwjbGVnnCphnj0En4BHKGW5SV.fLPY6cGdUgO5jVZXUn82lm5TZPDr4N7OnePNeQk.\";s:8:\"usertype\";s:10:\"deprecated\";s:5:\"block\";s:1:\"0\";s:8:\"approved\";s:1:\"2\";s:9:\"sendEmail\";s:1:\"0\";s:12:\"registerDate\";s:19:\"2015-09-13 14:36:26\";s:10:\"registerIP\";s:0:\"\";s:13:\"lastvisitDate\";s:19:\"2017-06-29 02:07:44\";s:10:\"activation\";s:1:\"1\";s:6:\"params\";s:95:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"America\\/New_York\"}\";s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:6:\"access\";s:1:\"5\";s:14:\"usageAgreement\";s:1:\"1\";s:13:\"homeDirectory\";s:19:\"/home/example/admin\";s:10:\"loginShell\";s:9:\"/bin/bash\";s:8:\"ftpShell\";s:20:\"/usr/lib/sftp-server\";s:5:\"guest\";i:0;}}s:15:\"tracker.user_id\";s:4:\"1000\";s:16:\"tracker.username\";s:5:\"admin\";s:12:\"tracker.psid\";s:32:\"5fdaae40ff44b66de28868200571e540\";s:11:\"tracker.sid\";s:32:\"5fdaae40ff44b66de28868200571e540\";s:12:\"tracker.ssid\";s:32:\"ae261e6bbb371e219df07392dc6476cc\";s:12:\"tracker.rsid\";s:32:\"ae261e6bbb371e219df07392dc6476cc\";s:13:\"session.token\";s:32:\"20068ed4500695c714c76c487e11eccb\";s:21:\"session.authenticator\";s:7:\"hubzero\";s:14:\"session.source\";s:4:\"user\";s:23:\"registration.incomplete\";b:1;}',1000,'admin','','192.168.33.1'),('3ae37f44658b6a3b510b7b36ef739a16',4,1,'1498702952',NULL,0,'','','192.168.33.1'),('1d37c1aa0337e49ab1c7030aa168b875',4,1,'1498702907',NULL,0,'','','192.168.33.1'),('ab1b93e6286ba9cd590f6097e66674dc',4,1,'1498702908',NULL,0,'','','192.168.33.1'),('9e18765043acdde1068ffbded5e6580e',4,1,'1498702908',NULL,0,'','','192.168.33.1'),('3d6549ccbf6d16d106092a38909d9df4',4,1,'1498702910',NULL,0,'','','192.168.33.1'),('2dba17035741ccccc426860f34027c6d',4,1,'1498702911',NULL,0,'','','192.168.33.1'),('276626ac2ced45d4d287b80b3d725bf4',4,1,'1498702913',NULL,0,'','','192.168.33.1'),('c16018942e962921201f7e9d355df16c',4,1,'1498702929',NULL,0,'','','192.168.33.1'),('468b8aea7f58bf00be583ce378958a46',4,1,'1498702930',NULL,0,'','','192.168.33.1'),('1ec4dcc56d3baff5910dcffb06eda1b2',4,1,'1498702932',NULL,0,'','','192.168.33.1'),('3307c2820a24238cdcadd66689c9dd0d',4,1,'1498702932',NULL,0,'','','192.168.33.1'),('af34d24029af87d98430b5bf8776f2a8',4,1,'1498702933',NULL,0,'','','192.168.33.1'),('f9d2229b794c7c380d9a2fc510762308',4,1,'1498702935',NULL,0,'','','192.168.33.1'),('9205b696773f07f80cbd293bcfafcf5e',4,1,'1498702952',NULL,0,'','','192.168.33.1'),('8043e98f6f941d9c01b23a74004c7622',4,1,'1498702954',NULL,0,'','','192.168.33.1'),('755e7178da67a3cd9649070c110f3b98',4,1,'1498702955',NULL,0,'','','192.168.33.1'),('12297c94441467a4b15b7d0ee5d3aace',4,1,'1498702955',NULL,0,'','','192.168.33.1'),('63ea986d89a218bfea99c9cf864f6caf',4,1,'1498702957',NULL,0,'','','192.168.33.1'),('69a2d287473b1bbba796d4c1e8355493',4,1,'1498702958',NULL,0,'','','192.168.33.1'),('96ed9b89084570df9def308dd9e659b4',4,1,'1498702959',NULL,0,'','','192.168.33.1'),('00a7f8743de907f280d5cd35e6798fb8',4,1,'1498702960',NULL,0,'','','192.168.33.1');
/*!40000 ALTER TABLE `jos_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_session_geo`
--

DROP TABLE IF EXISTS `jos_session_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_session_geo` (
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `ip` varchar(15) DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `domain` varchar(128) DEFAULT NULL,
  `signed` tinyint(3) DEFAULT '0',
  `countrySHORT` char(2) DEFAULT NULL,
  `countryLONG` varchar(64) DEFAULT NULL,
  `ipREGION` varchar(128) DEFAULT NULL,
  `ipCITY` varchar(128) DEFAULT NULL,
  `ipLATITUDE` double DEFAULT NULL,
  `ipLONGITUDE` double DEFAULT NULL,
  `bot` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `idx_userid` (`userid`),
  KEY `idx_time` (`time`),
  KEY `idx_ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_session_geo`
--

LOCK TABLES `jos_session_geo` WRITE;
/*!40000 ALTER TABLE `jos_session_geo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_session_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_session_log`
--

DROP TABLE IF EXISTS `jos_session_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_session_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` tinyint(4) DEFAULT NULL,
  `session_id` char(64) DEFAULT NULL,
  `psid` char(64) DEFAULT NULL,
  `rsid` char(64) DEFAULT NULL,
  `ssid` char(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `authenticator` char(64) DEFAULT NULL,
  `source` char(64) DEFAULT NULL,
  `ip` char(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_session_log`
--

LOCK TABLES `jos_session_log` WRITE;
/*!40000 ALTER TABLE `jos_session_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_session_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_shibboleth_sessions`
--

DROP TABLE IF EXISTS `jos_shibboleth_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_shibboleth_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` varchar(200) NOT NULL,
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `session_key` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_shibboleth_sessions`
--

LOCK TABLES `jos_shibboleth_sessions` WRITE;
/*!40000 ALTER TABLE `jos_shibboleth_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_shibboleth_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_sites`
--

DROP TABLE IF EXISTS `jos_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `teaser` varchar(255) DEFAULT NULL,
  `description` text,
  `notes` text,
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `published_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_sites`
--

LOCK TABLES `jos_sites` WRITE;
/*!40000 ALTER TABLE `jos_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_solr_search_facets`
--

DROP TABLE IF EXISTS `jos_solr_search_facets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_solr_search_facets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `facet` longtext,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` varchar(45) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_solr_search_facets`
--

LOCK TABLES `jos_solr_search_facets` WRITE;
/*!40000 ALTER TABLE `jos_solr_search_facets` DISABLE KEYS */;
INSERT INTO `jos_solr_search_facets` VALUES (1,'Content','hubtype:content',1,1,'0',0),(2,'Resources','hubtype:resource',1,1,'0',0),(3,'Collections','hubtype:collection',1,1,'0',0),(4,'Members','hubtype:member',1,1,'0',0),(5,'Projects','hubtype:project',1,1,'0',0),(6,'Groups','hubtype:group',1,1,'0',0),(7,'Courses','hubtype:course',1,1,'0',0),(8,'Wiki','hubtype:wiki',1,1,'0',0),(9,'Events','hubtype:event',1,1,'0',0),(10,'Knowledge Base Article','hubtype:kb-article',1,1,'0',0),(11,'Blog Posts','hubtype:blog-entry',1,1,'0',0),(12,'Wishes','hubtype:wishlist',1,1,'0',0),(13,'Publications','hubtype:publication',1,1,'0',0),(14,'Questions','hubtype:question',1,1,'0',0),(15,'Citations','hubtype:citation',1,1,'0',0);
/*!40000 ALTER TABLE `jos_solr_search_facets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_stats_tops`
--

DROP TABLE IF EXISTS `jos_stats_tops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_stats_tops` (
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `valfmt` tinyint(4) NOT NULL DEFAULT '0',
  `size` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_stats_tops`
--

LOCK TABLES `jos_stats_tops` WRITE;
/*!40000 ALTER TABLE `jos_stats_tops` DISABLE KEYS */;
INSERT INTO `jos_stats_tops` VALUES (1,'Top Tools by Ranking',1,5),(2,'Top Tools by Simulation Users',1,5),(3,'Top Tools by Interactive Sessions',1,5),(4,'Top Tools by Simulation Sessions',1,5),(5,'Top Tools by Simulation Runs',1,5),(6,'Top Tools by Simulation Wall Time',2,5),(7,'Top Tools by Simulation CPU Time',2,5),(8,'Top Tools by Simulation Interaction Time',2,5),(9,'Top Tools by Citations',1,5);
/*!40000 ALTER TABLE `jos_stats_tops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_stats_topvals`
--

DROP TABLE IF EXISTS `jos_stats_topvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_stats_topvals` (
  `top` tinyint(4) NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period` tinyint(4) NOT NULL DEFAULT '1',
  `rank` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `value` bigint(20) NOT NULL DEFAULT '0',
  KEY `idx_top` (`top`),
  KEY `idx_top_rank` (`top`,`rank`),
  KEY `idx_top_datetime` (`top`,`datetime`),
  KEY `idx_top_datetime_rank` (`top`,`datetime`,`rank`),
  KEY `idx_top_datetime_period` (`top`,`datetime`,`period`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_stats_topvals`
--

LOCK TABLES `jos_stats_topvals` WRITE;
/*!40000 ALTER TABLE `jos_stats_topvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_stats_topvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_store`
--

DROP TABLE IF EXISTS `jos_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_store` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(127) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `available` int(1) NOT NULL DEFAULT '0',
  `params` text,
  `special` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '1',
  `category` varchar(127) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_store`
--

LOCK TABLES `jos_store` WRITE;
/*!40000 ALTER TABLE `jos_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_collections`
--

DROP TABLE IF EXISTS `jos_storefront_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_collections` (
  `cId` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(64) DEFAULT NULL,
  `cParent` char(1) DEFAULT NULL,
  `cActive` tinyint(1) DEFAULT NULL,
  `cType` char(10) DEFAULT NULL,
  `cAlias` char(50) DEFAULT NULL,
  PRIMARY KEY (`cId`),
  KEY `cActive` (`cActive`),
  KEY `cParent` (`cParent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_collections`
--

LOCK TABLES `jos_storefront_collections` WRITE;
/*!40000 ALTER TABLE `jos_storefront_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_coupon_actions`
--

DROP TABLE IF EXISTS `jos_storefront_coupon_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_coupon_actions` (
  `cnId` int(16) NOT NULL,
  `cnaAction` char(25) DEFAULT NULL,
  `cnaVal` char(255) DEFAULT NULL,
  UNIQUE KEY `cnId` (`cnId`,`cnaAction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_coupon_actions`
--

LOCK TABLES `jos_storefront_coupon_actions` WRITE;
/*!40000 ALTER TABLE `jos_storefront_coupon_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_coupon_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_coupon_conditions`
--

DROP TABLE IF EXISTS `jos_storefront_coupon_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_coupon_conditions` (
  `cnId` int(16) NOT NULL,
  `cncRule` char(100) DEFAULT NULL,
  `cncVal` char(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_coupon_conditions`
--

LOCK TABLES `jos_storefront_coupon_conditions` WRITE;
/*!40000 ALTER TABLE `jos_storefront_coupon_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_coupon_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_coupon_objects`
--

DROP TABLE IF EXISTS `jos_storefront_coupon_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_coupon_objects` (
  `cnId` int(16) NOT NULL,
  `cnoObjectId` int(16) DEFAULT NULL,
  `cnoObjectsLimit` int(5) DEFAULT '0' COMMENT 'How many objects can be applied to. 0 - unlimited',
  UNIQUE KEY `cnId` (`cnId`,`cnoObjectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_coupon_objects`
--

LOCK TABLES `jos_storefront_coupon_objects` WRITE;
/*!40000 ALTER TABLE `jos_storefront_coupon_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_coupon_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_coupons`
--

DROP TABLE IF EXISTS `jos_storefront_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_coupons` (
  `cnId` int(16) NOT NULL AUTO_INCREMENT,
  `cnCode` char(25) DEFAULT NULL,
  `cnDescription` char(255) DEFAULT NULL,
  `cnExpires` date DEFAULT NULL,
  `cnUseLimit` int(5) unsigned DEFAULT NULL,
  `cnObject` char(15) NOT NULL,
  `cnActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cnId`),
  UNIQUE KEY `Unique code` (`cnCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_coupons`
--

LOCK TABLES `jos_storefront_coupons` WRITE;
/*!40000 ALTER TABLE `jos_storefront_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_images`
--

DROP TABLE IF EXISTS `jos_storefront_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_images` (
  `imgId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imgName` char(255) DEFAULT NULL,
  `imgObject` char(25) DEFAULT NULL,
  `imgObjectId` int(11) DEFAULT NULL,
  `imgPrimary` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`imgId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_images`
--

LOCK TABLES `jos_storefront_images` WRITE;
/*!40000 ALTER TABLE `jos_storefront_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_option_groups`
--

DROP TABLE IF EXISTS `jos_storefront_option_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_option_groups` (
  `ogId` int(16) NOT NULL AUTO_INCREMENT,
  `ogName` char(100) DEFAULT NULL,
  `ogActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ogId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_option_groups`
--

LOCK TABLES `jos_storefront_option_groups` WRITE;
/*!40000 ALTER TABLE `jos_storefront_option_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_option_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_options`
--

DROP TABLE IF EXISTS `jos_storefront_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_options` (
  `oId` int(16) NOT NULL AUTO_INCREMENT,
  `ogId` int(16) DEFAULT NULL COMMENT 'Foreign key to option-groups',
  `oName` char(255) DEFAULT NULL,
  `oActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oId`),
  UNIQUE KEY `ogId` (`ogId`,`oName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_options`
--

LOCK TABLES `jos_storefront_options` WRITE;
/*!40000 ALTER TABLE `jos_storefront_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_permissions`
--

DROP TABLE IF EXISTS `jos_storefront_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(15) DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `uId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `single entry per item` (`scope`,`scope_id`,`uId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_permissions`
--

LOCK TABLES `jos_storefront_permissions` WRITE;
/*!40000 ALTER TABLE `jos_storefront_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_product_access_groups`
--

DROP TABLE IF EXISTS `jos_storefront_product_access_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_product_access_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pId` int(11) NOT NULL DEFAULT '0',
  `agId` int(11) NOT NULL DEFAULT '0',
  `exclude` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pId` (`pId`),
  KEY `idx_agId` (`agId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_product_access_groups`
--

LOCK TABLES `jos_storefront_product_access_groups` WRITE;
/*!40000 ALTER TABLE `jos_storefront_product_access_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_product_access_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_product_collections`
--

DROP TABLE IF EXISTS `jos_storefront_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_product_collections` (
  `pcId` int(16) NOT NULL AUTO_INCREMENT,
  `pId` int(16) NOT NULL,
  `cId` char(50) NOT NULL,
  PRIMARY KEY (`pcId`,`pId`,`cId`),
  UNIQUE KEY `pId` (`pId`,`cId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_product_collections`
--

LOCK TABLES `jos_storefront_product_collections` WRITE;
/*!40000 ALTER TABLE `jos_storefront_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_product_meta`
--

DROP TABLE IF EXISTS `jos_storefront_product_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_product_meta` (
  `pmId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pId` int(11) NOT NULL,
  `pmKey` varchar(100) NOT NULL DEFAULT '',
  `pmValue` text,
  PRIMARY KEY (`pmId`),
  UNIQUE KEY `uniqueKey` (`pId`,`pmKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_product_meta`
--

LOCK TABLES `jos_storefront_product_meta` WRITE;
/*!40000 ALTER TABLE `jos_storefront_product_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_product_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_product_option_groups`
--

DROP TABLE IF EXISTS `jos_storefront_product_option_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_product_option_groups` (
  `pId` int(16) NOT NULL,
  `ogId` int(16) NOT NULL,
  PRIMARY KEY (`pId`,`ogId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_product_option_groups`
--

LOCK TABLES `jos_storefront_product_option_groups` WRITE;
/*!40000 ALTER TABLE `jos_storefront_product_option_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_product_option_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_product_types`
--

DROP TABLE IF EXISTS `jos_storefront_product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_product_types` (
  `ptId` int(16) NOT NULL AUTO_INCREMENT,
  `ptName` char(128) DEFAULT NULL,
  `ptModel` char(25) DEFAULT 'normal',
  PRIMARY KEY (`ptId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_product_types`
--

LOCK TABLES `jos_storefront_product_types` WRITE;
/*!40000 ALTER TABLE `jos_storefront_product_types` DISABLE KEYS */;
INSERT INTO `jos_storefront_product_types` VALUES (1,'Shippable merchandise','normal'),(20,'Course','membership'),(21,'Membership','membership'),(22,'Access Group Membership','membership'),(23,'Software Download','software');
/*!40000 ALTER TABLE `jos_storefront_product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_products`
--

DROP TABLE IF EXISTS `jos_storefront_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_products` (
  `pId` int(16) NOT NULL AUTO_INCREMENT,
  `pAlias` char(255) DEFAULT NULL,
  `ptId` int(16) NOT NULL COMMENT 'Product type ID. Foreign key to product_types table',
  `pName` char(128) DEFAULT NULL,
  `pTagline` tinytext,
  `pDescription` text,
  `pFeatures` text,
  `pActive` tinyint(1) DEFAULT '1',
  `pAllowMultiple` tinyint(1) DEFAULT '1',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `access` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pId`),
  KEY `pActive` (`pActive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_products`
--

LOCK TABLES `jos_storefront_products` WRITE;
/*!40000 ALTER TABLE `jos_storefront_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_serials`
--

DROP TABLE IF EXISTS `jos_storefront_serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_serials` (
  `srId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `srNumber` varchar(255) DEFAULT NULL,
  `srSId` int(11) DEFAULT NULL,
  `srStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`srId`),
  UNIQUE KEY `unique keys for a SKU` (`srNumber`,`srSId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_serials`
--

LOCK TABLES `jos_storefront_serials` WRITE;
/*!40000 ALTER TABLE `jos_storefront_serials` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_sku_meta`
--

DROP TABLE IF EXISTS `jos_storefront_sku_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_sku_meta` (
  `smId` int(16) NOT NULL AUTO_INCREMENT,
  `sId` int(16) NOT NULL,
  `smKey` varchar(100) DEFAULT NULL,
  `smValue` text,
  PRIMARY KEY (`smId`),
  UNIQUE KEY `sId` (`sId`,`smKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_sku_meta`
--

LOCK TABLES `jos_storefront_sku_meta` WRITE;
/*!40000 ALTER TABLE `jos_storefront_sku_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_sku_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_sku_options`
--

DROP TABLE IF EXISTS `jos_storefront_sku_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_sku_options` (
  `sId` int(16) NOT NULL,
  `oId` int(16) NOT NULL,
  PRIMARY KEY (`sId`,`oId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_sku_options`
--

LOCK TABLES `jos_storefront_sku_options` WRITE;
/*!40000 ALTER TABLE `jos_storefront_sku_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_sku_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_storefront_skus`
--

DROP TABLE IF EXISTS `jos_storefront_skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_storefront_skus` (
  `sId` int(16) NOT NULL AUTO_INCREMENT,
  `pId` int(16) DEFAULT NULL COMMENT 'Foreign key to products',
  `sSku` char(100) DEFAULT NULL,
  `sWeight` decimal(10,2) DEFAULT NULL,
  `sPrice` decimal(10,2) DEFAULT NULL,
  `sDescriprtion` text CHARACTER SET latin1,
  `sFeatures` text CHARACTER SET latin1,
  `sTrackInventory` tinyint(1) DEFAULT '0',
  `sInventory` int(11) DEFAULT '0',
  `sEnumerable` tinyint(1) DEFAULT '1',
  `sAllowMultiple` tinyint(1) DEFAULT '1',
  `sActive` tinyint(1) DEFAULT '1',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sRestricted` tinyint(1) DEFAULT '0',
  `sCheckoutNotes` varchar(255) DEFAULT NULL,
  `sCheckoutNotesRequired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_storefront_skus`
--

LOCK TABLES `jos_storefront_skus` WRITE;
/*!40000 ALTER TABLE `jos_storefront_skus` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_storefront_skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_acl_acos`
--

DROP TABLE IF EXISTS `jos_support_acl_acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_acl_acos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL DEFAULT '',
  `foreign_key` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_acl_acos`
--

LOCK TABLES `jos_support_acl_acos` WRITE;
/*!40000 ALTER TABLE `jos_support_acl_acos` DISABLE KEYS */;
INSERT INTO `jos_support_acl_acos` VALUES (1,'tickets',0),(2,'comments',0),(3,'private_comments',0);
/*!40000 ALTER TABLE `jos_support_acl_acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_acl_aros`
--

DROP TABLE IF EXISTS `jos_support_acl_aros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_acl_aros` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL DEFAULT '',
  `foreign_key` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_model_foreign_key` (`model`,`foreign_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_acl_aros`
--

LOCK TABLES `jos_support_acl_aros` WRITE;
/*!40000 ALTER TABLE `jos_support_acl_aros` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_acl_aros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_acl_aros_acos`
--

DROP TABLE IF EXISTS `jos_support_acl_aros_acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_acl_aros_acos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aro_id` int(11) unsigned NOT NULL DEFAULT '0',
  `aco_id` int(11) unsigned NOT NULL DEFAULT '0',
  `action_create` tinyint(3) NOT NULL DEFAULT '0',
  `action_read` tinyint(3) NOT NULL DEFAULT '0',
  `action_update` tinyint(3) NOT NULL DEFAULT '0',
  `action_delete` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aco_id` (`aco_id`),
  KEY `idx_aro_id` (`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_acl_aros_acos`
--

LOCK TABLES `jos_support_acl_aros_acos` WRITE;
/*!40000 ALTER TABLE `jos_support_acl_aros_acos` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_acl_aros_acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_attachments`
--

DROP TABLE IF EXISTS `jos_support_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_attachments`
--

LOCK TABLES `jos_support_attachments` WRITE;
/*!40000 ALTER TABLE `jos_support_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_categories`
--

DROP TABLE IF EXISTS `jos_support_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(250) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_categories`
--

LOCK TABLES `jos_support_categories` WRITE;
/*!40000 ALTER TABLE `jos_support_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_comments`
--

DROP TABLE IF EXISTS `jos_support_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket` int(11) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `changelog` text NOT NULL,
  `access` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ticket` (`ticket`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_comments`
--

LOCK TABLES `jos_support_comments` WRITE;
/*!40000 ALTER TABLE `jos_support_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_messages`
--

DROP TABLE IF EXISTS `jos_support_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_messages`
--

LOCK TABLES `jos_support_messages` WRITE;
/*!40000 ALTER TABLE `jos_support_messages` DISABLE KEYS */;
INSERT INTO `jos_support_messages` VALUES (1,'First Contact (no further information needed)','Thank you for using {sitename}, and for reporting this problem.  Your request has been forwarded to a member of our team, and it is being tracked as ticket {ticket#} in our system.  We will keep you informed as we make progress in resolving this issue.\r\n\r\nThanks again for your support!\r\n--the {sitename} team'),(2,'First Contact (more information is needed)','Thank you for using {sitename}, and for reporting this problem.  Your request has been forwarded to a member of our team, and it is being tracked as ticket {ticket#} in our system.\r\n\r\nIn order to resolve this issue, we need some more information:\r\n\r\nXXXXXXX  Input questions here XXXXXX\r\n\r\nPlease reply back to {siteemail} with the requested information. If we haven\\\'t heard back from you in 48 hours, we\\\'ll assume that you are no longer experiencing the problem, or that you\\\'ve worked around it, and we\\\'ll consider the matter closed.  You can reopen the matter at any time by sending email or by submitting another problem report on our web site.\r\n\r\nThanks again for your support!\r\n--the {sitename} team'),(3,'Final Contact (closing ticket)','We have not heard back from you so we will assume that you are no longer experiencing the problem, or that you\\\'ve worked around it, and we\\\'ll consider the matter closed.  You can reopen the matter at any time by sending email or by submitting another problem report on our web site.\r\n\r\nThanks again for your support!\r\n--the {sitename} team'),(4,'Ticket Resolved','Thank you for using {sitename}, and for reporting this problem.  We believe that your issue (ticket {ticket#} in our system) has been resolved. If you continue to have problems please let us know.\r\n\r\nThank you for helping us to improve {sitename}!\r\n--the {sitename} team'),(5,'Reply to tickets that have been in the queue for a while','Thank you for using {sitename}.  We apologize for not responding to your request sooner.  We have received more support requests than we can handle, and we are working hard to improve our help-desk support.\r\n\r\nYour request was concerning XXXXXXXXXXXXX. \r\n\r\nMany problems have been fixed since your message.  Is this still a problem for you now?  Is there any more information you could give us about this? Please reply back to {siteemail} with any additional information. If we haven\\\'t heard back from you in 48 hours, we\\\'ll assume that you are no longer experiencing the problem, or that it is no longer an issue for you, and we\\\'ll consider the matter closed.  You can reopen the matter at any time by sending email or by submitting another problem report on our web site.\r\n\r\nThanks again for your support!\r\n--the {sitename} team');
/*!40000 ALTER TABLE `jos_support_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_queries`
--

DROP TABLE IF EXISTS `jos_support_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_queries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `conditions` text NOT NULL,
  `query` text NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` varchar(100) NOT NULL DEFAULT '',
  `sort_dir` varchar(100) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `iscore` int(3) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_iscore` (`iscore`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_queries`
--

LOCK TABLES `jos_support_queries` WRITE;
/*!40000 ALTER TABLE `jos_support_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_query_folders`
--

DROP TABLE IF EXISTS `jos_support_query_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_query_folders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `iscore` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_query_folders`
--

LOCK TABLES `jos_support_query_folders` WRITE;
/*!40000 ALTER TABLE `jos_support_query_folders` DISABLE KEYS */;
INSERT INTO `jos_support_query_folders` VALUES (1,0,'Common','common','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,1,1),(2,0,'Mine','mine','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,2,1),(3,0,'Custom','custom','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,3,1),(4,0,'Common','common','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,1,2),(5,0,'Mine','mine','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,2,2);
/*!40000 ALTER TABLE `jos_support_query_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_resolutions`
--

DROP TABLE IF EXISTS `jos_support_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_resolutions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_resolutions`
--

LOCK TABLES `jos_support_resolutions` WRITE;
/*!40000 ALTER TABLE `jos_support_resolutions` DISABLE KEYS */;
INSERT INTO `jos_support_resolutions` VALUES (1,'Fixed','fixed'),(2,'Invalid','invalid'),(3,'Won\'t fix','wontfix'),(4,'Duplicate','duplicate'),(5,'Works for me','worksforme'),(6,'Transferred','transferred'),(7,'Answered','answered');
/*!40000 ALTER TABLE `jos_support_resolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_sections`
--

DROP TABLE IF EXISTS `jos_support_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_sections`
--

LOCK TABLES `jos_support_sections` WRITE;
/*!40000 ALTER TABLE `jos_support_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_statuses`
--

DROP TABLE IF EXISTS `jos_support_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_statuses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `open` tinyint(2) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(250) NOT NULL DEFAULT '',
  `color` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_open` (`open`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_statuses`
--

LOCK TABLES `jos_support_statuses` WRITE;
/*!40000 ALTER TABLE `jos_support_statuses` DISABLE KEYS */;
INSERT INTO `jos_support_statuses` VALUES (1,1,'Open','open',''),(2,1,'Waiting response','waiting',''),(3,1,'Waiting review','waitingreview',''),(4,1,'Pending update','pendingupdate',''),(5,0,'Fixed','fixed',''),(6,0,'Invalid','invalid',''),(7,0,'Won\'t fix','wontfix',''),(8,0,'Duplicate','duplicate',''),(9,0,'Works for me','worksforme',''),(10,0,'Transferred','transferred',''),(11,0,'Answered','answered','');
/*!40000 ALTER TABLE `jos_support_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_tickets`
--

DROP TABLE IF EXISTS `jos_support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_tickets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login` varchar(200) NOT NULL DEFAULT '',
  `severity` varchar(30) NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '0',
  `category` varchar(50) NOT NULL DEFAULT '',
  `summary` varchar(250) NOT NULL DEFAULT '',
  `report` text NOT NULL,
  `resolved` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `os` varchar(50) NOT NULL DEFAULT '',
  `browser` varchar(50) NOT NULL DEFAULT '',
  `ip` varchar(200) NOT NULL DEFAULT '',
  `hostname` varchar(200) NOT NULL DEFAULT '',
  `uas` varchar(250) NOT NULL DEFAULT '',
  `referrer` varchar(250) NOT NULL DEFAULT '',
  `cookies` tinyint(3) NOT NULL DEFAULT '0',
  `instances` int(11) NOT NULL DEFAULT '1',
  `section` int(11) NOT NULL DEFAULT '1',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(3) NOT NULL DEFAULT '1',
  `target_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_owner` (`owner`),
  KEY `idx_status` (`status`),
  KEY `idx_open` (`open`),
  KEY `idx_type` (`type`),
  KEY `idx_severity` (`severity`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_tickets`
--

LOCK TABLES `jos_support_tickets` WRITE;
/*!40000 ALTER TABLE `jos_support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_support_watching`
--

DROP TABLE IF EXISTS `jos_support_watching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_support_watching` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ticket_id` (`ticket_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_support_watching`
--

LOCK TABLES `jos_support_watching` WRITE;
/*!40000 ALTER TABLE `jos_support_watching` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_support_watching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tags`
--

DROP TABLE IF EXISTS `jos_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL DEFAULT '',
  `raw_tag` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `admin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `objects` int(11) NOT NULL DEFAULT '0',
  `substitutes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tag` (`tag`),
  KEY `idx_objects` (`objects`),
  KEY `idx_substitutes` (`substitutes`),
  FULLTEXT KEY `ftidx_description` (`description`),
  FULLTEXT KEY `ftidx_raw_tag_description` (`raw_tag`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tags`
--

LOCK TABLES `jos_tags` WRITE;
/*!40000 ALTER TABLE `jos_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tags_log`
--

DROP TABLE IF EXISTS `jos_tags_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tags_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `actorid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tag_id` (`tag_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tags_log`
--

LOCK TABLES `jos_tags_log` WRITE;
/*!40000 ALTER TABLE `jos_tags_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tags_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tags_object`
--

DROP TABLE IF EXISTS `jos_tags_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tags_object` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `objectid` int(11) unsigned NOT NULL DEFAULT '0',
  `tagid` int(11) unsigned NOT NULL DEFAULT '0',
  `strength` tinyint(3) NOT NULL DEFAULT '0',
  `taggerid` int(11) unsigned NOT NULL DEFAULT '0',
  `taggedon` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tbl` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_objectid_tbl` (`objectid`,`tbl`),
  KEY `idx_label_tagid` (`label`,`tagid`),
  KEY `idx_tbl_objectid_label_tagid` (`tbl`,`objectid`,`label`,`tagid`),
  KEY `idx_tagid` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tags_object`
--

LOCK TABLES `jos_tags_object` WRITE;
/*!40000 ALTER TABLE `jos_tags_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tags_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tags_substitute`
--

DROP TABLE IF EXISTS `jos_tags_substitute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tags_substitute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `raw_tag` varchar(100) NOT NULL DEFAULT '',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_tag_id` (`tag_id`),
  KEY `idx_tag` (`tag`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tags_substitute`
--

LOCK TABLES `jos_tags_substitute` WRITE;
/*!40000 ALTER TABLE `jos_tags_substitute` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tags_substitute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_template_styles`
--

DROP TABLE IF EXISTS `jos_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_template_styles`
--

LOCK TABLES `jos_template_styles` WRITE;
/*!40000 ALTER TABLE `jos_template_styles` DISABLE KEYS */;
INSERT INTO `jos_template_styles` VALUES (8,'hubbasic2012',0,'0','HUBzero Standard Site Template - 2012','{}'),(9,'hubbasic2013',0,'0','HUBzero Standard Site Template - 2013','{}'),(10,'welcome',0,'0','Welcome Template','{\"flavor\":\"\",\"template\":\"kimera\"}'),(12,'kameleon',1,'1','kameleon (admin)','{\"header\":\"dark\",\"theme\":\"bluesteel\"}'),(13,'kimera',0,'1','HUBzero Standard Site Template - 2015','{}');
/*!40000 ALTER TABLE `jos_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool`
--

DROP TABLE IF EXISTS `jos_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `toolname` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(127) NOT NULL DEFAULT '',
  `version` varchar(15) DEFAULT NULL,
  `description` text,
  `fulltxt` text,
  `license` text,
  `toolaccess` varchar(15) DEFAULT NULL,
  `codeaccess` varchar(15) DEFAULT NULL,
  `wikiaccess` varchar(15) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  `state` int(15) DEFAULT NULL,
  `priority` int(15) DEFAULT '3',
  `team` text,
  `registered` datetime DEFAULT NULL,
  `registered_by` varchar(31) DEFAULT NULL,
  `mw` varchar(31) DEFAULT NULL,
  `vnc_geometry` varchar(31) DEFAULT NULL,
  `ticketid` int(15) DEFAULT NULL,
  `state_changed` datetime DEFAULT '0000-00-00 00:00:00',
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_toolname` (`toolname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool`
--

LOCK TABLES `jos_tool` WRITE;
/*!40000 ALTER TABLE `jos_tool` DISABLE KEYS */;
INSERT INTO `jos_tool` VALUES (1,'workspace','Workspace',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,7,3,NULL,'2015-09-13 14:50:14','admin',NULL,NULL,NULL,'2015-09-13 14:50:14',NULL);
/*!40000 ALTER TABLE `jos_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_authors`
--

DROP TABLE IF EXISTS `jos_tool_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_authors` (
  `toolname` varchar(50) NOT NULL DEFAULT '',
  `revision` int(15) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `version_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`toolname`,`revision`,`uid`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_authors`
--

LOCK TABLES `jos_tool_authors` WRITE;
/*!40000 ALTER TABLE `jos_tool_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_groups`
--

DROP TABLE IF EXISTS `jos_tool_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_groups` (
  `cn` varchar(255) NOT NULL DEFAULT '',
  `toolid` int(11) NOT NULL DEFAULT '0',
  `role` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cn`,`toolid`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_groups`
--

LOCK TABLES `jos_tool_groups` WRITE;
/*!40000 ALTER TABLE `jos_tool_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_handler_rules`
--

DROP TABLE IF EXISTS `jos_tool_handler_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_handler_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `handler_id` int(11) NOT NULL,
  `extension` varchar(10) NOT NULL DEFAULT '',
  `quantity` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_handler_rules`
--

LOCK TABLES `jos_tool_handler_rules` WRITE;
/*!40000 ALTER TABLE `jos_tool_handler_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_handler_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_handlers`
--

DROP TABLE IF EXISTS `jos_tool_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_handlers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) NOT NULL,
  `prompt` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_handlers`
--

LOCK TABLES `jos_tool_handlers` WRITE;
/*!40000 ALTER TABLE `jos_tool_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_licenses`
--

DROP TABLE IF EXISTS `jos_tool_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `text` text,
  `title` varchar(100) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_licenses`
--

LOCK TABLES `jos_tool_licenses` WRITE;
/*!40000 ALTER TABLE `jos_tool_licenses` DISABLE KEYS */;
INSERT INTO `jos_tool_licenses` VALUES (1,'default','All rights reserved.','Default license',0),(2,'BSD','Copyright (c) [YEAR], [OWNER]\nAll rights reserved.\n\nRedistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:\n\nRedistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.\nRedistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.\nNeither the name of the [ORGANIZATION] nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \'AS IS\' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.','BSD',1),(3,'GPL','[ONE LINE DESCRIPTION]\r\nCopyright (C) [YEAR]  [OWNER]\r\n\r\nThis program is free software: you can redistribute it and/or modify\r\nit under the terms of the GNU General Public License as published by\r\nthe Free Software Foundation, either version 3 of the License, or\r\n(at your option) any later version.\r\n\r\nThis program is distributed in the hope that it will be useful,\r\nbut WITHOUT ANY WARRANTY; without even the implied warranty of\r\nMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\nGNU General Public License below for more details.\r\n\r\n------------------------------------------------------------------------\r\n\r\n                    GNU GENERAL PUBLIC LICENSE\r\n                       Version 3, 29 June 2007\r\n\r\n Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>\r\n Everyone is permitted to copy and distribute verbatim copies\r\n of this license document, but changing it is not allowed.\r\n\r\n                            Preamble\r\n\r\n  The GNU General Public License is a free, copyleft license for\r\nsoftware and other kinds of works.\r\n\r\n  The licenses for most software and other practical works are designed\r\nto take away your freedom to share and change the works.  By contrast,\r\nthe GNU General Public License is intended to guarantee your freedom to\r\nshare and change all versions of a program--to make sure it remains free\r\nsoftware for all its users.  We, the Free Software Foundation, use the\r\nGNU General Public License for most of our software; it applies also to\r\nany other work released this way by its authors.  You can apply it to\r\nyour programs, too.\r\n\r\n  When we speak of free software, we are referring to freedom, not\r\nprice.  Our General Public Licenses are designed to make sure that you\r\nhave the freedom to distribute copies of free software (and charge for\r\nthem if you wish), that you receive source code or can get it if you\r\nwant it, that you can change the software or use pieces of it in new\r\nfree programs, and that you know you can do these things.\r\n\r\n  To protect your rights, we need to prevent others from denying you\r\nthese rights or asking you to surrender the rights.  Therefore, you have\r\ncertain responsibilities if you distribute copies of the software, or if\r\nyou modify it: responsibilities to respect the freedom of others.\r\n\r\n  For example, if you distribute copies of such a program, whether\r\ngratis or for a fee, you must pass on to the recipients the same\r\nfreedoms that you received.  You must make sure that they, too, receive\r\nor can get the source code.  And you must show them these terms so they\r\nknow their rights.\r\n\r\n  Developers that use the GNU GPL protect your rights with two steps:\r\n(1) assert copyright on the software, and (2) offer you this License\r\ngiving you legal permission to copy, distribute and/or modify it.\r\n\r\n  For the developers\' and authors\' protection, the GPL clearly explains\r\nthat there is no warranty for this free software.  For both users\' and\r\nauthors\' sake, the GPL requires that modified versions be marked as\r\nchanged, so that their problems will not be attributed erroneously to\r\nauthors of previous versions.\r\n\r\n  Some devices are designed to deny users access to install or run\r\nmodified versions of the software inside them, although the manufacturer\r\ncan do so.  This is fundamentally incompatible with the aim of\r\nprotecting users\' freedom to change the software.  The systematic\r\npattern of such abuse occurs in the area of products for individuals to\r\nuse, which is precisely where it is most unacceptable.  Therefore, we\r\nhave designed this version of the GPL to prohibit the practice for those\r\nproducts.  If such problems arise substantially in other domains, we\r\nstand ready to extend this provision to those domains in future versions\r\nof the GPL, as needed to protect the freedom of users.\r\n\r\n  Finally, every program is threatened constantly by software patents.\r\nStates should not allow patents to restrict development and use of\r\nsoftware on general-purpose computers, but in those that do, we wish to\r\navoid the special danger that patents applied to a free program could\r\nmake it effectively proprietary.  To prevent this, the GPL assures that\r\npatents cannot be used to render the program non-free.\r\n\r\n  The precise terms and conditions for copying, distribution and\r\nmodification follow.\r\n\r\n                       TERMS AND CONDITIONS\r\n\r\n  0. Definitions.\r\n\r\n  &quot;This License&quot; refers to version 3 of the GNU General Public License.\r\n\r\n  &quot;Copyright&quot; also means copyright-like laws that apply to other kinds of\r\nworks, such as semiconductor masks.\r\n\r\n  &quot;The Program&quot; refers to any copyrightable work licensed under this\r\nLicense.  Each licensee is addressed as &quot;you&quot;.  &quot;Licensees&quot; and\r\n&quot;recipients&quot; may be individuals or organizations.\r\n\r\n  To &quot;modify&quot; a work means to copy from or adapt all or part of the work\r\nin a fashion requiring copyright permission, other than the making of an\r\nexact copy.  The resulting work is called a &quot;modified version&quot; of the\r\nearlier work or a work &quot;based on&quot; the earlier work.\r\n\r\n  A &quot;covered work&quot; means either the unmodified Program or a work based\r\non the Program.\r\n\r\n  To &quot;propagate&quot; a work means to do anything with it that, without\r\npermission, would make you directly or secondarily liable for\r\ninfringement under applicable copyright law, except executing it on a\r\ncomputer or modifying a private copy.  Propagation includes copying,\r\ndistribution (with or without modification), making available to the\r\npublic, and in some countries other activities as well.\r\n\r\n  To &quot;convey&quot; a work means any kind of propagation that enables other\r\nparties to make or receive copies.  Mere interaction with a user through\r\na computer network, with no transfer of a copy, is not conveying.\r\n\r\n  An interactive user interface displays &quot;Appropriate Legal Notices&quot;\r\nto the extent that it includes a convenient and prominently visible\r\nfeature that (1) displays an appropriate copyright notice, and (2)\r\ntells the user that there is no warranty for the work (except to the\r\nextent that warranties are provided), that licensees may convey the\r\nwork under this License, and how to view a copy of this License.  If\r\nthe interface presents a list of user commands or options, such as a\r\nmenu, a prominent item in the list meets this criterion.\r\n\r\n  1. Source Code.\r\n\r\n  The &quot;source code&quot; for a work means the preferred form of the work\r\nfor making modifications to it.  &quot;Object code&quot; means any non-source\r\nform of a work.\r\n\r\n  A &quot;Standard Interface&quot; means an interface that either is an official\r\nstandard defined by a recognized standards body, or, in the case of\r\ninterfaces specified for a particular programming language, one that\r\nis widely used among developers working in that language.\r\n\r\n  The &quot;System Libraries&quot; of an executable work include anything, other\r\nthan the work as a whole, that (a) is included in the normal form of\r\npackaging a Major Component, but which is not part of that Major\r\nComponent, and (b) serves only to enable use of the work with that\r\nMajor Component, or to implement a Standard Interface for which an\r\nimplementation is available to the public in source code form.  A\r\n&quot;Major Component&quot;, in this context, means a major essential component\r\n(kernel, window system, and so on) of the specific operating system\r\n(if any) on which the executable work runs, or a compiler used to\r\nproduce the work, or an object code interpreter used to run it.\r\n\r\n  The &quot;Corresponding Source&quot; for a work in object code form means all\r\nthe source code needed to generate, install, and (for an executable\r\nwork) run the object code and to modify the work, including scripts to\r\ncontrol those activities.  However, it does not include the work\'s\r\nSystem Libraries, or general-purpose tools or generally available free\r\nprograms which are used unmodified in performing those activities but\r\nwhich are not part of the work.  For example, Corresponding Source\r\nincludes interface definition files associated with source files for\r\nthe work, and the source code for shared libraries and dynamically\r\nlinked subprograms that the work is specifically designed to require,\r\nsuch as by intimate data communication or control flow between those\r\nsubprograms and other parts of the work.\r\n\r\n  The Corresponding Source need not include anything that users\r\ncan regenerate automatically from other parts of the Corresponding\r\nSource.\r\n\r\n  The Corresponding Source for a work in source code form is that\r\nsame work.\r\n\r\n  2. Basic Permissions.\r\n\r\n  All rights granted under this License are granted for the term of\r\ncopyright on the Program, and are irrevocable provided the stated\r\nconditions are met.  This License explicitly affirms your unlimited\r\npermission to run the unmodified Program.  The output from running a\r\ncovered work is covered by this License only if the output, given its\r\ncontent, constitutes a covered work.  This License acknowledges your\r\nrights of fair use or other equivalent, as provided by copyright law.\r\n\r\n  You may make, run and propagate covered works that you do not\r\nconvey, without conditions so long as your license otherwise remains\r\nin force.  You may convey covered works to others for the sole purpose\r\nof having them make modifications exclusively for you, or provide you\r\nwith facilities for running those works, provided that you comply with\r\nthe terms of this License in conveying all material for which you do\r\nnot control copyright.  Those thus making or running the covered works\r\nfor you must do so exclusively on your behalf, under your direction\r\nand control, on terms that prohibit them from making any copies of\r\nyour copyrighted material outside their relationship with you.\r\n\r\n  Conveying under any other circumstances is permitted solely under\r\nthe conditions stated below.  Sublicensing is not allowed; section 10\r\nmakes it unnecessary.\r\n\r\n  3. Protecting Users\' Legal Rights From Anti-Circumvention Law.\r\n\r\n  No covered work shall be deemed part of an effective technological\r\nmeasure under any applicable law fulfilling obligations under article\r\n11 of the WIPO copyright treaty adopted on 20 December 1996, or\r\nsimilar laws prohibiting or restricting circumvention of such\r\nmeasures.\r\n\r\n  When you convey a covered work, you waive any legal power to forbid\r\ncircumvention of technological measures to the extent such circumvention\r\nis effected by exercising rights under this License with respect to\r\nthe covered work, and you disclaim any intention to limit operation or\r\nmodification of the work as a means of enforcing, against the work\'s\r\nusers, your or third parties\' legal rights to forbid circumvention of\r\ntechnological measures.\r\n\r\n  4. Conveying Verbatim Copies.\r\n\r\n  You may convey verbatim copies of the Program\'s source code as you\r\nreceive it, in any medium, provided that you conspicuously and\r\nappropriately publish on each copy an appropriate copyright notice;\r\nkeep intact all notices stating that this License and any\r\nnon-permissive terms added in accord with section 7 apply to the code;\r\nkeep intact all notices of the absence of any warranty; and give all\r\nrecipients a copy of this License along with the Program.\r\n\r\n  You may charge any price or no price for each copy that you convey,\r\nand you may offer support or warranty protection for a fee.\r\n\r\n  5. Conveying Modified Source Versions.\r\n\r\n  You may convey a work based on the Program, or the modifications to\r\nproduce it from the Program, in the form of source code under the\r\nterms of section 4, provided that you also meet all of these conditions:\r\n\r\n    a) The work must carry prominent notices stating that you modified\r\n    it, and giving a relevant date.\r\n\r\n    b) The work must carry prominent notices stating that it is\r\n    released under this License and any conditions added under section\r\n    7.  This requirement modifies the requirement in section 4 to\r\n    &quot;keep intact all notices&quot;.\r\n\r\n    c) You must license the entire work, as a whole, under this\r\n    License to anyone who comes into possession of a copy.  This\r\n    License will therefore apply, along with any applicable section 7\r\n    additional terms, to the whole of the work, and all its parts,\r\n    regardless of how they are packaged.  This License gives no\r\n    permission to license the work in any other way, but it does not\r\n    invalidate such permission if you have separately received it.\r\n\r\n    d) If the work has interactive user interfaces, each must display\r\n    Appropriate Legal Notices; however, if the Program has interactive\r\n    interfaces that do not display Appropriate Legal Notices, your\r\n    work need not make them do so.\r\n\r\n  A compilation of a covered work with other separate and independent\r\nworks, which are not by their nature extensions of the covered work,\r\nand which are not combined with it such as to form a larger program,\r\nin or on a volume of a storage or distribution medium, is called an\r\n&quot;aggregate&quot; if the compilation and its resulting copyright are not\r\nused to limit the access or legal rights of the compilation\'s users\r\nbeyond what the individual works permit.  Inclusion of a covered work\r\nin an aggregate does not cause this License to apply to the other\r\nparts of the aggregate.\r\n\r\n  6. Conveying Non-Source Forms.\r\n\r\n  You may convey a covered work in object code form under the terms\r\nof sections 4 and 5, provided that you also convey the\r\nmachine-readable Corresponding Source under the terms of this License,\r\nin one of these ways:\r\n\r\n    a) Convey the object code in, or embodied in, a physical product\r\n    (including a physical distribution medium), accompanied by the\r\n    Corresponding Source fixed on a durable physical medium\r\n    customarily used for software interchange.\r\n\r\n    b) Convey the object code in, or embodied in, a physical product\r\n    (including a physical distribution medium), accompanied by a\r\n    written offer, valid for at least three years and valid for as\r\n    long as you offer spare parts or customer support for that product\r\n    model, to give anyone who possesses the object code either (1) a\r\n    copy of the Corresponding Source for all the software in the\r\n    product that is covered by this License, on a durable physical\r\n    medium customarily used for software interchange, for a price no\r\n    more than your reasonable cost of physically performing this\r\n    conveying of source, or (2) access to copy the\r\n    Corresponding Source from a network server at no charge.\r\n\r\n    c) Convey individual copies of the object code with a copy of the\r\n    written offer to provide the Corresponding Source.  This\r\n    alternative is allowed only occasionally and noncommercially, and\r\n    only if you received the object code with such an offer, in accord\r\n    with subsection 6b.\r\n\r\n    d) Convey the object code by offering access from a designated\r\n    place (gratis or for a charge), and offer equivalent access to the\r\n    Corresponding Source in the same way through the same place at no\r\n    further charge.  You need not require recipients to copy the\r\n    Corresponding Source along with the object code.  If the place to\r\n    copy the object code is a network server, the Corresponding Source\r\n    may be on a different server (operated by you or a third party)\r\n    that supports equivalent copying facilities, provided you maintain\r\n    clear directions next to the object code saying where to find the\r\n    Corresponding Source.  Regardless of what server hosts the\r\n    Corresponding Source, you remain obligated to ensure that it is\r\n    available for as long as needed to satisfy these requirements.\r\n\r\n    e) Convey the object code using peer-to-peer transmission, provided\r\n    you inform other peers where the object code and Corresponding\r\n    Source of the work are being offered to the general public at no\r\n    charge under subsection 6d.\r\n\r\n  A separable portion of the object code, whose source code is excluded\r\nfrom the Corresponding Source as a System Library, need not be\r\nincluded in conveying the object code work.\r\n\r\n  A &quot;User Product&quot; is either (1) a &quot;consumer product&quot;, which means any\r\ntangible personal property which is normally used for personal, family,\r\nor household purposes, or (2) anything designed or sold for incorporation\r\ninto a dwelling.  In determining whether a product is a consumer product,\r\ndoubtful cases shall be resolved in favor of coverage.  For a particular\r\nproduct received by a particular user, &quot;normally used&quot; refers to a\r\ntypical or common use of that class of product, regardless of the status\r\nof the particular user or of the way in which the particular user\r\nactually uses, or expects or is expected to use, the product.  A product\r\nis a consumer product regardless of whether the product has substantial\r\ncommercial, industrial or non-consumer uses, unless such uses represent\r\nthe only significant mode of use of the product.\r\n\r\n  &quot;Installation Information&quot; for a User Product means any methods,\r\nprocedures, authorization keys, or other information required to install\r\nand execute modified versions of a covered work in that User Product from\r\na modified version of its Corresponding Source.  The information must\r\nsuffice to ensure that the continued functioning of the modified object\r\ncode is in no case prevented or interfered with solely because\r\nmodification has been made.\r\n\r\n  If you convey an object code work under this section in, or with, or\r\nspecifically for use in, a User Product, and the conveying occurs as\r\npart of a transaction in which the right of possession and use of the\r\nUser Product is transferred to the recipient in perpetuity or for a\r\nfixed term (regardless of how the transaction is characterized), the\r\nCorresponding Source conveyed under this section must be accompanied\r\nby the Installation Information.  But this requirement does not apply\r\nif neither you nor any third party retains the ability to install\r\nmodified object code on the User Product (for example, the work has\r\nbeen installed in ROM).\r\n\r\n  The requirement to provide Installation Information does not include a\r\nrequirement to continue to provide support service, warranty, or updates\r\nfor a work that has been modified or installed by the recipient, or for\r\nthe User Product in which it has been modified or installed.  Access to a\r\nnetwork may be denied when the modification itself materially and\r\nadversely affects the operation of the network or violates the rules and\r\nprotocols for communication across the network.\r\n\r\n  Corresponding Source conveyed, and Installation Information provided,\r\nin accord with this section must be in a format that is publicly\r\ndocumented (and with an implementation available to the public in\r\nsource code form), and must require no special password or key for\r\nunpacking, reading or copying.\r\n\r\n  7. Additional Terms.\r\n\r\n  &quot;Additional permissions&quot; are terms that supplement the terms of this\r\nLicense by making exceptions from one or more of its conditions.\r\nAdditional permissions that are applicable to the entire Program shall\r\nbe treated as though they were included in this License, to the extent\r\nthat they are valid under applicable law.  If additional permissions\r\napply only to part of the Program, that part may be used separately\r\nunder those permissions, but the entire Program remains governed by\r\nthis License without regard to the additional permissions.\r\n\r\n  When you convey a copy of a covered work, you may at your option\r\nremove any additional permissions from that copy, or from any part of\r\nit.  (Additional permissions may be written to require their own\r\nremoval in certain cases when you modify the work.)  You may place\r\nadditional permissions on material, added by you to a covered work,\r\nfor which you have or can give appropriate copyright permission.\r\n\r\n  Notwithstanding any other provision of this License, for material you\r\nadd to a covered work, you may (if authorized by the copyright holders of\r\nthat material) supplement the terms of this License with terms:\r\n\r\n    a) Disclaiming warranty or limiting liability differently from the\r\n    terms of sections 15 and 16 of this License; or\r\n\r\n    b) Requiring preservation of specified reasonable legal notices or\r\n    author attributions in that material or in the Appropriate Legal\r\n    Notices displayed by works containing it; or\r\n\r\n    c) Prohibiting misrepresentation of the origin of that material, or\r\n    requiring that modified versions of such material be marked in\r\n    reasonable ways as different from the original version; or\r\n\r\n    d) Limiting the use for publicity purposes of names of licensors or\r\n    authors of the material; or\r\n\r\n    e) Declining to grant rights under trademark law for use of some\r\n    trade names, trademarks, or service marks; or\r\n\r\n    f) Requiring indemnification of licensors and authors of that\r\n    material by anyone who conveys the material (or modified versions of\r\n    it) with contractual assumptions of liability to the recipient, for\r\n    any liability that these contractual assumptions directly impose on\r\n    those licensors and authors.\r\n\r\n  All other non-permissive additional terms are considered &quot;further\r\nrestrictions&quot; within the meaning of section 10.  If the Program as you\r\nreceived it, or any part of it, contains a notice stating that it is\r\ngoverned by this License along with a term that is a further\r\nrestriction, you may remove that term.  If a license document contains\r\na further restriction but permits relicensing or conveying under this\r\nLicense, you may add to a covered work material governed by the terms\r\nof that license document, provided that the further restriction does\r\nnot survive such relicensing or conveying.\r\n\r\n  If you add terms to a covered work in accord with this section, you\r\nmust place, in the relevant source files, a statement of the\r\nadditional terms that apply to those files, or a notice indicating\r\nwhere to find the applicable terms.\r\n\r\n  Additional terms, permissive or non-permissive, may be stated in the\r\nform of a separately written license, or stated as exceptions;\r\nthe above requirements apply either way.\r\n\r\n  8. Termination.\r\n\r\n  You may not propagate or modify a covered work except as expressly\r\nprovided under this License.  Any attempt otherwise to propagate or\r\nmodify it is void, and will automatically terminate your rights under\r\nthis License (including any patent licenses granted under the third\r\nparagraph of section 11).\r\n\r\n  However, if you cease all violation of this License, then your\r\nlicense from a particular copyright holder is reinstated (a)\r\nprovisionally, unless and until the copyright holder explicitly and\r\nfinally terminates your license, and (b) permanently, if the copyright\r\nholder fails to notify you of the violation by some reasonable means\r\nprior to 60 days after the cessation.\r\n\r\n  Moreover, your license from a particular copyright holder is\r\nreinstated permanently if the copyright holder notifies you of the\r\nviolation by some reasonable means, this is the first time you have\r\nreceived notice of violation of this License (for any work) from that\r\ncopyright holder, and you cure the violation prior to 30 days after\r\nyour receipt of the notice.\r\n\r\n  Termination of your rights under this section does not terminate the\r\nlicenses of parties who have received copies or rights from you under\r\nthis License.  If your rights have been terminated and not permanently\r\nreinstated, you do not qualify to receive new licenses for the same\r\nmaterial under section 10.\r\n\r\n  9. Acceptance Not Required for Having Copies.\r\n\r\n  You are not required to accept this License in order to receive or\r\nrun a copy of the Program.  Ancillary propagation of a covered work\r\noccurring solely as a consequence of using peer-to-peer transmission\r\nto receive a copy likewise does not require acceptance.  However,\r\nnothing other than this License grants you permission to propagate or\r\nmodify any covered work.  These actions infringe copyright if you do\r\nnot accept this License.  Therefore, by modifying or propagating a\r\ncovered work, you indicate your acceptance of this License to do so.\r\n\r\n  10. Automatic Licensing of Downstream Recipients.\r\n\r\n  Each time you convey a covered work, the recipient automatically\r\nreceives a license from the original licensors, to run, modify and\r\npropagate that work, subject to this License.  You are not responsible\r\nfor enforcing compliance by third parties with this License.\r\n\r\n  An &quot;entity transaction&quot; is a transaction transferring control of an\r\norganization, or substantially all assets of one, or subdividing an\r\norganization, or merging organizations.  If propagation of a covered\r\nwork results from an entity transaction, each party to that\r\ntransaction who receives a copy of the work also receives whatever\r\nlicenses to the work the party\'s predecessor in interest had or could\r\ngive under the previous paragraph, plus a right to possession of the\r\nCorresponding Source of the work from the predecessor in interest, if\r\nthe predecessor has it or can get it with reasonable efforts.\r\n\r\n  You may not impose any further restrictions on the exercise of the\r\nrights granted or affirmed under this License.  For example, you may\r\nnot impose a license fee, royalty, or other charge for exercise of\r\nrights granted under this License, and you may not initiate litigation\r\n(including a cross-claim or counterclaim in a lawsuit) alleging that\r\nany patent claim is infringed by making, using, selling, offering for\r\nsale, or importing the Program or any portion of it.\r\n\r\n  11. Patents.\r\n\r\n  A &quot;contributor&quot; is a copyright holder who authorizes use under this\r\nLicense of the Program or a work on which the Program is based.  The\r\nwork thus licensed is called the contributor\'s &quot;contributor version&quot;.\r\n\r\n  A contributor\'s &quot;essential patent claims&quot; are all patent claims\r\nowned or controlled by the contributor, whether already acquired or\r\nhereafter acquired, that would be infringed by some manner, permitted\r\nby this License, of making, using, or selling its contributor version,\r\nbut do not include claims that would be infringed only as a\r\nconsequence of further modification of the contributor version.  For\r\npurposes of this definition, &quot;control&quot; includes the right to grant\r\npatent sublicenses in a manner consistent with the requirements of\r\nthis License.\r\n\r\n  Each contributor grants you a non-exclusive, worldwide, royalty-free\r\npatent license under the contributor\'s essential patent claims, to\r\nmake, use, sell, offer for sale, import and otherwise run, modify and\r\npropagate the contents of its contributor version.\r\n\r\n  In the following three paragraphs, a &quot;patent license&quot; is any express\r\nagreement or commitment, however denominated, not to enforce a patent\r\n(such as an express permission to practice a patent or covenant not to\r\nsue for patent infringement).  To &quot;grant&quot; such a patent license to a\r\nparty means to make such an agreement or commitment not to enforce a\r\npatent against the party.\r\n\r\n  If you convey a covered work, knowingly relying on a patent license,\r\nand the Corresponding Source of the work is not available for anyone\r\nto copy, free of charge and under the terms of this License, through a\r\npublicly available network server or other readily accessible means,\r\nthen you must either (1) cause the Corresponding Source to be so\r\navailable, or (2) arrange to deprive yourself of the benefit of the\r\npatent license for this particular work, or (3) arrange, in a manner\r\nconsistent with the requirements of this License, to extend the patent\r\nlicense to downstream recipients.  &quot;Knowingly relying&quot; means you have\r\nactual knowledge that, but for the patent license, your conveying the\r\ncovered work in a country, or your recipient\'s use of the covered work\r\nin a country, would infringe one or more identifiable patents in that\r\ncountry that you have reason to believe are valid.\r\n\r\n  If, pursuant to or in connection with a single transaction or\r\narrangement, you convey, or propagate by procuring conveyance of, a\r\ncovered work, and grant a patent license to some of the parties\r\nreceiving the covered work authorizing them to use, propagate, modify\r\nor convey a specific copy of the covered work, then the patent license\r\nyou grant is automatically extended to all recipients of the covered\r\nwork and works based on it.\r\n\r\n  A patent license is &quot;discriminatory&quot; if it does not include within\r\nthe scope of its coverage, prohibits the exercise of, or is\r\nconditioned on the non-exercise of one or more of the rights that are\r\nspecifically granted under this License.  You may not convey a covered\r\nwork if you are a party to an arrangement with a third party that is\r\nin the business of distributing software, under which you make payment\r\nto the third party based on the extent of your activity of conveying\r\nthe work, and under which the third party grants, to any of the\r\nparties who would receive the covered work from you, a discriminatory\r\npatent license (a) in connection with copies of the covered work\r\nconveyed by you (or copies made from those copies), or (b) primarily\r\nfor and in connection with specific products or compilations that\r\ncontain the covered work, unless you entered into that arrangement,\r\nor that patent license was granted, prior to 28 March 2007.\r\n\r\n  Nothing in this License shall be construed as excluding or limiting\r\nany implied license or other defenses to infringement that may\r\notherwise be available to you under applicable patent law.\r\n\r\n  12. No Surrender of Others\' Freedom.\r\n\r\n  If conditions are imposed on you (whether by court order, agreement or\r\notherwise) that contradict the conditions of this License, they do not\r\nexcuse you from the conditions of this License.  If you cannot convey a\r\ncovered work so as to satisfy simultaneously your obligations under this\r\nLicense and any other pertinent obligations, then as a consequence you may\r\nnot convey it at all.  For example, if you agree to terms that obligate you\r\nto collect a royalty for further conveying from those to whom you convey\r\nthe Program, the only way you could satisfy both those terms and this\r\nLicense would be to refrain entirely from conveying the Program.\r\n\r\n  13. Use with the GNU Affero General Public License.\r\n\r\n  Notwithstanding any other provision of this License, you have\r\npermission to link or combine any covered work with a work licensed\r\nunder version 3 of the GNU Affero General Public License into a single\r\ncombined work, and to convey the resulting work.  The terms of this\r\nLicense will continue to apply to the part which is the covered work,\r\nbut the special requirements of the GNU Affero General Public License,\r\nsection 13, concerning interaction through a network will apply to the\r\ncombination as such.\r\n\r\n  14. Revised Versions of this License.\r\n\r\n  The Free Software Foundation may publish revised and/or new versions of\r\nthe GNU General Public License from time to time.  Such new versions will\r\nbe similar in spirit to the present version, but may differ in detail to\r\naddress new problems or concerns.\r\n\r\n  Each version is given a distinguishing version number.  If the\r\nProgram specifies that a certain numbered version of the GNU General\r\nPublic License &quot;or any later version&quot; applies to it, you have the\r\noption of following the terms and conditions either of that numbered\r\nversion or of any later version published by the Free Software\r\nFoundation.  If the Program does not specify a version number of the\r\nGNU General Public License, you may choose any version ever published\r\nby the Free Software Foundation.\r\n\r\n  If the Program specifies that a proxy can decide which future\r\nversions of the GNU General Public License can be used, that proxy\'s\r\npublic statement of acceptance of a version permanently authorizes you\r\nto choose that version for the Program.\r\n\r\n  Later license versions may give you additional or different\r\npermissions.  However, no additional obligations are imposed on any\r\nauthor or copyright holder as a result of your choosing to follow a\r\nlater version.\r\n\r\n  15. Disclaimer of Warranty.\r\n\r\n  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY\r\nAPPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT\r\nHOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM &quot;AS IS&quot; WITHOUT WARRANTY\r\nOF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,\r\nTHE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR\r\nPURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM\r\nIS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF\r\nALL NECESSARY SERVICING, REPAIR OR CORRECTION.\r\n\r\n  16. Limitation of Liability.\r\n\r\n  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING\r\nWILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS\r\nTHE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY\r\nGENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE\r\nUSE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF\r\nDATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD\r\nPARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),\r\nEVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF\r\nSUCH DAMAGES.\r\n\r\n  17. Interpretation of Sections 15 and 16.\r\n\r\n  If the disclaimer of warranty and limitation of liability provided\r\nabove cannot be given local legal effect according to their terms,\r\nreviewing courts shall apply local law that most closely approximates\r\nan absolute waiver of all civil liability in connection with the\r\nProgram, unless a warranty or assumption of liability accompanies a\r\ncopy of the Program in return for a fee.\r\n','General Public License (GPL)',3),(4,'NCSA','Copyright (c) [YEAR] [OWNER] \nAll rights reserved.\n\nDeveloped by:	\n			[OWNER]\n			[ORGANIZATION]\n			[URL]\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \'Software\'), to deal with the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nRedistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimers. \n\nRedistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimers in the documentation and/or other materials provided with the distribution.\n\nNeither the names of [OWNER],[ORGANIZATION], nor the names of its contributors may be used to endorse or promote products derived from this Software without specific prior written permission.\n\nTHE SOFTWARE IS PROVIDED \'AS IS\', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.','NCSA Open Source License',2),(5,'custom','[ONE LINE DESCRIPTION]\nCopyright (C) [YEAR] [OWNER]','custom',5),(6,'LGPL','[ONE LINE DESCRIPTION]\r\nCopyright (C) [YEAR]  [OWNER]\r\n\r\nThis program is free software: you can redistribute it and/or modify\r\nit under the terms of the GNU Lesser General Public License as published\r\nby the Free Software Foundation, either version 3 of the License, or\r\n(at your option) any later version.\r\n\r\nThis program is distributed in the hope that it will be useful,\r\nbut WITHOUT ANY WARRANTY; without even the implied warranty of\r\nMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\nGNU Lesser General Public License below for more details.\r\n\r\n------------------------------------------------------------------------\r\n\r\n		   GNU LESSER GENERAL PUBLIC LICENSE\r\n                       Version 3, 29 June 2007\r\n\r\n Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>\r\n Everyone is permitted to copy and distribute verbatim copies\r\n of this license document, but changing it is not allowed.\r\n\r\n\r\n  This version of the GNU Lesser General Public License incorporates\r\nthe terms and conditions of version 3 of the GNU General Public\r\nLicense, supplemented by the additional permissions listed below.\r\n\r\n  0. Additional Definitions. \r\n\r\n  As used herein, &quot;this License&quot; refers to version 3 of the GNU Lesser\r\nGeneral Public License, and the &quot;GNU GPL&quot; refers to version 3 of the GNU\r\nGeneral Public License.\r\n\r\n  &quot;The Library&quot; refers to a covered work governed by this License,\r\nother than an Application or a Combined Work as defined below.\r\n\r\n  An &quot;Application&quot; is any work that makes use of an interface provided\r\nby the Library, but which is not otherwise based on the Library.\r\nDefining a subclass of a class defined by the Library is deemed a mode\r\nof using an interface provided by the Library.\r\n\r\n  A &quot;Combined Work&quot; is a work produced by combining or linking an\r\nApplication with the Library.  The particular version of the Library\r\nwith which the Combined Work was made is also called the &quot;Linked\r\nVersion&quot;.\r\n\r\n  The &quot;Minimal Corresponding Source&quot; for a Combined Work means the\r\nCorresponding Source for the Combined Work, excluding any source code\r\nfor portions of the Combined Work that, considered in isolation, are\r\nbased on the Application, and not on the Linked Version.\r\n\r\n  The &quot;Corresponding Application Code&quot; for a Combined Work means the\r\nobject code and/or source code for the Application, including any data\r\nand utility programs needed for reproducing the Combined Work from the\r\nApplication, but excluding the System Libraries of the Combined Work.\r\n\r\n  1. Exception to Section 3 of the GNU GPL.\r\n\r\n  You may convey a covered work under sections 3 and 4 of this License\r\nwithout being bound by section 3 of the GNU GPL.\r\n\r\n  2. Conveying Modified Versions.\r\n\r\n  If you modify a copy of the Library, and, in your modifications, a\r\nfacility refers to a function or data to be supplied by an Application\r\nthat uses the facility (other than as an argument passed when the\r\nfacility is invoked), then you may convey a copy of the modified\r\nversion:\r\n\r\n   a) under this License, provided that you make a good faith effort to\r\n   ensure that, in the event an Application does not supply the\r\n   function or data, the facility still operates, and performs\r\n   whatever part of its purpose remains meaningful, or\r\n\r\n   b) under the GNU GPL, with none of the additional permissions of\r\n   this License applicable to that copy.\r\n\r\n  3. Object Code Incorporating Material from Library Header Files.\r\n\r\n  The object code form of an Application may incorporate material from\r\na header file that is part of the Library.  You may convey such object\r\ncode under terms of your choice, provided that, if the incorporated\r\nmaterial is not limited to numerical parameters, data structure\r\nlayouts and accessors, or small macros, inline functions and templates\r\n(ten or fewer lines in length), you do both of the following:\r\n\r\n   a) Give prominent notice with each copy of the object code that the\r\n   Library is used in it and that the Library and its use are\r\n   covered by this License.\r\n\r\n   b) Accompany the object code with a copy of the GNU GPL and this license\r\n   document.\r\n\r\n  4. Combined Works.\r\n\r\n  You may convey a Combined Work under terms of your choice that,\r\ntaken together, effectively do not restrict modification of the\r\nportions of the Library contained in the Combined Work and reverse\r\nengineering for debugging such modifications, if you also do each of\r\nthe following:\r\n\r\n   a) Give prominent notice with each copy of the Combined Work that\r\n   the Library is used in it and that the Library and its use are\r\n   covered by this License.\r\n\r\n   b) Accompany the Combined Work with a copy of the GNU GPL and this license\r\n   document.\r\n\r\n   c) For a Combined Work that displays copyright notices during\r\n   execution, include the copyright notice for the Library among\r\n   these notices, as well as a reference directing the user to the\r\n   copies of the GNU GPL and this license document.\r\n\r\n   d) Do one of the following:\r\n\r\n       0) Convey the Minimal Corresponding Source under the terms of this\r\n       License, and the Corresponding Application Code in a form\r\n       suitable for, and under terms that permit, the user to\r\n       recombine or relink the Application with a modified version of\r\n       the Linked Version to produce a modified Combined Work, in the\r\n       manner specified by section 6 of the GNU GPL for conveying\r\n       Corresponding Source.\r\n\r\n       1) Use a suitable shared library mechanism for linking with the\r\n       Library.  A suitable mechanism is one that (a) uses at run time\r\n       a copy of the Library already present on the user\'s computer\r\n       system, and (b) will operate properly with a modified version\r\n       of the Library that is interface-compatible with the Linked\r\n       Version. \r\n\r\n   e) Provide Installation Information, but only if you would otherwise\r\n   be required to provide such information under section 6 of the\r\n   GNU GPL, and only to the extent that such information is\r\n   necessary to install and execute a modified version of the\r\n   Combined Work produced by recombining or relinking the\r\n   Application with a modified version of the Linked Version. (If\r\n   you use option 4d0, the Installation Information must accompany\r\n   the Minimal Corresponding Source and Corresponding Application\r\n   Code. If you use option 4d1, you must provide the Installation\r\n   Information in the manner specified by section 6 of the GNU GPL\r\n   for conveying Corresponding Source.)\r\n\r\n  5. Combined Libraries.\r\n\r\n  You may place library facilities that are a work based on the\r\nLibrary side by side in a single library together with other library\r\nfacilities that are not Applications and are not covered by this\r\nLicense, and convey such a combined library under terms of your\r\nchoice, if you do both of the following:\r\n\r\n   a) Accompany the combined library with a copy of the same work based\r\n   on the Library, uncombined with any other library facilities,\r\n   conveyed under the terms of this License.\r\n\r\n   b) Give prominent notice with the combined library that part of it\r\n   is a work based on the Library, and explaining where to find the\r\n   accompanying uncombined form of the same work.\r\n\r\n  6. Revised Versions of the GNU Lesser General Public License.\r\n\r\n  The Free Software Foundation may publish revised and/or new versions\r\nof the GNU Lesser General Public License from time to time. Such new\r\nversions will be similar in spirit to the present version, but may\r\ndiffer in detail to address new problems or concerns.\r\n\r\n  Each version is given a distinguishing version number. If the\r\nLibrary as you received it specifies that a certain numbered version\r\nof the GNU Lesser General Public License &quot;or any later version&quot;\r\napplies to it, you have the option of following the terms and\r\nconditions either of that published version or of any later version\r\npublished by the Free Software Foundation. If the Library as you\r\nreceived it does not specify a version number of the GNU Lesser\r\nGeneral Public License, you may choose any version of the GNU Lesser\r\nGeneral Public License ever published by the Free Software Foundation.\r\n\r\n  If the Library as you received it specifies that a proxy can decide\r\nwhether future versions of the GNU Lesser General Public License shall\r\napply, that proxy\'s public statement of acceptance of any version is\r\npermanent authorization for you to choose that version for the\r\nLibrary.\r\n\r\n------------------------------------------------------------------------\r\n\r\n                    GNU GENERAL PUBLIC LICENSE\r\n                       Version 3, 29 June 2007\r\n\r\n Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>\r\n Everyone is permitted to copy and distribute verbatim copies\r\n of this license document, but changing it is not allowed.\r\n\r\n                            Preamble\r\n\r\n  The GNU General Public License is a free, copyleft license for\r\nsoftware and other kinds of works.\r\n\r\n  The licenses for most software and other practical works are designed\r\nto take away your freedom to share and change the works.  By contrast,\r\nthe GNU General Public License is intended to guarantee your freedom to\r\nshare and change all versions of a program--to make sure it remains free\r\nsoftware for all its users.  We, the Free Software Foundation, use the\r\nGNU General Public License for most of our software; it applies also to\r\nany other work released this way by its authors.  You can apply it to\r\nyour programs, too.\r\n\r\n  When we speak of free software, we are referring to freedom, not\r\nprice.  Our General Public Licenses are designed to make sure that you\r\nhave the freedom to distribute copies of free software (and charge for\r\nthem if you wish), that you receive source code or can get it if you\r\nwant it, that you can change the software or use pieces of it in new\r\nfree programs, and that you know you can do these things.\r\n\r\n  To protect your rights, we need to prevent others from denying you\r\nthese rights or asking you to surrender the rights.  Therefore, you have\r\ncertain responsibilities if you distribute copies of the software, or if\r\nyou modify it: responsibilities to respect the freedom of others.\r\n\r\n  For example, if you distribute copies of such a program, whether\r\ngratis or for a fee, you must pass on to the recipients the same\r\nfreedoms that you received.  You must make sure that they, too, receive\r\nor can get the source code.  And you must show them these terms so they\r\nknow their rights.\r\n\r\n  Developers that use the GNU GPL protect your rights with two steps:\r\n(1) assert copyright on the software, and (2) offer you this License\r\ngiving you legal permission to copy, distribute and/or modify it.\r\n\r\n  For the developers\' and authors\' protection, the GPL clearly explains\r\nthat there is no warranty for this free software.  For both users\' and\r\nauthors\' sake, the GPL requires that modified versions be marked as\r\nchanged, so that their problems will not be attributed erroneously to\r\nauthors of previous versions.\r\n\r\n  Some devices are designed to deny users access to install or run\r\nmodified versions of the software inside them, although the manufacturer\r\ncan do so.  This is fundamentally incompatible with the aim of\r\nprotecting users\' freedom to change the software.  The systematic\r\npattern of such abuse occurs in the area of products for individuals to\r\nuse, which is precisely where it is most unacceptable.  Therefore, we\r\nhave designed this version of the GPL to prohibit the practice for those\r\nproducts.  If such problems arise substantially in other domains, we\r\nstand ready to extend this provision to those domains in future versions\r\nof the GPL, as needed to protect the freedom of users.\r\n\r\n  Finally, every program is threatened constantly by software patents.\r\nStates should not allow patents to restrict development and use of\r\nsoftware on general-purpose computers, but in those that do, we wish to\r\navoid the special danger that patents applied to a free program could\r\nmake it effectively proprietary.  To prevent this, the GPL assures that\r\npatents cannot be used to render the program non-free.\r\n\r\n  The precise terms and conditions for copying, distribution and\r\nmodification follow.\r\n\r\n                       TERMS AND CONDITIONS\r\n\r\n  0. Definitions.\r\n\r\n  &quot;This License&quot; refers to version 3 of the GNU General Public License.\r\n\r\n  &quot;Copyright&quot; also means copyright-like laws that apply to other kinds of\r\nworks, such as semiconductor masks.\r\n\r\n  &quot;The Program&quot; refers to any copyrightable work licensed under this\r\nLicense.  Each licensee is addressed as &quot;you&quot;.  &quot;Licensees&quot; and\r\n&quot;recipients&quot; may be individuals or organizations.\r\n\r\n  To &quot;modify&quot; a work means to copy from or adapt all or part of the work\r\nin a fashion requiring copyright permission, other than the making of an\r\nexact copy.  The resulting work is called a &quot;modified version&quot; of the\r\nearlier work or a work &quot;based on&quot; the earlier work.\r\n\r\n  A &quot;covered work&quot; means either the unmodified Program or a work based\r\non the Program.\r\n\r\n  To &quot;propagate&quot; a work means to do anything with it that, without\r\npermission, would make you directly or secondarily liable for\r\ninfringement under applicable copyright law, except executing it on a\r\ncomputer or modifying a private copy.  Propagation includes copying,\r\ndistribution (with or without modification), making available to the\r\npublic, and in some countries other activities as well.\r\n\r\n  To &quot;convey&quot; a work means any kind of propagation that enables other\r\nparties to make or receive copies.  Mere interaction with a user through\r\na computer network, with no transfer of a copy, is not conveying.\r\n\r\n  An interactive user interface displays &quot;Appropriate Legal Notices&quot;\r\nto the extent that it includes a convenient and prominently visible\r\nfeature that (1) displays an appropriate copyright notice, and (2)\r\ntells the user that there is no warranty for the work (except to the\r\nextent that warranties are provided), that licensees may convey the\r\nwork under this License, and how to view a copy of this License.  If\r\nthe interface presents a list of user commands or options, such as a\r\nmenu, a prominent item in the list meets this criterion.\r\n\r\n  1. Source Code.\r\n\r\n  The &quot;source code&quot; for a work means the preferred form of the work\r\nfor making modifications to it.  &quot;Object code&quot; means any non-source\r\nform of a work.\r\n\r\n  A &quot;Standard Interface&quot; means an interface that either is an official\r\nstandard defined by a recognized standards body, or, in the case of\r\ninterfaces specified for a particular programming language, one that\r\nis widely used among developers working in that language.\r\n\r\n  The &quot;System Libraries&quot; of an executable work include anything, other\r\nthan the work as a whole, that (a) is included in the normal form of\r\npackaging a Major Component, but which is not part of that Major\r\nComponent, and (b) serves only to enable use of the work with that\r\nMajor Component, or to implement a Standard Interface for which an\r\nimplementation is available to the public in source code form.  A\r\n&quot;Major Component&quot;, in this context, means a major essential component\r\n(kernel, window system, and so on) of the specific operating system\r\n(if any) on which the executable work runs, or a compiler used to\r\nproduce the work, or an object code interpreter used to run it.\r\n\r\n  The &quot;Corresponding Source&quot; for a work in object code form means all\r\nthe source code needed to generate, install, and (for an executable\r\nwork) run the object code and to modify the work, including scripts to\r\ncontrol those activities.  However, it does not include the work\'s\r\nSystem Libraries, or general-purpose tools or generally available free\r\nprograms which are used unmodified in performing those activities but\r\nwhich are not part of the work.  For example, Corresponding Source\r\nincludes interface definition files associated with source files for\r\nthe work, and the source code for shared libraries and dynamically\r\nlinked subprograms that the work is specifically designed to require,\r\nsuch as by intimate data communication or control flow between those\r\nsubprograms and other parts of the work.\r\n\r\n  The Corresponding Source need not include anything that users\r\ncan regenerate automatically from other parts of the Corresponding\r\nSource.\r\n\r\n  The Corresponding Source for a work in source code form is that\r\nsame work.\r\n\r\n  2. Basic Permissions.\r\n\r\n  All rights granted under this License are granted for the term of\r\ncopyright on the Program, and are irrevocable provided the stated\r\nconditions are met.  This License explicitly affirms your unlimited\r\npermission to run the unmodified Program.  The output from running a\r\ncovered work is covered by this License only if the output, given its\r\ncontent, constitutes a covered work.  This License acknowledges your\r\nrights of fair use or other equivalent, as provided by copyright law.\r\n\r\n  You may make, run and propagate covered works that you do not\r\nconvey, without conditions so long as your license otherwise remains\r\nin force.  You may convey covered works to others for the sole purpose\r\nof having them make modifications exclusively for you, or provide you\r\nwith facilities for running those works, provided that you comply with\r\nthe terms of this License in conveying all material for which you do\r\nnot control copyright.  Those thus making or running the covered works\r\nfor you must do so exclusively on your behalf, under your direction\r\nand control, on terms that prohibit them from making any copies of\r\nyour copyrighted material outside their relationship with you.\r\n\r\n  Conveying under any other circumstances is permitted solely under\r\nthe conditions stated below.  Sublicensing is not allowed; section 10\r\nmakes it unnecessary.\r\n\r\n  3. Protecting Users\' Legal Rights From Anti-Circumvention Law.\r\n\r\n  No covered work shall be deemed part of an effective technological\r\nmeasure under any applicable law fulfilling obligations under article\r\n11 of the WIPO copyright treaty adopted on 20 December 1996, or\r\nsimilar laws prohibiting or restricting circumvention of such\r\nmeasures.\r\n\r\n  When you convey a covered work, you waive any legal power to forbid\r\ncircumvention of technological measures to the extent such circumvention\r\nis effected by exercising rights under this License with respect to\r\nthe covered work, and you disclaim any intention to limit operation or\r\nmodification of the work as a means of enforcing, against the work\'s\r\nusers, your or third parties\' legal rights to forbid circumvention of\r\ntechnological measures.\r\n\r\n  4. Conveying Verbatim Copies.\r\n\r\n  You may convey verbatim copies of the Program\'s source code as you\r\nreceive it, in any medium, provided that you conspicuously and\r\nappropriately publish on each copy an appropriate copyright notice;\r\nkeep intact all notices stating that this License and any\r\nnon-permissive terms added in accord with section 7 apply to the code;\r\nkeep intact all notices of the absence of any warranty; and give all\r\nrecipients a copy of this License along with the Program.\r\n\r\n  You may charge any price or no price for each copy that you convey,\r\nand you may offer support or warranty protection for a fee.\r\n\r\n  5. Conveying Modified Source Versions.\r\n\r\n  You may convey a work based on the Program, or the modifications to\r\nproduce it from the Program, in the form of source code under the\r\nterms of section 4, provided that you also meet all of these conditions:\r\n\r\n    a) The work must carry prominent notices stating that you modified\r\n    it, and giving a relevant date.\r\n\r\n    b) The work must carry prominent notices stating that it is\r\n    released under this License and any conditions added under section\r\n    7.  This requirement modifies the requirement in section 4 to\r\n    &quot;keep intact all notices&quot;.\r\n\r\n    c) You must license the entire work, as a whole, under this\r\n    License to anyone who comes into possession of a copy.  This\r\n    License will therefore apply, along with any applicable section 7\r\n    additional terms, to the whole of the work, and all its parts,\r\n    regardless of how they are packaged.  This License gives no\r\n    permission to license the work in any other way, but it does not\r\n    invalidate such permission if you have separately received it.\r\n\r\n    d) If the work has interactive user interfaces, each must display\r\n    Appropriate Legal Notices; however, if the Program has interactive\r\n    interfaces that do not display Appropriate Legal Notices, your\r\n    work need not make them do so.\r\n\r\n  A compilation of a covered work with other separate and independent\r\nworks, which are not by their nature extensions of the covered work,\r\nand which are not combined with it such as to form a larger program,\r\nin or on a volume of a storage or distribution medium, is called an\r\n&quot;aggregate&quot; if the compilation and its resulting copyright are not\r\nused to limit the access or legal rights of the compilation\'s users\r\nbeyond what the individual works permit.  Inclusion of a covered work\r\nin an aggregate does not cause this License to apply to the other\r\nparts of the aggregate.\r\n\r\n  6. Conveying Non-Source Forms.\r\n\r\n  You may convey a covered work in object code form under the terms\r\nof sections 4 and 5, provided that you also convey the\r\nmachine-readable Corresponding Source under the terms of this License,\r\nin one of these ways:\r\n\r\n    a) Convey the object code in, or embodied in, a physical product\r\n    (including a physical distribution medium), accompanied by the\r\n    Corresponding Source fixed on a durable physical medium\r\n    customarily used for software interchange.\r\n\r\n    b) Convey the object code in, or embodied in, a physical product\r\n    (including a physical distribution medium), accompanied by a\r\n    written offer, valid for at least three years and valid for as\r\n    long as you offer spare parts or customer support for that product\r\n    model, to give anyone who possesses the object code either (1) a\r\n    copy of the Corresponding Source for all the software in the\r\n    product that is covered by this License, on a durable physical\r\n    medium customarily used for software interchange, for a price no\r\n    more than your reasonable cost of physically performing this\r\n    conveying of source, or (2) access to copy the\r\n    Corresponding Source from a network server at no charge.\r\n\r\n    c) Convey individual copies of the object code with a copy of the\r\n    written offer to provide the Corresponding Source.  This\r\n    alternative is allowed only occasionally and noncommercially, and\r\n    only if you received the object code with such an offer, in accord\r\n    with subsection 6b.\r\n\r\n    d) Convey the object code by offering access from a designated\r\n    place (gratis or for a charge), and offer equivalent access to the\r\n    Corresponding Source in the same way through the same place at no\r\n    further charge.  You need not require recipients to copy the\r\n    Corresponding Source along with the object code.  If the place to\r\n    copy the object code is a network server, the Corresponding Source\r\n    may be on a different server (operated by you or a third party)\r\n    that supports equivalent copying facilities, provided you maintain\r\n    clear directions next to the object code saying where to find the\r\n    Corresponding Source.  Regardless of what server hosts the\r\n    Corresponding Source, you remain obligated to ensure that it is\r\n    available for as long as needed to satisfy these requirements.\r\n\r\n    e) Convey the object code using peer-to-peer transmission, provided\r\n    you inform other peers where the object code and Corresponding\r\n    Source of the work are being offered to the general public at no\r\n    charge under subsection 6d.\r\n\r\n  A separable portion of the object code, whose source code is excluded\r\nfrom the Corresponding Source as a System Library, need not be\r\nincluded in conveying the object code work.\r\n\r\n  A &quot;User Product&quot; is either (1) a &quot;consumer product&quot;, which means any\r\ntangible personal property which is normally used for personal, family,\r\nor household purposes, or (2) anything designed or sold for incorporation\r\ninto a dwelling.  In determining whether a product is a consumer product,\r\ndoubtful cases shall be resolved in favor of coverage.  For a particular\r\nproduct received by a particular user, &quot;normally used&quot; refers to a\r\ntypical or common use of that class of product, regardless of the status\r\nof the particular user or of the way in which the particular user\r\nactually uses, or expects or is expected to use, the product.  A product\r\nis a consumer product regardless of whether the product has substantial\r\ncommercial, industrial or non-consumer uses, unless such uses represent\r\nthe only significant mode of use of the product.\r\n\r\n  &quot;Installation Information&quot; for a User Product means any methods,\r\nprocedures, authorization keys, or other information required to install\r\nand execute modified versions of a covered work in that User Product from\r\na modified version of its Corresponding Source.  The information must\r\nsuffice to ensure that the continued functioning of the modified object\r\ncode is in no case prevented or interfered with solely because\r\nmodification has been made.\r\n\r\n  If you convey an object code work under this section in, or with, or\r\nspecifically for use in, a User Product, and the conveying occurs as\r\npart of a transaction in which the right of possession and use of the\r\nUser Product is transferred to the recipient in perpetuity or for a\r\nfixed term (regardless of how the transaction is characterized), the\r\nCorresponding Source conveyed under this section must be accompanied\r\nby the Installation Information.  But this requirement does not apply\r\nif neither you nor any third party retains the ability to install\r\nmodified object code on the User Product (for example, the work has\r\nbeen installed in ROM).\r\n\r\n  The requirement to provide Installation Information does not include a\r\nrequirement to continue to provide support service, warranty, or updates\r\nfor a work that has been modified or installed by the recipient, or for\r\nthe User Product in which it has been modified or installed.  Access to a\r\nnetwork may be denied when the modification itself materially and\r\nadversely affects the operation of the network or violates the rules and\r\nprotocols for communication across the network.\r\n\r\n  Corresponding Source conveyed, and Installation Information provided,\r\nin accord with this section must be in a format that is publicly\r\ndocumented (and with an implementation available to the public in\r\nsource code form), and must require no special password or key for\r\nunpacking, reading or copying.\r\n\r\n  7. Additional Terms.\r\n\r\n  &quot;Additional permissions&quot; are terms that supplement the terms of this\r\nLicense by making exceptions from one or more of its conditions.\r\nAdditional permissions that are applicable to the entire Program shall\r\nbe treated as though they were included in this License, to the extent\r\nthat they are valid under applicable law.  If additional permissions\r\napply only to part of the Program, that part may be used separately\r\nunder those permissions, but the entire Program remains governed by\r\nthis License without regard to the additional permissions.\r\n\r\n  When you convey a copy of a covered work, you may at your option\r\nremove any additional permissions from that copy, or from any part of\r\nit.  (Additional permissions may be written to require their own\r\nremoval in certain cases when you modify the work.)  You may place\r\nadditional permissions on material, added by you to a covered work,\r\nfor which you have or can give appropriate copyright permission.\r\n\r\n  Notwithstanding any other provision of this License, for material you\r\nadd to a covered work, you may (if authorized by the copyright holders of\r\nthat material) supplement the terms of this License with terms:\r\n\r\n    a) Disclaiming warranty or limiting liability differently from the\r\n    terms of sections 15 and 16 of this License; or\r\n\r\n    b) Requiring preservation of specified reasonable legal notices or\r\n    author attributions in that material or in the Appropriate Legal\r\n    Notices displayed by works containing it; or\r\n\r\n    c) Prohibiting misrepresentation of the origin of that material, or\r\n    requiring that modified versions of such material be marked in\r\n    reasonable ways as different from the original version; or\r\n\r\n    d) Limiting the use for publicity purposes of names of licensors or\r\n    authors of the material; or\r\n\r\n    e) Declining to grant rights under trademark law for use of some\r\n    trade names, trademarks, or service marks; or\r\n\r\n    f) Requiring indemnification of licensors and authors of that\r\n    material by anyone who conveys the material (or modified versions of\r\n    it) with contractual assumptions of liability to the recipient, for\r\n    any liability that these contractual assumptions directly impose on\r\n    those licensors and authors.\r\n\r\n  All other non-permissive additional terms are considered &quot;further\r\nrestrictions&quot; within the meaning of section 10.  If the Program as you\r\nreceived it, or any part of it, contains a notice stating that it is\r\ngoverned by this License along with a term that is a further\r\nrestriction, you may remove that term.  If a license document contains\r\na further restriction but permits relicensing or conveying under this\r\nLicense, you may add to a covered work material governed by the terms\r\nof that license document, provided that the further restriction does\r\nnot survive such relicensing or conveying.\r\n\r\n  If you add terms to a covered work in accord with this section, you\r\nmust place, in the relevant source files, a statement of the\r\nadditional terms that apply to those files, or a notice indicating\r\nwhere to find the applicable terms.\r\n\r\n  Additional terms, permissive or non-permissive, may be stated in the\r\nform of a separately written license, or stated as exceptions;\r\nthe above requirements apply either way.\r\n\r\n  8. Termination.\r\n\r\n  You may not propagate or modify a covered work except as expressly\r\nprovided under this License.  Any attempt otherwise to propagate or\r\nmodify it is void, and will automatically terminate your rights under\r\nthis License (including any patent licenses granted under the third\r\nparagraph of section 11).\r\n\r\n  However, if you cease all violation of this License, then your\r\nlicense from a particular copyright holder is reinstated (a)\r\nprovisionally, unless and until the copyright holder explicitly and\r\nfinally terminates your license, and (b) permanently, if the copyright\r\nholder fails to notify you of the violation by some reasonable means\r\nprior to 60 days after the cessation.\r\n\r\n  Moreover, your license from a particular copyright holder is\r\nreinstated permanently if the copyright holder notifies you of the\r\nviolation by some reasonable means, this is the first time you have\r\nreceived notice of violation of this License (for any work) from that\r\ncopyright holder, and you cure the violation prior to 30 days after\r\nyour receipt of the notice.\r\n\r\n  Termination of your rights under this section does not terminate the\r\nlicenses of parties who have received copies or rights from you under\r\nthis License.  If your rights have been terminated and not permanently\r\nreinstated, you do not qualify to receive new licenses for the same\r\nmaterial under section 10.\r\n\r\n  9. Acceptance Not Required for Having Copies.\r\n\r\n  You are not required to accept this License in order to receive or\r\nrun a copy of the Program.  Ancillary propagation of a covered work\r\noccurring solely as a consequence of using peer-to-peer transmission\r\nto receive a copy likewise does not require acceptance.  However,\r\nnothing other than this License grants you permission to propagate or\r\nmodify any covered work.  These actions infringe copyright if you do\r\nnot accept this License.  Therefore, by modifying or propagating a\r\ncovered work, you indicate your acceptance of this License to do so.\r\n\r\n  10. Automatic Licensing of Downstream Recipients.\r\n\r\n  Each time you convey a covered work, the recipient automatically\r\nreceives a license from the original licensors, to run, modify and\r\npropagate that work, subject to this License.  You are not responsible\r\nfor enforcing compliance by third parties with this License.\r\n\r\n  An &quot;entity transaction&quot; is a transaction transferring control of an\r\norganization, or substantially all assets of one, or subdividing an\r\norganization, or merging organizations.  If propagation of a covered\r\nwork results from an entity transaction, each party to that\r\ntransaction who receives a copy of the work also receives whatever\r\nlicenses to the work the party\'s predecessor in interest had or could\r\ngive under the previous paragraph, plus a right to possession of the\r\nCorresponding Source of the work from the predecessor in interest, if\r\nthe predecessor has it or can get it with reasonable efforts.\r\n\r\n  You may not impose any further restrictions on the exercise of the\r\nrights granted or affirmed under this License.  For example, you may\r\nnot impose a license fee, royalty, or other charge for exercise of\r\nrights granted under this License, and you may not initiate litigation\r\n(including a cross-claim or counterclaim in a lawsuit) alleging that\r\nany patent claim is infringed by making, using, selling, offering for\r\nsale, or importing the Program or any portion of it.\r\n\r\n  11. Patents.\r\n\r\n  A &quot;contributor&quot; is a copyright holder who authorizes use under this\r\nLicense of the Program or a work on which the Program is based.  The\r\nwork thus licensed is called the contributor\'s &quot;contributor version&quot;.\r\n\r\n  A contributor\'s &quot;essential patent claims&quot; are all patent claims\r\nowned or controlled by the contributor, whether already acquired or\r\nhereafter acquired, that would be infringed by some manner, permitted\r\nby this License, of making, using, or selling its contributor version,\r\nbut do not include claims that would be infringed only as a\r\nconsequence of further modification of the contributor version.  For\r\npurposes of this definition, &quot;control&quot; includes the right to grant\r\npatent sublicenses in a manner consistent with the requirements of\r\nthis License.\r\n\r\n  Each contributor grants you a non-exclusive, worldwide, royalty-free\r\npatent license under the contributor\'s essential patent claims, to\r\nmake, use, sell, offer for sale, import and otherwise run, modify and\r\npropagate the contents of its contributor version.\r\n\r\n  In the following three paragraphs, a &quot;patent license&quot; is any express\r\nagreement or commitment, however denominated, not to enforce a patent\r\n(such as an express permission to practice a patent or covenant not to\r\nsue for patent infringement).  To &quot;grant&quot; such a patent license to a\r\nparty means to make such an agreement or commitment not to enforce a\r\npatent against the party.\r\n\r\n  If you convey a covered work, knowingly relying on a patent license,\r\nand the Corresponding Source of the work is not available for anyone\r\nto copy, free of charge and under the terms of this License, through a\r\npublicly available network server or other readily accessible means,\r\nthen you must either (1) cause the Corresponding Source to be so\r\navailable, or (2) arrange to deprive yourself of the benefit of the\r\npatent license for this particular work, or (3) arrange, in a manner\r\nconsistent with the requirements of this License, to extend the patent\r\nlicense to downstream recipients.  &quot;Knowingly relying&quot; means you have\r\nactual knowledge that, but for the patent license, your conveying the\r\ncovered work in a country, or your recipient\'s use of the covered work\r\nin a country, would infringe one or more identifiable patents in that\r\ncountry that you have reason to believe are valid.\r\n\r\n  If, pursuant to or in connection with a single transaction or\r\narrangement, you convey, or propagate by procuring conveyance of, a\r\ncovered work, and grant a patent license to some of the parties\r\nreceiving the covered work authorizing them to use, propagate, modify\r\nor convey a specific copy of the covered work, then the patent license\r\nyou grant is automatically extended to all recipients of the covered\r\nwork and works based on it.\r\n\r\n  A patent license is &quot;discriminatory&quot; if it does not include within\r\nthe scope of its coverage, prohibits the exercise of, or is\r\nconditioned on the non-exercise of one or more of the rights that are\r\nspecifically granted under this License.  You may not convey a covered\r\nwork if you are a party to an arrangement with a third party that is\r\nin the business of distributing software, under which you make payment\r\nto the third party based on the extent of your activity of conveying\r\nthe work, and under which the third party grants, to any of the\r\nparties who would receive the covered work from you, a discriminatory\r\npatent license (a) in connection with copies of the covered work\r\nconveyed by you (or copies made from those copies), or (b) primarily\r\nfor and in connection with specific products or compilations that\r\ncontain the covered work, unless you entered into that arrangement,\r\nor that patent license was granted, prior to 28 March 2007.\r\n\r\n  Nothing in this License shall be construed as excluding or limiting\r\nany implied license or other defenses to infringement that may\r\notherwise be available to you under applicable patent law.\r\n\r\n  12. No Surrender of Others\' Freedom.\r\n\r\n  If conditions are imposed on you (whether by court order, agreement or\r\notherwise) that contradict the conditions of this License, they do not\r\nexcuse you from the conditions of this License.  If you cannot convey a\r\ncovered work so as to satisfy simultaneously your obligations under this\r\nLicense and any other pertinent obligations, then as a consequence you may\r\nnot convey it at all.  For example, if you agree to terms that obligate you\r\nto collect a royalty for further conveying from those to whom you convey\r\nthe Program, the only way you could satisfy both those terms and this\r\nLicense would be to refrain entirely from conveying the Program.\r\n\r\n  13. Use with the GNU Affero General Public License.\r\n\r\n  Notwithstanding any other provision of this License, you have\r\npermission to link or combine any covered work with a work licensed\r\nunder version 3 of the GNU Affero General Public License into a single\r\ncombined work, and to convey the resulting work.  The terms of this\r\nLicense will continue to apply to the part which is the covered work,\r\nbut the special requirements of the GNU Affero General Public License,\r\nsection 13, concerning interaction through a network will apply to the\r\ncombination as such.\r\n\r\n  14. Revised Versions of this License.\r\n\r\n  The Free Software Foundation may publish revised and/or new versions of\r\nthe GNU General Public License from time to time.  Such new versions will\r\nbe similar in spirit to the present version, but may differ in detail to\r\naddress new problems or concerns.\r\n\r\n  Each version is given a distinguishing version number.  If the\r\nProgram specifies that a certain numbered version of the GNU General\r\nPublic License &quot;or any later version&quot; applies to it, you have the\r\noption of following the terms and conditions either of that numbered\r\nversion or of any later version published by the Free Software\r\nFoundation.  If the Program does not specify a version number of the\r\nGNU General Public License, you may choose any version ever published\r\nby the Free Software Foundation.\r\n\r\n  If the Program specifies that a proxy can decide which future\r\nversions of the GNU General Public License can be used, that proxy\'s\r\npublic statement of acceptance of a version permanently authorizes you\r\nto choose that version for the Program.\r\n\r\n  Later license versions may give you additional or different\r\npermissions.  However, no additional obligations are imposed on any\r\nauthor or copyright holder as a result of your choosing to follow a\r\nlater version.\r\n\r\n  15. Disclaimer of Warranty.\r\n\r\n  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY\r\nAPPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT\r\nHOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM &quot;AS IS&quot; WITHOUT WARRANTY\r\nOF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,\r\nTHE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR\r\nPURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM\r\nIS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF\r\nALL NECESSARY SERVICING, REPAIR OR CORRECTION.\r\n\r\n  16. Limitation of Liability.\r\n\r\n  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING\r\nWILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS\r\nTHE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY\r\nGENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE\r\nUSE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF\r\nDATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD\r\nPARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),\r\nEVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF\r\nSUCH DAMAGES.\r\n\r\n  17. Interpretation of Sections 15 and 16.\r\n\r\n  If the disclaimer of warranty and limitation of liability provided\r\nabove cannot be given local legal effect according to their terms,\r\nreviewing courts shall apply local law that most closely approximates\r\nan absolute waiver of all civil liability in connection with the\r\nProgram, unless a warranty or assumption of liability accompanies a\r\ncopy of the Program in return for a fee.\r\n','LGPL',4);
/*!40000 ALTER TABLE `jos_tool_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_session_class_groups`
--

DROP TABLE IF EXISTS `jos_tool_session_class_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_session_class_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_class_id` (`class_id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_session_class_groups`
--

LOCK TABLES `jos_tool_session_class_groups` WRITE;
/*!40000 ALTER TABLE `jos_tool_session_class_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_session_class_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_session_classes`
--

DROP TABLE IF EXISTS `jos_tool_session_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_session_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `jobs` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_session_classes`
--

LOCK TABLES `jos_tool_session_classes` WRITE;
/*!40000 ALTER TABLE `jos_tool_session_classes` DISABLE KEYS */;
INSERT INTO `jos_tool_session_classes` VALUES (1,'default',3);
/*!40000 ALTER TABLE `jos_tool_session_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_statusviews`
--

DROP TABLE IF EXISTS `jos_tool_statusviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_statusviews` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(15) NOT NULL DEFAULT '',
  `uid` varchar(31) NOT NULL DEFAULT '',
  `viewed` datetime DEFAULT '0000-00-00 00:00:00',
  `elapsed` int(11) DEFAULT '500000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_statusviews`
--

LOCK TABLES `jos_tool_statusviews` WRITE;
/*!40000 ALTER TABLE `jos_tool_statusviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_statusviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_version`
--

DROP TABLE IF EXISTS `jos_tool_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_version` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `toolname` varchar(64) NOT NULL DEFAULT '',
  `instance` varchar(31) NOT NULL DEFAULT '',
  `title` varchar(127) NOT NULL DEFAULT '',
  `description` text,
  `fulltxt` text,
  `version` varchar(15) DEFAULT NULL,
  `revision` int(11) DEFAULT NULL,
  `toolaccess` varchar(15) DEFAULT NULL,
  `codeaccess` varchar(15) DEFAULT NULL,
  `wikiaccess` varchar(15) DEFAULT NULL,
  `state` int(15) DEFAULT NULL,
  `released_by` varchar(31) DEFAULT NULL,
  `released` datetime DEFAULT NULL,
  `unpublished` datetime DEFAULT NULL,
  `exportControl` varchar(16) DEFAULT NULL,
  `license` text,
  `vnc_geometry` varchar(31) DEFAULT NULL,
  `vnc_depth` int(11) DEFAULT NULL,
  `vnc_timeout` int(11) DEFAULT NULL,
  `vnc_command` varchar(100) DEFAULT NULL,
  `mw` varchar(31) DEFAULT NULL,
  `toolid` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_toolname_instance` (`toolname`,`instance`),
  KEY `idx_instance` (`instance`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_version`
--

LOCK TABLES `jos_tool_version` WRITE;
/*!40000 ALTER TABLE `jos_tool_version` DISABLE KEYS */;
INSERT INTO `jos_tool_version` VALUES (1,'workspace','workspace_r3','Workspace','Development workspace','Workspace','1.3',3,NULL,NULL,NULL,1,'admin','2015-09-13 14:50:14',NULL,NULL,NULL,'800x600',NULL,1209600,'/apps/workspace/r3/invoke','narwhal',1,NULL,NULL);
/*!40000 ALTER TABLE `jos_tool_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_version_alias`
--

DROP TABLE IF EXISTS `jos_tool_version_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_version_alias` (
  `tool_version_id` int(11) NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_version_alias`
--

LOCK TABLES `jos_tool_version_alias` WRITE;
/*!40000 ALTER TABLE `jos_tool_version_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_version_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_version_hostreq`
--

DROP TABLE IF EXISTS `jos_tool_version_hostreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_version_hostreq` (
  `tool_version_id` int(11) NOT NULL,
  `hostreq` varchar(255) NOT NULL,
  UNIQUE KEY `uidx_tool_version_id_hostreq` (`tool_version_id`,`hostreq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_version_hostreq`
--

LOCK TABLES `jos_tool_version_hostreq` WRITE;
/*!40000 ALTER TABLE `jos_tool_version_hostreq` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_version_hostreq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_version_middleware`
--

DROP TABLE IF EXISTS `jos_tool_version_middleware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_version_middleware` (
  `tool_version_id` int(11) NOT NULL,
  `middleware` varchar(255) NOT NULL,
  UNIQUE KEY `uidx_tool_version_id_middleware` (`tool_version_id`,`middleware`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_version_middleware`
--

LOCK TABLES `jos_tool_version_middleware` WRITE;
/*!40000 ALTER TABLE `jos_tool_version_middleware` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_version_middleware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_version_tracperm`
--

DROP TABLE IF EXISTS `jos_tool_version_tracperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_version_tracperm` (
  `tool_version_id` int(11) NOT NULL,
  `tracperm` varchar(64) NOT NULL,
  UNIQUE KEY `uidx_tool_version_id_tracperm` (`tool_version_id`,`tracperm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_version_tracperm`
--

LOCK TABLES `jos_tool_version_tracperm` WRITE;
/*!40000 ALTER TABLE `jos_tool_version_tracperm` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_version_tracperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_tool_version_zone`
--

DROP TABLE IF EXISTS `jos_tool_version_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_tool_version_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_version_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zoneid_toolversionid` (`zone_id`,`tool_version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_tool_version_zone`
--

LOCK TABLES `jos_tool_version_zone` WRITE;
/*!40000 ALTER TABLE `jos_tool_version_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_tool_version_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_trac_group_permission`
--

DROP TABLE IF EXISTS `jos_trac_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_trac_group_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `trac_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_group_id_action_trac_project_id` (`group_id`,`action`,`trac_project_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_trac_group_permission`
--

LOCK TABLES `jos_trac_group_permission` WRITE;
/*!40000 ALTER TABLE `jos_trac_group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_trac_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_trac_project`
--

DROP TABLE IF EXISTS `jos_trac_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_trac_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_trac_project`
--

LOCK TABLES `jos_trac_project` WRITE;
/*!40000 ALTER TABLE `jos_trac_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_trac_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_trac_projects`
--

DROP TABLE IF EXISTS `jos_trac_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_trac_projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_trac_projects`
--

LOCK TABLES `jos_trac_projects` WRITE;
/*!40000 ALTER TABLE `jos_trac_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_trac_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_trac_user_permission`
--

DROP TABLE IF EXISTS `jos_trac_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_trac_user_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `trac_project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_user_id_action_trac_project_id` (`user_id`,`action`,`trac_project_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_trac_user_permission`
--

LOCK TABLES `jos_trac_user_permission` WRITE;
/*!40000 ALTER TABLE `jos_trac_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_trac_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_update_categories`
--

DROP TABLE IF EXISTS `jos_update_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_update_categories`
--

LOCK TABLES `jos_update_categories` WRITE;
/*!40000 ALTER TABLE `jos_update_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_update_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_update_sites`
--

DROP TABLE IF EXISTS `jos_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_update_sites`
--

LOCK TABLES `jos_update_sites` WRITE;
/*!40000 ALTER TABLE `jos_update_sites` DISABLE KEYS */;
INSERT INTO `jos_update_sites` VALUES (1,'Joomla Core','collection','http://update.joomla.org/core/list.xml',1,0),(2,'Joomla Extension Directory','collection','http://update.joomla.org/jed/list.xml',1,0),(3,'Accredited Joomla! Translations','collection','http://update.joomla.org/language/translationlist.xml',1,0);
/*!40000 ALTER TABLE `jos_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_update_sites_extensions`
--

DROP TABLE IF EXISTS `jos_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_update_sites_extensions`
--

LOCK TABLES `jos_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `jos_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `jos_update_sites_extensions` VALUES (1,700),(2,700),(3,600);
/*!40000 ALTER TABLE `jos_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_updates`
--

DROP TABLE IF EXISTS `jos_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_updates`
--

LOCK TABLES `jos_updates` WRITE;
/*!40000 ALTER TABLE `jos_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_user_notes`
--

DROP TABLE IF EXISTS `jos_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_user_notes`
--

LOCK TABLES `jos_user_notes` WRITE;
/*!40000 ALTER TABLE `jos_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_user_profile_fields`
--

DROP TABLE IF EXISTS `jos_user_profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_user_profile_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `placeholder` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(10) NOT NULL DEFAULT '0',
  `option_other` tinyint(2) NOT NULL DEFAULT '0',
  `option_blank` tinyint(2) NOT NULL DEFAULT '0',
  `action_create` tinyint(2) NOT NULL DEFAULT '1',
  `action_update` tinyint(2) NOT NULL DEFAULT '1',
  `action_edit` tinyint(2) NOT NULL DEFAULT '1',
  `action_browse` tinyint(2) NOT NULL DEFAULT '0',
  `min` int(11) NOT NULL DEFAULT '0',
  `max` int(11) NOT NULL DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_user_profile_fields`
--

LOCK TABLES `jos_user_profile_fields` WRITE;
/*!40000 ALTER TABLE `jos_user_profile_fields` DISABLE KEYS */;
INSERT INTO `jos_user_profile_fields` VALUES (1,'select','organization','Organization',NULL,NULL,1,1,1,1,0,0,1,1,0,0,NULL),(2,'select','orgtype','Employment Status',NULL,NULL,2,5,0,1,0,0,1,0,0,0,NULL),(3,'country','countryresident','Residency',NULL,'Select your Country of Residency.',3,5,0,1,0,0,0,0,0,0,NULL),(4,'country','countryorigin','Citizenship',NULL,'Select your Country of Citizenship.',4,5,0,1,0,0,0,0,0,0,NULL),(5,'url','url','Website',NULL,NULL,5,1,0,0,0,0,1,0,0,0,NULL),(6,'text','phone','Telephone',NULL,NULL,6,5,0,0,0,0,1,0,0,0,NULL),(7,'orcid','orcid','ORCID',NULL,'Open Researcher and Contributor ID (ORCID) provides a persistent digital identifier that distinguishes you from every other researcher and supports automated linkages between you and your professional activities ensuring that your work is recognized.',7,1,0,0,0,0,0,0,0,0,NULL),(8,'radio','gender','Gender',NULL,NULL,8,5,0,0,0,0,0,0,0,0,NULL),(9,'checkboxes','race','Racial Background',NULL,NULL,9,5,0,0,0,0,0,0,0,0,NULL),(10,'checkboxes','disability','Disability',NULL,NULL,10,5,0,0,0,0,0,0,0,0,NULL),(11,'select','reason','Reason',NULL,NULL,11,5,0,1,0,0,1,0,0,0,NULL),(12,'tags','tags','Interests',NULL,NULL,12,1,0,0,0,0,1,0,0,0,NULL),(13,'address','address','Address',NULL,NULL,13,5,0,0,0,0,0,0,0,0,NULL),(14,'radio','hispanic','Hispanic Heritage',NULL,NULL,14,5,0,0,0,0,0,0,0,0,NULL),(15,'editor','bio','Biography',NULL,NULL,15,1,0,0,0,0,1,1,0,0,NULL);
/*!40000 ALTER TABLE `jos_user_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_user_profile_options`
--

DROP TABLE IF EXISTS `jos_user_profile_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_user_profile_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `checked` tinyint(2) NOT NULL DEFAULT '0',
  `dependents` tinytext,
  PRIMARY KEY (`id`),
  KEY `idx_field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_user_profile_options`
--

LOCK TABLES `jos_user_profile_options` WRITE;
/*!40000 ALTER TABLE `jos_user_profile_options` DISABLE KEYS */;
INSERT INTO `jos_user_profile_options` VALUES (1,8,'male','Male',1,0,NULL),(2,8,'female','Female',2,0,NULL),(3,8,'refused','Do not with to reveal',3,0,NULL),(4,9,'nativeamerican','American Indian or Alaska Native',1,0,NULL),(5,9,'asian','Asian',2,0,NULL),(6,9,'black','Black or African American',3,0,NULL),(7,9,'hawaiian','Native Hawaiian or Other Pacific Islander',4,0,NULL),(8,9,'white','White',5,0,NULL),(9,9,'refused','Do not wish to reveal',6,0,NULL),(10,14,'cuban','Cuban',1,0,NULL),(11,14,'mexican','Mexican American or Chicano',2,0,NULL),(12,14,'puertorican','Puerto Rican',3,0,NULL),(13,14,'no','No (not Hispanic or Latino)',4,0,NULL),(14,14,'refused','Do not wish to reveal',5,0,NULL),(15,10,'blind','Blind / Visually Impaired',1,0,NULL),(16,10,'deaf','Deaf / Hard of Hearing',2,0,NULL),(17,10,'physical','Physical / Orthopedic Disability',3,0,NULL),(18,10,'learning','Learning / Cognitive Disability',4,0,NULL),(19,10,'vocal','Vocal / Speech Disability',5,0,NULL),(20,10,'no','No (none)',6,0,NULL),(21,10,'refused','Do not wish to reveal',7,0,NULL),(22,2,'government','Government Agency',1,0,NULL),(23,2,'industry','Industry / Private Company',2,0,NULL),(24,2,'military','Military',3,0,NULL),(25,2,'nationallab','National Laboratory',4,0,NULL),(26,2,'universityfaculty','University / College Faculty',5,0,NULL),(27,2,'universitystaff','University / College Staff',6,0,NULL),(28,2,'universityundergraduate','University / College Undergraduate',7,0,NULL),(29,2,'precollegefacultystaff','K-12 (Pre-College) Faculty or Staff',8,0,NULL),(30,2,'precollegestudent','K-12 (Pre-College) Student',9,0,NULL),(31,2,'unemployed','Retired / Unemployed',10,0,NULL),(32,2,'universitygraduate','University / College Graduate Student',11,0,NULL),(33,11,'Required for class','Required for class',1,0,NULL),(34,11,'Developing a new course','Developing a new course',2,0,NULL),(35,11,'Using in an existing course','Using in an existing course',3,0,NULL),(36,11,'Using simulation tools for research','Using simulation tools for research',4,0,NULL),(37,11,'Using as background for my research','Using as background for my research',5,0,NULL),(38,11,'Learning about subject matter','Learning about subject matter',6,0,NULL),(39,11,'Keeping current in subject matter','Keeping current in subject matter',7,0,NULL);
/*!40000 ALTER TABLE `jos_user_profile_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_user_profiles`
--

DROP TABLE IF EXISTS `jos_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_user_profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_user_profiles`
--

LOCK TABLES `jos_user_profiles` WRITE;
/*!40000 ALTER TABLE `jos_user_profiles` DISABLE KEYS */;
INSERT INTO `jos_user_profiles` VALUES (1,1000,'address','{\"address1\":\"\",\"address2\":\"\",\"city\":\"\",\"postal\":\"\",\"region\":\"\",\"country\":\"\",\"latitude\":\"\",\"longitude\":\"\"}',1,5),(2,1003,'address','{\"address1\":\"\",\"address2\":\"\",\"city\":\"\",\"postal\":\"\",\"region\":\"\",\"country\":\"\",\"latitude\":\"\",\"longitude\":\"\"}',1,5),(3,1004,'address','{\"address1\":\"\",\"address2\":\"\",\"city\":\"\",\"postal\":\"\",\"region\":\"\",\"country\":\"\",\"latitude\":\"\",\"longitude\":\"\"}',1,5),(4,1005,'address','{\"address1\":\"\",\"address2\":\"\",\"city\":\"\",\"postal\":\"\",\"region\":\"\",\"country\":\"\",\"latitude\":\"\",\"longitude\":\"\"}',1,5);
/*!40000 ALTER TABLE `jos_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_user_reputation`
--

DROP TABLE IF EXISTS `jos_user_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_user_reputation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `spam_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_user_reputation`
--

LOCK TABLES `jos_user_reputation` WRITE;
/*!40000 ALTER TABLE `jos_user_reputation` DISABLE KEYS */;
INSERT INTO `jos_user_reputation` VALUES (1,NULL,0),(2,NULL,0),(3,NULL,0),(4,NULL,0),(5,NULL,0),(6,NULL,0);
/*!40000 ALTER TABLE `jos_user_reputation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_user_roles`
--

DROP TABLE IF EXISTS `jos_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_user_roles` (
  `user_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_role_user_id_group_id` (`role`,`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_user_roles`
--

LOCK TABLES `jos_user_roles` WRITE;
/*!40000 ALTER TABLE `jos_user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_user_usergroup_map`
--

DROP TABLE IF EXISTS `jos_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_user_usergroup_map`
--

LOCK TABLES `jos_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `jos_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `jos_user_usergroup_map` VALUES (1000,8),(1001,2),(1002,2),(1003,2),(1004,2),(1005,2);
/*!40000 ALTER TABLE `jos_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_usergroups`
--

DROP TABLE IF EXISTS `jos_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_usergroups`
--

LOCK TABLES `jos_usergroups` WRITE;
/*!40000 ALTER TABLE `jos_usergroups` DISABLE KEYS */;
INSERT INTO `jos_usergroups` VALUES (1,0,1,20,'Public'),(2,1,6,17,'Registered'),(3,2,7,14,'Author'),(4,3,8,11,'Editor'),(5,4,9,10,'Publisher'),(6,1,2,5,'Manager'),(7,6,3,4,'Administrator'),(8,1,18,19,'Super Users');
/*!40000 ALTER TABLE `jos_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users`
--

DROP TABLE IF EXISTS `jos_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `givenName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(127) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `approved` tinyint(4) NOT NULL DEFAULT '2',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `registerIP` varchar(40) NOT NULL DEFAULT '',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `access` int(10) NOT NULL DEFAULT '0',
  `usageAgreement` tinyint(2) NOT NULL DEFAULT '0',
  `homeDirectory` varchar(255) NOT NULL,
  `loginShell` varchar(255) NOT NULL,
  `ftpShell` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_username` (`username`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users`
--

LOCK TABLES `jos_users` WRITE;
/*!40000 ALTER TABLE `jos_users` DISABLE KEYS */;
INSERT INTO `jos_users` VALUES (1000,'CMS Manager','CMS','','Manager','admin','webmaster@example.com','{CRYPT}$6$tqLPZ7rY$JaNgLctVOeYsGclf0XXTDwjbGVnnCphnj0En4BHKGW5SV.fLPY6cGdUgO5jVZXUn82lm5TZPDr4N7OnePNeQk.','deprecated',0,2,0,'2015-09-13 14:36:26','','2017-06-29 02:21:15',1,'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"America\\/New_York\"}','0000-00-00 00:00:00',0,5,1,'/home/example/admin','/bin/bash','/usr/lib/sftp-server'),(1001,'Applications Manager','Applications','','Manager','apps','apps@example.com','{MD5}*','Registered',0,2,0,'2015-09-13 14:41:06','','0000-00-00 00:00:00',1,'','0000-00-00 00:00:00',0,5,1,'/home/example/apps','/bin/bash','/usr/lib/sftp-server'),(1002,'Repository Manager','Repository','','Manager','hubrepo','hubrepo@example.com','{MD5}jYgaTWrbkI8G/Dugb8NglA==','Registered',0,2,0,'2015-09-13 14:41:06','','0000-00-00 00:00:00',1,'','0000-00-00 00:00:00',0,5,1,'/home/example/hubrepo','/bin/bash','/usr/lib/sftp-server'),(1003,'James Tester','James','','Tester','jamest','jamest@example.com','{CRYPT}$6$S17zEicm$ho5OEyek5jZYMJi0DXWndMDc.2Dvv3M8KCEirCt023PGdTJteHYQ0oG6th4aP2X6UWOEN.DbHq/ZmYWEEw8S21','',0,1,0,'2017-06-29 02:12:24','192.168.33.1','0000-00-00 00:00:00',1,'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"America\\/New_York\"}','0000-00-00 00:00:00',0,1,1,'/home/example/jamest','/bin/bash','/usr/lib/sftp-server'),(1004,'Tiger Huang','Tiger','','Huang','tigerh','tiger@example.com','{CRYPT}$6$0cxhU9cu$.g5pdocVCkKUtTqcDWT3iNFRgA32X39Bhifokv29123e7POatAasLp3d.pUcHuyFdZPqwq1IlwAn.LvSpZtBO/','',0,1,0,'2017-06-29 02:13:59','192.168.33.1','0000-00-00 00:00:00',1,'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"America\\/New_York\"}','0000-00-00 00:00:00',0,1,1,'/home/example/tigerh','/bin/bash','/usr/lib/sftp-server'),(1005,'Jerry Huang','Jerry','','Huang','jerryh','jerry@example.com','{CRYPT}$6$MzLjds1T$0c/ORbhjHFtBOyW/1bvdENHFaGcigIR5sQWnVl9gZdEIncAsn3J/lyB/VX8ZliwLyhHFfZWEQ1fB1QL6MMcQQ0','',0,1,0,'2017-06-29 02:14:42','192.168.33.1','0000-00-00 00:00:00',1,'{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"America\\/New_York\"}','0000-00-00 00:00:00',0,1,1,'/home/example/jerryh','/bin/bash','/usr/lib/sftp-server');
/*!40000 ALTER TABLE `jos_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_log_auth`
--

DROP TABLE IF EXISTS `jos_users_log_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_log_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `status` enum('success','failure','blocked') DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `logged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_log_auth`
--

LOCK TABLES `jos_users_log_auth` WRITE;
/*!40000 ALTER TABLE `jos_users_log_auth` DISABLE KEYS */;
INSERT INTO `jos_users_log_auth` VALUES (1,0,'admin','failure','192.168.33.1','2016-04-09 20:07:31'),(2,0,'admin','failure','192.168.33.1','2016-04-09 20:07:36'),(3,1000,'admin','success','192.168.33.1','2016-04-09 20:09:01'),(4,1000,'admin','success','192.168.33.1','2016-04-09 20:11:00'),(5,1000,'admin','success','192.168.33.1','2017-06-29 02:07:44'),(6,1000,'admin','success','192.168.33.1','2017-06-29 02:21:15');
/*!40000 ALTER TABLE `jos_users_log_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_merge_log`
--

DROP TABLE IF EXISTS `jos_users_merge_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_merge_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(150) NOT NULL DEFAULT '',
  `destination` varchar(150) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `column` varchar(255) NOT NULL DEFAULT '',
  `table_pk` varchar(255) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `logged` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_merge_log`
--

LOCK TABLES `jos_users_merge_log` WRITE;
/*!40000 ALTER TABLE `jos_users_merge_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_merge_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_password`
--

DROP TABLE IF EXISTS `jos_users_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_password` (
  `user_id` int(11) NOT NULL,
  `passhash` char(127) NOT NULL,
  `shadowExpire` int(11) DEFAULT NULL,
  `shadowFlag` int(11) DEFAULT NULL,
  `shadowInactive` int(11) DEFAULT NULL,
  `shadowLastChange` int(11) DEFAULT NULL,
  `shadowMax` int(11) DEFAULT NULL,
  `shadowMin` int(11) DEFAULT NULL,
  `shadowWarning` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_password`
--

LOCK TABLES `jos_users_password` WRITE;
/*!40000 ALTER TABLE `jos_users_password` DISABLE KEYS */;
INSERT INTO `jos_users_password` VALUES (1000,'{CRYPT}$6$tqLPZ7rY$JaNgLctVOeYsGclf0XXTDwjbGVnnCphnj0En4BHKGW5SV.fLPY6cGdUgO5jVZXUn82lm5TZPDr4N7OnePNeQk.',NULL,NULL,0,17346,3650,0,7),(1001,'{MD5}*',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1002,'{MD5}jYgaTWrbkI8G/Dugb8NglA==',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1003,'{CRYPT}$6$S17zEicm$ho5OEyek5jZYMJi0DXWndMDc.2Dvv3M8KCEirCt023PGdTJteHYQ0oG6th4aP2X6UWOEN.DbHq/ZmYWEEw8S21',NULL,NULL,0,17346,3650,0,7),(1004,'{CRYPT}$6$0cxhU9cu$.g5pdocVCkKUtTqcDWT3iNFRgA32X39Bhifokv29123e7POatAasLp3d.pUcHuyFdZPqwq1IlwAn.LvSpZtBO/',NULL,NULL,0,17346,3650,0,7),(1005,'{CRYPT}$6$MzLjds1T$0c/ORbhjHFtBOyW/1bvdENHFaGcigIR5sQWnVl9gZdEIncAsn3J/lyB/VX8ZliwLyhHFfZWEQ1fB1QL6MMcQQ0',NULL,NULL,0,17346,3650,0,7);
/*!40000 ALTER TABLE `jos_users_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_password_history`
--

DROP TABLE IF EXISTS `jos_users_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_password_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `passhash` char(127) NOT NULL DEFAULT '',
  `action` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `invalidated` datetime DEFAULT NULL,
  `invalidated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_password_history`
--

LOCK TABLES `jos_users_password_history` WRITE;
/*!40000 ALTER TABLE `jos_users_password_history` DISABLE KEYS */;
INSERT INTO `jos_users_password_history` VALUES (1,1000,'{MD5}OgxHwdU4yU1QH5BWVTbbwQ==',NULL,NULL,NULL,'2016-04-09 20:10:51',NULL),(2,1000,'{CRYPT}$6$fW0UrFPK$jg68R6xtLfWNvGJUi82ErwJVsXUMK1FIPh9bD4KO8wYV9KxTZPtBq3boLORjRoY1dq7rF3GQ8tfIFHv2II8C9.',NULL,NULL,NULL,'2017-06-29 02:10:43',NULL),(3,1005,'{CRYPT}$6$WOtc7UMB$Mh0chKjidIGLdWJlJtv5vZ0DHTMshm4vDMQXh3HV1Qa375Z4AWIDdWsHkUAa84Quy8pRIeRvnBhBv/g9bskwp1',NULL,NULL,NULL,'2017-06-29 02:21:55',NULL),(4,1004,'{CRYPT}$6$95OHsLeN$9/zB2Wj6yrYgXZ17TQqPg1kDFL7deqk2OJkar94ZBhIlh1v1N/BOWjG6Btu0WtNSOFwfIQ9EmhKnERuySuJPi/',NULL,NULL,NULL,'2017-06-29 02:22:18',NULL),(5,1003,'{CRYPT}$6$gKMm6vxR$tZ5JpMf3.2b3H1fCCd.dPhHORbygWzOeECi76JxRQgswHIfZnXCuhuAJ6lFTtSOHA5x0k2EJijBjzdqyoDxBj.',NULL,NULL,NULL,'2017-06-29 02:22:43',NULL);
/*!40000 ALTER TABLE `jos_users_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_points`
--

DROP TABLE IF EXISTS `jos_users_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `balance` int(11) NOT NULL DEFAULT '0',
  `earnings` int(11) NOT NULL DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_points`
--

LOCK TABLES `jos_users_points` WRITE;
/*!40000 ALTER TABLE `jos_users_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_points_config`
--

DROP TABLE IF EXISTS `jos_users_points_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_points_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_points_config`
--

LOCK TABLES `jos_users_points_config` WRITE;
/*!40000 ALTER TABLE `jos_users_points_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_points_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_points_services`
--

DROP TABLE IF EXISTS `jos_users_points_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_points_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `category` varchar(50) NOT NULL DEFAULT '',
  `alias` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `unitprice` float(6,2) DEFAULT '0.00',
  `pointsprice` int(11) DEFAULT '0',
  `currency` varchar(50) DEFAULT 'points',
  `maxunits` int(11) DEFAULT '0',
  `minunits` int(11) DEFAULT '0',
  `unitsize` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `restricted` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `params` text,
  `unitmeasure` varchar(200) NOT NULL DEFAULT '',
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_points_services`
--

LOCK TABLES `jos_users_points_services` WRITE;
/*!40000 ALTER TABLE `jos_users_points_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_points_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_points_subscriptions`
--

DROP TABLE IF EXISTS `jos_users_points_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_points_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `serviceid` int(11) NOT NULL DEFAULT '0',
  `units` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `pendingunits` int(11) DEFAULT '0',
  `pendingpayment` float(6,2) DEFAULT '0.00',
  `totalpaid` float(6,2) DEFAULT '0.00',
  `installment` int(11) DEFAULT '0',
  `contact` varchar(20) DEFAULT '',
  `code` varchar(10) DEFAULT '',
  `usepoints` tinyint(2) DEFAULT '0',
  `notes` text,
  `added` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_points_subscriptions`
--

LOCK TABLES `jos_users_points_subscriptions` WRITE;
/*!40000 ALTER TABLE `jos_users_points_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_points_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_quotas`
--

DROP TABLE IF EXISTS `jos_users_quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_quotas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `hard_files` int(11) NOT NULL,
  `soft_files` int(11) NOT NULL,
  `hard_blocks` int(11) NOT NULL,
  `soft_blocks` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_quotas`
--

LOCK TABLES `jos_users_quotas` WRITE;
/*!40000 ALTER TABLE `jos_users_quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_quotas_classes`
--

DROP TABLE IF EXISTS `jos_users_quotas_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_quotas_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `hard_files` int(11) NOT NULL,
  `soft_files` int(11) NOT NULL,
  `hard_blocks` int(11) NOT NULL,
  `soft_blocks` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_quotas_classes`
--

LOCK TABLES `jos_users_quotas_classes` WRITE;
/*!40000 ALTER TABLE `jos_users_quotas_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_quotas_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_quotas_classes_groups`
--

DROP TABLE IF EXISTS `jos_users_quotas_classes_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_quotas_classes_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_class_id` (`class_id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_quotas_classes_groups`
--

LOCK TABLES `jos_users_quotas_classes_groups` WRITE;
/*!40000 ALTER TABLE `jos_users_quotas_classes_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_quotas_classes_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_quotas_log`
--

DROP TABLE IF EXISTS `jos_users_quotas_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_quotas_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_type` varchar(255) NOT NULL DEFAULT '',
  `object_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `actor_id` int(11) NOT NULL,
  `soft_blocks` int(11) NOT NULL,
  `hard_blocks` int(11) NOT NULL,
  `soft_files` int(11) NOT NULL,
  `hard_files` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_quotas_log`
--

LOCK TABLES `jos_users_quotas_log` WRITE;
/*!40000 ALTER TABLE `jos_users_quotas_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_quotas_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_tool_preferences`
--

DROP TABLE IF EXISTS `jos_users_tool_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_tool_preferences` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `params` text,
  `class_id` int(11) NOT NULL DEFAULT '0',
  `jobs` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`),
  KEY `idx_class_id` (`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_tool_preferences`
--

LOCK TABLES `jos_users_tool_preferences` WRITE;
/*!40000 ALTER TABLE `jos_users_tool_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_tool_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_tracperms`
--

DROP TABLE IF EXISTS `jos_users_tracperms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_tracperms` (
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_tracperms`
--

LOCK TABLES `jos_users_tracperms` WRITE;
/*!40000 ALTER TABLE `jos_users_tracperms` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_tracperms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users_transactions`
--

DROP TABLE IF EXISTS `jos_users_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category` varchar(50) DEFAULT NULL,
  `referenceid` int(11) DEFAULT '0',
  `amount` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_referenceid_category_type` (`referenceid`,`category`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users_transactions`
--

LOCK TABLES `jos_users_transactions` WRITE;
/*!40000 ALTER TABLE `jos_users_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_users_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_viewlevels`
--

DROP TABLE IF EXISTS `jos_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_viewlevels`
--

LOCK TABLES `jos_viewlevels` WRITE;
/*!40000 ALTER TABLE `jos_viewlevels` DISABLE KEYS */;
INSERT INTO `jos_viewlevels` VALUES (1,'Public',0,'[1]'),(2,'Registered',1,'[6,2,8]'),(3,'Special',2,'[6,3,8]'),(4,'Protected',3,'[1]'),(5,'Private',4,'[8]');
/*!40000 ALTER TABLE `jos_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_vote_log`
--

DROP TABLE IF EXISTS `jos_vote_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_vote_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referenceid` int(11) NOT NULL DEFAULT '0',
  `voted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voter` int(11) DEFAULT NULL,
  `helpful` varchar(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_referenceid` (`referenceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_vote_log`
--

LOCK TABLES `jos_vote_log` WRITE;
/*!40000 ALTER TABLE `jos_vote_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_vote_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_attachments`
--

DROP TABLE IF EXISTS `jos_wiki_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT '0',
  `filename` varchar(255) DEFAULT NULL,
  `description` tinytext,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pageid` (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_attachments`
--

LOCK TABLES `jos_wiki_attachments` WRITE;
/*!40000 ALTER TABLE `jos_wiki_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_authors`
--

DROP TABLE IF EXISTS `jos_wiki_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `page_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_authors`
--

LOCK TABLES `jos_wiki_authors` WRITE;
/*!40000 ALTER TABLE `jos_wiki_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_comments`
--

DROP TABLE IF EXISTS `jos_wiki_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `ctext` text,
  `chtml` text,
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pageid` (`page_id`),
  KEY `idx_version` (`version`),
  KEY `idx_status` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_comments`
--

LOCK TABLES `jos_wiki_comments` WRITE;
/*!40000 ALTER TABLE `jos_wiki_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `jos_wiki_contributors_view`
--

DROP TABLE IF EXISTS `jos_wiki_contributors_view`;
/*!50001 DROP VIEW IF EXISTS `jos_wiki_contributors_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jos_wiki_contributors_view` (
  `uidNumber` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jos_wiki_formulas`
--

DROP TABLE IF EXISTS `jos_wiki_formulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_formulas` (
  `inputhash` varchar(32) NOT NULL DEFAULT '',
  `outputhash` varchar(32) NOT NULL DEFAULT '',
  `conservativeness` tinyint(4) NOT NULL,
  `html` text,
  `mathml` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_inputhash` (`inputhash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_formulas`
--

LOCK TABLES `jos_wiki_formulas` WRITE;
/*!40000 ALTER TABLE `jos_wiki_formulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_formulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_links`
--

DROP TABLE IF EXISTS `jos_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scope` varchar(50) NOT NULL DEFAULT '',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_scope_scope_id` (`scope`,`scope_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_links`
--

LOCK TABLES `jos_wiki_links` WRITE;
/*!40000 ALTER TABLE `jos_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_logs`
--

DROP TABLE IF EXISTS `jos_wiki_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) DEFAULT '0',
  `action` varchar(50) DEFAULT NULL,
  `comments` text,
  `actorid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_logs`
--

LOCK TABLES `jos_wiki_logs` WRITE;
/*!40000 ALTER TABLE `jos_wiki_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_metrics`
--

DROP TABLE IF EXISTS `jos_wiki_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_metrics` (
  `page_id` int(11) NOT NULL DEFAULT '0',
  `pagename` varchar(100) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `visitors` int(11) NOT NULL DEFAULT '0',
  `visits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_metrics`
--

LOCK TABLES `jos_wiki_metrics` WRITE;
/*!40000 ALTER TABLE `jos_wiki_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_pages`
--

DROP TABLE IF EXISTS `jos_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) NOT NULL,
  `pagename` varchar(100) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` decimal(2,1) NOT NULL DEFAULT '0.0',
  `times_rated` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `scope` varchar(255) NOT NULL,
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `params` tinytext,
  `ranking` float DEFAULT '0',
  `access` tinyint(2) DEFAULT '0',
  `state` tinyint(2) DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version_id` int(11) NOT NULL DEFAULT '0',
  `protected` tinyint(2) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  FULLTEXT KEY `ftidx_title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_pages`
--

LOCK TABLES `jos_wiki_pages` WRITE;
/*!40000 ALTER TABLE `jos_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wiki_versions`
--

DROP TABLE IF EXISTS `jos_wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wiki_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `minor_edit` int(1) NOT NULL DEFAULT '0',
  `pagetext` text,
  `pagehtml` text,
  `approved` int(1) NOT NULL DEFAULT '0',
  `summary` varchar(255) DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pageid` (`page_id`),
  KEY `idx_approved` (`approved`),
  FULLTEXT KEY `ftidx_pagetext` (`pagetext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wiki_versions`
--

LOCK TABLES `jos_wiki_versions` WRITE;
/*!40000 ALTER TABLE `jos_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wish_attachments`
--

DROP TABLE IF EXISTS `jos_wish_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wish_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wish` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wish` (`wish`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wish_attachments`
--

LOCK TABLES `jos_wish_attachments` WRITE;
/*!40000 ALTER TABLE `jos_wish_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wish_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wishlist`
--

DROP TABLE IF EXISTS `jos_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `referenceid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(3) NOT NULL DEFAULT '0',
  `public` int(3) NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_referenceid` (`category`,`referenceid`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wishlist`
--

LOCK TABLES `jos_wishlist` WRITE;
/*!40000 ALTER TABLE `jos_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wishlist_implementation`
--

DROP TABLE IF EXISTS `jos_wishlist_implementation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wishlist_implementation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wishid` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `minor_edit` int(1) NOT NULL DEFAULT '0',
  `pagetext` text,
  `pagehtml` text,
  `approved` int(1) NOT NULL DEFAULT '0',
  `summary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wishid` (`wishid`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_approved` (`approved`),
  FULLTEXT KEY `ftidx_pagetext` (`pagetext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wishlist_implementation`
--

LOCK TABLES `jos_wishlist_implementation` WRITE;
/*!40000 ALTER TABLE `jos_wishlist_implementation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wishlist_implementation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wishlist_item`
--

DROP TABLE IF EXISTS `jos_wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wishlist_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wishlist` int(11) DEFAULT '0',
  `subject` varchar(200) NOT NULL,
  `about` text,
  `proposed_by` int(11) DEFAULT '0',
  `granted_by` int(11) DEFAULT '0',
  `assigned` int(11) DEFAULT '0',
  `granted_vid` int(11) DEFAULT '0',
  `proposed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `granted` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(3) NOT NULL DEFAULT '0',
  `due` datetime DEFAULT '0000-00-00 00:00:00',
  `anonymous` int(3) DEFAULT '0',
  `ranking` int(11) DEFAULT '0',
  `points` int(11) DEFAULT '0',
  `private` int(3) DEFAULT '0',
  `accepted` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wishlist` (`wishlist`),
  FULLTEXT KEY `ftidx_subject_about` (`subject`,`about`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wishlist_item`
--

LOCK TABLES `jos_wishlist_item` WRITE;
/*!40000 ALTER TABLE `jos_wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wishlist_ownergroups`
--

DROP TABLE IF EXISTS `jos_wishlist_ownergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wishlist_ownergroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wishlist` int(11) unsigned NOT NULL DEFAULT '0',
  `groupid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wishlist` (`wishlist`),
  KEY `idx_groupid` (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wishlist_ownergroups`
--

LOCK TABLES `jos_wishlist_ownergroups` WRITE;
/*!40000 ALTER TABLE `jos_wishlist_ownergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wishlist_ownergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wishlist_owners`
--

DROP TABLE IF EXISTS `jos_wishlist_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wishlist_owners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wishlist` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wishlist` (`wishlist`),
  KEY `idx_userid` (`userid`),
  KEY `idx_type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wishlist_owners`
--

LOCK TABLES `jos_wishlist_owners` WRITE;
/*!40000 ALTER TABLE `jos_wishlist_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wishlist_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_wishlist_vote`
--

DROP TABLE IF EXISTS `jos_wishlist_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_wishlist_vote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wishid` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `voted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `importance` int(3) unsigned NOT NULL DEFAULT '0',
  `effort` int(3) NOT NULL DEFAULT '0',
  `due` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_wishid` (`wishid`),
  KEY `idx_userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_wishlist_vote`
--

LOCK TABLES `jos_wishlist_vote` WRITE;
/*!40000 ALTER TABLE `jos_wishlist_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_wishlist_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xdomain_users`
--

DROP TABLE IF EXISTS `jos_xdomain_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xdomain_users` (
  `domain_id` int(11) NOT NULL,
  `domain_username` varchar(150) NOT NULL DEFAULT '',
  `uidNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`domain_id`,`domain_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xdomain_users`
--

LOCK TABLES `jos_xdomain_users` WRITE;
/*!40000 ALTER TABLE `jos_xdomain_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xdomain_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xdomains`
--

DROP TABLE IF EXISTS `jos_xdomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xdomains` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`domain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xdomains`
--

LOCK TABLES `jos_xdomains` WRITE;
/*!40000 ALTER TABLE `jos_xdomains` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xdomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups`
--

DROP TABLE IF EXISTS `jos_xgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups` (
  `gidNumber` int(11) NOT NULL AUTO_INCREMENT,
  `cn` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `published` tinyint(3) DEFAULT '0',
  `approved` tinyint(3) DEFAULT '1',
  `type` tinyint(3) DEFAULT '0',
  `public_desc` text,
  `private_desc` text,
  `restrict_msg` text,
  `join_policy` tinyint(3) DEFAULT '0',
  `discoverability` tinyint(3) DEFAULT NULL,
  `discussion_email_autosubscribe` tinyint(3) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `plugins` text,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`gidNumber`),
  UNIQUE KEY `idx_cn` (`cn`),
  FULLTEXT KEY `ftidx_cn_description_public_desc` (`cn`,`description`,`public_desc`)
) ENGINE=MyISAM AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups`
--

LOCK TABLES `jos_xgroups` WRITE;
/*!40000 ALTER TABLE `jos_xgroups` DISABLE KEYS */;
INSERT INTO `jos_xgroups` VALUES (1000,'apps','apps',0,1,0,'','','',1,NULL,0,'',NULL,'2015-09-13 14:41:06',NULL,NULL),(1001,'network','network',0,1,0,'','','',1,NULL,0,'',NULL,'2015-09-13 14:47:38',NULL,NULL),(1002,'submit','submit',0,1,0,'','','',1,NULL,0,'',NULL,'2015-09-13 14:55:59',NULL,NULL);
/*!40000 ALTER TABLE `jos_xgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_applicants`
--

DROP TABLE IF EXISTS `jos_xgroups_applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_applicants` (
  `gidNumber` int(11) NOT NULL,
  `uidNumber` int(11) NOT NULL,
  PRIMARY KEY (`gidNumber`,`uidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_applicants`
--

LOCK TABLES `jos_xgroups_applicants` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_applicants` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_inviteemails`
--

DROP TABLE IF EXISTS `jos_xgroups_inviteemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_inviteemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `gidNumber` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_inviteemails`
--

LOCK TABLES `jos_xgroups_inviteemails` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_inviteemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_inviteemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_invitees`
--

DROP TABLE IF EXISTS `jos_xgroups_invitees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_invitees` (
  `gidNumber` int(11) NOT NULL,
  `uidNumber` int(11) NOT NULL,
  PRIMARY KEY (`gidNumber`,`uidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_invitees`
--

LOCK TABLES `jos_xgroups_invitees` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_invitees` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_invitees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_log`
--

DROP TABLE IF EXISTS `jos_xgroups_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userid` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `comments` text,
  `actorid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`),
  KEY `idx_userid` (`userid`),
  KEY `idx_actorid` (`actorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_log`
--

LOCK TABLES `jos_xgroups_log` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_managers`
--

DROP TABLE IF EXISTS `jos_xgroups_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_managers` (
  `gidNumber` int(11) NOT NULL,
  `uidNumber` int(11) NOT NULL,
  PRIMARY KEY (`gidNumber`,`uidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_managers`
--

LOCK TABLES `jos_xgroups_managers` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_member_roles`
--

DROP TABLE IF EXISTS `jos_xgroups_member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_member_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `uidNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_member_roles`
--

LOCK TABLES `jos_xgroups_member_roles` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_member_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_memberoption`
--

DROP TABLE IF EXISTS `jos_xgroups_memberoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_memberoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `optionname` varchar(100) DEFAULT NULL,
  `optionvalue` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`),
  KEY `idx_userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_memberoption`
--

LOCK TABLES `jos_xgroups_memberoption` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_memberoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_memberoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_members`
--

DROP TABLE IF EXISTS `jos_xgroups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) NOT NULL,
  `uidNumber` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `idx_gidNumber_uidNumber` (`gidNumber`,`uidNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_members`
--

LOCK TABLES `jos_xgroups_members` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_members` DISABLE KEYS */;
INSERT INTO `jos_xgroups_members` VALUES (1,1000,1001),(2,1000,1000),(3,1000,1002);
/*!40000 ALTER TABLE `jos_xgroups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_modules`
--

DROP TABLE IF EXISTS `jos_xgroups_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `content` text,
  `position` varchar(50) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `approved` int(11) DEFAULT '1',
  `approved_on` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `checked_errors` int(11) DEFAULT '0',
  `scanned` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_modules`
--

LOCK TABLES `jos_xgroups_modules` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_modules_menu`
--

DROP TABLE IF EXISTS `jos_xgroups_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_modules_menu` (
  `moduleid` int(11) DEFAULT NULL,
  `pageid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_modules_menu`
--

LOCK TABLES `jos_xgroups_modules_menu` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_modules_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_pages`
--

DROP TABLE IF EXISTS `jos_xgroups_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT '1',
  `category` int(11) DEFAULT NULL,
  `template` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `privacy` varchar(10) DEFAULT NULL,
  `home` int(11) DEFAULT '0',
  `comments` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_pages`
--

LOCK TABLES `jos_xgroups_pages` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_pages_categories`
--

DROP TABLE IF EXISTS `jos_xgroups_pages_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_pages_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_pages_categories`
--

LOCK TABLES `jos_xgroups_pages_categories` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_pages_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_pages_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_pages_checkout`
--

DROP TABLE IF EXISTS `jos_xgroups_pages_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_pages_checkout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `when` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_pages_checkout`
--

LOCK TABLES `jos_xgroups_pages_checkout` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_pages_checkout` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_pages_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_pages_hits`
--

DROP TABLE IF EXISTS `jos_xgroups_pages_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_pages_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) DEFAULT NULL,
  `pageid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_pages_hits`
--

LOCK TABLES `jos_xgroups_pages_hits` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_pages_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_pages_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_pages_versions`
--

DROP TABLE IF EXISTS `jos_xgroups_pages_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_pages_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `content` longtext,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `approved` int(11) DEFAULT '1',
  `approved_on` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `checked_errors` int(11) DEFAULT '0',
  `scanned` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pageid` (`pageid`),
  KEY `idx_approved` (`approved`),
  KEY `idx_scanned` (`scanned`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_pages_versions`
--

LOCK TABLES `jos_xgroups_pages_versions` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_pages_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_pages_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_reasons`
--

DROP TABLE IF EXISTS `jos_xgroups_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidNumber` int(11) NOT NULL,
  `gidNumber` int(11) NOT NULL,
  `reason` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`),
  KEY `idx_uidNumber` (`uidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_reasons`
--

LOCK TABLES `jos_xgroups_reasons` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_recents`
--

DROP TABLE IF EXISTS `jos_xgroups_recents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_recents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_recents`
--

LOCK TABLES `jos_xgroups_recents` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_recents` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_recents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_roles`
--

DROP TABLE IF EXISTS `jos_xgroups_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gidNumber` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `permissions` text,
  PRIMARY KEY (`id`),
  KEY `idx_gidNumber` (`gidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_roles`
--

LOCK TABLES `jos_xgroups_roles` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xgroups_tracperm`
--

DROP TABLE IF EXISTS `jos_xgroups_tracperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xgroups_tracperm` (
  `group_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  UNIQUE KEY `id` (`group_id`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xgroups_tracperm`
--

LOCK TABLES `jos_xgroups_tracperm` WRITE;
/*!40000 ALTER TABLE `jos_xgroups_tracperm` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xgroups_tracperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xmessage`
--

DROP TABLE IF EXISTS `jos_xmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xmessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `message` mediumtext,
  `subject` varchar(250) DEFAULT NULL,
  `component` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_component` (`component`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xmessage`
--

LOCK TABLES `jos_xmessage` WRITE;
/*!40000 ALTER TABLE `jos_xmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xmessage_action`
--

DROP TABLE IF EXISTS `jos_xmessage_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xmessage_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(20) NOT NULL DEFAULT '',
  `element` int(11) unsigned NOT NULL DEFAULT '0',
  `description` mediumtext,
  PRIMARY KEY (`id`),
  KEY `idx_class` (`class`),
  KEY `idx_element` (`element`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xmessage_action`
--

LOCK TABLES `jos_xmessage_action` WRITE;
/*!40000 ALTER TABLE `jos_xmessage_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xmessage_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xmessage_component`
--

DROP TABLE IF EXISTS `jos_xmessage_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xmessage_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_component` (`component`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xmessage_component`
--

LOCK TABLES `jos_xmessage_component` WRITE;
/*!40000 ALTER TABLE `jos_xmessage_component` DISABLE KEYS */;
INSERT INTO `jos_xmessage_component` VALUES (1,'com_support','support_reply_submitted','Someone replies to a support ticket I submitted.'),(2,'com_support','support_reply_assigned','Someone replies to a support ticket I am assigned to.'),(3,'com_support','support_close_submitted','Someone closes a support ticket I submitted.'),(4,'com_answers','answers_reply_submitted','Someone answers a question I submitted.'),(5,'com_answers','answers_reply_comment','Someone replies to a comment I posted.'),(6,'com_answers','answers_question_deleted','Someone deletes a question I replied to.'),(7,'com_groups','groups_requests_membership','Someone requests membership to a group I manage.'),(8,'com_groups','groups_requests_status','Someone is approved/denied membership to a group I manage.'),(9,'com_groups','groups_cancels_membership','Someone cancels membership to a group I manage.'),(10,'com_groups','groups_promoted_demoted','Someone promotes/demotes a member of a group I manage.'),(11,'com_groups','groups_approved_denied','My membership request to a group is approved or denied.'),(12,'com_groups','groups_status_changed','My membership status changes'),(13,'com_groups','groups_cancelled_me','My membership to a group is cancelled.'),(14,'com_groups','groups_changed','Someone changes the settings of a group I am a member of.'),(15,'com_groups','groups_deleted','Someone deletes a group I am a member of.'),(16,'com_resources','resources_submission_approved','A contribution I submitted is approved.'),(17,'com_resources','resources_new_comment','Someone adds a review/comment to one of my contributions.'),(18,'com_store','store_notifications','Shipping and other notifications about my purchases.'),(19,'com_wishlist','wishlist_new_wish','Someone posted a wish on the Wish List I control.'),(20,'com_wishlist','wishlist_status_changed','A wish I submitted got accepted/rejected/granted.'),(21,'com_support','support_item_transferred','A support ticket/wish/question I submitted got transferred.'),(22,'com_wishlist','wishlist_comment_posted','Someone commented on a wish I posted or am assigned to'),(23,'com_groups','groups_invite','When you are invited to join a group.'),(24,'com_tools','contribtool_status_changed','Tool development status has changed'),(25,'com_tools','contribtool_new_message','New contribtool message is received'),(26,'com_tools','contribtool_info_changed','Information about a tool I develop has changed'),(27,'com_wishlist','wishlist_comment_thread','Someone replied to my comment or followed me in a discussion'),(28,'com_wishlist','wishlist_new_owner','You were added as an administrator of a Wish List'),(29,'com_wishlist','wishlist_wish_assigned','A wish has been assigned to me'),(30,'com_groups','group_message','Messages from fellow group members'),(31,'com_members','member_message','Messages from fellow site members'),(32,'com_projects','projects_member_added','You were added or invited to a project'),(33,'com_projects','projects_new_project_admin','Receive notifications about project(s) you monitor as an admin or reviewer'),(34,'com_projects','projects_admin_message','Receive administrative messages about your project(s)');
/*!40000 ALTER TABLE `jos_xmessage_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xmessage_notify`
--

DROP TABLE IF EXISTS `jos_xmessage_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xmessage_notify` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `method` varchar(250) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `priority` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_method` (`method`),
  KEY `idx_type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xmessage_notify`
--

LOCK TABLES `jos_xmessage_notify` WRITE;
/*!40000 ALTER TABLE `jos_xmessage_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xmessage_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xmessage_recipient`
--

DROP TABLE IF EXISTS `jos_xmessage_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xmessage_recipient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `expires` datetime DEFAULT '0000-00-00 00:00:00',
  `actionid` int(11) DEFAULT '0',
  `state` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`mid`),
  KEY `idx_uid` (`uid`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xmessage_recipient`
--

LOCK TABLES `jos_xmessage_recipient` WRITE;
/*!40000 ALTER TABLE `jos_xmessage_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xmessage_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xmessage_seen`
--

DROP TABLE IF EXISTS `jos_xmessage_seen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xmessage_seen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `whenseen` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`mid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xmessage_seen`
--

LOCK TABLES `jos_xmessage_seen` WRITE;
/*!40000 ALTER TABLE `jos_xmessage_seen` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xmessage_seen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles`
--

DROP TABLE IF EXISTS `jos_xprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles` (
  `uidNumber` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gidNumber` varchar(11) NOT NULL DEFAULT '',
  `homeDirectory` varchar(255) NOT NULL DEFAULT '',
  `loginShell` varchar(255) NOT NULL DEFAULT '',
  `ftpShell` varchar(255) NOT NULL DEFAULT '',
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `gid` varchar(255) NOT NULL DEFAULT '',
  `orgtype` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `countryresident` char(2) NOT NULL DEFAULT '',
  `countryorigin` char(2) NOT NULL DEFAULT '',
  `gender` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `reason` text NOT NULL,
  `mailPreferenceOption` int(11) NOT NULL DEFAULT '-1',
  `usageAgreement` int(11) NOT NULL DEFAULT '0',
  `modifiedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `emailConfirmed` int(11) NOT NULL DEFAULT '0',
  `regIP` varchar(255) NOT NULL DEFAULT '',
  `regHost` varchar(255) NOT NULL DEFAULT '',
  `nativeTribe` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `proxyPassword` varchar(255) NOT NULL DEFAULT '',
  `proxyUidNumber` varchar(255) NOT NULL DEFAULT '',
  `givenName` varchar(255) NOT NULL DEFAULT '',
  `middleName` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `vip` int(11) NOT NULL DEFAULT '0',
  `public` tinyint(2) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `note` text NOT NULL,
  `shadowExpire` int(11) DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orcid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uidNumber`),
  KEY `idx_username` (`username`),
  FULLTEXT KEY `ftidx_givenName_surname` (`givenName`,`surname`),
  FULLTEXT KEY `ftidx_name` (`name`),
  FULLTEXT KEY `ftidx_fullname` (`givenName`,`middleName`,`surname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles`
--

LOCK TABLES `jos_xprofiles` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles` DISABLE KEYS */;
INSERT INTO `jos_xprofiles` VALUES (1000,'CMS Manager','admin','webmaster@example.com','2015-09-13 14:36:26','100','/home/example/admin','/bin/bash','/usr/lib/sftp-server','{CRYPT}$6$tqLPZ7rY$JaNgLctVOeYsGclf0XXTDwjbGVnnCphnj0En4BHKGW5SV.fLPY6cGdUgO5jVZXUn82lm5TZPDr4N7OnePNeQk.','users','','','','','','','',0,1,'2016-04-09 20:10:51',1,'','','','','','','CMS','','Manager','',0,0,'{}','',0,0,''),(1001,'Applications Manager','apps','apps@example.com','2015-09-13 14:41:06','100','/home/example/apps','/bin/bash','/usr/lib/sftp-server','{MD5}*','users','','','','','','','',0,1,'0000-00-00 00:00:00',1,'','','','','','','Applications','','Manager','',0,0,'','',NULL,0,''),(1002,'Repository Manager','hubrepo','hubrepo@example.com','2015-09-13 14:41:06','100','/home/example/hubrepo','/bin/bash','/usr/lib/sftp-server','{MD5}jYgaTWrbkI8G/Dugb8NglA==','users','','','','','','','',0,1,'0000-00-00 00:00:00',1,'','','','','','','Repository','','Manager','',0,0,'','',NULL,0,''),(1003,'James Tester','jamest','jamest@example.com','2017-06-29 02:12:25','3000','/home/example/jamest','/bin/bash','/usr/lib/sftp-server','{CRYPT}$6$S17zEicm$ho5OEyek5jZYMJi0DXWndMDc.2Dvv3M8KCEirCt023PGdTJteHYQ0oG6th4aP2X6UWOEN.DbHq/ZmYWEEw8S21','public','','','','','','','',-1,0,'2017-06-29 02:13:11',1,'192.168.33.1','','','','','','James','','Tester','',0,1,'{}','',0,0,''),(1004,'Tiger Huang','tigerh','tiger@example.com','2017-06-29 02:13:59','3000','/home/example/tigerh','/bin/bash','/usr/lib/sftp-server','{CRYPT}$6$0cxhU9cu$.g5pdocVCkKUtTqcDWT3iNFRgA32X39Bhifokv29123e7POatAasLp3d.pUcHuyFdZPqwq1IlwAn.LvSpZtBO/','public','','','','','','','',-1,0,'2017-06-29 02:22:17',1,'192.168.33.1','','','','','','Tiger','','Huang','',0,1,'{}','',0,0,''),(1005,'Jerry Huang','jerryh','jerry@example.com','2017-06-29 02:14:43','3000','/home/example/jerryh','/bin/bash','/usr/lib/sftp-server','{CRYPT}$6$MzLjds1T$0c/ORbhjHFtBOyW/1bvdENHFaGcigIR5sQWnVl9gZdEIncAsn3J/lyB/VX8ZliwLyhHFfZWEQ1fB1QL6MMcQQ0','public','','','','','','','',-1,0,'2017-06-29 02:21:54',1,'192.168.33.1','','','','','','Jerry','','Huang','',0,1,'{}','',0,0,'');
/*!40000 ALTER TABLE `jos_xprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_address`
--

DROP TABLE IF EXISTS `jos_xprofiles_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidNumber` int(11) DEFAULT NULL,
  `addressTo` varchar(200) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `addressCity` varchar(200) DEFAULT NULL,
  `addressRegion` varchar(200) DEFAULT NULL,
  `addressPostal` varchar(200) DEFAULT NULL,
  `addressCountry` varchar(200) DEFAULT NULL,
  `addressLatitude` float DEFAULT NULL,
  `addressLongitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_address`
--

LOCK TABLES `jos_xprofiles_address` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_admin`
--

DROP TABLE IF EXISTS `jos_xprofiles_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_admin` (
  `uidNumber` int(11) NOT NULL,
  `admin` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uidNumber`,`admin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_admin`
--

LOCK TABLES `jos_xprofiles_admin` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_bio`
--

DROP TABLE IF EXISTS `jos_xprofiles_bio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_bio` (
  `uidNumber` int(11) NOT NULL,
  `bio` text,
  PRIMARY KEY (`uidNumber`),
  FULLTEXT KEY `ftidx_bio` (`bio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_bio`
--

LOCK TABLES `jos_xprofiles_bio` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_bio` DISABLE KEYS */;
INSERT INTO `jos_xprofiles_bio` VALUES (1000,''),(1003,''),(1004,''),(1005,'');
/*!40000 ALTER TABLE `jos_xprofiles_bio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_dashboard_preferences`
--

DROP TABLE IF EXISTS `jos_xprofiles_dashboard_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_dashboard_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidNumber` int(11) unsigned NOT NULL,
  `preferences` text,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidNumber` (`uidNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_dashboard_preferences`
--

LOCK TABLES `jos_xprofiles_dashboard_preferences` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_dashboard_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_dashboard_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_disability`
--

DROP TABLE IF EXISTS `jos_xprofiles_disability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_disability` (
  `uidNumber` int(11) NOT NULL,
  `disability` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uidNumber`,`disability`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_disability`
--

LOCK TABLES `jos_xprofiles_disability` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_disability` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_disability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_edulevel`
--

DROP TABLE IF EXISTS `jos_xprofiles_edulevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_edulevel` (
  `uidNumber` int(11) NOT NULL,
  `edulevel` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uidNumber`,`edulevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_edulevel`
--

LOCK TABLES `jos_xprofiles_edulevel` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_edulevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_edulevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_hispanic`
--

DROP TABLE IF EXISTS `jos_xprofiles_hispanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_hispanic` (
  `uidNumber` int(11) NOT NULL,
  `hispanic` varchar(255) NOT NULL,
  PRIMARY KEY (`uidNumber`,`hispanic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_hispanic`
--

LOCK TABLES `jos_xprofiles_hispanic` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_hispanic` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_hispanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_host`
--

DROP TABLE IF EXISTS `jos_xprofiles_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_host` (
  `uidNumber` int(11) NOT NULL,
  `host` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uidNumber`,`host`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_host`
--

LOCK TABLES `jos_xprofiles_host` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_race`
--

DROP TABLE IF EXISTS `jos_xprofiles_race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_race` (
  `uidNumber` int(11) NOT NULL,
  `race` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uidNumber`,`race`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_race`
--

LOCK TABLES `jos_xprofiles_race` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_race` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_role`
--

DROP TABLE IF EXISTS `jos_xprofiles_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_role` (
  `uidNumber` int(11) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uidNumber`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_role`
--

LOCK TABLES `jos_xprofiles_role` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xprofiles_tokens`
--

DROP TABLE IF EXISTS `jos_xprofiles_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xprofiles_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xprofiles_tokens`
--

LOCK TABLES `jos_xprofiles_tokens` WRITE;
/*!40000 ALTER TABLE `jos_xprofiles_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xprofiles_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_xsession`
--

DROP TABLE IF EXISTS `jos_xsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_xsession` (
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `ip` varchar(15) DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `domain` varchar(128) DEFAULT NULL,
  `signed` tinyint(3) DEFAULT '0',
  `countrySHORT` char(2) DEFAULT NULL,
  `countryLONG` varchar(64) DEFAULT NULL,
  `ipREGION` varchar(128) DEFAULT NULL,
  `ipCITY` varchar(128) DEFAULT NULL,
  `ipLATITUDE` double DEFAULT NULL,
  `ipLONGITUDE` double DEFAULT NULL,
  `bot` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `idx_ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_xsession`
--

LOCK TABLES `jos_xsession` WRITE;
/*!40000 ALTER TABLE `jos_xsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_xsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_ysearch_plugin_weights`
--

DROP TABLE IF EXISTS `jos_ysearch_plugin_weights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_ysearch_plugin_weights` (
  `plugin` varchar(20) NOT NULL,
  `weight` float NOT NULL,
  PRIMARY KEY (`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_ysearch_plugin_weights`
--

LOCK TABLES `jos_ysearch_plugin_weights` WRITE;
/*!40000 ALTER TABLE `jos_ysearch_plugin_weights` DISABLE KEYS */;
INSERT INTO `jos_ysearch_plugin_weights` VALUES ('content',0.8),('events',0.8),('groups',0.8),('kb',0.8),('members',0.8),('resources',0.8),('wiki',1),('weighttitle',1),('sortrelevance',1),('sortnewer',0.2),('tagmod',1.3),('weightcontributor',0.2);
/*!40000 ALTER TABLE `jos_ysearch_plugin_weights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_ysearch_site_map`
--

DROP TABLE IF EXISTS `jos_ysearch_site_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_ysearch_site_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ftidx_title_description` (`title`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_ysearch_site_map`
--

LOCK TABLES `jos_ysearch_site_map` WRITE;
/*!40000 ALTER TABLE `jos_ysearch_site_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_ysearch_site_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `sessnum` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `remoteip` varchar(40) NOT NULL DEFAULT '',
  `exechost` varchar(40) NOT NULL DEFAULT '',
  `dispnum` int(10) unsigned DEFAULT '0',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accesstime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeout` int(11) DEFAULT '86400',
  `appname` varchar(80) NOT NULL DEFAULT '',
  `sessname` varchar(100) NOT NULL DEFAULT '',
  `sesstoken` varchar(32) NOT NULL DEFAULT '',
  `params` text,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessionlog`
--

DROP TABLE IF EXISTS `sessionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessionlog` (
  `sessnum` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `remoteip` varchar(40) NOT NULL DEFAULT '',
  `remotehost` varchar(40) NOT NULL DEFAULT '',
  `exechost` varchar(40) NOT NULL DEFAULT '',
  `dispnum` int(10) unsigned DEFAULT '0',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `appname` varchar(80) NOT NULL DEFAULT '',
  `walltime` double unsigned DEFAULT '0',
  `viewtime` double unsigned DEFAULT '0',
  `cputime` double unsigned DEFAULT '0',
  `status` smallint(5) unsigned DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessionlog`
--

LOCK TABLES `sessionlog` WRITE;
/*!40000 ALTER TABLE `sessionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessionpriv`
--

DROP TABLE IF EXISTS `sessionpriv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessionpriv` (
  `privid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sessnum` bigint(20) unsigned NOT NULL DEFAULT '0',
  `privilege` varchar(40) NOT NULL DEFAULT '',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`privid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessionpriv`
--

LOCK TABLES `sessionpriv` WRITE;
/*!40000 ALTER TABLE `sessionpriv` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessionpriv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue` varchar(40) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `mw_version` varchar(3) DEFAULT NULL,
  `ssh_key_path` varchar(200) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `master` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view` (
  `viewid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sessnum` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `remoteip` varchar(40) NOT NULL DEFAULT '',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `heartbeat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`viewid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

LOCK TABLES `view` WRITE;
/*!40000 ALTER TABLE `view` DISABLE KEYS */;
/*!40000 ALTER TABLE `view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewlog`
--

DROP TABLE IF EXISTS `viewlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewlog` (
  `sessnum` bigint(20) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `remoteip` varchar(40) NOT NULL DEFAULT '',
  `remotehost` varchar(40) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duration` float unsigned DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewlog`
--

LOCK TABLES `viewlog` WRITE;
/*!40000 ALTER TABLE `viewlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `viewlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewperm`
--

DROP TABLE IF EXISTS `viewperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewperm` (
  `sessnum` bigint(20) unsigned NOT NULL DEFAULT '0',
  `viewuser` varchar(32) NOT NULL DEFAULT '',
  `viewtoken` varchar(32) NOT NULL DEFAULT '',
  `geometry` varchar(9) NOT NULL DEFAULT '0',
  `fwhost` varchar(40) NOT NULL DEFAULT '',
  `fwport` smallint(5) unsigned NOT NULL DEFAULT '0',
  `vncpass` varchar(16) NOT NULL DEFAULT '',
  `readonly` varchar(4) NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`sessnum`,`viewuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewperm`
--

LOCK TABLES `viewperm` WRITE;
/*!40000 ALTER TABLE `viewperm` DISABLE KEYS */;
/*!40000 ALTER TABLE `viewperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_locations`
--

DROP TABLE IF EXISTS `zone_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL,
  `ipFROM` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `ipTO` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `continent` char(2) NOT NULL,
  `countrySHORT` char(2) NOT NULL,
  `countryLONG` varchar(64) NOT NULL,
  `ipREGION` varchar(128) NOT NULL,
  `ipCITY` varchar(128) NOT NULL,
  `ipLATITUDE` double DEFAULT NULL,
  `ipLONGITUDE` double DEFAULT NULL,
  `notes` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_locations`
--

LOCK TABLES `zone_locations` WRITE;
/*!40000 ALTER TABLE `zone_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(40) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `is_default` tinyint(2) NOT NULL DEFAULT '0',
  `type` varchar(10) DEFAULT NULL,
  `master` varchar(255) DEFAULT NULL,
  `mw_version` varchar(3) DEFAULT NULL,
  `ssh_key_path` varchar(200) DEFAULT NULL,
  `description` text,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `jos_contributor_ids_view`
--

/*!50001 DROP TABLE IF EXISTS `jos_contributor_ids_view`*/;
/*!50001 DROP VIEW IF EXISTS `jos_contributor_ids_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`example`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `jos_contributor_ids_view` AS select `jos_resource_contributors_view`.`uidNumber` AS `uidNumber` from `jos_resource_contributors_view` union select `jos_wiki_contributors_view`.`uidNumber` AS `uidNumber` from `jos_wiki_contributors_view` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jos_contributors_view`
--

/*!50001 DROP TABLE IF EXISTS `jos_contributors_view`*/;
/*!50001 DROP VIEW IF EXISTS `jos_contributors_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`example`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `jos_contributors_view` AS select `c`.`uidNumber` AS `uidNumber`,coalesce(`r`.`count`,0) AS `resource_count`,coalesce(`w`.`count`,0) AS `wiki_count`,(coalesce(`w`.`count`,0) + coalesce(`r`.`count`,0)) AS `total_count` from ((`jos_contributor_ids_view` `c` left join `jos_resource_contributors_view` `r` on((`r`.`uidNumber` = `c`.`uidNumber`))) left join `jos_wiki_contributors_view` `w` on((`w`.`uidNumber` = `c`.`uidNumber`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jos_courses_form_latest_responses_view`
--

/*!50001 DROP TABLE IF EXISTS `jos_courses_form_latest_responses_view`*/;
/*!50001 DROP VIEW IF EXISTS `jos_courses_form_latest_responses_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`example`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `jos_courses_form_latest_responses_view` AS select `fre`.`id` AS `id`,`fre`.`respondent_id` AS `respondent_id`,`fre`.`question_id` AS `question_id`,`fre`.`answer_id` AS `answer_id` from `jos_courses_form_responses` `fre` where ((select count(0) from `jos_courses_form_responses` `frei` where ((`frei`.`respondent_id` = `fre`.`respondent_id`) and (`frei`.`id` > `fre`.`id`))) < (select count(distinct `frei`.`question_id`) from `jos_courses_form_responses` `frei` where (`frei`.`respondent_id` = `fre`.`respondent_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jos_resource_contributors_view`
--

/*!50001 DROP TABLE IF EXISTS `jos_resource_contributors_view`*/;
/*!50001 DROP VIEW IF EXISTS `jos_resource_contributors_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`example`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `jos_resource_contributors_view` AS select `m`.`uidNumber` AS `uidNumber`,count(`AA`.`authorid`) AS `count` from ((`jos_xprofiles` `m` left join `jos_author_assoc` `AA` on(((`AA`.`authorid` = `m`.`uidNumber`) and (`AA`.`subtable` = _utf8'resources')))) join `jos_resources` `R` on(((`R`.`id` = `AA`.`subid`) and (`R`.`published` = 1) and (`R`.`standalone` = 1)))) where (`m`.`public` = 1) group by `m`.`uidNumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jos_wiki_contributors_view`
--

/*!50001 DROP TABLE IF EXISTS `jos_wiki_contributors_view`*/;
/*!50001 DROP VIEW IF EXISTS `jos_wiki_contributors_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `jos_wiki_contributors_view` AS select `m`.`id` AS `uidNumber`,count(`w`.`id`) AS `count` from ((`jos_users` `m` left join `jos_wiki_pages` `w` on(((`w`.`access` <> 1) and (`w`.`created_by` = `m`.`id`)))) left join `jos_wiki_authors` `a` on(((`a`.`page_id` = `w`.`id`) and (`m`.`id` = `a`.`user_id`)))) where ((`m`.`access` = 1) and (`w`.`id` is not null)) group by `m`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-29  2:23:03
