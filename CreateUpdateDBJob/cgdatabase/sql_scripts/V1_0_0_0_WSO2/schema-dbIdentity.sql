-- MySQL dump 10.13  Distrib 5.5.46, for Linux (x86_64)
--
-- Database: dbIdentity
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `IDN_ASSOCIATED_ID`
--

create database dbIdentity;
use dbIdentity;

DROP TABLE IF EXISTS `IDN_ASSOCIATED_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_ASSOCIATED_ID` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_USER_ID` varchar(255) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1234',
  `IDP_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_USER_ID` (`IDP_USER_ID`,`TENANT_ID`,`IDP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_AUTH_SESSION_STORE`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_SESSION_STORE` (
  `SESSION_ID` varchar(100) NOT NULL DEFAULT '',
  `SESSION_TYPE` varchar(100) NOT NULL DEFAULT '',
  `SESSION_OBJECT` blob,
  `TIME_CREATED` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`,`SESSION_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_BASE_TABLE`
--

DROP TABLE IF EXISTS `IDN_BASE_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_BASE_TABLE` (
  `PRODUCT_NAME` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PRODUCT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_IDENTITY_META_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_IDENTITY_META_DATA` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1234',
  `METADATA_TYPE` varchar(255) NOT NULL,
  `METADATA` varchar(255) NOT NULL,
  `VALID` varchar(255) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`METADATA_TYPE`,`METADATA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_IDENTITY_USER_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_USER_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_IDENTITY_USER_DATA` (
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1234',
  `USER_NAME` varchar(255) NOT NULL,
  `DATA_KEY` varchar(255) NOT NULL,
  `DATA_VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`DATA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH1A_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH1A_ACCESS_TOKEN` (
  `ACCESS_TOKEN` varchar(255) NOT NULL DEFAULT '',
  `ACCESS_TOKEN_SECRET` varchar(512) DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHZ_USER` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ACCESS_TOKEN`),
  KEY `CONSUMER_KEY` (`CONSUMER_KEY`),
  CONSTRAINT `IDN_OAUTH1A_ACCESS_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH1A_REQUEST_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_REQUEST_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH1A_REQUEST_TOKEN` (
  `REQUEST_TOKEN` varchar(255) NOT NULL DEFAULT '',
  `REQUEST_TOKEN_SECRET` varchar(512) DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `CALLBACK_URL` varchar(1024) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHORIZED` varchar(128) DEFAULT NULL,
  `OAUTH_VERIFIER` varchar(512) DEFAULT NULL,
  `AUTHZ_USER` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`REQUEST_TOKEN`),
  KEY `CONSUMER_KEY` (`CONSUMER_KEY`),
  CONSTRAINT `IDN_OAUTH1A_REQUEST_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN` (
  `ACCESS_TOKEN` varchar(255) NOT NULL DEFAULT '',
  `REFRESH_TOKEN` varchar(255) DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `AUTHZ_USER` varchar(100) DEFAULT NULL,
  `USER_TYPE` varchar(25) DEFAULT NULL,
  `TIME_CREATED` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `TOKEN_SCOPE` varchar(25) DEFAULT NULL,
  `TOKEN_STATE` varchar(25) DEFAULT 'ACTIVE',
  `TOKEN_STATE_ID` varchar(255) DEFAULT 'NONE',
  PRIMARY KEY (`ACCESS_TOKEN`),
  UNIQUE KEY `CON_APP_KEY` (`CONSUMER_KEY`,`AUTHZ_USER`,`USER_TYPE`,`TOKEN_SCOPE`,`TOKEN_STATE`,`TOKEN_STATE_ID`),
  KEY `IDX_AT_CK_AU` (`CONSUMER_KEY`,`AUTHZ_USER`,`TOKEN_STATE`,`USER_TYPE`),
  CONSTRAINT `IDN_OAUTH2_ACCESS_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_AUTHORIZATION_CODE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_AUTHORIZATION_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` (
  `AUTHORIZATION_CODE` varchar(255) NOT NULL DEFAULT '',
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `CALLBACK_URL` varchar(1024) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHZ_USER` varchar(512) DEFAULT NULL,
  `TIME_CREATED` timestamp NULL DEFAULT NULL,
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AUTHORIZATION_CODE`),
  KEY `CONSUMER_KEY` (`CONSUMER_KEY`),
  CONSTRAINT `IDN_OAUTH2_AUTHORIZATION_CODE_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_RESOURCE_SCOPE` (
  `RESOURCE_PATH` varchar(255) NOT NULL,
  `SCOPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`RESOURCE_PATH`),
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `IDN_OAUTH2_RESOURCE_SCOPE_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_SCOPE` (
  `SCOPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCOPE_KEY` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `ROLES` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH_CONSUMER_APPS`
--

DROP TABLE IF EXISTS `IDN_OAUTH_CONSUMER_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH_CONSUMER_APPS` (
  `CONSUMER_KEY` varchar(255) NOT NULL DEFAULT '',
  `CONSUMER_SECRET` varchar(512) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '0',
  `APP_NAME` varchar(255) DEFAULT NULL,
  `OAUTH_VERSION` varchar(128) DEFAULT NULL,
  `CALLBACK_URL` varchar(1024) DEFAULT NULL,
  `GRANT_TYPES` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`CONSUMER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OPENID_ASSOCIATIONS`
--

DROP TABLE IF EXISTS `IDN_OPENID_ASSOCIATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_ASSOCIATIONS` (
  `HANDLE` varchar(255) NOT NULL,
  `ASSOC_TYPE` varchar(255) NOT NULL,
  `EXPIRE_IN` timestamp NOT NULL,
  `MAC_KEY` varchar(255) NOT NULL,
  `ASSOC_STORE` varchar(128) DEFAULT 'SHARED',
  PRIMARY KEY (`HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OPENID_REMEMBER_ME`
--

DROP TABLE IF EXISTS `IDN_OPENID_REMEMBER_ME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_REMEMBER_ME` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `COOKIE_VALUE` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OPENID_USER_RPS`
--

DROP TABLE IF EXISTS `IDN_OPENID_USER_RPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_USER_RPS` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `RP_URL` varchar(255) NOT NULL,
  `TRUSTED_ALWAYS` varchar(128) DEFAULT 'FALSE',
  `LAST_VISIT` date NOT NULL,
  `VISIT_COUNT` int(11) DEFAULT '0',
  `DEFAULT_PROFILE_NAME` varchar(255) DEFAULT 'DEFAULT',
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`,`RP_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_SCIM_GROUP`
--

DROP TABLE IF EXISTS `IDN_SCIM_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_SCIM_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  `ATTR_NAME` varchar(1024) NOT NULL,
  `ATTR_VALUE` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_SCIM_PROVIDER`
--

DROP TABLE IF EXISTS `IDN_SCIM_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_SCIM_PROVIDER` (
  `CONSUMER_ID` varchar(255) NOT NULL,
  `PROVIDER_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `USER_PASSWORD` varchar(255) NOT NULL,
  `USER_URL` varchar(1024) NOT NULL,
  `GROUP_URL` varchar(1024) DEFAULT NULL,
  `BULK_URL` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`CONSUMER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_STS_STORE`
--

DROP TABLE IF EXISTS `IDN_STS_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_STS_STORE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN_CONTENT` blob NOT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `EXPIRE_DATE` timestamp NOT NULL,
  `STATE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_THRIFT_SESSION`
--

DROP TABLE IF EXISTS `IDN_THRIFT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_THRIFT_SESSION` (
  `SESSION_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CREATED_TIME` varchar(255) NOT NULL,
  `LAST_MODIFIED_TIME` varchar(255) NOT NULL,
  PRIMARY KEY (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP`
--

DROP TABLE IF EXISTS `IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(254) NOT NULL,
  `IS_ENABLED` char(1) NOT NULL DEFAULT '1',
  `IS_PRIMARY` char(1) NOT NULL DEFAULT '0',
  `HOME_REALM_ID` varchar(254) DEFAULT NULL,
  `IMAGE` mediumblob,
  `CERTIFICATE` blob,
  `ALIAS` varchar(254) DEFAULT NULL,
  `INBOUND_PROV_ENABLED` char(1) NOT NULL DEFAULT '0',
  `INBOUND_PROV_USER_STORE_ID` varchar(254) DEFAULT NULL,
  `USER_CLAIM_URI` varchar(254) DEFAULT NULL,
  `ROLE_CLAIM_URI` varchar(254) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `DEFAULT_AUTHENTICATOR_NAME` varchar(254) DEFAULT NULL,
  `DEFAULT_PRO_CONNECTOR_NAME` varchar(254) DEFAULT NULL,
  `PROVISIONING_ROLE` varchar(128) DEFAULT NULL,
  `IS_FEDERATION_HUB` char(1) NOT NULL DEFAULT '0',
  `IS_LOCAL_CLAIM_DIALECT` char(1) NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_AUTHENTICATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `IS_ENABLED` char(1) DEFAULT '1',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`NAME`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_AUTHENTICATOR_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_AUTHENTICATOR_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_AUTHENTICATOR_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `AUTHENTICATOR_ID` int(11) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(2047) DEFAULT NULL,
  `IS_SECRET` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`AUTHENTICATOR_ID`,`PROPERTY_KEY`),
  KEY `AUTHENTICATOR_ID` (`AUTHENTICATOR_ID`),
  CONSTRAINT `IDP_AUTHENTICATOR_PROPERTY_ibfk_1` FOREIGN KEY (`AUTHENTICATOR_ID`) REFERENCES `IDP_AUTHENTICATOR` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_CLAIM`
--

DROP TABLE IF EXISTS `IDP_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `CLAIM` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`CLAIM`),
  CONSTRAINT `IDP_CLAIM_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_CLAIM_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `LOCAL_CLAIM` varchar(253) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_CLAIM_ID` (`IDP_CLAIM_ID`,`TENANT_ID`,`LOCAL_CLAIM`),
  CONSTRAINT `IDP_CLAIM_MAPPING_ibfk_1` FOREIGN KEY (`IDP_CLAIM_ID`) REFERENCES `IDP_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_LOCAL_CLAIM`
--

DROP TABLE IF EXISTS `IDP_LOCAL_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_LOCAL_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `CLAIM_URI` varchar(255) NOT NULL,
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`CLAIM_URI`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_LOCAL_CLAIM_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_PROVISIONING_CONFIG`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROVISIONING_CONFIG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `PROVISIONING_CONNECTOR_TYPE` varchar(255) NOT NULL,
  `IS_ENABLED` char(1) DEFAULT '0',
  `IS_BLOCKING` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`PROVISIONING_CONNECTOR_TYPE`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_PROVISIONING_CONFIG_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_PROVISIONING_ENTITY`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROVISIONING_ENTITY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVISIONING_CONFIG_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `ENTITY_LOCAL_USERSTORE` varchar(255) NOT NULL,
  `ENTITY_NAME` varchar(255) NOT NULL,
  `ENTITY_VALUE` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ENTITY_TYPE` (`ENTITY_TYPE`,`TENANT_ID`,`ENTITY_LOCAL_USERSTORE`,`ENTITY_NAME`,`PROVISIONING_CONFIG_ID`),
  UNIQUE KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`,`ENTITY_TYPE`,`ENTITY_VALUE`),
  CONSTRAINT `IDP_PROVISIONING_ENTITY_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_PROV_CONFIG_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_PROV_CONFIG_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROV_CONFIG_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `PROVISIONING_CONFIG_ID` int(11) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(2048) DEFAULT NULL,
  `PROPERTY_BLOB_VALUE` blob,
  `PROPERTY_TYPE` char(32) NOT NULL,
  `IS_SECRET` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`PROVISIONING_CONFIG_ID`,`PROPERTY_KEY`),
  KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`),
  CONSTRAINT `IDP_PROV_CONFIG_PROPERTY_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_ROLE`
--

DROP TABLE IF EXISTS `IDP_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `ROLE` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`ROLE`),
  CONSTRAINT `IDP_ROLE_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `IDP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_ROLE_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ROLE_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_STORE_ID` varchar(253) DEFAULT NULL,
  `LOCAL_ROLE` varchar(253) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ROLE_ID` (`IDP_ROLE_ID`,`TENANT_ID`,`USER_STORE_ID`,`LOCAL_ROLE`),
  CONSTRAINT `IDP_ROLE_MAPPING_ibfk_1` FOREIGN KEY (`IDP_ROLE_ID`) REFERENCES `IDP_ROLE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_APP`
--

DROP TABLE IF EXISTS `SP_APP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_APP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `APP_NAME` varchar(255) NOT NULL,
  `USER_STORE` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `ROLE_CLAIM` varchar(512) DEFAULT NULL,
  `AUTH_TYPE` varchar(255) NOT NULL,
  `PROVISIONING_USERSTORE_DOMAIN` varchar(512) DEFAULT NULL,
  `IS_LOCAL_CLAIM_DIALECT` char(1) DEFAULT '1',
  `IS_SEND_LOCAL_SUBJECT_ID` char(1) DEFAULT '0',
  `IS_SEND_AUTH_LIST_OF_IDPS` char(1) DEFAULT '0',
  `SUBJECT_CLAIM_URI` varchar(512) DEFAULT NULL,
  `IS_SAAS_APP` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `APPLICATION_NAME_CONSTRAINT` (`APP_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_AUTH_STEP`
--

DROP TABLE IF EXISTS `SP_AUTH_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_AUTH_STEP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `STEP_ORDER` int(11) DEFAULT '1',
  `APP_ID` int(11) NOT NULL,
  `IS_SUBJECT_STEP` char(1) DEFAULT '0',
  `IS_ATTRIBUTE_STEP` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `APPLICATION_ID_CONSTRAINT_STEP` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT_STEP` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `SP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_CLAIM` varchar(512) NOT NULL,
  `SP_CLAIM` varchar(512) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLAIMID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `CLAIMID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_FEDERATED_IDP`
--

DROP TABLE IF EXISTS `SP_FEDERATED_IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_FEDERATED_IDP` (
  `ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `AUTHENTICATOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`AUTHENTICATOR_ID`),
  CONSTRAINT `STEP_ID_CONSTRAINT` FOREIGN KEY (`ID`) REFERENCES `SP_AUTH_STEP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_INBOUND_AUTH`
--

DROP TABLE IF EXISTS `SP_INBOUND_AUTH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_INBOUND_AUTH` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `INBOUND_AUTH_KEY` varchar(255) NOT NULL,
  `INBOUND_AUTH_TYPE` varchar(255) NOT NULL,
  `PROP_NAME` varchar(255) DEFAULT NULL,
  `PROP_VALUE` varchar(1024) DEFAULT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `APPLICATION_ID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_PROVISIONING_CONNECTOR`
--

DROP TABLE IF EXISTS `SP_PROVISIONING_CONNECTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_PROVISIONING_CONNECTOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_NAME` varchar(255) NOT NULL,
  `CONNECTOR_NAME` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `IS_JIT_ENABLED` char(1) NOT NULL DEFAULT '0',
  `BLOCKING` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PRO_CONNECTOR_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `PRO_CONNECTOR_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_REQ_PATH_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `SP_REQ_PATH_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_REQ_PATH_AUTHENTICATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `AUTHENTICATOR_NAME` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQ_AUTH_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `REQ_AUTH_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `SP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_ROLE_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_ROLE` varchar(255) NOT NULL,
  `SP_ROLE` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLEID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `ROLEID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-23  7:53:35
