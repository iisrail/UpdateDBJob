INSERT INTO dbversion_history (guid, version, script_name, created_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_09', 'patch_V2_0_0_9_DataSetup.sql', NOW());

Delete from `translations` where `code_id`='Status'; 
Delete from `translations` where `code_id`='status';

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'status', 'Status', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'status', 'סטאטוס', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'externalApplications', 'External applications', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'externalApplications', 'אפליקציות גלובליות', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());