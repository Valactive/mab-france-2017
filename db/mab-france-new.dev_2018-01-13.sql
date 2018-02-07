# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: localhost (MySQL 5.6.35)
# Base de données: mab-france-new.dev
# Temps de génération: 2018-01-13 15:52:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table sym_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_authors`;

CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '1000-01-01 00:00:00',
  `user_type` enum('author','manager','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;

INSERT INTO `sym_authors` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `last_seen`, `user_type`, `primary`, `default_area`, `auth_token_active`, `language`)
VALUES
	(1,'valery','PBKDF2v1|10000|6a27ba7a8ccd424e755a|zsJqLZuA0O6067f0ur/117DDkevVsR51F5K6QXX8CMmljYsUmRXMow==','Valéry','Frisch','valery.frisch@gmail.com','2018-01-13 16:52:01','developer','yes','1','no','fr');

/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_cache`;

CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_ckeditor_link_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_ckeditor_link_templates`;

CREATE TABLE `sym_ckeditor_link_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `field_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table sym_ckeditor_presets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_ckeditor_presets`;

CREATE TABLE `sym_ckeditor_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `toolbar` text,
  `plugins` text,
  `resize` int(1) DEFAULT NULL,
  `outline` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_ckeditor_presets` WRITE;
/*!40000 ALTER TABLE `sym_ckeditor_presets` DISABLE KEYS */;

INSERT INTO `sym_ckeditor_presets` (`id`, `name`, `toolbar`, `plugins`, `resize`, `outline`)
VALUES
	(13,'Minimal','[\'Bold\', \'Italic\', \'Strike\', \'-\', \'Subscript\', \'Superscript\'],\r\n[\'Link\', \'Unlink\'],\r\n[\'Source\']',NULL,NULL,NULL),
	(14,'Normal','[\'Bold\', \'Italic\', \'Strike\', \'-\', \'Subscript\', \'Superscript\'],\r\n[\'NumberedList\', \'BulletedList\', \'-\', \'Outdent\', \'Indent\', \'Blockquote\'],\r\n[\'Image\', \'oembed\'],[\'Link\', \'Unlink\'],\r\n[\'HorizontalRule\'],\r\n[\'Source\', \'Maximize\',\'ShowBlocks\']',NULL,1,1),
	(15,'Full','{ name: \'document\',    items : [ \'Source\',\'-\',\'Save\',\'NewPage\',\'DocProps\',\'Preview\',\'Print\',\'-\',\'Templates\' ] },\r\n    { name: \'clipboard\',   items : [ \'Cut\',\'Copy\',\'Paste\',\'PasteText\',\'PasteFromWord\',\'-\',\'Undo\',\'Redo\' ] },\r\n    { name: \'editing\',     items : [ \'Find\',\'Replace\',\'-\',\'SelectAll\',\'-\',\'SpellChecker\', \'Scayt\' ] },\r\n    { name: \'forms\',       items : [ \'Form\', \'Checkbox\', \'Radio\', \'TextField\', \'Textarea\', \'Select\', \'Button\', \'ImageButton\', \'HiddenField\' ] },\r\n    \'/\',\r\n    { name: \'basicstyles\', items : [ \'Bold\',\'Italic\',\'Underline\',\'Strike\',\'Subscript\',\'Superscript\',\'-\',\'RemoveFormat\' ] },\r\n    { name: \'paragraph\',   items : [ \'NumberedList\',\'BulletedList\',\'-\',\'Outdent\',\'Indent\',\'-\',\'Blockquote\',\'CreateDiv\',\'-\',\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\' ] },\r\n    { name: \'links\',       items : [ \'Link\',\'Unlink\',\'Anchor\' ] },\r\n    { name: \'insert\',      items : [ \'Image\',\'Flash\',\'Table\',\'HorizontalRule\',\'Smiley\',\'SpecialChar\',\'PageBreak\' ] },\r\n    \'/\',\r\n    { name: \'styles\',      items : [ \'Styles\',\'Format\',\'Font\',\'FontSize\' ] },\r\n    { name: \'colors\',      items : [ \'TextColor\',\'BGColor\' ] },\r\n    { name: \'tools\',       items : [ \'Maximize\', \'ShowBlocks\',\'-\',\'About\' ] }',NULL,1,1);

/*!40000 ALTER TABLE `sym_ckeditor_presets` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries`;

CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `modification_author_id` int(11) unsigned NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `creation_date_gmt` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `modification_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `modification_date_gmt` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;

INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`)
VALUES
	(1,1,1,1,'2017-11-22 20:59:21','2017-11-22 19:59:21','2017-12-13 15:10:41','2017-12-13 14:10:41'),
	(2,2,1,1,'2017-11-23 10:32:42','2017-11-23 09:32:42','2017-11-27 14:36:44','2017-11-27 13:36:44'),
	(3,2,1,1,'2017-11-23 10:35:30','2017-11-23 09:35:30','2017-11-27 22:24:17','2017-11-27 21:24:17'),
	(4,2,1,1,'2017-11-23 10:35:47','2017-11-23 09:35:47','2017-11-27 22:25:29','2017-11-27 21:25:29'),
	(5,2,1,1,'2017-11-23 10:36:12','2017-11-23 09:36:12','2017-11-27 22:24:34','2017-11-27 21:24:34'),
	(6,2,1,1,'2017-11-23 10:36:28','2017-11-23 09:36:28','2017-11-27 22:24:42','2017-11-27 21:24:42'),
	(7,2,1,1,'2017-11-23 10:36:42','2017-11-23 09:36:42','2017-11-27 22:24:05','2017-11-27 21:24:05'),
	(8,1,1,1,'2017-11-27 14:59:34','2017-11-27 13:59:34','2017-11-27 14:59:34','2017-11-27 13:59:34'),
	(9,1,1,1,'2017-11-27 15:00:13','2017-11-27 14:00:13','2017-11-27 15:00:13','2017-11-27 14:00:13'),
	(10,1,1,1,'2017-11-27 15:33:46','2017-11-27 14:33:46','2017-11-27 15:33:46','2017-11-27 14:33:46'),
	(12,1,1,1,'2017-12-16 10:27:58','2017-12-16 09:27:58','2018-01-10 16:49:57','2018-01-10 15:49:57'),
	(13,5,1,1,'2018-01-10 17:05:51','2018-01-10 16:05:51','2018-01-10 17:05:51','2018-01-10 16:05:51'),
	(15,5,1,1,'2018-01-10 17:32:23','2018-01-10 16:32:23','2018-01-10 17:32:23','2018-01-10 16:32:23');

