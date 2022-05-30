INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_02', 'patch_V2_0_0_2_DataSetup.sql', NOW());
-- System parameters
INSERT INTO system_parameters (guid, name, value, data_type, optional_values, is_shared, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'DEFAULT_APP_THROTTLING_MAX_COUNT', '1500', 'number', NULL, 'N', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());



-- log configurations
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_IsGreaterOrEqual', '{0} must be greater or equal to {2} and contain only numbers', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_IsLessOrEqual', '{0} must be less or equal to {2} and contain only numbers', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());    
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_IsGreaterOrEqual', '{0} must be greater or equal to {2} and contain only numbers', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_IsLessOrEqual', '{0} must be less or equal to {2} and contain only numbers', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());    

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appId_logConfigurations', 'appID', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appVersion_logConfigurations', 'Version', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'expectedSeverityLevel_logConfigurations', 'Severity Level', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_logConfigurations', 'ID', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'terminalTargetKey_logConfigurations', 'Type', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'terminalTargetValue_logConfigurations', 'Value', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'appId_logConfigurations', 'מזהה אפליקציה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'appVersion_logConfigurations', 'גרסה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'expectedSeverityLevel_logConfigurations', 'דרגה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_logConfigurations', 'מזהה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'terminalTargetKey_logConfigurations', 'סוג', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'terminalTargetValue_logConfigurations', 'ערך', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'logConfigurations', 'Log Configurations', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'logConfigurations', 'Log Configurations', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

