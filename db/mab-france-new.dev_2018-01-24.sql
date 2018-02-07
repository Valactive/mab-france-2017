# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: localhost (MySQL 5.6.35)
# Base de données: mab-france-new.dev
# Temps de génération: 2018-01-24 22:37:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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



# Affichage de la table sym_entries_data_24
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_24`;

CREATE TABLE `sym_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_25
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_25`;

CREATE TABLE `sym_entries_data_25` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_26
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_26`;

CREATE TABLE `sym_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sym_entries_data_27
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_27`;

CREATE TABLE `sym_entries_data_27` (
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

LOCK TABLES `sym_entries_data_27` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_27` DISABLE KEYS */;

INSERT INTO `sym_entries_data_27` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-fr`, `value-fr`, `value_formatted-fr`, `word_count-fr`)
VALUES
	(1,16,'brochure','Brochure','Brochure',1,'brochure','Brochure','Brochure',1,'brochure','Brochure','Brochure',1),
	(2,17,'publications-mab','Publications MAB','Publications MAB',2,'publications-mab','Publications MAB','Publications MAB',2,'publications-mab','Publications MAB','Publications MAB',2),
	(3,18,'publications-scientifiques','Publications scientifiques','Publications scientifiques',2,'publications-scientifiques','Publications scientifiques','Publications scientifiques',2,'publications-scientifiques','Publications scientifiques','Publications scientifiques',2);

/*!40000 ALTER TABLE `sym_entries_data_27` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table sym_entries_data_28
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_28`;

CREATE TABLE `sym_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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
	(49,'valtheme','enabled','1.4'),
	(51,'flang_redirection','enabled','2.0.2'),
	(52,'xmlimporter','enabled','3.0.0');

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
	(24,'Auteur de la publication','auteur-de-la-publication','input',6,'no',11,'sidebar','no'),
	(12,'Image','image','upload',5,'yes',0,'sidebar','yes'),
	(13,'Titre','titre','input',6,'yes',0,'main','yes'),
	(14,'statut','statut','select',6,'yes',1,'sidebar','yes'),
	(15,'Date','date','datetime',6,'yes',2,'sidebar','yes'),
	(16,'Publié','publie','checkbox',6,'no',3,'sidebar','yes'),
	(17,'Auteur','auteur','author',6,'no',4,'sidebar','yes'),
	(18,'Texte','texte','textarea',6,'yes',5,'main','no'),
	(19,'Nom du document joint','nom-du-document-joint','input',6,'no',6,'main','no'),
	(20,'Document joint','document-joint','upload',6,'no',7,'sidebar','no'),
	(21,'guid','guid','input',6,'no',8,'sidebar','no'),
	(22,'Date rss','date-rss','date',6,'no',9,'sidebar','no'),
	(23,'thumbnail','thumbnail','input',6,'no',10,'main','no'),
	(25,'Editeur','editeur','input',6,'no',12,'main','no'),
	(26,'Type de publication','type-de-publication','selectbox_link',6,'no',13,'main','yes'),
	(27,'Nom','nom','multilingual_textbox',7,'no',0,'main','yes'),
	(28,'Type','type','select',6,'no',14,'sidebar','yes');

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
	(19,8,'no','no','7',20),
	(20,9,'no','no','2',20);

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
	(10,17,'no','no','author,manager,developer');

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
	(18,4,'off',NULL),
	(25,16,'on',NULL);

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
	(8,22,'now','no','no');

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
	(11,15,0,1,0,0);

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
	(45,13,NULL),
	(46,19,NULL),
	(47,21,NULL),
	(48,23,NULL),
	(49,24,NULL),
	(50,25,NULL);

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
	(31,2,75,'single','none',NULL,0,'no','yes','yes','yes','main'),
	(14,7,75,'single','none',NULL,150,'no','yes','yes','yes','all'),
	(33,27,150,'single','none',NULL,0,'no','yes','yes','yes','main'),
	(32,3,75,'large','ckeditor_normal',NULL,0,'no','yes','yes','no','main');

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
	(16,14,'no','no','A faire, Fait',NULL),
	(17,28,'no','no','Actualité,Publication',NULL);

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

LOCK TABLES `sym_fields_selectbox_link` WRITE;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` DISABLE KEYS */;

INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`)
VALUES
	(7,26,'no','no','27',20);

/*!40000 ALTER TABLE `sym_fields_selectbox_link` ENABLE KEYS */;
UNLOCK TABLES;


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
	(15,5,'yes','no');

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
	(15,6,'yes','no');

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
	(11,18,'ckeditor_normal',15);

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
	(16,20,'/workspace/uploads/actualites','/\\.(?:docx?|pdf|rtf|txt)$/i');

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
	(1,NULL,'Accueil','accueil',NULL,'rubrique/s-rubrique/ss-rubrique','fl_languages,menu_principal,page_content,page_content_1level,plh_page,rubriques_principales,actualites_import','flang_redirect',2,'Home','home','Accueil','accueil'),
	(3,NULL,'Mentions légales','mentions-legales',NULL,NULL,'menu_principal,page_content_1level','flang_redirect',3,'Mentions légales (en)','mentions-legales-en','Mentions légales','mentions-legales');

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
	(8,1,'admin'),
	(10,3,'admin'),
	(9,1,'index');

/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'Pages','page',3,'no','yes','Contenus',1,1,'2017-11-22 20:58:49','2017-11-22 19:58:49','2018-01-17 16:23:16','2018-01-17 15:23:16'),
	(2,'Rubriques principales','rubriques',2,'no','no','Contenus',1,1,'2017-11-23 10:28:39','2017-11-23 09:28:39','2018-01-13 15:36:45','2018-01-13 14:36:45'),
	(7,'Types de publication','types-de-publication',5,'no','no','Contenus',1,1,'2018-01-24 13:56:43','2018-01-24 12:56:43','2018-01-24 13:56:43','2018-01-24 12:56:43'),
	(5,'Images','images',4,'no','yes','Contenus',1,1,'2018-01-10 17:05:01','2018-01-10 16:05:01','2018-01-13 15:38:55','2018-01-13 14:38:55'),
	(6,'Actualités / Publications','actualites-publications',1,'no','yes','Contenus',1,1,'2018-01-13 15:29:44','2018-01-13 14:29:44','2018-01-24 16:50:43','2018-01-24 15:50:43');

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
	(19,2,7,1,8,'yes','aui-selector','aui-editor-new'),
	(20,1,2,1,9,'yes','aui-selector',NULL),
	(27,7,27,6,26,'no',NULL,NULL);

/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