/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_12
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_12`;

CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_12` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_12` DISABLE KEYS */;

INSERT INTO `sym_entries_data_12` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`)
VALUES
	(1,13,'iledesein.jpg',193054,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2018-01-10T17:05:51+01:00\";s:5:\"width\";i:1024;s:6:\"height\";i:768;}'),
	(2,15,'grand-cul-de-sac-marin.jpg',5492264,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2018-01-10T17:32:23+01:00\";s:5:\"width\";i:3872;s:6:\"height\";i:2592;}');

/*!40000 ALTER TABLE `sym_entries_data_12` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_13
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_13`;

CREATE TABLE `sym_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_14
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_14`;

CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_15
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_15`;

CREATE TABLE `sym_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_16
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_16`;

CREATE TABLE `sym_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_17
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_17`;

CREATE TABLE `sym_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_18
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_18`;

CREATE TABLE `sym_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_19
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_19`;

CREATE TABLE `sym_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_2`;

CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-fr` text COLLATE utf8_unicode_ci,
  `value_formatted-fr` text COLLATE utf8_unicode_ci,
  `word_count-fr` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-fr` (`handle-fr`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-fr` (`value-fr`),
  FULLTEXT KEY `value_formatted-fr` (`value_formatted-fr`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_2` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_2` DISABLE KEYS */;

INSERT INTO `sym_entries_data_2` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-fr`, `value-fr`, `value_formatted-fr`, `word_count-fr`)
VALUES
	(16,1,'candidature','Candidature','Candidature',1,'creating-a-reserve','Creating a Reserve','Creating a Reserve',3,'candidature','Candidature','Candidature',1),
	(9,8,'groupes-de-travail','Groupes de travail','Groupes de travail',3,'groupes-de-travail-en','Groupes de travail (en)','Groupes de travail (en)',4,'groupes-de-travail','Groupes de travail','Groupes de travail',3),
	(10,9,'les-groupes-thematiques','Les groupes thématiques','Les groupes thématiques',3,'les-groupes-thematiques-en','Les groupes thématiques (en)','Les groupes thématiques (en)',4,'les-groupes-thematiques','Les groupes thématiques','Les groupes thématiques',3),
	(11,10,'construire-la-reserve-de-biosphere','Construire la réserve de biosphère','Construire la réserve de biosphère',5,'construire-la-reserve-de-biosphere-en','Construire la réserve de biosphère (en)','Construire la réserve de biosphère (en)',6,'construire-la-reserve-de-biosphere','Construire la réserve de biosphère','Construire la réserve de biosphère',5),
	(20,12,'accueil','Accueil','Accueil',1,'home','Home','Home',1,'accueil','Accueil','Accueil',1);

/*!40000 ALTER TABLE `sym_entries_data_2` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_20
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_20`;

CREATE TABLE `sym_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_21
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_21`;

CREATE TABLE `sym_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_22
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_22`;

CREATE TABLE `sym_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_23
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_23`;

CREATE TABLE `sym_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_3`;

CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-fr` text COLLATE utf8_unicode_ci,
  `value_formatted-fr` text COLLATE utf8_unicode_ci,
  `word_count-fr` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-fr` (`handle-fr`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-fr` (`value-fr`),
  FULLTEXT KEY `value_formatted-fr` (`value_formatted-fr`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_3` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_3` DISABLE KEYS */;

INSERT INTO `sym_entries_data_3` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-fr`, `value-fr`, `value_formatted-fr`, `word_count-fr`)
VALUES
	(16,1,' pour-etre-designe reserve-de-biosphere-un-territoire-doit-repondre-aux-criteres-du-cadre-statutaire-du-reseau-mondial-de-reserves-de-biosphere et-aux-fonctions-decrites-dans-la-strategie-de-seville -unesco-1995- la-candidature-est-proposee-a-l-unesco-par','<p><strong> Pour être désigné Réserve de biosphère, un territoire doit répondre aux critères du cadre statutaire du réseau mondial de Réserves de biosphère et aux fonctions décrites dans la Stratégie de Séville  (Unesco, 1995). La candidature est proposée à l’Unesco par le pays, en l\'occurence la délégation de la France auprès de l\'Unesco. Elle intervient au terme d\'un processus au cours duquel le MAB France accompagne les porteurs de projet.</strong></p>\r\n<p><a href=\"/workspace/uploads/mab/documents/cadre-statutaire-du-reseau-mondial-de-rb.pdf\" target=\"_blank\">Cadre statutaire du Réseau mondial de Réserves de biosphère</a></p>\r\n<h2>En amont de la candidature</h2>\r\n<p>Des organisations locales diverses sont à l\'origine de candidatures : parcs ou organismes de gestion déjà existants à la recherche d\'un reconnaissance internationale, associations souhaitant structurer des projets territoriaux de développement durable et de valorisation de la biodiversité…Un premier contact avec le MAB France permet de discuter de l\'opportunité du projet. Un engagement formel des autorités locales  est souhaité pour qu\'un site soit considéré comme candidat.</p>\r\n<p>Le MAB facilite ensuite la prise de contact avec d’autres Réserves de biosphère, incite à organiser des voyages d’étude, reste à l\'écoute des porteurs de projets.<br /> Il peut intervenir lors de réunions d’informations des acteurs locaux, apporter un appui en matière de démarches participatives (en savoir plus <a href=\"http://www.mab-france.org/fr/renforcer-le-reseau/construire-une-reserve-de-biosphere/\" target=\"_blank\">ici</a>).<br /> Les réserves candidates sont associées aux travaux du réseau, invitées à participer aux rencontres et groupes de travail qu’il organise.</p>\r\n<p>Le délai entre les premiers contacts et le dépôt de la candidature est très variable : de 2 à 10 ans…</p>\r\n<h2>La candidature</h2>\r\n<p>Un <a href=\"http://www.unesco.org/new/fileadmin/MULTIMEDIA/HQ/SC/pdf/biosphere_reserve_nomination_form_2013_fr.pdf\" target=\"_blank\">formulaire</a> est la base du dossier de candidature. Celui-ci est transmis à l’Unesco après une évaluation au niveau national par le MAB France.</p>\r\n<p>Le dossier de candidature est soumis à deux rapporteurs : un  membre du bureau du MAB France, et un scientifique ayant des compétences sur les enjeux prioritaires de la Réserve de biosphère. Une fois les rapports établis, le dossier est présenté et défendu devant le comité MAB France ; des recommandations sont alors formulées afin d\'améliorer le dossier et garantir une bonne évaluation par l\'UNESCO. </p>\r\n<p>Une fois à l\'Unesco, le dossier est instruit par le Secrétariat international, examiné par le Comité consultatif international des Réserves de biosphère puis par le Conseil International de Coordination du MAB. Ces procédures s\'étalent sur 9 mois environ.</p>\r\n<h2>La désignation</h2>\r\n<p><img style=\"width: 223px; height: 151px; float: left; margin: 4px;\" src=\"/workspace/images/385-ramsar-2013-par-frederic-quivrin-pour-le-pnr.jpg\" alt=\"Inauguration de la Réserve de biosphère du Marais Audomarois, Novembre 2013\" />La désignation donne lieu à la production d\'un certificat signé par le Directeur général de l\'Unesco. La remise officielle est l\'occasion d\'une cérémonie et d\'une fête. Cette reconnaissance, élément de fierté, couronne un long travail de préparation et concrétise de nouvelles responsabilités associées à l\'inclusion dans un réseau mondial de l\'Unesco.</p>\r\n<p> </p>\r\n<h2>Sources de la Loire, de l\'Allier et de l\'Ardèche</h2>\r\n<p><img style=\"width: 223px; height: 167px; float: left;\" src=\"/workspace/images/dscf2624.jpg\" alt=\"\" longdesc=\"©SOS Loire Vivante-ERN France\" />Depuis 2006, l\'association SOS Loire Vivante mobilise les élus, le secteur économique et social des hautes terres du Massif central en faveur d\'un projet concerté portant sur le territoire des sources de trois rivières emblématiques. La publication de brochures, des séminaires, une ballade estivale des trois sources, des réunions, un site Internet contribuent progressivement à dessiner ce projet.</p>\r\n<p><a href=\"http://www.mabloireallierardeche.org\" target=\"_blank\">Plus d\'informations</a></p>','<p><strong> Pour être désigné Réserve de biosphère, un territoire doit répondre aux critères du cadre statutaire du réseau mondial de Réserves de biosphère et aux fonctions décrites dans la Stratégie de Séville  (Unesco, 1995). La candidature est proposée à l’Unesco par le pays, en l\'occurence la délégation de la France auprès de l\'Unesco. Elle intervient au terme d\'un processus au cours duquel le MAB France accompagne les porteurs de projet.</strong></p>\r\n<p><a href=\"/workspace/uploads/mab/documents/cadre-statutaire-du-reseau-mondial-de-rb.pdf\" target=\"_blank\">Cadre statutaire du Réseau mondial de Réserves de biosphère</a></p>\r\n<h2>En amont de la candidature</h2>\r\n<p>Des organisations locales diverses sont à l\'origine de candidatures : parcs ou organismes de gestion déjà existants à la recherche d\'un reconnaissance internationale, associations souhaitant structurer des projets territoriaux de développement durable et de valorisation de la biodiversité…Un premier contact avec le MAB France permet de discuter de l\'opportunité du projet. Un engagement formel des autorités locales  est souhaité pour qu\'un site soit considéré comme candidat.</p>\r\n<p>Le MAB facilite ensuite la prise de contact avec d’autres Réserves de biosphère, incite à organiser des voyages d’étude, reste à l\'écoute des porteurs de projets.<br /> Il peut intervenir lors de réunions d’informations des acteurs locaux, apporter un appui en matière de démarches participatives (en savoir plus <a href=\"http://www.mab-france.org/fr/renforcer-le-reseau/construire-une-reserve-de-biosphere/\" target=\"_blank\">ici</a>).<br /> Les réserves candidates sont associées aux travaux du réseau, invitées à participer aux rencontres et groupes de travail qu’il organise.</p>\r\n<p>Le délai entre les premiers contacts et le dépôt de la candidature est très variable : de 2 à 10 ans…</p>\r\n<h2>La candidature</h2>\r\n<p>Un <a href=\"http://www.unesco.org/new/fileadmin/MULTIMEDIA/HQ/SC/pdf/biosphere_reserve_nomination_form_2013_fr.pdf\" target=\"_blank\">formulaire</a> est la base du dossier de candidature. Celui-ci est transmis à l’Unesco après une évaluation au niveau national par le MAB France.</p>\r\n<p>Le dossier de candidature est soumis à deux rapporteurs : un  membre du bureau du MAB France, et un scientifique ayant des compétences sur les enjeux prioritaires de la Réserve de biosphère. Une fois les rapports établis, le dossier est présenté et défendu devant le comité MAB France ; des recommandations sont alors formulées afin d\'améliorer le dossier et garantir une bonne évaluation par l\'UNESCO. </p>\r\n<p>Une fois à l\'Unesco, le dossier est instruit par le Secrétariat international, examiné par le Comité consultatif international des Réserves de biosphère puis par le Conseil International de Coordination du MAB. Ces procédures s\'étalent sur 9 mois environ.</p>\r\n<h2>La désignation</h2>\r\n<p><img style=\"width: 223px; height: 151px; float: left; margin: 4px;\" src=\"/workspace/images/385-ramsar-2013-par-frederic-quivrin-pour-le-pnr.jpg\" alt=\"Inauguration de la Réserve de biosphère du Marais Audomarois, Novembre 2013\" />La désignation donne lieu à la production d\'un certificat signé par le Directeur général de l\'Unesco. La remise officielle est l\'occasion d\'une cérémonie et d\'une fête. Cette reconnaissance, élément de fierté, couronne un long travail de préparation et concrétise de nouvelles responsabilités associées à l\'inclusion dans un réseau mondial de l\'Unesco.</p>\r\n<p> </p>\r\n<h2>Sources de la Loire, de l\'Allier et de l\'Ardèche</h2>\r\n<p><img style=\"width: 223px; height: 167px; float: left;\" src=\"/workspace/images/dscf2624.jpg\" alt=\"\" longdesc=\"©SOS Loire Vivante-ERN France\" />Depuis 2006, l\'association SOS Loire Vivante mobilise les élus, le secteur économique et social des hautes terres du Massif central en faveur d\'un projet concerté portant sur le territoire des sources de trois rivières emblématiques. La publication de brochures, des séminaires, une ballade estivale des trois sources, des réunions, un site Internet contribuent progressivement à dessiner ce projet.</p>\r\n<p><a href=\"http://www.mabloireallierardeche.org\" target=\"_blank\">Plus d\'informations</a></p>',448,'to-join-the-world-network-of-biosphere-reserves-a-region-s-application-must-be-submitted-to-unesco-by-the-country-in-which-it-is-situated-mab-france-guides-project-leaders-from-candidate-regions-throughout-the-process-of-creating-a-new-biosphere-reserve-t','<p><strong>To join the world network of Biosphere reserves, a region’s application must be submitted to UNESCO by the country in which it is situated. MAB France guides project leaders from candidate regions throughout the process of creating a new Biosphere reserve.</strong><br /> <strong>To obtain the designation, the site must satisfy criteria for eligibility within the statutory framework of the World Network of Biosphere Reserves, in addition to the functions described in the Seville Strategy (UNESCO, 1995).</strong><br /> <strong><strong>A local organization supports the application, and works towards implementing the proposal, in conjunction with MAB France. MAB provides guidance during the reflection stage, facilitates contact with other Biosphere reserves, and encourages the organization of study tours.<br /> Representatives from MAB France may also speak at information meetings for local stakeholders, providing support for participatory initiatives, and facilitating co-construction sessions for the proposed Biosphere reserve.</strong></strong></p>\r\n<p><strong><strong>Candidate Biosphere reserves are involved in the network’s activities, and are invited to attend meetings and working groups organized by MAB France. </strong></strong><br /> <strong><strong>Applications are forwarded to UNESCO only after evaluation by MAB France on a national level.</strong></strong></p>\r\n<ul>\r\n<li><strong><strong>For further information : <a href=\"http://www.unesco.org/new/en/natural-sciences/environment/ecological-sciences/related-info/publications/mab-official-documents/\" target=\"_blank\">Seville Strategy</a></strong></strong></li>\r\n</ul>','<p><strong>To join the world network of Biosphere reserves, a region’s application must be submitted to UNESCO by the country in which it is situated. MAB France guides project leaders from candidate regions throughout the process of creating a new Biosphere reserve.</strong><br /> <strong>To obtain the designation, the site must satisfy criteria for eligibility within the statutory framework of the World Network of Biosphere Reserves, in addition to the functions described in the Seville Strategy (UNESCO, 1995).</strong><br /> <strong><strong>A local organization supports the application, and works towards implementing the proposal, in conjunction with MAB France. MAB provides guidance during the reflection stage, facilitates contact with other Biosphere reserves, and encourages the organization of study tours.<br /> Representatives from MAB France may also speak at information meetings for local stakeholders, providing support for participatory initiatives, and facilitating co-construction sessions for the proposed Biosphere reserve.</strong></strong></p>\r\n<p><strong><strong>Candidate Biosphere reserves are involved in the network’s activities, and are invited to attend meetings and working groups organized by MAB France. </strong></strong><br /> <strong><strong>Applications are forwarded to UNESCO only after evaluation by MAB France on a national level.</strong></strong></p>\r\n<ul>\r\n<li><strong><strong>For further information : <a href=\"http://www.unesco.org/new/en/natural-sciences/environment/ecological-sciences/related-info/publications/mab-official-documents/\" target=\"_blank\">Seville Strategy</a></strong></strong></li>\r\n</ul>',180,' pour-etre-designe reserve-de-biosphere-un-territoire-doit-repondre-aux-criteres-du-cadre-statutaire-du-reseau-mondial-de-reserves-de-biosphere et-aux-fonctions-decrites-dans-la-strategie-de-seville -unesco-1995- la-candidature-est-proposee-a-l-unesco-par','<p><strong> Pour être désigné Réserve de biosphère, un territoire doit répondre aux critères du cadre statutaire du réseau mondial de Réserves de biosphère et aux fonctions décrites dans la Stratégie de Séville  (Unesco, 1995). La candidature est proposée à l’Unesco par le pays, en l\'occurence la délégation de la France auprès de l\'Unesco. Elle intervient au terme d\'un processus au cours duquel le MAB France accompagne les porteurs de projet.</strong></p>\r\n<p><a href=\"/workspace/uploads/mab/documents/cadre-statutaire-du-reseau-mondial-de-rb.pdf\" target=\"_blank\">Cadre statutaire du Réseau mondial de Réserves de biosphère</a></p>\r\n<h2>En amont de la candidature</h2>\r\n<p>Des organisations locales diverses sont à l\'origine de candidatures : parcs ou organismes de gestion déjà existants à la recherche d\'un reconnaissance internationale, associations souhaitant structurer des projets territoriaux de développement durable et de valorisation de la biodiversité…Un premier contact avec le MAB France permet de discuter de l\'opportunité du projet. Un engagement formel des autorités locales  est souhaité pour qu\'un site soit considéré comme candidat.</p>\r\n<p>Le MAB facilite ensuite la prise de contact avec d’autres Réserves de biosphère, incite à organiser des voyages d’étude, reste à l\'écoute des porteurs de projets.<br /> Il peut intervenir lors de réunions d’informations des acteurs locaux, apporter un appui en matière de démarches participatives (en savoir plus <a href=\"http://www.mab-france.org/fr/renforcer-le-reseau/construire-une-reserve-de-biosphere/\" target=\"_blank\">ici</a>).<br /> Les réserves candidates sont associées aux travaux du réseau, invitées à participer aux rencontres et groupes de travail qu’il organise.</p>\r\n<p>Le délai entre les premiers contacts et le dépôt de la candidature est très variable : de 2 à 10 ans…</p>\r\n<h2>La candidature</h2>\r\n<p>Un <a href=\"http://www.unesco.org/new/fileadmin/MULTIMEDIA/HQ/SC/pdf/biosphere_reserve_nomination_form_2013_fr.pdf\" target=\"_blank\">formulaire</a> est la base du dossier de candidature. Celui-ci est transmis à l’Unesco après une évaluation au niveau national par le MAB France.</p>\r\n<p>Le dossier de candidature est soumis à deux rapporteurs : un  membre du bureau du MAB France, et un scientifique ayant des compétences sur les enjeux prioritaires de la Réserve de biosphère. Une fois les rapports établis, le dossier est présenté et défendu devant le comité MAB France ; des recommandations sont alors formulées afin d\'améliorer le dossier et garantir une bonne évaluation par l\'UNESCO. </p>\r\n<p>Une fois à l\'Unesco, le dossier est instruit par le Secrétariat international, examiné par le Comité consultatif international des Réserves de biosphère puis par le Conseil International de Coordination du MAB. Ces procédures s\'étalent sur 9 mois environ.</p>\r\n<h2>La désignation</h2>\r\n<p><img style=\"width: 223px; height: 151px; float: left; margin: 4px;\" src=\"/workspace/images/385-ramsar-2013-par-frederic-quivrin-pour-le-pnr.jpg\" alt=\"Inauguration de la Réserve de biosphère du Marais Audomarois, Novembre 2013\" />La désignation donne lieu à la production d\'un certificat signé par le Directeur général de l\'Unesco. La remise officielle est l\'occasion d\'une cérémonie et d\'une fête. Cette reconnaissance, élément de fierté, couronne un long travail de préparation et concrétise de nouvelles responsabilités associées à l\'inclusion dans un réseau mondial de l\'Unesco.</p>\r\n<p> </p>\r\n<h2>Sources de la Loire, de l\'Allier et de l\'Ardèche</h2>\r\n<p><img style=\"width: 223px; height: 167px; float: left;\" src=\"/workspace/images/dscf2624.jpg\" alt=\"\" longdesc=\"©SOS Loire Vivante-ERN France\" />Depuis 2006, l\'association SOS Loire Vivante mobilise les élus, le secteur économique et social des hautes terres du Massif central en faveur d\'un projet concerté portant sur le territoire des sources de trois rivières emblématiques. La publication de brochures, des séminaires, une ballade estivale des trois sources, des réunions, un site Internet contribuent progressivement à dessiner ce projet.</p>\r\n<p><a href=\"http://www.mabloireallierardeche.org\" target=\"_blank\">Plus d\'informations</a></p>','<p><strong> Pour être désigné Réserve de biosphère, un territoire doit répondre aux critères du cadre statutaire du réseau mondial de Réserves de biosphère et aux fonctions décrites dans la Stratégie de Séville  (Unesco, 1995). La candidature est proposée à l’Unesco par le pays, en l\'occurence la délégation de la France auprès de l\'Unesco. Elle intervient au terme d\'un processus au cours duquel le MAB France accompagne les porteurs de projet.</strong></p>\r\n<p><a href=\"/workspace/uploads/mab/documents/cadre-statutaire-du-reseau-mondial-de-rb.pdf\" target=\"_blank\">Cadre statutaire du Réseau mondial de Réserves de biosphère</a></p>\r\n<h2>En amont de la candidature</h2>\r\n<p>Des organisations locales diverses sont à l\'origine de candidatures : parcs ou organismes de gestion déjà existants à la recherche d\'un reconnaissance internationale, associations souhaitant structurer des projets territoriaux de développement durable et de valorisation de la biodiversité…Un premier contact avec le MAB France permet de discuter de l\'opportunité du projet. Un engagement formel des autorités locales  est souhaité pour qu\'un site soit considéré comme candidat.</p>\r\n<p>Le MAB facilite ensuite la prise de contact avec d’autres Réserves de biosphère, incite à organiser des voyages d’étude, reste à l\'écoute des porteurs de projets.<br /> Il peut intervenir lors de réunions d’informations des acteurs locaux, apporter un appui en matière de démarches participatives (en savoir plus <a href=\"http://www.mab-france.org/fr/renforcer-le-reseau/construire-une-reserve-de-biosphere/\" target=\"_blank\">ici</a>).<br /> Les réserves candidates sont associées aux travaux du réseau, invitées à participer aux rencontres et groupes de travail qu’il organise.</p>\r\n<p>Le délai entre les premiers contacts et le dépôt de la candidature est très variable : de 2 à 10 ans…</p>\r\n<h2>La candidature</h2>\r\n<p>Un <a href=\"http://www.unesco.org/new/fileadmin/MULTIMEDIA/HQ/SC/pdf/biosphere_reserve_nomination_form_2013_fr.pdf\" target=\"_blank\">formulaire</a> est la base du dossier de candidature. Celui-ci est transmis à l’Unesco après une évaluation au niveau national par le MAB France.</p>\r\n<p>Le dossier de candidature est soumis à deux rapporteurs : un  membre du bureau du MAB France, et un scientifique ayant des compétences sur les enjeux prioritaires de la Réserve de biosphère. Une fois les rapports établis, le dossier est présenté et défendu devant le comité MAB France ; des recommandations sont alors formulées afin d\'améliorer le dossier et garantir une bonne évaluation par l\'UNESCO. </p>\r\n<p>Une fois à l\'Unesco, le dossier est instruit par le Secrétariat international, examiné par le Comité consultatif international des Réserves de biosphère puis par le Conseil International de Coordination du MAB. Ces procédures s\'étalent sur 9 mois environ.</p>\r\n<h2>La désignation</h2>\r\n<p><img style=\"width: 223px; height: 151px; float: left; margin: 4px;\" src=\"/workspace/images/385-ramsar-2013-par-frederic-quivrin-pour-le-pnr.jpg\" alt=\"Inauguration de la Réserve de biosphère du Marais Audomarois, Novembre 2013\" />La désignation donne lieu à la production d\'un certificat signé par le Directeur général de l\'Unesco. La remise officielle est l\'occasion d\'une cérémonie et d\'une fête. Cette reconnaissance, élément de fierté, couronne un long travail de préparation et concrétise de nouvelles responsabilités associées à l\'inclusion dans un réseau mondial de l\'Unesco.</p>\r\n<p> </p>\r\n<h2>Sources de la Loire, de l\'Allier et de l\'Ardèche</h2>\r\n<p><img style=\"width: 223px; height: 167px; float: left;\" src=\"/workspace/images/dscf2624.jpg\" alt=\"\" longdesc=\"©SOS Loire Vivante-ERN France\" />Depuis 2006, l\'association SOS Loire Vivante mobilise les élus, le secteur économique et social des hautes terres du Massif central en faveur d\'un projet concerté portant sur le territoire des sources de trois rivières emblématiques. La publication de brochures, des séminaires, une ballade estivale des trois sources, des réunions, un site Internet contribuent progressivement à dessiner ce projet.</p>\r\n<p><a href=\"http://www.mabloireallierardeche.org\" target=\"_blank\">Plus d\'informations</a></p>',448),
	(20,12,'bienvenue-sur-le-site-du-mab-france- - ','<h2>Bienvenue sur le site du Mab France.</h2>\r\n<p> </p>\r\n<p> </p>','<h2>Bienvenue sur le site du Mab France.</h2>\r\n<p> </p>\r\n<p> </p>',7,'welcome-on-board','<p>Welcome on board!</p>','<p>Welcome on board!</p>',3,'bienvenue-sur-le-site-du-mab-france- - ','<h2>Bienvenue sur le site du Mab France.</h2>\r\n<p> </p>\r\n<p> </p>','<h2>Bienvenue sur le site du Mab France.</h2>\r\n<p> </p>\r\n<p> </p>',7),
	(9,8,'texte-groupes-de-travail','<p>Texte groupes de travail</p>','<p>Texte groupes de travail</p>',4,NULL,NULL,NULL,0,'texte-groupes-de-travail','<p>Texte groupes de travail</p>','<p>Texte groupes de travail</p>',4),
	(10,9,'les-groupes-thematiques-textes','<p>Les groupes thématiques textes</p>','<p>Les groupes thématiques textes</p>',4,NULL,NULL,NULL,0,'les-groupes-thematiques-textes','<p>Les groupes thématiques textes</p>','<p>Les groupes thématiques textes</p>',4),
	(11,10,'construire-la-reserve-de-biosphere','<p>Construire la réserve de biosphère</p>','<p>Construire la réserve de biosphère</p>',5,NULL,NULL,NULL,0,'construire-la-reserve-de-biosphere','<p>Construire la réserve de biosphère</p>','<p>Construire la réserve de biosphère</p>',5);

/*!40000 ALTER TABLE `sym_entries_data_3` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_4`;

CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_4` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_4` DISABLE KEYS */;

INSERT INTO `sym_entries_data_4` (`id`, `entry_id`, `value`)
VALUES
	(16,1,'yes'),
	(9,8,'yes'),
	(10,9,'yes'),
	(11,10,'yes'),
	(20,12,'yes');

/*!40000 ALTER TABLE `sym_entries_data_4` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_7`;

CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-fr` text COLLATE utf8_unicode_ci,
  `value_formatted-fr` text COLLATE utf8_unicode_ci,
  `word_count-fr` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-fr` (`handle-fr`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-fr` (`value-fr`),
  FULLTEXT KEY `value_formatted-fr` (`value_formatted-fr`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_7` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_7` DISABLE KEYS */;

INSERT INTO `sym_entries_data_7` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-fr`, `value-fr`, `value_formatted-fr`, `word_count-fr`)
VALUES
	(10,3,'demarche','Démarche','Démarche',1,'demarche-en','Demarche(en)','Demarche(en)',1,'demarche','Démarche','Démarche',1),
	(11,5,'les-reserves-de-biospheres','Les réserves de Biosphères','Les réserves de Biosphères',4,'les-reserves-de-biospheres-en','Les réserves de Biosphères(en)','Les réserves de Biosphères(en)',4,'les-reserves-de-biospheres','Les réserves de Biosphères','Les réserves de Biosphères',4),
	(12,6,'nos-actions','Nos actions','Nos actions',2,'nos-actions-en','Nos actions(en)','Nos actions(en)',2,'nos-actions','Nos actions','Nos actions',2),
	(9,7,'international','International','International',1,'international-en','International(en)','International(en)',1,'international','International','International',1),
	(8,2,'la-designation','La désignation','La désignation',2,'create-a-biosphere','Create a biosphere','Create a biosphere',3,'la-designation','La désignation','La désignation',2),
	(14,4,'le-mab-france','Le Mab France','Le Mab France',3,'mab-france-en','Mab France(en)','Mab France(en)',2,'le-mab-france','Le Mab France','Le Mab France',3);

/*!40000 ALTER TABLE `sym_entries_data_7` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_8
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_8`;

CREATE TABLE `sym_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_8` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_8` DISABLE KEYS */;

INSERT INTO `sym_entries_data_8` (`id`, `entry_id`, `relation_id`)
VALUES
	(8,1,2),
	(3,8,4),
	(4,10,2);

/*!40000 ALTER TABLE `sym_entries_data_8` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_9
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_9`;

CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_9` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_9` DISABLE KEYS */;

INSERT INTO `sym_entries_data_9` (`id`, `entry_id`, `relation_id`)
VALUES
	(1,9,8);

/*!40000 ALTER TABLE `sym_entries_data_9` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions`;

CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`)
VALUES
	(1,'jit_image_manipulation','enabled','2.0.0'),
	(2,'markdown','enabled','1.21'),
	(3,'xssfilter','enabled','1.5.0'),
	(4,'debugdevkit','enabled','1.3.4'),
	(9,'languages','enabled','1.2.2'),
	(6,'selectbox_link_field','enabled','2.0.2'),
	(7,'profiledevkit','enabled','1.5.2'),
	(8,'maintenance_mode','enabled','1.9.3'),
	(10,'flang_detection_gtlds','enabled','2.0.0'),
	(11,'frontend_localisation','enabled','2.7.3'),
	(50,'ckeditor','enabled','1.4.1'),
	(13,'association_field','enabled','2.0.2'),
	(14,'cache_management','enabled','1.3.4'),
	(15,'content_type_mappings','enabled','1.6.3'),
	(16,'datetime','enabled','3.8.3'),
	(17,'email_template_manager','enabled','7.5.0'),
	(18,'expressionfield','enabled','1.2.0'),
	(19,'field_divider','enabled','1.0'),
	(20,'field_group','enabled','1.0'),
	(21,'multilingual_field','enabled','3.5.14'),
	(22,'system_date_fields','enabled','1.2.2'),
	(23,'google_analytics_dashboard','enabled','1.0.3'),
	(24,'google_recaptcha','enabled','1.1.0'),
	(25,'html_panel','enabled','1.5.3'),
	(26,'html5_doctype','enabled','1.3.5'),
	(27,'image_preview','enabled','2.4.0'),
	(28,'importcsv','enabled','1.0.1'),
	(29,'maplocationfield','enabled','3.4.3'),
	(30,'multiuploadfield','enabled','1.6.1'),
	(31,'numberfield','enabled','1.7.2'),
	(32,'order_entries','enabled','2.3.8'),
	(33,'page_lhandles','enabled','2.11.1'),
	(34,'parenthesistabs','enabled','1.0.0'),
	(35,'reflectionfield','enabled','2.0.3'),
	(36,'remote_datasource','enabled','2.3.0'),
	(37,'richtext_tinymce','enabled','3.0.1'),
	(38,'search_index','enabled','0.9.5'),
	(39,'sitemap_xml','enabled','2.6'),
	(40,'sitemap_xml_ping','enabled','1.1'),
	(41,'textboxfield','enabled','2.7.3'),
	(42,'tracker','enabled','2.1.1'),
	(43,'valTheme','enabled','1.4'),
	(44,'dynamic_text_field','enabled','0.1'),
	(45,'lang_french','enabled','1.2'),
	(46,'association_ui_editor_materie','enabled','1.1.3'),
	(47,'association_ui_selector_materie','enabled','1.4.7'),
	(49,'valtheme','enabled','1.4');

/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_extensions_delegates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions_delegates`;

CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`)
VALUES
	(1,1,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(2,1,'/system/preferences/','Save','__SavePreferences'),
	(3,1,'/all/','ModifySymphonyLauncher','modifySymphonyLauncher'),
	(4,3,'/blueprints/events/','AppendEventFilterDocumentation','appendEventFilterDocumentation'),
	(5,3,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),
	(6,3,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),
	(7,3,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),
	(8,3,'/frontend/','FrontendParamsResolve','frontendParamsResolve'),
	(9,4,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(10,4,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(21,9,'/frontend/','ManageEXSLFunctions','dManageEXSLFunctions'),
	(12,7,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(13,7,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(14,8,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(15,8,'/system/preferences/','Save','__SavePreferences'),
	(16,8,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),
	(17,8,'/backend/','AppendPageAlert','__appendAlert'),
	(18,8,'/blueprints/pages/','AppendPageContent','__appendType'),
	(19,8,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),
	(20,8,'/frontend/','FrontendParamsResolve','__addParam'),
	(28,10,'/extensions/frontend_localisation/','FLSavePreferences','dFLSavePreferences'),
	(23,11,'/frontend/','FrontendInitialised','dFrontendInitialised'),
	(24,11,'/frontend/','FrontendParamsPostResolve','dFrontendParamsPostResolve'),
	(25,11,'/backend/','AdminPagePreBuild','dAdminPagePreBuild'),
	(26,11,'/system/preferences/','AddCustomPreferenceFieldsets','dAddCustomPreferenceFieldsets'),
	(27,11,'/system/preferences/','Save','dSave'),
	(156,50,'/system/preferences/','Save','savePresets'),
	(155,50,'/system/preferences/','AddCustomPreferenceFieldsets','appendPresets'),
	(154,50,'/backend/','ModifyTextBoxFullFieldPublishWidget','applyCKEditor'),
	(153,50,'/backend/','ModifyTextareaFieldPublishWidget','applyCKEditor'),
	(34,13,'/backend/','InitaliseAdminPageHead','appendAssets'),
	(35,14,'/backend/','NavigationPreRender','navigationPreRender'),
	(36,15,'/frontend/','FrontendPreRenderHeaders','setContentType'),
	(37,15,'/system/preferences/','AddCustomPreferenceFieldsets','addCustomPreferenceFieldsets'),
	(38,15,'/system/preferences/','Save','save'),
	(39,15,'/backend/','AdminPagePreGenerate','__appendAssets'),
	(40,16,'/system/preferences/','AddCustomPreferenceFieldsets','__addPreferences'),
	(41,16,'/system/preferences/','Save','__savePreferences'),
	(42,17,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),
	(43,17,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),
	(44,17,'/frontend/','EventFinalSaveFilter','eventFinalSaveFilter'),
	(45,17,'/blueprints/events/edit/','AppendEventFilterDocumentation','appendEventFilterDocumentation'),
	(46,17,'/blueprints/datasources/','DatasourcePostEdit','datasourcePostEdit'),
	(47,19,'/backend/','InitaliseAdminPageHead','initializeAdmin'),
	(48,20,'/backend/','InitaliseAdminPageHead','initializeAdmin'),
	(49,21,'/system/preferences/','AddCustomPreferenceFieldsets','dAddCustomPreferenceFieldsets'),
	(50,21,'/system/preferences/','Save','dSave'),
	(51,21,'/extensions/frontend_localisation/','FLSavePreferences','dFLSavePreferences'),
	(52,22,'/backend/','InitialiseAdminPageHead','appendAssets'),
	(53,23,'/backend/','DashboardPanelRender','dashboard_render_panel'),
	(54,23,'/backend/','DashboardPanelTypes','dashboard_panel_types'),
	(55,23,'/backend/','DashboardPanelOptions','dashboard_panel_options'),
	(56,23,'/backend/','DashboardPanelValidate','dashboard_panel_validate'),
	(57,24,'/blueprints/events/new/','AppendEventFilter','addFilterToEventEditor'),
	(58,24,'/blueprints/events/edit/','AppendEventFilter','addFilterToEventEditor'),
	(59,24,'/system/preferences/','Save','save_preferences'),
	(60,24,'/system/preferences/success/','Save','save_preferences'),
	(61,24,'/system/preferences/','AddCustomPreferenceFieldsets','append_preferences'),
	(62,24,'/frontend/','FrontendParamsResolve','addReCaptchaParams'),
	(63,24,'/frontend/','EventPreSaveFilter','processEventData'),
	(64,26,'/frontend/','FrontendOutputPostGenerate','parse_html'),
	(65,26,'/frontend/','FrontendPageResolved','setRenderTrigger'),
	(66,26,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(67,27,'/backend/','InitaliseAdminPageHead','appendJS'),
	(68,32,'/backend/','InitialiseAdminPageHead','prepareIndex'),
	(69,32,'/backend/','AdminPagePreGenerate','adjustTable'),
	(70,32,'/backend/','AdminPagePostGenerate','resetPagination'),
	(71,32,'/frontend/','DataSourcePreExecute','saveFilterContext'),
	(72,33,'/blueprints/pages/','AppendPageContent','dAppendPageContent'),
	(73,33,'/frontend/','FrontendPrePageResolve','dFrontendPrePageResolve'),
	(74,33,'/system/preferences/','AddCustomPreferenceFieldsets','dAddCustomPreferenceFieldsets'),
	(75,33,'/system/preferences/','CustomActions','dCustomActions'),
	(76,33,'/extensions/frontend_localisation/','FLSavePreferences','dFLSavePreferences'),
	(77,33,'/backend/','AppendPageAlert','dAppendPageAlert'),
	(78,33,'/blueprints/datasources/','DatasourcePreCreate','dDatasourceNavigation'),
	(79,33,'/blueprints/datasources/','DatasourcePreEdit','dDatasourceNavigation'),
	(80,33,'/blueprints/pages/','PagePreCreate','dPagePre'),
	(81,33,'/blueprints/pages/','PagePreEdit','dPagePre'),
	(82,34,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead'),
	(83,35,'/publish/new/','EntryPostCreate','compileBackendFields'),
	(84,35,'/publish/edit/','EntryPostEdit','compileBackendFields'),
	(85,35,'/xmlimporter/importers/run/','XMLImporterEntryPostCreate','compileBackendFields'),
	(86,35,'/xmlimporter/importers/run/','XMLImporterEntryPostEdit','compileBackendFields'),
	(87,35,'/frontend/','EventPostSaveFilter','compileFrontendFields'),
	(88,36,'/system/preferences/','AddCachingOpportunity','addCachingOpportunity'),
	(89,37,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead'),
	(90,38,'/publish/new/','EntryPostCreate','indexEntry'),
	(91,38,'/publish/edit/','EntryPostEdit','indexEntry'),
	(92,38,'/publish/','EntryPostDelete','deleteEntryIndex'),
	(93,38,'/frontend/','EventPostSaveFilter','indexEntry'),
	(94,38,'/backend/','DashboardPanelRender','renderPanel'),
	(95,38,'/backend/','DashboardPanelTypes','dashboardPanelTypes'),
	(96,39,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(97,39,'/backend/','InitaliseAdminPageHead','appendPageHead'),
	(98,40,'/system/preferences/','AddCustomPreferenceFieldsets','addCustomPreferenceFieldsets'),
	(99,40,'/publish/new/','EntryPostCreate','entryPostEdit'),
	(100,40,'/publish/edit/','EntryPostEdit','entryPostEdit'),
	(101,42,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(102,42,'/system/preferences/','CustomActions','savePreferences'),
	(103,42,'/publish/new/','EntryPostCreate','parseEntryAction'),
	(104,42,'/publish/edit/','EntryPostEdit','parseEntryAction'),
	(105,42,'/publish/','EntryPreDelete','parseEntryAction'),
	(106,42,'/frontend/','EventPostSaveFilter','parseEventSave'),
	(107,42,'/blueprints/pages/','PagePostCreate','parsePageAction'),
	(108,42,'/blueprints/pages/','PagePostEdit','parsePageAction'),
	(109,42,'/blueprints/pages/','PagePreDelete','parsePageAction'),
	(110,42,'/blueprints/events/','EventPostCreate','parseEventAction'),
	(111,42,'/blueprints/events/','EventPostEdit','parseEventAction'),
	(112,42,'/blueprints/events/','EventPreDelete','parseEventAction'),
	(113,42,'/blueprints/datasources/','DatasourcePostCreate','parseDatasourceAction'),
	(114,42,'/blueprints/datasources/','DatasourcePostEdit','parseDatasourceAction'),
	(115,42,'/blueprints/datasources/','DatasourcePreDelete','parseDatasourceAction'),
	(116,42,'/blueprints/utilities/','UtilityPostCreate','parseUtilityAction'),
	(117,42,'/blueprints/utilities/','UtilityPostEdit','parseUtilityAction'),
	(118,42,'/blueprints/utilities/','UtilityPreDelete','parseUtilityAction'),
	(119,42,'/blueprints/sections/','SectionPostCreate','parseSectionAction'),
	(120,42,'/blueprints/sections/','SectionPostEdit','parseSectionAction'),
	(121,42,'/blueprints/sections/','SectionPreDelete','parseSectionAction'),
	(122,42,'/system/authors/','AuthorPostCreate','parseAuthorAction'),
	(123,42,'/system/authors/','AuthorPostEdit','parseAuthorAction'),
	(124,42,'/system/authors/','AuthorPreDelete','parseAuthorAction'),
	(125,42,'/system/extensions/','ExtensionPreEnable','parseExtensionAction'),
	(126,42,'/system/extensions/','ExtensionPreDisable','parseExtensionAction'),
	(127,42,'/system/extensions/','ExtensionPreUninstall','parseExtensionAction'),
	(128,42,'/system/preferences/','Save','parsePreferencesSave'),
	(129,42,'/login/','AuthorLoginFailure','parseLogin'),
	(130,42,'/login/','AuthorLoginSuccess','parseLogin'),
	(131,42,'/login/','AuthorPostPasswordResetSuccess','parsePasswordAction'),
	(132,42,'/login/','AuthorPostPasswordResetFailure','parsePasswordAction'),
	(133,42,'/login/','AuthorPostPasswordChange','parsePasswordAction'),
	(134,42,'/login/','AuthorPostPasswordResetRequest','parsePasswordAction'),
	(135,42,'/frontend/','MembersPostLogin','parseMembersLogin'),
	(136,42,'/frontend/','MembersLoginFailure','parseMembersLoginFailure'),
	(137,42,'/frontend/','MembersPostActivation','parseMembersPostActivation'),
	(138,42,'/frontend/','MembersPostForgotPassword','parseMembersPostForgotPassword'),
	(139,42,'/frontend/','MembersPostRegenerateActivationCode','parseMembersPostRegenerateActivationCode'),
	(140,42,'/frontend/','MembersPostResetPassword','parseMembersPostResetPassword'),
	(141,42,'/frontend/','MembersPasswordResetFailure','parseMembersPasswordResetFailure'),
	(142,42,'/backend/','DashboardPanelRender','renderPanel'),
	(143,42,'/backend/','DashboardPanelOptions','dashboardPanelOptions'),
	(144,42,'/backend/','DashboardPanelTypes','dashboardPanelTypes'),
	(148,43,'/backend/','InitaliseAdminPageHead','appendAssets'),
	(149,46,'/backend/','InitaliseAdminPageHead','appendAssets'),
	(150,47,'/backend/','InitaliseAdminPageHead','appendAssets'),
	(152,49,'/backend/','InitaliseAdminPageHead','appendAssets');

/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields`;

CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;

INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`)
VALUES
	(2,'Nom','nom','multilingual_textbox',1,'no',0,'main','yes'),
	(3,'Contenu','contenu','multilingual_textbox',1,'no',3,'main','yes'),
	(4,'Publié','publie','checkbox',1,'no',4,'sidebar','yes'),
	(5,'Créé le','cree-le','systemcreateddate',1,'no',5,'sidebar','yes'),
	(6,'Modifié le','modifie-le','systemmodifieddate',1,'no',6,'sidebar','yes'),
	(7,'Nom','nom','multilingual_textbox',2,'yes',0,'main','yes'),
	(8,'Menu niveau 1','rubrique-parente','association',1,'no',1,'sidebar','yes'),
	(9,'Menu niveau 2 (page)','menu-niveau-2-page','association',1,'no',2,'sidebar','yes'),
	(12,'Image','image','upload',5,'yes',0,'sidebar','yes'),
	(13,'Titre','titre','input',6,'yes',0,'main','yes'),
	(14,'statut','statut','select',6,'yes',1,'sidebar','yes'),
	(15,'Date','date','datetime',6,'yes',2,'sidebar','yes'),
	(16,'Publié','publie','checkbox',6,'no',3,'sidebar','yes'),
	(17,'Auteur','auteur','author',6,'yes',4,'sidebar','yes'),
	(18,'Texte','texte','textarea',6,'yes',5,'main','yes'),
	(19,'Nom du document joint','nom-du-document-joint','input',6,'no',6,'main','yes'),
	(20,'Document joint','document-joint','upload',6,'no',7,'sidebar','yes'),
	(21,'guid','guid','input',6,'no',8,'sidebar','yes'),
	(22,'Date rss','date-rss','date',6,'no',9,'sidebar','yes'),
	(23,'thumbnail','thumbnail','input',6,'no',10,'main','yes');

/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_association`;

CREATE TABLE `sym_fields_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_association` WRITE;
/*!40000 ALTER TABLE `sym_fields_association` DISABLE KEYS */;

INSERT INTO `sym_fields_association` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`)
VALUES
	(15,8,'no','no','7',20),
	(16,9,'no','no','2',20);

/*!40000 ALTER TABLE `sym_fields_association` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_author`;

CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_author` WRITE;
/*!40000 ALTER TABLE `sym_fields_author` DISABLE KEYS */;

INSERT INTO `sym_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`)
VALUES
	(3,17,'no','yes','author,manager,developer');

/*!40000 ALTER TABLE `sym_fields_author` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_checkbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_checkbox`;

CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;

INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`)
VALUES
	(13,4,'off',NULL),
	(16,16,'on',NULL);

/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_date`;

CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_date` DISABLE KEYS */;

INSERT INTO `sym_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`, `time`)
VALUES
	(1,22,'now','no','no');

/*!40000 ALTER TABLE `sym_fields_date` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_datetime`;

CREATE TABLE `sym_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_datetime` WRITE;
/*!40000 ALTER TABLE `sym_fields_datetime` DISABLE KEYS */;

INSERT INTO `sym_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`)
VALUES
	(4,15,1,1,0,0);

/*!40000 ALTER TABLE `sym_fields_datetime` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_dynamictextfield
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_dynamictextfield`;

CREATE TABLE `sym_fields_dynamictextfield` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_expression
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_expression`;

CREATE TABLE `sym_fields_expression` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_field_divider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_field_divider`;

CREATE TABLE `sym_fields_field_divider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `margin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show-label` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_field_group_end
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_field_group_end`;

CREATE TABLE `sym_fields_field_group_end` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_field_group_start
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_field_group_start`;

CREATE TABLE `sym_fields_field_group_start` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_html_panel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_html_panel`;

CREATE TABLE `sym_fields_html_panel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `url_expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table sym_fields_image_preview_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_image_preview_settings`;

CREATE TABLE `sym_fields_image_preview_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `field-handles` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table-width` int(11) unsigned DEFAULT NULL,
  `table-height` int(11) unsigned DEFAULT NULL,
  `table-resize` int(11) unsigned DEFAULT NULL,
  `table-position` int(11) unsigned DEFAULT NULL,
  `table-absolute` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `entry-width` int(11) unsigned DEFAULT NULL,
  `entry-height` int(11) unsigned DEFAULT NULL,
  `entry-resize` int(11) unsigned DEFAULT NULL,
  `entry-position` int(11) unsigned DEFAULT NULL,
  `entry-absolute` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_input
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_input`;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;

INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`)
VALUES
	(5,13,NULL),
	(6,19,NULL),
	(7,21,NULL),
	(8,23,NULL);

/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_languages`;

CREATE TABLE `sym_fields_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `available_codes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_maplocation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_maplocation`;

CREATE TABLE `sym_fields_maplocation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_location` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `default_location_coords` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `default_zoom` int(11) unsigned NOT NULL,
  `api_key` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_multilingual_textbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_multilingual_textbox`;

CREATE TABLE `sym_fields_multilingual_textbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') COLLATE utf8_unicode_ci DEFAULT 'medium',
  `text_formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `text_cdata` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `text_handle` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `handle_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `default_main_lang` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `required_languages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_multilingual_textbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_multilingual_textbox` DISABLE KEYS */;

INSERT INTO `sym_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `handle_unique`, `default_main_lang`, `required_languages`)
VALUES
	(27,2,75,'single','none',NULL,0,'no','yes','yes','yes','main'),
	(14,7,75,'single','none',NULL,150,'no','yes','yes','yes','all'),
	(28,3,75,'large','ckeditor_normal',NULL,0,'no','yes','yes','no','main');

/*!40000 ALTER TABLE `sym_fields_multilingual_textbox` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_multiupload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_multiupload`;

CREATE TABLE `sym_fields_multiupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_number
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_number`;

CREATE TABLE `sym_fields_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_order_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_order_entries`;

CREATE TABLE `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  `disable_pagination` enum('yes','no') DEFAULT 'no',
  `filtered_fields` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table sym_fields_reflection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_reflection`;

CREATE TABLE `sym_fields_reflection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `xsltfile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `override` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `hide` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `fetch_associated_counts` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_search_index`;

CREATE TABLE `sym_fields_search_index` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_select
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_select`;

CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;

INSERT INTO `sym_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `sort_options`, `static_options`, `dynamic_options`)
VALUES
	(4,14,'no','no','A faire, Fait',NULL);

/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_selectbox_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;

CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_systemcreateddate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_systemcreateddate`;

CREATE TABLE `sym_fields_systemcreateddate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `show_time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `use_timeago` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_systemcreateddate` WRITE;
/*!40000 ALTER TABLE `sym_fields_systemcreateddate` DISABLE KEYS */;

INSERT INTO `sym_fields_systemcreateddate` (`id`, `field_id`, `show_time`, `use_timeago`)
VALUES
	(13,5,'yes','no');

/*!40000 ALTER TABLE `sym_fields_systemcreateddate` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_systemmodifieddate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_systemmodifieddate`;

CREATE TABLE `sym_fields_systemmodifieddate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `show_time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `use_timeago` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_systemmodifieddate` WRITE;
/*!40000 ALTER TABLE `sym_fields_systemmodifieddate` DISABLE KEYS */;

INSERT INTO `sym_fields_systemmodifieddate` (`id`, `field_id`, `show_time`, `use_timeago`)
VALUES
	(13,6,'yes','no');

/*!40000 ALTER TABLE `sym_fields_systemmodifieddate` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_taglist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_taglist`;

CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_textarea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_textarea`;

CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;

INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`)
VALUES
	(4,18,'ckeditor_normal',15);

