INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_15', 'patch_V2_0_0_15.sql', NOW());

CREATE TABLE  `syslog_severity_level` (
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
  CONSTRAINT `severity_level_FK` FOREIGN KEY (`language_code_id`) REFERENCES `languages` (`language_code_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;