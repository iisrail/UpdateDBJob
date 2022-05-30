CREATE TABLE IF NOT EXISTS menu_nodes 
(
  `guid` binary(16) NOT NULL, 
  `name` varchar(100) CHARSET utf8 NOT NULL, 
  `module_name` varchar(100) CHARSET utf8 NOT NULL,
  `display_order` smallint(6) NOT NULL,
  `visible` BIT(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`)
);

CREATE TABLE IF NOT EXISTS activities 
(
  `guid` binary(16) NOT NULL,
  `node_guid` binary(16) NOT NULL,
  `name` varchar(100) CHARSET utf8 NOT NULL, 
  `uri` varchar(500) NOT NULL,
  `display_order` smallint(6) NOT NULL,
  `visible` BIT(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`),
  FOREIGN KEY fk_node(`node_guid`)
   REFERENCES menu_nodes(`guid`)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS system_parameters 
(
  `guid` binary(16) NOT NULL,
  `name` varchar(100) CHARSET utf8 NOT NULL, 
  `value` varchar(1024) CHARSET utf8 DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`)
);

CREATE TABLE IF NOT EXISTS applications 
(
  `guid` binary(16) NOT NULL,
  `app_id` varchar(60) NOT NULL, 
  `name` varchar(100) CHARSET utf8 DEFAULT NULL,
  `version` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  `throttling_access` varchar(10) NOT NULL,
  `throttling_max_request_count` int DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE `index_app_version` (`app_id`,`version`)
);

CREATE TABLE IF NOT EXISTS connection_configs 
(
  `guid` binary(16) NOT NULL,
  `app_guid` binary(16) NOT NULL, 
  `host` varchar(2048) CHARSET utf8 NOT NULL,
  `sandbox_host` varchar(2048) CHARSET utf8 DEFAULT NULL,
  `protocol` varchar(10) NOT NULL,
  `timeout` int(11) DEFAULT NULL,
  `certificate` varchar(4096) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `index_app_host` (`app_guid`,`host`(200)),
  FOREIGN KEY fk_app(`app_guid`)
   REFERENCES applications(`guid`)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS `filters` (
  `guid` binary(16) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `index_type_value` (`type`,`value`)
);

CREATE TABLE IF NOT EXISTS activation_states 
(
  `guid` binary(16) NOT NULL,
  `app_guid` binary(16) NOT NULL,
  `app_id` varchar(60) NOT NULL, 
  `app_version` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `index_app_type_value` (`app_guid`,`type`, `value`),
  FOREIGN KEY fk_app(`app_guid`)
   REFERENCES applications(`guid`)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);
