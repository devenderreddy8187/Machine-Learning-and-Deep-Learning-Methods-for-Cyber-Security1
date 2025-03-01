-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2019 at 09:04 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cyber`
--
CREATE DATABASE IF NOT EXISTS `cyber` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cyber`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add user add_ model', 7, 'add_useradd_model'),
(20, 'Can change user add_ model', 7, 'change_useradd_model'),
(21, 'Can delete user add_ model', 7, 'delete_useradd_model'),
(22, 'Can add user register_ model', 8, 'add_userregister_model'),
(23, 'Can change user register_ model', 8, 'change_userregister_model'),
(24, 'Can delete user register_ model', 8, 'delete_userregister_model');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'User', 'useradd_model'),
(8, 'User', 'userregister_model');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'User', '0001_initial', '2019-03-18 05:18:58.731695'),
(2, 'contenttypes', '0001_initial', '2019-03-18 05:18:59.715093'),
(3, 'auth', '0001_initial', '2019-03-18 05:19:12.355718'),
(4, 'admin', '0001_initial', '2019-03-18 05:19:14.652593'),
(5, 'admin', '0002_logentry_remove_auto_add', '2019-03-18 05:19:14.683843'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-03-18 05:19:16.415289'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-03-18 05:19:17.213140'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-03-18 05:19:18.088140'),
(9, 'auth', '0004_alter_user_username_opts', '2019-03-18 05:19:18.119390'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-03-18 05:19:19.091070'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-03-18 05:19:19.106695'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-18 05:19:19.153570'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-03-18 05:19:20.261968'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-18 05:19:20.856695'),
(15, 'sessions', '0001_initial', '2019-03-18 05:19:21.840093');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6cdq2j8ehv4e4itdsjrr1mh77z06e8o9', 'ZDNiNWVhNDg2NjZlYzVjZTgzYTQxMjI5MzZlM2EzYTc0ZGY0Nzg1YTp7InVzZXJpZCI6MX0=', '2019-04-01 06:43:35.093023');

-- --------------------------------------------------------

--
-- Table structure for table `user_useradd_model`
--

CREATE TABLE IF NOT EXISTS `user_useradd_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `records` varchar(1000) NOT NULL,
  `organizationtype` varchar(1000) NOT NULL,
  `method` varchar(100) NOT NULL,
  `adddata` varchar(500) NOT NULL,
  `attackresult` varchar(500) NOT NULL,
  `time` varchar(100) NOT NULL,
  `uregid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_useradd_model_uregid_id_91591e29_fk_User_user` (`uregid_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=281 ;

--
-- Dumping data for table `user_useradd_model`
--

INSERT INTO `user_useradd_model` (`id`, `entity`, `year`, `records`, `organizationtype`, `method`, `adddata`, `attackresult`, `time`, `uregid_id`) VALUES
(1, '21st Century Oncology', 2016, '2,200,000', 'healthcare', 'Teardrop', ' https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-privateid.37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=serverattack/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Denial-of-service attack', '1:00 AM', 1),
(2, 'Accendo Insurance Co.', 2011, '175,350', 'healthcare', 'Ipsweep', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&utm_medium=associate&utm_source=walkinu/2F4/pdates%2ecom+1880861/tcpoffset', 'probing attack', '2:00 AM', 1),
(3, 'Adobe Systems', 2013, '152,000,000', 'tech', 'Portswee', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+NLOM]pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%2/NTP/9&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Hacking probing attack', '3:00 AM', 1),
(4, 'Advocate Medical Group', 2013, '4,000,000', 'healthcare', 'Multihop', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/getmonlist', 'Remote to User (R2L) Attacks', '4:00 AM', 1),
(5, 'AerServ (subsidiary of?InMobi)', 2018, '75,000', 'advertising', 'Buffer Overflow', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs/2F4=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=c/tcpoffset/hrome&ie=UTF-8', 'User to Root attack', '5:00 AM', 1),
(6, 'Affinity Health Plan, Inc.', 2009, '344,579', 'healthcare', 'Smurf', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/x25/NLOM;2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Denial-of-service attack', '6:00 AM', 1),
(7, 'Ameritrade', 2005, '200,000', 'financial', 'Ipsweep', 'https://realpython.com/pypi-publish-python-package/ECSID/ICMPID', 'probing attack', '7:00 AM', 1),
(8, 'Ancestry.com', 2015, '300,000', 'web', 'Satan', 'https://mail.google.com/mail/u/0/#inbox/ECSID/getmonlist', 'Hacking probing attack', '8:00 AM', 1),
(9, 'Ankle & Foot Center of Tampa Bay, Inc.', 2010, '156,000', 'healthcare', 'Spy', 'https://www.linkedin.com/jobs/view/927854395/privateid/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml/ipid-jymbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '9:00 AM', 1),
(10, 'Anthem Inc.', 2015, '80,000,000', 'healthcare', 'Teardrop', 'http://127.0.0.1:8000/user/userpage/ECSID/getmonlist', 'Denial-of-service attack', '10:00 AM', 1),
(11, 'AOL', 2004, '92,000,000', 'web', 'Ipsweep', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-privateid.37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=serverattack/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '11:00 AM', 1),
(12, 'AOL', 2006, '20,000,000', 'web', 'Portswee', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/privateid/getmonlist', 'Hacking probing attack', '12:00 PM', 1),
(13, 'AOL', 2014, '2,400,000', 'web', 'Multihop', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/ECSID/tcpoffset', 'Remote to User (R2L) Attacks', '1:00 PM', 1),
(14, 'Apple', 2013, '275,000', 'tech', 'Buffer Overflow', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/NID/monlist', 'User to Root attack', '2:00 PM', 1),
(15, 'Apple Health Medicaid', 2016, '91,000', 'healthcare', 'Smurf', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+ECSID+data+interchange&oq=Electronic+&/ipid/gs_l=psy-ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Denial-of-service attack', '3:00 PM', 1),
(16, 'Apple, Inc./BlueToad', 2012, '12,367,232', 'tech, retail', 'Ipsweep', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data/privateid+interchange&oq=interchange+data+int/ICMPID/erchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'probing attack', '4:00 PM', 1),
(17, 'Ashley Madison', 2015, '32,000,000', 'web', 'Satan', 'http://localhost/phpmyadmin/index.php?token=NID/39738e084bf00732384b427239ec1401#PMAURL-/udptraffic/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Hacking probing attack', '5:00 PM', 1),
(18, 'AT&T', 2008, '113,000', 'telecoms', 'Spy', 'https://www.bayt.com/en/job-seekers/create-account/ECSID/?url_id=1&utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/monlist', 'Remote to User (R2L) Attacks', '6:00 PM', 1),
(19, 'AT&T', 2010, '114,000', 'telecoms', 'Teardrop', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+privateid.pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+/ICMPID/Ltd%29&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Denial-of-service attack', '7:00 PM', 1),
(20, 'Auction.co.kr', 2008, '18,000,000', 'web', 'Ipsweep', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/c', 'probing attack', '8:00 PM', 1),
(21, 'Australian Immigration Department', 2015, 'G20 world leaders', 'government', 'Portswee', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs=2C/chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=chrome&serveridie=UTF-8', 'Hacking probing attack', '9:00 PM', 1),
(22, 'Automatic Data Processing', 2005, '125,000', 'financial', 'Multihop', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/tcpattack/iosid/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Remote to User (R2L) Attacks', '10:00 PM', 1),
(23, 'AvMed, Inc.', 2009, '1,220,000', 'healthcare', 'Buffer Overflow', 'https://realpython.com/pypi-publish-python-package/2F4/portid', 'User to Root attack', '11:00 PM', 1),
(24, 'Bailey''s Inc.', 2015, '250,000', 'retail', 'Smurf', 'https://mail.google.com/mail/u/0/#inbox/iosid/portid', 'Denial-of-service attack', '12:00 AM', 1),
(25, 'Bank of America', 2005, '1,200,000', 'financial', 'Ipsweep', 'https://www.linkedin.com/jobs/view/927854395/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=AQH/FDDI/BnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '1:00 AM', 1),
(26, 'Barnes & Noble', 2012, '63 stores', 'retail', 'Satan', 'http://127.0.0.1:8000/user/userpage/portid', 'Hacking probing attack', '2:00 AM', 1),
(27, 'Bedford/St. Martin''s', 2012, 'unknown', 'retail', 'Spy', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-NLOM-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=/udptraffic/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '3:00 AM', 1),
(28, 'Bell Canada', 2017, '1,900,000', 'telecoms', 'Teardrop', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/fragflag', 'Denial-of-service attack', '4:00 AM', 1),
(29, 'Bell Canada', 2018, '100,000', 'telecoms', 'Ipsweep', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/NLOM/fragflag', 'probing attack', '5:00 AM', 1),
(30, 'Betfair', 2010, '2,300,000', 'web', 'Portswee', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/fragflag', 'Hacking probing attack', '6:00 AM', 1),
(31, 'Bethesda Game Studios', 2011, '200,000', 'gaming', 'Multihop', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+interchange/NLOM&oq=Electronic+&gs_l=psy-/udptraffic/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Remote to User (R2L) Attacks', '7:00 AM', 1),
(32, 'Bethesda Game Studios', 2018, '', 'gaming', 'Buffer Overflow', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+NID/electronic+data+interchange&oq=interchange+data+sycookies\\interchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'User to Root attack', '8:00 AM', 1),
(33, 'BlankMediaGames', 2018, '7,633,234', 'gaming', 'Smurf', 'http://localhost/phpmyadmin/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-E /x25/tag/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Denial-of-service attack', '9:00 AM', 1),
(34, 'Blizzard Entertainment', 2012, '14,000,000', 'gaming', 'Ipsweep', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&2F4/utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/malwareid', 'probing attack', '10:00 AM', 1),
(35, 'BlueCross BlueShield of Tennessee', 2009, '1,023,209', 'healthcare', 'Satan', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+nginx+pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%29/tcpattack/&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Hacking probing attack', '11:00 AM', 1),
(36, 'BMO and Simplii', 2018, '90,000', 'banking', 'Spy', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'Remote to User (R2L) Attacks', '12:00 PM', 1),
(37, 'British Airways', 2018, '380,000', 'transport', 'Teardrop', 'https://www.google.co.in/search?q=python+free+online+2F4/course+certification&oq=p&aqs=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=ACK/chrome&ie=UTF-8', 'Denial-of-service attack', '1:00 PM', 1),
(38, 'British Airways', 2015, 'tens of thousands', 'retail', 'Ipsweep', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-SYN/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'probing attack', '2:00 PM', 1),
(39, 'California Department of Child Support Services', 2012, '800,000', 'government', 'Portswee', 'https://realpython.com/pypi-publish-python-package/rangingdistanc', 'Hacking probing attack', '3:00 PM', 1),
(40, 'CardSystems Solutions?Inc.', 2005, '40,000,000', 'financial', 'Multihop', 'https://mail.google.com/mail/u/0/#inbox/2C', 'Remote to User (R2L) Attacks', '4:00 PM', 1),
(41, '(MasterCard, Visa, Discover Financial Services and American Express)', 0, '', '', 'Buffer Overflow', 'https://www.linkedin.com/jobs/view/927854395/2F4/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-GETID/organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'User to Root attack', '5:00 PM', 1),
(42, 'CareFirst BlueCross Blue Shield - Maryland', 2015, '1,100,000', 'healthcare', 'Smurf', 'http://127.0.0.1:8000/user/userpage/nginx/x25', 'Denial-of-service attack', '6:00 PM', 1),
(43, 'Cathay Pacific Airways', 2018, '9,400,000', 'transport', 'Ipsweep', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-decid.jy/GETID/mbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '7:00 PM', 1),
(44, 'Centers for Medicare & Medicaid Services', 2018, '75,000', 'healthcare', 'Satan', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/NLOM', 'Hacking probing attack', '8:00 PM', 1),
(45, 'Central Coast Credit Union', 2016, '60,000', 'financial', 'Spy', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/x25', 'Remote to User (R2L) Attacks', '9:00 PM', 1),
(46, 'Central Hudson Gas & Electric', 2013, '110,000', 'energy', 'Teardrop', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..2F4;69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8', 'Denial-of-service attack', '10:00 PM', 1),
(47, 'CheckFree Corporation', 2009, '5,000,000', 'financial', 'Ipsweep', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+inte;2C/rchange&oq=Electronic+&gs_l=psy-POSDID/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'probing attack', '11:00 PM', 1),
(48, 'China Software Developer Network', 2011, '6,000,000', 'web', 'Portswee', 'https://www.google.co.in/search?ei=2F4qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data+interchange&oq=interchange+data+intercha/openBSD/nge&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Hacking probing attack', '12:00 AM', 1),
(49, 'Chinese gaming websites (three: Duowan, 7K7K, 178.com)', 2011, '10,000,000', 'web', 'Multihop', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Remote to User (R2L) Attacks', '1:00 AM', 1),
(50, 'Citigroup', 2005, '3,900,000', 'financial', 'Buffer Overflow', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'User to Root attack', '2:00 AM', 1),
(51, 'Citigroup', 2011, '360,083', 'financial', 'Smurf', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Denial-of-service attack', '3:00 AM', 1),
(52, 'Citigroup', 2013, '150,000', 'financial', 'Ipsweep', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&utm_medium=associate&utm_source=walkinu/2F4/pdates%2ecom+1880861/tcpoffset', 'probing attack', '4:00 AM', 1),
(53, 'City and Hackney Teaching Primary Care Trust', 2007, '160,000', 'healthcare', 'Satan', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+NLOM]pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%2/NTP/9&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Hacking probing attack', '5:00 AM', 1),
(54, 'Colorado government', 2010, '105,470', 'healthcare', 'Spy', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/getmonlist', 'Remote to User (R2L) Attacks', '6:00 AM', 1),
(55, 'Community Health Systems', 2014, '4,500,000', 'healthcare', 'Teardrop', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs/2F4=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=c/tcpoffset/hrome&ie=UTF-8', 'Denial-of-service attack', '7:00 AM', 1),
(56, 'Compass Bank', 2007, '1,000,000', 'financial', 'Ipsweep', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/x25/NLOM;2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'probing attack', '8:00 AM', 1),
(57, 'Countrywide Financial Corp', 2006, '2,600,000', 'financial', 'Portswee', 'https://realpython.com/pypi-publish-python-package/ECSID/ICMPID', 'Hacking probing attack', '9:00 AM', 1),
(58, 'Countrywide Financial Corp', 2011, '2,500,000', 'financial', 'Multihop', 'https://mail.google.com/mail/u/0/#inbox/ECSID/getmonlist', 'Remote to User (R2L) Attacks', '10:00 AM', 1),
(59, 'Cox Communications', 2016, '40,000', 'telecoms', 'Buffer Overflow', 'https://www.linkedin.com/jobs/view/927854395/privateid/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml/ipid-jymbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'User to Root attack', '11:00 AM', 1),
(60, 'Crescent Health Inc.,?Walgreens', 2013, '100,000', 'healthcare', 'Smurf', 'http://127.0.0.1:8000/user/userpage/ECSID/getmonlist', 'Denial-of-service attack', '12:00 PM', 1),
(61, 'CVS', 2015, 'millions', 'retail', 'Ipsweep', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-privateid.37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=serverattack/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '1:00 PM', 1),
(62, 'Dai Nippon Printing', 2007, '8,637,405', 'retail', 'Satan', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/privateid/getmonlist', 'Hacking probing attack', '2:00 PM', 1),
(63, 'Data Processors International', 2008, '8,000,000', 'financial', 'Spy', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/ECSID/tcpoffset', 'Remote to User (R2L) Attacks', '3:00 PM', 1),
(64, '(MasterCard, Visa, Discover Financial Services and American Express)', 0, '', '', 'Teardrop', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/NID/monlist', 'Denial-of-service attack', '4:00 PM', 1),
(65, 'Defense Integrated Data Center (South Korea)', 2017, '235 GB', 'military', 'Ipsweep', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+ECSID+data+interchange&oq=Electronic+&/ipid/gs_l=psy-ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'probing attack', '5:00 PM', 1),
(66, 'Deloitte', 2017, '', 'consulting, accounting', 'Portswee', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data/privateid+interchange&oq=interchange+data+int/ICMPID/erchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Hacking probing attack', '6:00 PM', 1),
(67, 'Democratic National Committee', 2016, '19,252', 'political', 'Multihop', 'http://localhost/phpmyadmin/index.php?token=NID/39738e084bf00732384b427239ec1401#PMAURL-/udptraffic/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Remote to User (R2L) Attacks', '7:00 PM', 1),
(68, 'Domino''s Pizza(France)', 2014, '600,000', 'web', 'Buffer Overflow', 'https://www.bayt.com/en/job-seekers/create-account/ECSID/?url_id=1&utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/monlist', 'User to Root attack', '8:00 PM', 1),
(69, 'Dropbox', 2012, 'unknown', 'web', 'Smurf', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+privateid.pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+/ICMPID/Ltd%29&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Denial-of-service attack', '9:00 PM', 1),
(70, 'Drupal', 2013, '1,000,000', 'web', 'Ipsweep', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/c', 'probing attack', '10:00 PM', 1),
(71, 'DSW Inc.', 2005, '1,400,000', 'retail', 'Satan', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs=2C/chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=chrome&serveridie=UTF-8', 'Hacking probing attack', '11:00 PM', 1),
(72, 'Dun & Bradstreet', 2013, '1,000,000', 'tech', 'Spy', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/tcpattack/iosid/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Remote to User (R2L) Attacks', '12:00 AM', 1),
(73, 'eBay', 2014, '145,000,000', 'web', 'Teardrop', 'https://realpython.com/pypi-publish-python-package/2F4/portid', 'Denial-of-service attack', '1:00 AM', 1),
(74, 'Educational Credit Management Corporation', 2010, '3,300,000', 'financial', 'Ipsweep', 'https://mail.google.com/mail/u/0/#inbox/iosid/portid', 'probing attack', '2:00 AM', 1),
(75, 'Eisenhower Medical Center', 2011, '514,330', 'healthcare', 'Portswee', 'https://www.linkedin.com/jobs/view/927854395/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=AQH/FDDI/BnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Hacking probing attack', '3:00 AM', 1),
(76, 'Embassy Cables', 2010, '251,000', 'government', 'Multihop', 'http://127.0.0.1:8000/user/userpage/portid', 'Remote to User (R2L) Attacks', '4:00 AM', 1),
(77, 'Emergency Healthcare Physicians, Ltd.', 2010, '180,111', 'healthcare', 'Buffer Overflow', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-NLOM-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=/udptraffic/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'User to Root attack', '5:00 AM', 1),
(78, 'Emory Healthcare', 2012, '315,000', 'healthcare', 'Smurf', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/fragflag', 'Denial-of-service attack', '6:00 AM', 1),
(79, 'Equifax', 2017, '143,000,000', 'financial, credit reporting', 'Ipsweep', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/NLOM/fragflag', 'probing attack', '7:00 AM', 1),
(80, 'Erie County Medical Center', 2017, 'unknown', 'healthcare', 'Satan', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/fragflag', 'Hacking probing attack', '8:00 AM', 1),
(81, 'European Central Bank', 2014, 'unknown', 'financial', 'Spy', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+interchange/NLOM&oq=Electronic+&gs_l=psy-/udptraffic/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Remote to User (R2L) Attacks', '9:00 AM', 1),
(82, 'Evernote', 2013, '50,000,000', 'web', 'Teardrop', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+NID/electronic+data+interchange&oq=interchange+data+sycookies\\interchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Denial-of-service attack', '10:00 AM', 1),
(83, 'Excellus BlueCross BlueShield', 2015, '10,000,000', 'healthcare', 'Ipsweep', 'http://localhost/phpmyadmin/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-E /x25/tag/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'probing attack', '11:00 AM', 1),
(84, 'Experian?-?T-Mobile US', 2015, '15,000,000', 'telecoms', 'Portswee', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&2F4/utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/malwareid', 'Hacking probing attack', '12:00 PM', 1),
(85, 'EyeWire', 2016, 'unknown', 'tech', 'Multihop', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+nginx+pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%29/tcpattack/&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Remote to User (R2L) Attacks', '1:00 PM', 1),
(86, 'Facebook', 2018, '50,000,000', 'social network', 'Buffer Overflow', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'User to Root attack', '2:00 PM', 1),
(87, 'Facebook', 2013, '6,000,000', 'web', 'Smurf', 'https://www.google.co.in/search?q=python+free+online+2F4/course+certification&oq=p&aqs=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=ACK/chrome&ie=UTF-8', 'Denial-of-service attack', '3:00 PM', 1),
(88, 'Federal Reserve Bank of Cleveland', 2010, '400,000', 'financial', 'Ipsweep', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-SYN/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'probing attack', '4:00 PM', 1),
(89, 'Fidelity National Information Services', 2007, '8,500,000', 'financial', 'Satan', 'https://realpython.com/pypi-publish-python-package/rangingdistanc', 'Hacking probing attack', '5:00 PM', 1),
(90, 'Florida Department of Juvenile Justice', 2013, '100,000', 'government', 'Spy', 'https://mail.google.com/mail/u/0/#inbox/2C', 'Remote to User (R2L) Attacks', '6:00 PM', 1),
(91, 'Formspring', 2012, '420,000', 'web', 'Teardrop', 'https://www.linkedin.com/jobs/view/927854395/2F4/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-GETID/organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Denial-of-service attack', '7:00 PM', 1),
(92, 'Friend Finder Networks', 2016, '412,214,295', 'web', 'Ipsweep', 'http://127.0.0.1:8000/user/userpage/nginx/x25', 'probing attack', '8:00 PM', 1),
(93, 'Gamigo', 2012, '8,000,000', 'web', 'Portswee', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-decid.jy/GETID/mbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Hacking probing attack', '9:00 PM', 1),
(94, 'Gap Inc.', 2007, '800,000', 'retail', 'Multihop', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/NLOM', 'Remote to User (R2L) Attacks', '10:00 PM', 1),
(95, 'Gawker', 2010, '1,500,000', 'web', 'Buffer Overflow', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/x25', 'User to Root attack', '11:00 PM', 1),
(96, 'Global Payments', 2012, '7,000,000', 'financial', 'Smurf', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..2F4;69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8', 'Denial-of-service attack', '12:00 AM', 1),
(97, 'Gmail', 2014, '5,000,000', 'web', 'Ipsweep', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+inte;2C/rchange&oq=Electronic+&gs_l=psy-POSDID/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'probing attack', '1:00 AM', 1),
(98, 'Google Plus', 2018, '500,000', 'social network', 'Satan', 'https://www.google.co.in/search?ei=2F4qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data+interchange&oq=interchange+data+intercha/openBSD/nge&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Hacking probing attack', '2:00 AM', 1),
(99, 'Greek government', 2012, '9,000,000', 'government', 'Spy', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Remote to User (R2L) Attacks', '3:00 AM', 1),
(100, 'Grozio Chirurgija', 2017, '25,000', 'healthcare', 'Teardrop', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'Denial-of-service attack', '4:00 AM', 1),
(101, 'GS Caltex', 2008, '11,100,000', 'energy', 'Ipsweep', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'probing attack', '5:00 AM', 1),
(102, 'Gyft', 2016, 'unknown', 'web', 'Portswee', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&utm_medium=associate&utm_source=walkinu/2F4/pdates%2ecom+1880861/tcpoffset', 'Hacking probing attack', '6:00 AM', 1),
(103, 'Hannaford Brothers Supermarket Chain', 2007, '4,200,000', 'retail', 'Multihop', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+NLOM]pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%2/NTP/9&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Remote to User (R2L) Attacks', '7:00 AM', 1),
(104, 'Health Net', 2009, '500,000', 'healthcare', 'Buffer Overflow', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/getmonlist', 'User to Root attack', '8:00 AM', 1),
(105, 'Health Net???IBM', 2011, '1,900,000', 'healthcare', 'Smurf', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs/2F4=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=c/tcpoffset/hrome&ie=UTF-8', 'Denial-of-service attack', '9:00 AM', 1),
(106, 'Heartland', 2009, '130,000,000', 'financial', 'Ipsweep', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/x25/NLOM;2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'probing attack', '10:00 AM', 1),
(107, 'Heathrow Airport', 2017, '2.5GB', 'transport', 'Satan', 'https://realpython.com/pypi-publish-python-package/ECSID/ICMPID', 'Hacking probing attack', '11:00 AM', 1),
(108, 'Hewlett Packard', 2006, '200,000', 'tech, retail', 'Spy', 'https://mail.google.com/mail/u/0/#inbox/ECSID/getmonlist', 'Remote to User (R2L) Attacks', '12:00 PM', 1),
(109, 'Hilton Hotels', 2015, 'unknown', 'hotel', 'Teardrop', 'https://www.linkedin.com/jobs/view/927854395/privateid/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml/ipid-jymbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Denial-of-service attack', '1:00 PM', 1),
(110, 'Home Depot', 2014, '56,000,000', 'retail', 'Ipsweep', 'http://127.0.0.1:8000/user/userpage/ECSID/getmonlist', 'probing attack', '2:00 PM', 1),
(111, 'Honda Canada', 2011, '283,000', 'retail', 'Portswee', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-privateid.37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=serverattack/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Hacking probing attack', '3:00 PM', 1),
(112, 'Hyatt Hotels', 2015, '250 locations', 'hotel', 'Multihop', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/privateid/getmonlist', 'Remote to User (R2L) Attacks', '4:00 PM', 1),
(113, 'Internal Revenue Service', 2015, '720,000', 'financial', 'Buffer Overflow', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/ECSID/tcpoffset', 'User to Root attack', '5:00 PM', 1),
(114, 'Inuvik hospital', 2016, '6,700', 'healthcare', 'Smurf', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/NID/monlist', 'Denial-of-service attack', '6:00 PM', 1),
(115, 'Iranian banks (three:?Saderat,?Eghtesad Novin, and?Saman)', 2012, '3,000,000', 'financial', 'Ipsweep', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+ECSID+data+interchange&oq=Electronic+&/ipid/gs_l=psy-ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'probing attack', '7:00 PM', 1),
(116, 'Jefferson County, West Virginia', 2008, '1,600,000', 'government', 'Satan', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data/privateid+interchange&oq=interchange+data+int/ICMPID/erchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Hacking probing attack', '8:00 PM', 1),
(117, 'JP Morgan Chase', 2010, '2,600,000', 'financial', 'Spy', 'http://localhost/phpmyadmin/index.php?token=NID/39738e084bf00732384b427239ec1401#PMAURL-/udptraffic/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Remote to User (R2L) Attacks', '9:00 PM', 1),
(118, 'JP Morgan Chase', 2014, '76,000,000', 'financial', 'Teardrop', 'https://www.bayt.com/en/job-seekers/create-account/ECSID/?url_id=1&utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/monlist', 'Denial-of-service attack', '10:00 PM', 1),
(119, 'KDDI', 2006, '4,000,000', 'telecoms', 'Ipsweep', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+privateid.pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+/ICMPID/Ltd%29&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'probing attack', '11:00 PM', 1),
(120, 'Kirkwood Community College', 2013, '125,000', 'academic', 'Portswee', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/c', 'Hacking probing attack', '12:00 AM', 1),
(121, 'KM.RU', 2016, '1,500,000', 'web', 'Multihop', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs=2C/chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=chrome&serveridie=UTF-8', 'Remote to User (R2L) Attacks', '1:00 AM', 1),
(122, 'Korea Credit Bureau', 2014, '20,000,000', 'financial', 'Buffer Overflow', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/tcpattack/iosid/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'User to Root attack', '2:00 AM', 1),
(123, 'Kroll Background America', 2013, '1,000,000', 'tech', 'Smurf', 'https://realpython.com/pypi-publish-python-package/2F4/portid', 'Denial-of-service attack', '3:00 AM', 1),
(124, 'KT Corporation', 2012, '8,700,000', 'telecoms', 'Ipsweep', 'https://mail.google.com/mail/u/0/#inbox/iosid/portid', 'probing attack', '4:00 AM', 1),
(125, 'Landry''s, Inc.', 2015, '500 locations', 'restaurant', 'Satan', 'https://www.linkedin.com/jobs/view/927854395/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=AQH/FDDI/BnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Hacking probing attack', '5:00 AM', 1),
(126, 'LexisNexis', 2014, '1,000,000', 'tech', 'Spy', 'http://127.0.0.1:8000/user/userpage/portid', 'Remote to User (R2L) Attacks', '6:00 AM', 1),
(127, 'Lincoln Medical & Mental Health Center', 2010, '130,495', 'healthcare', 'Teardrop', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-NLOM-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=/udptraffic/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Denial-of-service attack', '7:00 AM', 1),
(128, 'LinkedIn,?eHarmony,?Last.fm', 2012, '8,000,000', 'web', 'Ipsweep', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/fragflag', 'probing attack', '8:00 AM', 1),
(129, 'Living Social', 2013, '50,000,000', 'web', 'Portswee', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/NLOM/fragflag', 'Hacking probing attack', '9:00 AM', 1),
(130, 'MacRumors.com', 2014, '860,000', 'web', 'Multihop', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/fragflag', 'Remote to User (R2L) Attacks', '10:00 AM', 1),
(131, 'Mandarin Oriental Hotels', 2014, '10 locations', 'hotel', 'Buffer Overflow', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+interchange/NLOM&oq=Electronic+&gs_l=psy-/udptraffic/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'User to Root attack', '11:00 AM', 1),
(132, 'Marriott International', 2018, '500,000,000', 'hotel', 'Smurf', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+NID/electronic+data+interchange&oq=interchange+data+sycookies\\interchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Denial-of-service attack', '12:00 PM', 1),
(133, 'Massachusetts Government', 2011, '210,000', 'government', 'Ipsweep', 'http://localhost/phpmyadmin/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-E /x25/tag/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'probing attack', '1:00 PM', 1),
(134, 'Massive American business hack', 2012, '160,000,000', 'financial', 'Satan', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&2F4/utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/malwareid', 'Hacking probing attack', '2:00 PM', 1),
(135, 'including?7-Elevenand?Nasdaq', 0, '', '', 'Spy', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+nginx+pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%29/tcpattack/&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Remote to User (R2L) Attacks', '3:00 PM', 1),
(136, 'Medical Informatics Engineering', 2015, '3,900,000', 'healthcare', 'Teardrop', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'Denial-of-service attack', '4:00 PM', 1),
(137, 'Memorial Healthcare System', 2011, '102,153', 'healthcare', 'Ipsweep', 'https://www.google.co.in/search?q=python+free+online+2F4/course+certification&oq=p&aqs=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=ACK/chrome&ie=UTF-8', 'probing attack', '5:00 PM', 1),
(138, 'Michaels', 2014, '3,000,000', 'retail', 'Portswee', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-SYN/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Hacking probing attack', '6:00 PM', 1),
(139, 'Militarysingles.com', 2012, '163,792', 'web, military', 'Multihop', 'https://realpython.com/pypi-publish-python-package/rangingdistanc', 'Remote to User (R2L) Attacks', '7:00 PM', 1),
(140, 'Ministry of Education (Chile)', 2008, '6,000,000', 'government', 'Buffer Overflow', 'https://mail.google.com/mail/u/0/#inbox/2C', 'User to Root attack', '8:00 PM', 1),
(141, 'Monster.com', 2007, '1,600,000', 'web', 'Smurf', 'https://www.linkedin.com/jobs/view/927854395/2F4/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-GETID/organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Denial-of-service attack', '9:00 PM', 1),
(142, 'Morgan Stanley Smith Barney', 2011, '34,000', 'financial', 'Ipsweep', 'http://127.0.0.1:8000/user/userpage/nginx/x25', 'probing attack', '10:00 PM', 1),
(143, 'Mozilla', 2014, '76,000', 'web', 'Satan', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-decid.jy/GETID/mbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Hacking probing attack', '11:00 PM', 1),
(144, 'MyHeritage', 2018, '92,283,889', 'genealogy', 'Spy', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/NLOM', 'Remote to User (R2L) Attacks', '12:00 AM', 1),
(145, 'NASDAQ', 2014, 'unknown', 'financial', 'Teardrop', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/x25', 'Denial-of-service attack', '1:00 AM', 1),
(146, 'National Archives and Records Administration(U.S. military veterans records)', 2009, '76,000,000', 'military', 'Ipsweep', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..2F4;69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8', 'probing attack', '2:00 AM', 1),
(147, 'National Guard of the United States', 2009, '131,000', 'military', 'Portswee', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+inte;2C/rchange&oq=Electronic+&gs_l=psy-POSDID/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Hacking probing attack', '3:00 AM', 1),
(148, 'Natural Grocers', 2015, '93 stores', 'retail', 'Multihop', 'https://www.google.co.in/search?ei=2F4qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data+interchange&oq=interchange+data+intercha/openBSD/nge&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Remote to User (R2L) Attacks', '4:00 AM', 1),
(149, 'Neiman Marcus', 2014, '1,100,000', 'retail', 'Buffer Overflow', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'User to Root attack', '5:00 AM', 1),
(150, 'Nemours Foundation', 2011, '1,055,489', 'healthcare', 'Smurf', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'Denial-of-service attack', '6:00 AM', 1),
(151, 'Network Solutions', 2009, '573,000', 'tech', 'Ipsweep', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'probing attack', '7:00 AM', 1),
(152, 'New York City Health & Hospitals Corp.', 2010, '1,700,000', 'healthcare', 'Satan', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&utm_medium=associate&utm_source=walkinu/2F4/pdates%2ecom+1880861/tcpoffset', 'Hacking probing attack', '8:00 AM', 1),
(153, 'New York State Electric & Gas', 2012, '1,800,000', 'energy', 'Spy', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+NLOM]pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%2/NTP/9&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Remote to User (R2L) Attacks', '9:00 AM', 1),
(154, 'New York Taxis', 2014, '52,000', 'transport', 'Teardrop', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/getmonlist', 'Denial-of-service attack', '10:00 AM', 1),
(155, 'Nexon?Korea Corp', 2011, '13,200,000', 'web', 'Ipsweep', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs/2F4=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=c/tcpoffset/hrome&ie=UTF-8', 'probing attack', '11:00 AM', 1),
(156, 'NHS', 2011, '8,300,000', 'healthcare', 'Portswee', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/x25/NLOM;2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Hacking probing attack', '12:00 PM', 1),
(157, 'Nintendo', 2013, '240,000', 'gaming', 'Multihop', 'https://realpython.com/pypi-publish-python-package/ECSID/ICMPID', 'Remote to User (R2L) Attacks', '1:00 PM', 1),
(158, 'Nival Networks', 2016, '1,500,000', 'gaming', 'Buffer Overflow', 'https://mail.google.com/mail/u/0/#inbox/ECSID/getmonlist', 'User to Root attack', '2:00 PM', 1),
(159, 'Norwegian Tax Administration', 2008, '3,950,000', 'government', 'Smurf', 'https://www.linkedin.com/jobs/view/927854395/privateid/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml/ipid-jymbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Denial-of-service attack', '3:00 PM', 1),
(160, 'Ofcom', 2016, 'unknown', 'telecom', 'Ipsweep', 'http://127.0.0.1:8000/user/userpage/ECSID/getmonlist', 'probing attack', '4:00 PM', 1),
(161, 'Office of the Texas Attorney General', 2012, '6,500,000', 'government', 'Satan', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-privateid.37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=serverattack/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Hacking probing attack', '5:00 PM', 1),
(162, 'Ohio State University', 2010, '760,000', 'academic', 'Spy', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/privateid/getmonlist', 'Remote to User (R2L) Attacks', '6:00 PM', 1),
(163, 'Orbitz', 2018, '880,000', 'web', 'Teardrop', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/ECSID/tcpoffset', 'Denial-of-service attack', '7:00 PM', 1),
(164, 'Oregon Department of Transportation', 2011, 'unknown', 'government', 'Ipsweep', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/NID/monlist', 'probing attack', '8:00 PM', 1),
(165, 'OVH', 2013, 'undisclosed', 'web', 'Portswee', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+ECSID+data+interchange&oq=Electronic+&/ipid/gs_l=psy-ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Hacking probing attack', '9:00 PM', 1),
(166, 'Patreon', 2015, '2.3 million', 'web', 'Multihop', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data/privateid+interchange&oq=interchange+data+int/ICMPID/erchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Remote to User (R2L) Attacks', '10:00 PM', 1),
(167, 'Philippines?Commission on Elections', 2016, '55,000,000', 'government', 'Buffer Overflow', 'http://localhost/phpmyadmin/index.php?token=NID/39738e084bf00732384b427239ec1401#PMAURL-/udptraffic/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'User to Root attack', '11:00 PM', 1),
(168, 'Popsugar', 2018, '123,857', 'fashion', 'Smurf', 'https://www.bayt.com/en/job-seekers/create-account/ECSID/?url_id=1&utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/monlist', 'Denial-of-service attack', '12:00 AM', 1),
(169, 'Premera', 2015, '11,000,000', 'healthcare', 'Ipsweep', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+privateid.pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+/ICMPID/Ltd%29&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'probing attack', '1:00 AM', 1),
(170, 'Puerto Rico Department of Health', 2010, '515,000', 'healthcare', 'Satan', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/c', 'Hacking probing attack', '2:00 AM', 1),
(171, 'Quora', 2018, '100,000,000', 'Question & Answer', 'Spy', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs=2C/chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=chrome&serveridie=UTF-8', 'Remote to User (R2L) Attacks', '3:00 AM', 1),
(172, 'Rambler.ru', 2012, '98,167,935', 'web', 'Teardrop', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/tcpattack/iosid/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Denial-of-service attack', '4:00 AM', 1),
(173, 'RBS?Worldpay', 2008, '1,500,000', 'financial', 'Ipsweep', 'https://realpython.com/pypi-publish-python-package/2F4/portid', 'probing attack', '5:00 AM', 1),
(174, 'Reddit', 2018, 'unknown', 'web', 'Portswee', 'https://mail.google.com/mail/u/0/#inbox/iosid/portid', 'Hacking probing attack', '6:00 AM', 1),
(175, 'Restaurant Depot', 2011, '200,000', 'retail', 'Multihop', 'https://www.linkedin.com/jobs/view/927854395/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=AQH/FDDI/BnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '7:00 AM', 1),
(176, 'RockYou!', 2009, '32,000,000', 'web, gaming', 'Buffer Overflow', 'http://127.0.0.1:8000/user/userpage/portid', 'User to Root attack', '8:00 AM', 1);
INSERT INTO `user_useradd_model` (`id`, `entity`, `year`, `records`, `organizationtype`, `method`, `adddata`, `attackresult`, `time`, `uregid_id`) VALUES
(177, 'Rosen Hotels', 2016, 'unknown', 'hotel', 'Smurf', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-NLOM-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=/udptraffic/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Denial-of-service attack', '9:00 AM', 1),
(178, 'San Francisco Public Utilities Commission', 2011, '180,000', 'government', 'Ipsweep', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/fragflag', 'probing attack', '10:00 AM', 1),
(179, 'Scottrade', 2015, '4,600,000', 'financial', 'Satan', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/NLOM/fragflag', 'Hacking probing attack', '11:00 AM', 1),
(180, 'Scribd', 2013, '500,000', 'web', 'Spy', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/fragflag', 'Remote to User (R2L) Attacks', '12:00 PM', 1),
(181, 'Seacoast Radiology, PA', 2010, '231,400', 'healthcare', 'Teardrop', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+interchange/NLOM&oq=Electronic+&gs_l=psy-/udptraffic/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Denial-of-service attack', '1:00 PM', 1),
(182, 'Sega', 2011, '1,290,755', 'gaming', 'Ipsweep', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+NID/electronic+data+interchange&oq=interchange+data+sycookies\\interchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'probing attack', '2:00 PM', 1),
(183, 'Service Personnel and Veterans Agency?(UK)', 2008, '50,500', 'government', 'Portswee', 'http://localhost/phpmyadmin/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-E /x25/tag/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Hacking probing attack', '3:00 PM', 1),
(184, 'SingHealth', 2018, '1,500,000', 'government, database', 'Multihop', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&2F4/utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/malwareid', 'Remote to User (R2L) Attacks', '4:00 PM', 1),
(185, 'Slack', 2015, '500,000', 'tech', 'Buffer Overflow', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+nginx+pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%29/tcpattack/&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'User to Root attack', '5:00 PM', 1),
(186, 'SnapChat', 2013, '4,700,000', 'web, tech', 'Smurf', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'Denial-of-service attack', '6:00 PM', 1),
(187, 'Sony Online Entertainment', 2011, '24,600,000', 'gaming', 'Ipsweep', 'https://www.google.co.in/search?q=python+free+online+2F4/course+certification&oq=p&aqs=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=ACK/chrome&ie=UTF-8', 'probing attack', '7:00 PM', 1),
(188, 'Sony Pictures', 2011, '1,000,000', 'web', 'Satan', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-SYN/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Hacking probing attack', '8:00 PM', 1),
(189, 'Sony Pictures', 2014, '100?terabytes', 'media', 'Spy', 'https://realpython.com/pypi-publish-python-package/rangingdistanc', 'Remote to User (R2L) Attacks', '9:00 PM', 1),
(190, 'Sony?PlayStation Network', 2011, '77,000,000', 'gaming', 'Teardrop', 'https://mail.google.com/mail/u/0/#inbox/2C', 'Denial-of-service attack', '10:00 PM', 1),
(191, 'South Africa police', 2013, '16,000', 'government', 'Ipsweep', 'https://www.linkedin.com/jobs/view/927854395/2F4/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-GETID/organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '11:00 PM', 1),
(192, 'South Carolina Government', 2012, '6,400,000', 'healthcare', 'Portswee', 'http://127.0.0.1:8000/user/userpage/nginx/x25', 'Hacking probing attack', '12:00 AM', 1),
(193, 'South Shore Hospital, Massachusetts', 2010, '800,000', 'healthcare', 'Multihop', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-decid.jy/GETID/mbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '1:00 AM', 1),
(194, 'Southern California Medical-Legal Consultants', 2011, '300,000', 'healthcare', 'Buffer Overflow', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/NLOM', 'User to Root attack', '2:00 AM', 1),
(195, 'Spartanburg Regional Healthcare System', 2011, '400,000', 'healthcare', 'Smurf', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/x25', 'Denial-of-service attack', '3:00 AM', 1),
(196, 'Stanford University', 2008, '72,000', 'academic', 'Ipsweep', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..2F4;69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8', 'probing attack', '4:00 AM', 1),
(197, 'Starbucks', 2008, '97,000', 'retail', 'Satan', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+inte;2C/rchange&oq=Electronic+&gs_l=psy-POSDID/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Hacking probing attack', '5:00 AM', 1),
(198, 'Starwood Hotels', 2015, '54 locations', 'hotel', 'Spy', 'https://www.google.co.in/search?ei=2F4qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data+interchange&oq=interchange+data+intercha/openBSD/nge&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Remote to User (R2L) Attacks', '6:00 AM', 1),
(199, 'including?Westin Hotels?and?Sheraton Hotels', 0, '', '', 'Teardrop', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Denial-of-service attack', '7:00 AM', 1),
(200, 'State of Texas', 2011, '3,500,000', 'government', 'Ipsweep', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'probing attack', '8:00 AM', 1),
(201, 'Steam', 2011, '35,000,000', 'web', 'Portswee', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Hacking probing attack', '9:00 AM', 1),
(202, 'Stratfor', 2011, '935,000', 'military', 'Multihop', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&utm_medium=associate&utm_source=walkinu/2F4/pdates%2ecom+1880861/tcpoffset', 'Remote to User (R2L) Attacks', '10:00 AM', 1),
(203, 'Supervalu', 2014, '200 stores', 'retail', 'Buffer Overflow', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+NLOM]pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%2/NTP/9&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'User to Root attack', '11:00 AM', 1),
(204, 'Sutter Medical Center', 2011, '4,243,434', 'healthcare', 'Smurf', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/getmonlist', 'Denial-of-service attack', '12:00 PM', 1),
(205, 'Syrian government(Syria Files)', 2012, '2,434,899', 'government', 'Ipsweep', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs/2F4=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=c/tcpoffset/hrome&ie=UTF-8', 'probing attack', '1:00 PM', 1),
(206, 'T-Mobile, Deutsche Telekom', 2006, '17,000,000', 'telecoms', 'Satan', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/x25/NLOM;2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Hacking probing attack', '2:00 PM', 1),
(207, 'Taobao', 2016, '20,000,000', 'retail', 'Spy', 'https://realpython.com/pypi-publish-python-package/ECSID/ICMPID', 'Remote to User (R2L) Attacks', '3:00 PM', 1),
(208, 'Target Corporation', 2014, '70,000,000', 'retail', 'Teardrop', 'https://mail.google.com/mail/u/0/#inbox/ECSID/getmonlist', 'Denial-of-service attack', '4:00 PM', 1),
(209, 'Taringa!', 2017, '28,722,877', 'web', 'Ipsweep', 'https://www.linkedin.com/jobs/view/927854395/privateid/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml/ipid-jymbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '5:00 PM', 1),
(210, 'TaxSlayer.com', 2016, 'unknown', 'web', 'Portswee', 'http://127.0.0.1:8000/user/userpage/ECSID/getmonlist', 'Hacking probing attack', '6:00 PM', 1),
(211, 'TD?Ameritrade', 2007, '6,300,000', 'financial', 'Multihop', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-privateid.37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=serverattack/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '7:00 PM', 1),
(212, 'TD Bank', 2012, '260,000', 'financial', 'Buffer Overflow', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/privateid/getmonlist', 'User to Root attack', '8:00 PM', 1),
(213, 'TerraCom & YourTel', 2013, '170,000', 'telecoms', 'Smurf', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/ECSID/tcpoffset', 'Denial-of-service attack', '9:00 PM', 1),
(214, 'Texas Lottery', 2007, '89,000', 'government', 'Ipsweep', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/NID/monlist', 'probing attack', '10:00 PM', 1),
(215, 'The Bank of New York Mellon', 2008, '12,500,000', 'financial', 'Satan', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+ECSID+data+interchange&oq=Electronic+&/ipid/gs_l=psy-ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Hacking probing attack', '11:00 PM', 1),
(216, 'Tianya Club', 2011, '28,000,000', 'web', 'Spy', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data/privateid+interchange&oq=interchange+data+int/ICMPID/erchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'Remote to User (R2L) Attacks', '12:00 AM', 1),
(217, 'Ticketfly (subsidiary of Eventbrite)', 2018, '26,151,608', 'ticket distribution', 'Teardrop', 'http://localhost/phpmyadmin/index.php?token=NID/39738e084bf00732384b427239ec1401#PMAURL-/udptraffic/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Denial-of-service attack', '1:00 AM', 1),
(218, 'TK /?TJ Maxx', 2007, '94,000,000', 'retail', 'Ipsweep', 'https://www.bayt.com/en/job-seekers/create-account/ECSID/?url_id=1&utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/monlist', 'probing attack', '2:00 AM', 1),
(219, 'Tricare', 2011, '4,901,432', 'military, healthcare', 'Portswee', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+privateid.pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+/ICMPID/Ltd%29&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Hacking probing attack', '3:00 AM', 1),
(220, 'Triple-S Salud, Inc.', 2010, '398,000', 'healthcare', 'Multihop', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/c', 'Remote to User (R2L) Attacks', '4:00 AM', 1),
(221, 'Trump Hotels', 2014, '8 locations', 'hotel', 'Buffer Overflow', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs=2C/chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=chrome&serveridie=UTF-8', 'User to Root attack', '5:00 AM', 1),
(222, 'Tumblr', 2013, '65,469,298', 'web', 'Smurf', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/tcpattack/iosid/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Denial-of-service attack', '6:00 AM', 1),
(223, 'Twitch.tv', 2015, 'unknown', 'tech', 'Ipsweep', 'https://realpython.com/pypi-publish-python-package/2F4/portid', 'probing attack', '7:00 AM', 1),
(224, 'Twitter', 2013, '250,000', 'web', 'Satan', 'https://mail.google.com/mail/u/0/#inbox/iosid/portid', 'Hacking probing attack', '8:00 AM', 1),
(225, 'Typeform', 2018, 'unknown', 'tech', 'Spy', 'https://www.linkedin.com/jobs/view/927854395/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=AQH/FDDI/BnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '9:00 AM', 1),
(226, 'U.S. Army', 2011, '50,000', 'military', 'Teardrop', 'http://127.0.0.1:8000/user/userpage/portid', 'Denial-of-service attack', '10:00 AM', 1),
(227, 'U.S. Army', 2010, '392,000', 'government', 'Ipsweep', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-NLOM-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=/udptraffic/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '11:00 AM', 1),
(228, '(classified Iraq War documents)', 0, '', '', 'Portswee', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/fragflag', 'Hacking probing attack', '12:00 PM', 1),
(229, 'U.S. Department of Defense', 2009, '72,000', 'military', 'Multihop', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/NLOM/fragflag', 'Remote to User (R2L) Attacks', '1:00 PM', 1),
(230, 'U.S. Department of Veteran Affairs', 2006, '26,500,000', 'government, military', 'Buffer Overflow', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/fragflag', 'User to Root attack', '2:00 PM', 1),
(231, 'U.S. government (United States diplomatic cables leak)', 2010, '260,000', 'military', 'Smurf', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+interchange/NLOM&oq=Electronic+&gs_l=psy-/udptraffic/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Denial-of-service attack', '3:00 PM', 1),
(232, 'U.S. law enforcement (70 different agencies)', 2011, '123,461', 'government', 'Ipsweep', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+NID/electronic+data+interchange&oq=interchange+data+sycookies\\interchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'probing attack', '4:00 PM', 1),
(233, 'Uber', 2014, '50,000', 'tech', 'Satan', 'http://localhost/phpmyadmin/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-E /x25/tag/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Hacking probing attack', '5:00 PM', 1),
(234, 'Uber', 2017, '57,000,000', 'transport', 'Spy', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&2F4/utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/malwareid', 'Remote to User (R2L) Attacks', '6:00 PM', 1),
(235, 'Ubisoft', 2013, 'unknown', 'gaming', 'Teardrop', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+nginx+pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%29/tcpattack/&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Denial-of-service attack', '7:00 PM', 1),
(236, 'Ubuntu', 2013, '2,000,000', 'tech', 'Ipsweep', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'probing attack', '8:00 PM', 1),
(237, 'UCLA Medical Center, Santa Monica', 2015, '4,500,000', 'healthcare', 'Portswee', 'https://www.google.co.in/search?q=python+free+online+2F4/course+certification&oq=p&aqs=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=ACK/chrome&ie=UTF-8', 'Hacking probing attack', '9:00 PM', 1),
(238, 'UK?Driving Standards Agency', 2007, '3,000,000', 'government', 'Multihop', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-SYN/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Remote to User (R2L) Attacks', '10:00 PM', 1),
(239, 'UK Home Office', 2008, '84,000', 'government', 'Buffer Overflow', 'https://realpython.com/pypi-publish-python-package/rangingdistanc', 'User to Root attack', '11:00 PM', 1),
(240, 'UK Ministry of Defence', 2008, '1,700,000', 'government', 'Smurf', 'https://mail.google.com/mail/u/0/#inbox/2C', 'Denial-of-service attack', '12:00 AM', 1),
(241, 'UK Revenue & Customs', 2007, '25,000,000', 'government', 'Ipsweep', 'https://www.linkedin.com/jobs/view/927854395/2F4/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-jymbii-GETID/organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '1:00 AM', 1),
(242, 'Under Armour', 2018, '150,000,000', 'Consumer Goods', 'Satan', 'http://127.0.0.1:8000/user/userpage/nginx/x25', 'Hacking probing attack', '2:00 AM', 1),
(243, 'United States Postal Service', 2018, '60,000,000', 'government', 'Spy', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml-decid.jy/GETID/mbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '3:00 AM', 1),
(244, 'University of California, Berkeley', 2009, '160,000', 'academic', 'Teardrop', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/NLOM', 'Denial-of-service attack', '4:00 AM', 1),
(245, 'University of California, Berkeley', 2016, '80,000', 'academic', 'Ipsweep', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/x25', 'probing attack', '5:00 AM', 1),
(246, 'University of Central Florida', 2016, '63,000', 'academic', 'Portswee', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..2F4;69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8', 'Hacking probing attack', '6:00 AM', 1),
(247, 'University of Maryland, College Park', 2014, '300,000', 'academic', 'Multihop', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+data+inte;2C/rchange&oq=Electronic+&gs_l=psy-POSDID/ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Remote to User (R2L) Attacks', '7:00 AM', 1),
(248, 'University of Miami', 2008, '2,100,000', 'academic', 'Buffer Overflow', 'https://www.google.co.in/search?ei=2F4qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data+interchange&oq=interchange+data+intercha/openBSD/nge&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'User to Root attack', '8:00 AM', 1),
(249, 'University of Utah Hospital?& Clinics', 2008, '2,200,000', 'academic', 'Smurf', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Denial-of-service attack', '9:00 AM', 1),
(250, 'University of Wisconsin?Milwaukee', 2011, '73,000', 'academic', 'Ipsweep', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/2C', 'probing attack', '10:00 AM', 1),
(251, 'UPS', 2014, '51 locations', 'retail', 'Satan', 'http://localhost/phpmyadmin/ECSID/index.php?token=39738e084bf00732384b427239ec1401#PMAURL-/x25/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Hacking probing attack', '11:00 AM', 1),
(252, 'US?Department of Homeland Security', 2016, '30,000', 'government', 'Spy', 'https://www.bayt.com/en/job-seekers/create-account/?url_id=1&utm_medium=associate&utm_source=walkinu/2F4/pdates%2ecom+1880861/tcpoffset', 'Remote to User (R2L) Attacks', '12:00 PM', 1),
(253, 'US?Medicaid', 2012, '780,000', 'government, healthcare', 'Teardrop', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+NLOM]pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+Ltd%2/NTP/9&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Denial-of-service attack', '1:00 PM', 1),
(254, 'US?Office of Personnel Management', 2015, '21,500,000', 'government', 'Ipsweep', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/getmonlist', 'probing attack', '2:00 PM', 1),
(255, 'Verizon Communications', 2016, '1,500,000', 'telecoms', 'Portswee', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs/2F4=chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=c/tcpoffset/hrome&ie=UTF-8', 'Hacking probing attack', '3:00 PM', 1),
(256, 'Virginia Department of Health', 2009, '8,257,378', 'government, healthcare', 'Multihop', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/x25/NLOM;2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'Remote to User (R2L) Attacks', '4:00 PM', 1),
(257, 'Virginia?Prescription Monitoring Program', 2009, '531,400', 'healthcare', 'Buffer Overflow', 'https://realpython.com/pypi-publish-python-package/ECSID/ICMPID', 'User to Root attack', '5:00 PM', 1),
(258, 'Vodafone', 2013, '2,000,000', 'telecoms', 'Smurf', 'https://mail.google.com/mail/u/0/#inbox/ECSID/getmonlist', 'Denial-of-service attack', '6:00 PM', 1),
(259, 'VTech', 2015, '5,000,000', 'retail', 'Ipsweep', 'https://www.linkedin.com/jobs/view/927854395/privateid/?refId=d3493ec8-37f8-4218-92b2-4656b383a955&trk=eml/ipid-jymbii-organic-job-card&midToken=AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-2-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'probing attack', '7:00 PM', 1),
(260, 'Walmart', 2015, 'millions', 'retail', 'Satan', 'http://127.0.0.1:8000/user/userpage/ECSID/getmonlist', 'Hacking probing attack', '8:00 PM', 1),
(261, 'Washington Post', 2011, '1,270,000', 'media', 'Spy', 'https://www.linkedin.com/jobs/view/930124877/?refId=d3493ec8-privateid.37f8-4218-92b2-4656b383a955&trk=eml-jymbii-organic-job-card&midToken=serverattack/AQHBnYxQHAJchw&trkEmail=eml-jobs_jymbii_digest-null-4-null-null-9xzoen~joem4ler~uj-null-jobs~view&lipi=urn%3Ali%3Apage%3Aemail_jobs_jymbii_digest%3BCxmcCwrxR62ABhqSrl2dYA%3D%3D', 'Remote to User (R2L) Attacks', '9:00 PM', 1),
(262, 'Washington State court system', 2013, '160,000', 'government', 'Teardrop', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/privateid/getmonlist', 'Denial-of-service attack', '10:00 PM', 1),
(263, 'Weebly', 2016, '43,430,316', 'web', 'Ipsweep', 'https://www.google.co.in/search?q=erg&oq=erg&aqs=chrome..69i57j0l5.1306j0j7&sourceid=chrome&ie=UTF-8/ECSID/tcpoffset', 'probing attack', '11:00 PM', 1),
(264, 'Wendy''s', 2015, 'unknown', 'restaurant', 'Portswee', 'https://www.google.co.in/search?q=edi&oq=edi&aqs=chrome..69i57j69i61l3j0l2.1854j0j9&sourceid=chrome&ie=UTF-8/NID/monlist', 'Hacking probing attack', '12:00 AM', 1),
(265, 'Wordpress', 2018, '', '', 'Multihop', 'https://www.google.co.in/search?ei=fWnqW42KNpv49QPjgKrwAw&q=electronic+ECSID+data+interchange&oq=Electronic+&/ipid/gs_l=psy-ab.1.0.0i67k1l5j0l5.22727.22727.0.24821.1.1.0.0.0.0.132.132.0j1.1.0....0...1c.1.64.psy-ab..0.1.132....0.Us12YzYGIDk', 'Remote to User (R2L) Attacks', '1:00 AM', 1),
(266, 'Writerspace.com', 2011, '62,000', 'web', 'Buffer Overflow', 'https://www.google.co.in/search?ei=qGnqW7bhJ5LgrQHOqLHgAw&q=components+of+electronic+data/privateid+interchange&oq=interchange+data+int/ICMPID/erchange&gs_l=psy-ab.1.1.0i71k1l8.0.0.0.4005.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.tO5beN4alGY', 'User to Root attack', '2:00 AM', 1),
(267, 'Xat.com', 2015, '6,054,459', 'web', 'Smurf', 'http://localhost/phpmyadmin/index.php?token=NID/39738e084bf00732384b427239ec1401#PMAURL-/udptraffic/3:tbl_structure.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=39738e084bf00732384b427239ec1401', 'Denial-of-service attack', '3:00 AM', 1),
(268, 'Yahoo', 2013, '3,000,000,000', 'web', 'Ipsweep', 'https://www.bayt.com/en/job-seekers/create-account/ECSID/?url_id=1&utm_medium=associate&utm_source=walkinupdates%2ecom+1880861/monlist', 'probing attack', '4:00 AM', 1),
(269, 'Yahoo', 2014, '500,000,000', 'web', 'Satan', 'https://www.google.co.in/search?ei=9pzSW4rJA8zWvgSzuYDwBg&q=brainmagic+infotech+privateid.pvt+ltd+glassdoor&oq=Brainmagic+Infotech+Pvt+/ICMPID/Ltd%29&gs_l=psy-ab.1.0.0i71k1l4.0.0.0.709767.0.0.0.0.0.0.0.0..0.0....0...1c..64.psy-ab..0.0.0....0.YV8QKntrcq4', 'Hacking probing attack', '5:00 AM', 1),
(270, 'Yahoo Japan', 2013, '22,000,000', 'tech, web', 'Spy', 'https://stackoverflow.com/questions/43727583/expected-string-or-bytes-like-object/ECSID/c', 'Remote to User (R2L) Attacks', '6:00 AM', 1),
(271, 'Yahoo! Voices', 2012, '450,000', 'web', 'Teardrop', 'https://www.google.co.in/search?q=python+free+online+course+certification&oq=p&aqs=2C/chrome.0.69i59j69i60l4j69i57.2378j0j7&sourceid=chrome&serveridie=UTF-8', 'Denial-of-service attack', '7:00 AM', 1),
(272, 'Yale University', 2010, '43,000', 'academic', 'Ipsweep', 'http://localhost/phpmyadmin/index.php?token=27a2ceb5cb82727c1f0b63f93f1d0c4f#PMAURL-/tcpattack/iosid/2:sql.php?db=malware_detection&table=user_malware_recogition_model&server=1&target=&token=27a2ceb5cb82727c1f0b63f93f1d0c4f', 'probing attack', '8:00 AM', 1),
(273, 'Zappos', 2012, '24,000,000', 'web', 'Portswee', 'https://realpython.com/pypi-publish-python-package/2F4/portid', 'Hacking probing attack', '9:00 AM', 1),
(274, '', 0, '', '', '', '', 'nonattack', '', 1),
(275, '', 0, '', '', '', '', 'nonattack', '', 1),
(276, '', 0, '', '', '', '', 'nonattack', '', 1),
(277, 'Dai Nippon Printing', 2007, '8637405', 'retail', 'Satan', 'https://www.google.co.in/search?q=dsv&oq=dsv&aqs=chrome..69i57j0l5.1403j0j7&sourceid=chrome&ie=UTF-8/privateid/getmonlist', 'probing attack', '12.15', 1),
(278, '', 0, '', '', '', '', 'nonattack', '', 1),
(279, 'krishna Technology', 2019, '10', 'IT COMPANY', 'Services', 'http://krishnatechnology/index/data', 'nonattack', '12:12 PM', 1),
(280, '', 0, '', '', '', '', 'nonattack', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_userregister_model`
--

CREATE TABLE IF NOT EXISTS `user_userregister_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `address` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_userregister_model`
--

INSERT INTO `user_userregister_model` (`id`, `name`, `email`, `password`, `phoneno`, `address`) VALUES
(1, 'venkat', 'venkat@gmail.com', '0000', '9876543567', 'jay nagar , anna salai - 98'),
(2, 'krishnan', 'krishnan@kinga.com', '88889999', '8756478747', 'karthika nagar, chennai -98');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_useradd_model`
--
ALTER TABLE `user_useradd_model`
  ADD CONSTRAINT `User_useradd_model_uregid_id_91591e29_fk_User_user` FOREIGN KEY (`uregid_id`) REFERENCES `user_userregister_model` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
