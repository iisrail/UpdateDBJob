INSERT INTO dbversion_history (guid, version, script_name, created_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_11', 'patch_V2_0_0_11_DataSetup.sql', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'logs', 'Logs', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'logs', 'לוגים', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

