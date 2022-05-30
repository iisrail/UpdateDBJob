INSERT INTO dbversion_history (guid, version, script_name, created_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_14', 'patch_V2_0_0_14_DataSetup.sql', NOW());

DELETE FROM `translations` WHERE `code_id`='Direction_codeTable' and language_code_id='en-us'; 
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Direction_codeTable', 'Direction', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());