/*!40000 ALTER TABLE `sym_fields_textarea` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_fields_textbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_textbox`;

CREATE TABLE `sym_fields_textbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') COLLATE utf8_unicode_ci DEFAULT 'medium',
  `text_formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `text_cdata` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `text_handle` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `handle_unique` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_fields_upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_upload`;

CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_upload` WRITE;
/*!40000 ALTER TABLE `sym_fields_upload` DISABLE KEYS */;

INSERT INTO `sym_fields_upload` (`id`, `field_id`, `destination`, `validator`)
VALUES
	(9,12,'/workspace/images','/\\.(?:bmp|gif|jpe?g|png)$/i'),
	(6,20,'/workspace/uploads/actualites','/\\.(?:docx?|pdf|rtf|txt)$/i');

/*!40000 ALTER TABLE `sym_fields_upload` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_forgotpass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_forgotpass`;

CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages`;

CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `plh_t-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plh_h-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plh_t-fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plh_h-fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;

INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-fr`, `plh_h-fr`)
VALUES
	(1,NULL,'Accueil','accueil',NULL,'rubrique/s-rubrique/ss-rubrique','fl_languages,menu_principal,page_content,page_content_1level,plh_page,rubriques_principales',NULL,2,'Home','home','Accueil','accueil'),
	(3,NULL,'Mentions légales','mentions-legales',NULL,NULL,'menu_principal,page_content_1level',NULL,3,'Mentions légales (en)','mentions-legales-en','Mentions légales','mentions-legales');

/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_pages_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages_types`;

CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;

INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`)
VALUES
	(5,1,'index'),
	(6,1,'admin'),
	(7,3,'admin');

/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index`;

CREATE TABLE `sym_search_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_search_index_entry_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index_entry_keywords`;

CREATE TABLE `sym_search_index_entry_keywords` (
  `entry_id` int(11) DEFAULT NULL,
  `keyword_id` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  KEY `entry_id` (`entry_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_search_index_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index_keywords`;

CREATE TABLE `sym_search_index_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_search_index_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_search_index_logs`;

CREATE TABLE `sym_search_index_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords_manipulated` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sections` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page` int(11) NOT NULL,
  `results` int(11) DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections`;

CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `filter` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  `author_id` int(11) unsigned NOT NULL DEFAULT '1',
  `modification_author_id` int(11) unsigned NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `creation_date_gmt` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `modification_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `modification_date_gmt` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;

INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `filter`, `navigation_group`, `author_id`, `modification_author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`)
VALUES
	(1,'Pages','page',3,'no','yes','Contenus',1,1,'2017-11-22 20:58:49','2017-11-22 19:58:49','2018-01-13 15:36:45','2018-01-13 14:36:45'),
	(2,'Rubriques principales','rubriques',2,'no','no','Contenus',1,1,'2017-11-23 10:28:39','2017-11-23 09:28:39','2018-01-13 15:36:45','2018-01-13 14:36:45'),
	(5,'Images','images',4,'no','yes','Contenus',1,1,'2018-01-10 17:05:01','2018-01-10 16:05:01','2018-01-13 15:38:55','2018-01-13 14:38:55'),
	(6,'Actualités','actualites',1,'no','no','Contenus',1,1,'2018-01-13 15:29:44','2018-01-13 14:29:44','2018-01-13 15:36:45','2018-01-13 14:36:45');

/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_sections_association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections_association`;

CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `interface` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;

INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`)
VALUES
	(15,2,7,1,8,'yes','aui-selector','aui-editor-new'),
	(16,1,2,1,9,'yes','aui-selector',NULL);

/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sessions`;

CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;

INSERT INTO `sym_sessions` (`session`, `session_expires`, `session_data`)
VALUES
	('5a8aca89714c4c48ba05222f3a60e031',1515858721,'sym-|a:2:{s:8:\"username\";s:6:\"valery\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|6a27ba7a8ccd424e755a|zsJqLZuA0O6067f0ur/117DDkevVsR51F5K6QXX8CMmljYsUmRXMow==\";}'),
	('8c745b78b83159c3bb08701b88ce1cc5',1515600636,'sym-|a:0:{}'),
	('2b83b25d8c8ef3688531e012a53a43f6',1515412551,'sym-|a:0:{}'),
	('374f719c0fc7331724af91e99a71aad7',1515576441,'sym-|a:2:{s:8:\"username\";s:6:\"valery\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|6a27ba7a8ccd424e755a|zsJqLZuA0O6067f0ur/117DDkevVsR51F5K6QXX8CMmljYsUmRXMow==\";}'),
	('8f8bbad40ecefda36e513153a8e89f9f',1515412543,'sym-|a:0:{}'),
	('3f0bbd1d0686950871d2e64c54f99165',1515407381,'sym-|a:0:{}'),
	('17a8d30b6e616a1ab18085cf6823daff',1515085456,'sym-|a:0:{}'),
	('c129018bfe31a675baf146d59c036c1c',1515086990,'sym-|a:2:{s:8:\"username\";s:6:\"valery\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|6a27ba7a8ccd424e755a|zsJqLZuA0O6067f0ur/117DDkevVsR51F5K6QXX8CMmljYsUmRXMow==\";}'),
	('b4b293b82204074dc0bd0b702ba53388',1515085222,'sym-|a:0:{}'),
	('4d42e18ac74accd1f095107f72a6cb9d',1515600613,'sym-|a:2:{s:8:\"username\";s:6:\"valery\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|6a27ba7a8ccd424e755a|zsJqLZuA0O6067f0ur/117DDkevVsR51F5K6QXX8CMmljYsUmRXMow==\";}'),
	('282b611c851132cc730a1eed60774220',1515084750,'sym-|a:0:{}'),
	('9ea2129163edae78a9da636bbf0b6a7a',1515084757,'sym-|a:0:{}'),
	('58178cadb3e5aa08a0f106df2dfd07d6',1515084758,'sym-|a:0:{}'),
	('5f49cb3d9af58bca4ed5037ae81a1ccf',1515084765,'sym-|a:0:{}'),
	('492911959593a361edb74a9bace5c950',1515084772,'sym-|a:0:{}'),
	('66da590e5e5390bffdd501ed1360b584',1515084775,'sym-|a:0:{}'),
	('7c17c24af57ed7dc6c6d44d4ca989429',1515084819,'sym-|a:0:{}'),
	('48e5cec5f985a9d956d6313afc3cba0b',1515085018,'sym-|a:0:{}'),
	('d1bbcc09ae6ebcfeac4e3763f7c6966b',1515085023,'sym-|a:0:{}'),
	('0b712ac71ba2667abec1bf4ec9954e69',1515085189,'sym-|a:0:{}'),
	('72e5889cfd5c9849dc427ed378bc7ec4',1515085197,'sym-|a:0:{}'),
	('521a339b422df27852030ef2a7f58ec9',1515085205,'sym-|a:0:{}'),
	('bc358f008bf2c3324272517b993c753c',1515085209,'sym-|a:0:{}');

/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_sitemap_xml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sitemap_xml`;

CREATE TABLE `sym_sitemap_xml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(4) unsigned DEFAULT NULL,
  `datasource_handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relative_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datasource_handle_page_id_relative_url` (`datasource_handle`(75),`page_id`,`relative_url`(75))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_tracker_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_tracker_activity`;

CREATE TABLE `sym_tracker_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fallback_username` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fallback_description` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_tracker_activity` WRITE;
/*!40000 ALTER TABLE `sym_tracker_activity` DISABLE KEYS */;

