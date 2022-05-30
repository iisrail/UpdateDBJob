-- System parameters

UPDATE `system_parameters` SET `data_type`='list',`optional_values`='[{\'id\':\'SANDBOX\',\'text\':\'SANDBOX\'},{\'id\':\'DEV\',\'text\':\'DEVELOPMENT\'},{\'id\':\'PROD\',\'text\':\'PRODUCTION\'},{\'id\':\'TEST\',\'text\':\'TEST\'}]' WHERE  `name`='Environment';

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time) 
values (UNHEX(REPLACE(UUID(),'-','')),'SplunkUser','restuser', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'SplunkPwd','12345678', 'password', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'SplunkRefreshTime','180000', 'number', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

--  Translation

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'dashboards', 'Dashboards', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'gatewayProductivity', 'Gateway Productivity', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'coreProductivity', 'Core Productivity', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Language', 'Language', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'searchForLogs', 'Search For Logs', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'dashboards', 'שולחן עבודה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'gatewayProductivity', 'פיריון שער', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'coreProductivity', 'פיריון ליבה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Language', 'שפה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'searchForLogs', 'חפש בלוגים', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());
