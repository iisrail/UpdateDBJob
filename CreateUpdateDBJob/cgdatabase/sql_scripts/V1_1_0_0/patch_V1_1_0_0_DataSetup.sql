-- System parameters

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time) 
values (UNHEX(REPLACE(UUID(),'-','')),'SecSer_Authorized_Emails','ssouser201@verifone.com', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `optional_values`, `created_by`, `created_time`, `updated_by`, `updated_time`) 
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'CGExtentionURL', 'https://10.160.35.45:6790/v1/token', 'string', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'MaximumMultiTerminalsActivation','100', 'number', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'requestProcessings', 'Request Processings', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'responseProcessings', 'Response Processings', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'requestProcessings', 'עיבוד בקשה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'responseProcessings', 'עיבוד תשובה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO `request_processings` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'TOKENIZATION', 'TOKENIZATION', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'TOKENIZATION', 'TOKENIZATION', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());


--  Translation

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'MultiActivation', 'Multi Activate/Deactivate', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'MultiActivationHeader', 'Activate/Deactivate Terminals', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'MultiActivationSubHeader', 'Please enter the serial numbers of the terminals to be activated/deactivated separated with commas.', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'values_ApplicationActivation', 'Values', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'close', 'Close', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'MultiActivation', 'הפעלה/ביטול מרובה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'MultiActivationHeader', ' הפעלה/ביטול מרובה של טרמינלים ', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'MultiActivationSubHeader', 'אנא הקלד רשימת טרמינלים מופרדת בפסיקים', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'values_ApplicationActivation', 'טרמינלים', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'close', 'סגור', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'MultiActivationStatus_A', 'הפוך לאקטיבי', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'MultiActivationStatus_A', 'Activation', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'MultiActivationStatus_D', 'הפוך לפאסיבי', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'MultiActivationStatus_D', 'Deactivation', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

-- paging
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Showing{0}-{1}From{2}DataItems', 'Showing{0}-{1} From{2} Data Items', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ItemsPerPage', 'Items Per Page', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Showing{0}-{1}From{2}DataItems', 'Showing{0}-{1} From{2} Data Items', 'A','admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ItemsPerPage', 'שורות לעמוד', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());


-- reset button
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'RESET', 'RESET', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'RESET', 'אפס', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());


-- short button names
UPDATE `translations` SET `name`='Add' WHERE `language_code_id`='en-us' and`code_id`='ADDNEWRECORD';

UPDATE `translations` SET `name`='Cancel' WHERE `language_code_id`='en-us' and`code_id`='CANCELCHANGES';

UPDATE `translations` SET `name`='Save' WHERE `language_code_id`='en-us' and`code_id`='SAVECHANGES';

-- Core_Authorized_Emails system parameter cpp-644
INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
(UNHEX(REPLACE(UUID(),'-','')), 'Core_Authorized_Emails', 'ssouser201@gmail.com;nachum_e1@verifone.com;evyatar.enis@verifone.com;kobi.shayo@verifone.com;denisp3@verifone.com;fred.shniper@verifone.com;igal.israelovich@verifone.com;helen.kharbash@verifone.com;mark_s5@verifone.com;moshe_o1@verifone.com', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

UPDATE `translations` SET `name`='Filter Type' WHERE `language_code_id`='en-us' and `code_id`='filterType';
UPDATE `translations` SET `name`='Code Tables' WHERE `language_code_id`='en-us' and `code_id`='CodeTables';
UPDATE `translations` SET `name`='Throttling Max Request Count' WHERE `language_code_id`='en-us' and `code_id`='throttlingMaxRequestCount_privateApplications';