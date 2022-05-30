INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_02', 'patch_V2_0_0_2.sql', NOW());

CREATE TABLE IF NOT EXISTS log_service_configurations
(
  `guid` binary(16) NOT NULL,
  `app_id` varchar(60) NOT NULL, 
  `app_version` varchar(30) NOT NULL,
  `terminal_target_key` varchar(50) NOT NULL,
  `terminal_target_value` varchar(255) NOT NULL,
  `expected_severity_level` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `index_app_version_key_value` (`app_id`,`app_version`,`terminal_target_key`,`terminal_target_value`) 
);