INSERT INTO `sym_tracker_activity` (`id`, `item_type`, `item_id`, `action_type`, `user_id`, `timestamp`, `fallback_username`, `fallback_description`)
VALUES
	(1,'extensions','valTheme','enabled',1,'2017-11-22 16:35:14','Valéry Frisch','the Val Theme extension'),
	(2,'preferences',NULL,'updated',1,'2017-11-22 16:37:52','Valéry Frisch',' the <a href=\"http://mab-france-new.dev/symphony/system/preferences\">system preferences</a>'),
	(3,'extensions','valTheme','enabled',1,'2017-11-22 16:39:39','Valéry Frisch','the Val Theme extension'),
	(4,'pages','1','created',1,'2017-11-22 16:40:45','Valéry Frisch',' the Accueil page'),
	(5,'pages','1','updated',1,'2017-11-22 16:41:16','Valéry Frisch',' the Accueil page'),
	(6,'extensions','valTheme','enabled',1,'2017-11-22 17:02:33','Valéry Frisch','the Val Theme extension'),
	(7,'login','::1','attempted to log in',0,'2017-11-22 17:03:31','An unidentified user (::1)',' to the back end'),
	(8,'login',NULL,'logged in',1,'2017-11-22 17:03:37','Valéry Frisch',' to the back end'),
	(9,'extensions','valTheme','enabled',1,'2017-11-22 17:03:49','Valéry Frisch','the Val Theme extension'),
	(10,'extensions','dynamic_text_field','enabled',1,'2017-11-22 19:58:19','Valéry Frisch','the Dynamic Text Field extension'),
	(11,'sections','1','created',1,'2017-11-22 19:58:49','Valéry Frisch',' the Page section'),
	(12,'1','1','created',1,'2017-11-22 19:59:21','Valéry Frisch',':::Page'),
	(13,'sections','1','updated',1,'2017-11-22 20:04:12','Valéry Frisch',' the Page section'),
	(14,'1','1','updated',1,'2017-11-22 20:15:59','Valéry Frisch','Candidature:::Page'),
	(15,'1','1','updated',1,'2017-11-22 20:16:20','Valéry Frisch','Candidater(en):::Page'),
	(16,'sections','1','updated',1,'2017-11-22 20:18:05','Valéry Frisch',' the Page section'),
	(17,'1','1','updated',1,'2017-11-22 20:18:24','Valéry Frisch','Candidater(en):::Page'),
	(18,'extensions','lang_french','enabled',1,'2017-11-22 20:18:52','Valéry Frisch','the Language: French extension'),
	(19,'preferences',NULL,'updated',1,'2017-11-22 20:19:01','Valéry Frisch',' the <a href=\"http://mab-france-new.dev/symphony/system/preferences\">system preferences</a>'),
	(20,'sections','1','updated',1,'2017-11-22 20:20:20','Valéry Frisch',' the Page section'),
	(21,'1','1','updated',1,'2017-11-23 07:17:13','Valéry Frisch','Candidature:::Page'),
	(22,'1','1','updated',1,'2017-11-23 07:17:46','Valéry Frisch','Candidature:::Page'),
	(23,'datasources','data.page_content.php','created',1,'2017-11-23 07:19:39','Valéry Frisch',' the Page content data source'),
	(24,'datasources','data.page_content.php','updated',1,'2017-11-23 07:29:48','Valéry Frisch',' the Page content data source'),
	(25,'1','1','updated',1,'2017-11-23 07:49:25','Valéry Frisch','Candidature:::Page'),
	(26,'login',NULL,'logged in',1,'2017-11-23 09:25:29','Valéry Frisch',' to the back end'),
	(27,'sections','2','created',1,'2017-11-23 09:28:39','Valéry Frisch',' the Rubriques principales section'),
	(28,'sections','1','updated',1,'2017-11-23 09:29:22','Valéry Frisch',' the Page section'),
	(29,'extensions','association_ui_editor_materie','enabled',1,'2017-11-23 09:31:19','Valéry Frisch','the Association UI: Editor (Materie) extension'),
	(30,'extensions','association_ui_selector_materie','enabled',1,'2017-11-23 09:31:19','Valéry Frisch','the Association UI: Selector (Materie) extension'),
	(31,'sections','1','updated',1,'2017-11-23 09:31:46','Valéry Frisch',' the Page section'),
	(32,'2','2','created',1,'2017-11-23 09:32:42','Valéry Frisch','Désignation:::Rubriques principales'),
	(33,'1','1','updated',1,'2017-11-23 09:32:59','Valéry Frisch','Candidature:::Page'),
	(34,'sections','1','updated',1,'2017-11-23 09:33:16','Valéry Frisch',' the Page section'),
	(35,'2','3','created',1,'2017-11-23 09:35:30','Valéry Frisch','Démarche:::Rubriques principales'),
	(36,'2','4','created',1,'2017-11-23 09:35:47','Valéry Frisch','Le Mab France:::Rubriques principales'),
	(37,'2','5','created',1,'2017-11-23 09:36:12','Valéry Frisch','Les réserves de Biosphères:::Rubriques principales'),
	(38,'2','6','created',1,'2017-11-23 09:36:28','Valéry Frisch','Nos actions:::Rubriques principales'),
	(39,'2','7','created',1,'2017-11-23 09:36:42','Valéry Frisch','International:::Rubriques principales'),
	(40,'sections','2','updated',1,'2017-11-23 09:42:09','Valéry Frisch',' the Rubriques principales section'),
	(41,'sections','1','updated',1,'2017-11-23 09:43:21','Valéry Frisch',' the Page section'),
	(42,'2','2','updated',1,'2017-11-23 09:44:01','Valéry Frisch','Désignation:::Rubriques principales'),
	(43,'datasources','data.page_content.php','updated',1,'2017-11-23 09:44:30','Valéry Frisch',' the Page content data source'),
	(44,'authors','1','updated',1,'2017-11-23 09:47:40','Valéry Frisch',' their author record'),
	(45,'login',NULL,'logged in',1,'2017-11-25 10:14:29','Valéry Frisch',' to the back end'),
	(46,'extensions','asset_pipeline_less','enabled',1,'2017-11-25 10:41:25','Valéry Frisch','the Asset Pipeline Less Compiler extension'),
	(47,'preferences',NULL,'updated',1,'2017-11-25 15:44:26','Valéry Frisch',' the <a href=\"http://mab-france-new.dev/symphony/system/preferences\">system preferences</a>'),
	(48,'preferences',NULL,'updated',1,'2017-11-25 15:45:08','Valéry Frisch',' the <a href=\"http://mab-france-new.dev/symphony/system/preferences\">system preferences</a>'),
	(49,'extensions','asset_pipeline','uninstalled',1,'2017-11-25 15:46:16','Valéry Frisch','the Asset Pipeline extension'),
	(50,'extensions','asset_pipeline_less','uninstalled',1,'2017-11-25 15:46:16','Valéry Frisch','the Asset Pipeline Less Compiler extension'),
	(51,'datasources','data.rubriques_principales.php','created',1,'2017-11-26 20:27:45','Valéry Frisch',' the Rubriques principales data source'),
	(52,'2','2','updated',1,'2017-11-27 13:36:44','Valéry Frisch','La désignation:::Rubriques principales'),
	(53,'1','1','updated',1,'2017-11-27 13:36:50','Valéry Frisch','Candidature:::Page'),
	(54,'sections','1','updated',1,'2017-11-27 13:57:44','Valéry Frisch',' the Page section'),
	(55,'1','8','created',1,'2017-11-27 13:59:34','Valéry Frisch','Groupes de travail:::Page'),
	(56,'1','9','created',1,'2017-11-27 14:00:13','Valéry Frisch','Les groupes thématiques:::Page'),
	(57,'sections','1','updated',1,'2017-11-27 14:00:28','Valéry Frisch',' the Page section'),
	(58,'datasources','data.page_content.php','updated',1,'2017-11-27 14:01:45','Valéry Frisch',' the Page content data source'),
	(59,'1','10','created',1,'2017-11-27 14:33:46','Valéry Frisch','Construire la réserve de biosphère:::Page'),
	(60,'pages','1','updated',1,'2017-11-27 20:38:58','Valéry Frisch',' the Accueil page'),
	(61,'2','7','updated',1,'2017-11-27 21:24:05','Valéry Frisch','International:::Rubriques principales'),
	(62,'2','3','updated',1,'2017-11-27 21:24:17','Valéry Frisch','Démarche:::Rubriques principales'),
	(63,'2','5','updated',1,'2017-11-27 21:24:34','Valéry Frisch','Les réserves de Biosphères:::Rubriques principales'),
	(64,'2','6','updated',1,'2017-11-27 21:24:42','Valéry Frisch','Nos actions:::Rubriques principales'),
	(65,'2','4','updated',1,'2017-11-27 21:25:08','Valéry Frisch','Le Mab France (en):::Rubriques principales'),
	(66,'2','4','updated',1,'2017-11-27 21:25:29','Valéry Frisch','Le Mab France:::Rubriques principales'),
	(67,'login',NULL,'logged in',1,'2017-11-28 19:29:13','Valéry Frisch',' to the back end'),
	(68,'sections','3','created',1,'2017-11-28 20:55:56','Valéry Frisch',' the Image uploader section'),
	(69,'sections','3','updated',1,'2017-11-28 20:56:43','Valéry Frisch',' the Image uploader section'),
	(70,'events','event.image_upload.php','created',1,'2017-11-28 20:57:23','Valéry Frisch',' the Image upload event'),
	(71,'pages','2','created',1,'2017-11-28 20:58:04','Valéry Frisch',' the image upload page'),
	(72,'pages','2','deleted',1,'2017-11-28 21:04:30','Valéry Frisch',' the image upload page'),
	(73,'sections','3','deleted',1,'2017-11-28 21:04:51','Valéry Frisch',' the Image uploader section'),
	(74,'1','1','updated',1,'2017-11-29 14:53:40','Valéry Frisch','Candidature:::Page'),
	(75,'pages','3','created',1,'2017-11-29 16:33:58','Valéry Frisch',' the Mentions légales page'),
	(76,'datasources','data.page_content.php','updated',1,'2017-12-10 11:49:19','Valéry Frisch',' the Page content data source'),
	(77,'datasources','data.page_content.php','updated',1,'2017-12-10 11:49:45','Valéry Frisch',' the Page content data source'),
	(78,'datasources','data.menu_principal.php','created',1,'2017-12-10 11:51:43','Valéry Frisch',' the Menu principal data source'),
	(79,'datasources','data.page_content.php','updated',1,'2017-12-10 11:52:41','Valéry Frisch',' the Page content data source'),
	(80,'datasources','data.menu_principal.php','updated',1,'2017-12-10 13:31:45','Valéry Frisch',' the Menu principal data source'),
	(81,'datasources','data.page_content.php','updated',1,'2017-12-10 13:33:35','Valéry Frisch',' the Page content data source'),
	(82,'pages','1','updated',1,'2017-12-10 13:38:04','Valéry Frisch',' the Accueil page'),
	(83,'1','11','created',1,'2017-12-10 13:42:42','Valéry Frisch','International:::Page'),
	(84,'datasources','data.page_content.php','updated',1,'2017-12-10 13:43:59','Valéry Frisch',' the Page content data source'),
	(85,'datasources','data.page_content.php','updated',1,'2017-12-10 13:46:59','Valéry Frisch',' the Page content data source'),
	(86,'sections','1','updated',1,'2017-12-10 13:49:34','Valéry Frisch',' the Page section'),
	(87,'1','11','deleted',1,'2017-12-10 14:00:22','Valéry Frisch','International:::Page'),
	(88,'datasources','data.page_content.php','updated',1,'2017-12-10 14:03:06','Valéry Frisch',' the Page content data source'),
	(89,'datasources','data.page_content.php','updated',1,'2017-12-10 14:12:00','Valéry Frisch',' the Page content data source'),
	(90,'datasources','data.page_content.php','updated',1,'2017-12-10 14:12:11','Valéry Frisch',' the Page content data source'),
	(91,'datasources','data.page_content.php','updated',1,'2017-12-10 14:28:34','Valéry Frisch',' the Page content data source'),
	(92,'datasources','data.page_content.php','updated',1,'2017-12-10 14:32:34','Valéry Frisch',' the Page content data source'),
	(93,'datasources','data.page_content.php','updated',1,'2017-12-10 14:33:45','Valéry Frisch',' the Page content data source'),
	(94,'datasources','data.page_content.php','updated',1,'2017-12-10 14:34:41','Valéry Frisch',' the Page content data source'),
	(95,'datasources','data.page_content.php','updated',1,'2017-12-10 14:35:08','Valéry Frisch',' the Page content data source'),
	(96,'datasources','data.page_content.php','updated',1,'2017-12-10 14:36:05','Valéry Frisch',' the Page content data source'),
	(97,'1','1','updated',1,'2017-12-13 14:08:25','Valéry Frisch','Candidature:::Page'),
	(98,'1','1','updated',1,'2017-12-13 14:08:48','Valéry Frisch','Candidature:::Page'),
	(99,'1','1','updated',1,'2017-12-13 14:10:41','Valéry Frisch','Candidature:::Page'),
	(100,'login','::1','attempted to log in',0,'2017-12-16 09:25:47','An unidentified user (::1)',' to the back end'),
	(101,'login','::1','attempted to log in',0,'2017-12-16 09:25:57','An unidentified user (::1)',' to the back end'),
	(102,'login','::1','attempted to log in',0,'2017-12-16 09:26:03','An unidentified user (::1)',' to the back end'),
	(103,'login','::1','attempted to log in',0,'2017-12-16 09:26:11','An unidentified user (::1)',' to the back end'),
	(104,'login','::1','attempted to log in',0,'2017-12-16 09:27:00','An unidentified user (::1)',' to the back end'),
	(105,'login',NULL,'logged in',1,'2017-12-16 09:27:06','Valéry Frisch',' to the back end'),
	(106,'1','12','created',1,'2017-12-16 09:27:58','Valéry Frisch','Accueil:::Page'),
	(107,'login','::1','attempted to log in',0,'2018-01-04 16:59:57','An unidentified user (::1)',' to the back end'),
	(108,'login','::1','attempted to log in',0,'2018-01-04 17:00:05','An unidentified user (::1)',' to the back end'),
	(109,'login','::1','attempted to log in',0,'2018-01-04 17:00:09','An unidentified user (::1)',' to the back end'),
	(110,'login','::1','attempted to log in',0,'2018-01-04 17:00:22','An unidentified user (::1)',' to the back end'),
	(111,'login',NULL,'logged in',1,'2018-01-04 17:01:02','Valéry Frisch',' to the back end'),
	(112,'login',NULL,'logged in',1,'2018-01-04 17:04:24','Valéry Frisch',' to the back end'),
	(113,'sections','1','updated',1,'2018-01-04 17:05:41','Valéry Frisch',' the Page section'),
	(114,'1','12','updated',1,'2018-01-04 19:02:10','Valéry Frisch','Accueil:::Page'),
	(115,'datasources','data.page_content_1level.php','created',1,'2018-01-05 08:37:48','Valéry Frisch',' the Page content 1level data source'),
	(116,'datasources','data.menu_principal.php','updated',1,'2018-01-05 13:07:25','Valéry Frisch',' the Menu principal data source'),
	(117,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:09:31','Valéry Frisch',' the Page content 1level data source'),
	(118,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:10:36','Valéry Frisch',' the Page content 1level data source'),
	(119,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:18:40','Valéry Frisch',' the Page content 1level data source'),
	(120,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:22:50','Valéry Frisch',' the Page content 1level data source'),
	(121,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:23:58','Valéry Frisch',' the Page content 1level data source'),
	(122,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:24:21','Valéry Frisch',' the Page content 1level data source'),
	(123,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:24:49','Valéry Frisch',' the Page content 1level data source'),
	(124,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:25:58','Valéry Frisch',' the Page content 1level data source'),
	(125,'datasources','data.page_content_1level.php','updated',1,'2018-01-05 13:26:13','Valéry Frisch',' the Page content 1level data source'),
	(126,'login',NULL,'logged in',1,'2018-01-08 11:55:59','Valéry Frisch',' to the back end'),
	(127,'extensions','valtheme','enabled',1,'2018-01-08 12:04:30','Valéry Frisch','the Val Theme Admin extension'),
	(128,'1','12','updated',1,'2018-01-10 11:50:30','Valéry Frisch','Accueil:::Page'),
	(129,'1','12','updated',1,'2018-01-10 15:49:57','Valéry Frisch','Accueil:::Page'),
	(130,'extensions','ckeditor','enabled',1,'2018-01-10 16:02:49','Valéry Frisch','the CKEditor extension'),
	(131,'sections','4','created',1,'2018-01-10 16:03:21','Valéry Frisch',' the test editor section'),
	(132,'sections','5','created',1,'2018-01-10 16:05:01','Valéry Frisch',' the Pages : images section'),
	(133,'preferences',NULL,'updated',1,'2018-01-10 16:05:26','Valéry Frisch',' the <a href=\"http://mab-france-new.localhost/symphony/system/preferences\">system preferences</a>'),
	(134,'5','13','created',1,'2018-01-10 16:05:51','Valéry Frisch','iledesein.jpg:::Pages : images'),
	(135,'4','14','created',1,'2018-01-10 16:06:05','Valéry Frisch',':::test editor'),
	(136,'login',NULL,'logged in',1,'2018-01-10 16:10:41','Valéry Frisch',' to the back end'),
	(137,'preferences',NULL,'updated',1,'2018-01-10 16:14:21','Valéry Frisch',' the <a href=\"http://mab-france-new.localhost/symphony/system/preferences\">system preferences</a>'),
	(138,'sections','4','updated',1,'2018-01-10 16:14:32','Valéry Frisch',' the test editor section'),
	(139,'4','14','updated',1,'2018-01-10 16:17:00','Valéry Frisch',':::test editor'),
	(140,'4','14','updated',1,'2018-01-10 16:21:23','Valéry Frisch',':::test editor'),
	(141,'5','15','created',1,'2018-01-10 16:32:23','Valéry Frisch','grand-cul-de-sac-marin.jpg:::Pages : images'),
	(142,'4','14','updated',1,'2018-01-10 16:32:46','Valéry Frisch',':::test editor'),
	(143,'sections','1','updated',1,'2018-01-10 16:33:57','Valéry Frisch',' the Page section'),
	(144,'sections','5','updated',1,'2018-01-10 16:38:55','Valéry Frisch',' the Pages : images section'),
	(145,'sections','1','updated',1,'2018-01-13 14:14:51','Valéry Frisch',' the Page section'),
	(146,'sections','6','created',1,'2018-01-13 14:29:44','Valéry Frisch',' the Actualités section'),
	(147,'sections','6','updated',1,'2018-01-13 14:32:05','Valéry Frisch',' the Actualités section'),
	(148,'sections','6','updated',1,'2018-01-13 14:34:13','Valéry Frisch',' the Actualités section'),
	(149,'sections','6','updated',1,'2018-01-13 14:36:16','Valéry Frisch',' the Actualités section'),
	(150,'sections','4','deleted',1,'2018-01-13 14:37:35','Valéry Frisch',' the test editor section'),
	(151,'sections','5','updated',1,'2018-01-13 14:37:49','Valéry Frisch',' the Images section'),
	(152,'sections','5','updated',1,'2018-01-13 14:38:08','Valéry Frisch',' the Images section'),
	(153,'sections','5','updated',1,'2018-01-13 14:38:55','Valéry Frisch',' the Images section'),
	(154,'pages','1','updated',1,'2018-01-13 15:51:46','Valéry Frisch',' the Accueil page'),
	(155,'pages','3','updated',1,'2018-01-13 15:52:00','Valéry Frisch',' the Mentions légales page');

/*!40000 ALTER TABLE `sym_tracker_activity` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
