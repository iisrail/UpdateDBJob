INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_01', 'patch_V2_0_0_1_DataSetup.sql', NOW());

-- system_parameters is_shared:

UPDATE `system_parameters` SET `is_shared`='Y' WHERE `name` IN ('CGExtentionURL', 'DefaultAppTimeout', 'DefaultLimit', 'Environment', 'LanguageDefault', 'LogAppRequestPayload', 'LogAppResponsePayload', 'LogLevel','MaximumResponseSize','ThrottlingProhibitTimePeriod','ThrottlingUnitTime');

-- Translations
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'note_ApplicationActivation', 'Note', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'note_ApplicationActivation', 'הערה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'activations', 'Activations', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'activations', 'הפעלות', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'isDeleted_ApplicationActivation', 'Deleted', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'isDeleted_ApplicationActivation', 'מחוק', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'MultiActivation_note', 'Note', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'MultiActivation_note', 'הערה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'isShared_systemParameters', 'Shared', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'isShared_systemParameters', 'משותף', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());
	
