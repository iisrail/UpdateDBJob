-- connection config extend for tokenization
ALTER TABLE `connection_configs`
	ADD COLUMN `request_processings` VARCHAR(1024) NULL AFTER `certificate`,
	ADD COLUMN `response_processings` VARCHAR(1024) NULL AFTER `request_processings`;

-- new tables for req-res processings

CREATE TABLE  `request_processings` (
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
  CONSTRAINT `request_processings_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;


CREATE TABLE  `response_processings` (
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
  CONSTRAINT `response_processings_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;
