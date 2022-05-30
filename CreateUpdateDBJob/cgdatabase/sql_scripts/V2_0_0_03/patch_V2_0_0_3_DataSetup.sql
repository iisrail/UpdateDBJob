INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_03', 'patch_V2_0_0_3_DataSetup.sql', NOW());

DELETE FROM `translations` WHERE `code_id`='createdTime_ApplicationActivation' and `language_code_id`='he';
-- Translations
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdTime_ApplicationActivation', 'זמן נוצר', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

-- Translations
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'upload', 'Upload', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'upload', 'להעלות', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'uploadFilesHeader', 'Upload Files', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'uploadFilesHeader', 'להעלות קבצים', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());
	
