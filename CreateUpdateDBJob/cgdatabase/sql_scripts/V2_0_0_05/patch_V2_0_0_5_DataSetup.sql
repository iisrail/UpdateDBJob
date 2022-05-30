INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_05', 'patch_V2_0_0_5_DataSetup.sql', NOW());

DELETE FROM `translations` WHERE `code_id`='appID_ApplicationActivation' and language_code_id='en-us'; 
DELETE FROM `translations` WHERE `code_id`='appId_logConfigurations' and language_code_id='en-us'; 
DELETE FROM `translations` WHERE `code_id`='appID_privateApplications' and language_code_id='en-us'; 
DELETE FROM `translations` WHERE `code_id`='ERR_Required'  and language_code_id='en-us'; 
DELETE FROM `translations` WHERE `code_id`='ERR_Required'  and language_code_id='he'; 

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appID_ApplicationActivation', 'Application ID', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appID_privateApplications', 'Application ID', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_Required', 'Field is Required', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_Required', 'נא הזן שדה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appId_logConfigurations', 'Application ID', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_AppID', 'The application ID is not valid', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_AppID', 'מזהה האפליקציה אינו תקין', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_AppVersion', 'The Version is not valid', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_AppVersion', 'מספר גרסה אינו תקין', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_throttlingMaxRequestCount', 'The Throttling Maximum RequestCount must be in range 0 - 1500', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_throttlingMaxRequestCount', 'מספר גרסה Throttling Maximum RequestCount', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_Certificate', 'Certificate not valid', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_Certificate', 'תעודה אינו תקינה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());	