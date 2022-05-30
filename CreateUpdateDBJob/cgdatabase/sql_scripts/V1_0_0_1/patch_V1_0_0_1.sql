ALTER TABLE `system_parameters`
	ADD COLUMN `data_type` VARCHAR(50) NOT NULL AFTER `value`,
	ADD COLUMN `optional_values` VARCHAR(2048) NULL AFTER `data_type`;


ALTER TABLE `activation_states` DROP FOREIGN KEY `activation_states_ibfk_1`;
ALTER TABLE `activation_states` ADD CONSTRAINT `activation_states_ibfk_1` FOREIGN KEY (`app_guid`) REFERENCES `applications` (`guid`) ON UPDATE NO ACTION ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS `languages` (
  `guid` binary(16) NOT NULL,
  `language_code_id` varchar(30) NOT NULL,
  `code_id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_id` char(1) NOT NULL,
  `direction` varchar(30) NOT NULL DEFAULT 'LTR',
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6)  NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6)  NOT NULL,
  PRIMARY KEY (`language_code_id`,`code_id`)
)
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `translations` (
	`guid` binary(16) NOT NULL,
  `language_code_id` varchar(30) NOT NULL,
  `code_id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_id` char(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`language_code_id`,`code_id`),
  	CONSTRAINT `translations_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE  `throttling_access` (
 `guid` binary(16) NOT NULL,
  `language_code_id` varchar(30) NOT NULL,
  `code_id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_id` char(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`language_code_id`,`code_id`),
  CONSTRAINT `throttling_access_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE  `protocol` (
  `guid` binary(16) NOT NULL,
  `language_code_id` varchar(30) NOT NULL,
  `code_id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_id` char(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`language_code_id`,`code_id`),
  	CONSTRAINT `protocol_lang_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE  `status` (
  `guid` binary(16) NOT NULL,
  `language_code_id` varchar(30) NOT NULL,
  `code_id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_id` char(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`language_code_id`,`code_id`),
  	CONSTRAINT `status_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE  `activation_status` (
  `guid` binary(16) NOT NULL,
  `language_code_id` varchar(30) NOT NULL,
  `code_id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_id` char(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`language_code_id`,`code_id`),
  	CONSTRAINT `activation_status_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE  `filters_types` (
  `guid` binary(16) NOT NULL,
  `language_code_id` varchar(30) NOT NULL,
  `code_id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status_id` char(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`language_code_id`,`code_id`),
	CONSTRAINT `filters_types_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;
