-- System parameters

INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `optional_values`, `created_by`, `created_time`, `updated_by`, `updated_time`) 
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'LogLevel', '6', 'list', '[{\'id\':0,\'text\':\'EMERG\'},{\'id\':1,\'text\':\'ALERT\'},{\'id\':2,\'text\':\'CRITICAL\'},{\'id\':3,\'text\':\'ERROR\'},{\'id\':4,\'text\':\'WARN\'},{\'id\':5,\'text\':\'NOTICE\'},{\'id\':6,\'text\':\'INFO\'},{\'id\':7,\'text\':\'DEBUG\'}]', 'admin@verifone.com', '2015-11-04 15:59:20', 'admin@verifone.com', '2015-11-04 15:59:25');

INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `optional_values`, `created_by`, `created_time`, `updated_by`, `updated_time`) 
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'LanguageDefault', 'en-us', 'string', NULL, 'admin@verifone.com', '2015-11-04 15:59:20', 'admin@verifone.com', '2015-11-04 15:59:25');

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'KeyStore_Type','JKS', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'KeyStore_Folder','/home/ec2-user/keystore/', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'KeyStore_Pwd','changeit', 'password', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'CAMasterHost','https://ejbca.svccg.verifone.internal:8443/ejbca/ejbcaws/ejbcaws?wsdl', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'S3_Region','us-east-1', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, created_by, created_time, updated_by, updated_time)
values (UNHEX(REPLACE(UUID(),'-','')),'CP_Publishing_CA','CPSS Publishing CA', 'string', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

UPDATE `system_parameters` SET `data_type`='string' WHERE  `name`='ESBMasterHost';
UPDATE `system_parameters` SET `data_type`='string' WHERE  `name`='ESBAdminAPIUser';
UPDATE `system_parameters` SET `data_type`='string' WHERE  `name`='ESBAdminAPIPwd';
UPDATE `system_parameters` SET `data_type`='bool' WHERE  `name`='LogAppRequestPayload';
UPDATE `system_parameters` SET `data_type`='bool' WHERE  `name`='LogAppResponsePayload';

UPDATE `system_parameters` SET `data_type`='number' WHERE  `name`='DefaultAppTimeout';
UPDATE `system_parameters` SET `data_type`='number' WHERE  `name`='DefaultLimit';
UPDATE `system_parameters` SET `data_type`='number' WHERE  `name`='MaximumResponseSize';
UPDATE `system_parameters` SET `data_type`='list',`optional_values`='[{\'id\':\'SANDBOX\',\'text\':\'SANDBOX\'},{\'id\':\'PRODUCTION\',\'text\':\'PRODUCTION\'},{\'id\':\'TEST\',\'text\':\'TEST\'}]' WHERE  `name`='Environment';
UPDATE `system_parameters` SET `data_type`='number' WHERE  `name`='ThrottlingUnitTime';
UPDATE `system_parameters` SET `data_type`='number' WHERE  `name`='ThrottlingProhibitTimePeriod';
UPDATE `system_parameters` SET `data_type`='string' WHERE  `name`='SplunkCloudAddress';
UPDATE `system_parameters` SET `data_type`='string' WHERE  `name`='ISAdminAPIUser';
UPDATE `system_parameters` SET `data_type`='password' WHERE  `name`='ISAdminAPIPwd';
UPDATE `system_parameters` SET `data_type`='string' WHERE  `name`='ISMasterHost';
UPDATE `system_parameters` SET `data_type`='number' WHERE  `name`='APIRetriesCount';
UPDATE `system_parameters` SET `data_type`='number' WHERE  `name`='APITimeout';


-- languages 

INSERT INTO `languages` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `direction`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'en-us', 'English-US', 'A', 'LTR', 'admin@verifone.com', '2015-11-04 15:53:57', 'admin@verifone.com', '2015-11-04 15:53:58'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'he', 'Hebrew', 'A', 'RTL', 'admin@verifone.com', '2015-11-04 15:54:53', 'admin@verifone.com', '2015-11-15 12:46:49');

-- code tables

INSERT INTO `filters_types` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'SPONSOR', 'SPONSOR', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'SPONSOR', 'משווק', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'SERIAL_NUMBER', 'SERIAL_NUMBER', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'SERIAL_NUMBER', 'מספר סידורי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18');

INSERT INTO `protocol` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'HTTP', 'HTTP', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'HTTP', 'HTTP', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'HTTPS', 'HTTPS', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'HTTPS', 'HTTPS', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18');

INSERT INTO `status` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'A', 'Active', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'A', 'אקטיבי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'D', 'Disabled', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'D', 'לא מאופשר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18');

INSERT INTO `activation_status` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'A', 'Active', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'A', 'אקטיבי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'D', 'De-Active', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'D', 'לא אקטיבי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18');

INSERT INTO `throttling_access` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'A', 'Allow', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'A', 'לאפשר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'D', 'Deny', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'D', 'לחסום', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'C', 'Control', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'C', 'מבוקר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18', 'admin@verifone.com', '2015-11-04 15:58:18');

	
-- translations

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'activation', 'Activation', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'activationStatus', 'Activation Status', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ADDNEWRECORD', 'Add New Record', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appGUID_ApplicationActivation', 'Application Guid', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appGUID_connectionConfigs', 'Application Guid', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appID_ApplicationActivation', 'ApplicationID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appID_privateApplications', 'ID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ApplicationActivation', 'Application Activation', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'applications', 'Applications', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Apps', 'Applications', 'A', 'admin@verifone.com', '2015-11-04 00:00:00.000000', 'admin@verifone.com', '2015-11-08 17:33:32.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'appVersion_ApplicationActivation', 'Version', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'CANCELCHANGES', 'Cancel Changes', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'certificate_connectionConfigs', 'Certificate', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-17 16:53:16.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'CodeID_codeTable', 'CodeID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'CodeID_translations', 'CodeID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'CodeTables', 'CodeTables', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'COLUMNS', 'Columns', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ConnConf', 'Connection Configs', 'A', 'admin@verifone.com', '2015-11-08 00:00:00.000000', 'admin@verifone.com', '2015-11-08 00:00:00.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'connectionConfigs', 'Connections', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'connections', 'Connections', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdBy_ApplicationActivation', 'Created By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdBy_BlackListFilters', 'Created By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdBy_connectionConfigs', 'Created By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdBy_privateApplications', 'Created By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdBy_systemParameters', 'Created By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdTime_ApplicationActivation', 'Created Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdTime_BlackListFilters', 'Created Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdTime_connectionConfigs', 'Created Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdTime_privateApplications', 'Created Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createdTime_systemParameters', 'Created Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'DELETE', 'DELETE', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_ExactLength', '{0} length must be {2}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_GreaterThanOrEqualTo', '{0} must be greater then or equal to {1}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_IsWebSite', '{0} is WebSite', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_LengthRange', '{0} length must be between {2} and {3}.', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_LessThen', '{0} must by less today.', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_LessThenDays', '{0} must by less today minus {3} days.', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_MaxLength', '{0} max length {2}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_MinLength', '{0} length not less from {2}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_PositiveNumber', '{0} must be grater than 0 and contain only numbers', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_Required', '{0} is required', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'ERR_URL', '{0} must be url', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'fdgadfgfg', 'gg', 'A', 'admin@verifone.com', '2015-11-19 17:51:45.000000', 'admin@verifone.com', '2015-11-19 17:51:45.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'filters', 'Black List Filters', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'filterType', 'FilterType', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_ApplicationActivation', 'ID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_BlackListFilters', 'Filter ID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_codeTable', 'Guid', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_connectionConfigs', 'ID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_privateApplications', 'Guid', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_systemParameters', 'ID', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_translations', 'Guid', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'host_connectionConfigs', 'Host', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'LanguageCodeID_codeTable', 'Language Code', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'LanguageCodeID_translations', 'Language Code', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'languages', 'Languages', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'mainSearchText', 'Search for something...', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Name_codeTable', 'Value', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'name_privateApplications', 'Name', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'name_systemParameters', 'Name', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Name_translations', 'Value', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'privateApplications', 'Applications', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'properties', 'Properties', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'protocol', 'Protocol', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'protocol_connectionConfigs', 'Protocol', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'sandboxHost_connectionConfigs', 'SandBox', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'SAVECHANGES', 'Save Changes', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'status', 'Status', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'status_ApplicationActivation', 'Status', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'status_privateApplications', 'Status', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Stpd', 'Stupid Translation', 'D', 'admin@verifone.com', '2015-11-09 12:03:33.000000', 'admin@verifone.com', '2015-11-09 12:03:33.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Successed.', 'Successed.', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'systemParameters', 'System Parameters', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'throttlingAccess', 'Throttling Access', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'throttlingAccess_privateApplications', 'Throttling Access', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'throttlingMaxRequestCount_privateApplications', 'Throttling Max RequestCount', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'timeout_connectionConfigs', 'Timeout', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Translation', 'Translations', 'A', 'admin@verifone.com', '2015-11-19 11:09:47.000000', 'admin@verifone.com', '2015-11-19 11:09:47.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'translations', 'Translations', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'type_ApplicationActivation', 'Type', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'type_BlackListFilters', 'Type', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedBy_ApplicationActivation', 'Updated By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedBy_connectionConfigs', 'Updated By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedBy_privateApplications', 'Updated By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedBy_systemParameters', 'Updated By', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedTime_ApplicationActivation', 'Updated Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedTime_connectionConfigs', 'Updated Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedTime_privateApplications', 'Updated Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'updatedTime_systemParameters', 'Updated Time', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'User Name', 'User Name', 'A', 'admin@verifone.com', '2015-11-24 16:31:39.000000', 'admin@verifone.com', '2015-11-24 16:31:39.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'value_ApplicationActivation', 'Value', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'value_BlackListFilters', 'Value', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'value_privateApplications', 'Value', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'value_systemParameters', 'Value', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'version_privateApplications', 'Version', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'activation', 'אקטיבציה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'activationStatus', 'סטאטוס אקטיבציה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ADDNEWRECORD', 'הוסף', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-26 17:11:05.546000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'appGUID_ApplicationActivation', 'מזהה ייחודי אפליקציה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'appGUID_connectionConfigs', 'מזהה ייחודי אפליקציה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'appID_ApplicationActivation', 'מזהה אפליקציה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'appID_privateApplications', 'מזהה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ApplicationActivation', 'אקטיבציה של אפליקציה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'applications', 'אפליקציות', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Apps', 'אפליקציות', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:20.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'appVersion_ApplicationActivation', 'גירסה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'CANCELCHANGES', 'בטל', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'CodeID_codeTable', 'קוד', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'CodeID_translations', 'קוד', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'CodeTables', 'הגדרות תרגום', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'COLUMNS', 'עמודות', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ConnConf', 'הגדרות חיבורים', 'A', 'admin@verifone.com', '2015-11-08 00:00:00.000000', 'admin@verifone.com', '2015-11-08 00:00:00.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'connectionConfigs', 'פרטי התחברות', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'connections', 'פרטי התחברות', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdBy_ApplicationActivation', 'נוצר על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdBy_BlackListFilters', 'נוצר על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdBy_connectionConfigs', 'נוצר על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdBy_privateApplications', 'נוצר על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdBy_systemParameters', 'נוצר על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdTime_ApplicationActivation', 'נוצר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdTime_BlackListFilters', 'נוצר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdTime_connectionConfigs', 'נוצר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdTime_privateApplications', 'נוצר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createdTime_systemParameters', 'נוצר', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'DELETE', 'מחיקה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_ExactLength', 'אורך של {0} חייב להיות בדיוק {2}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_GreaterThanOrEqualTo', 'אורך של {0} חייב להיות לפחות {1}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_IsWebSite', '{0} is WebSite', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_LengthRange', 'אורך של {0} חייב להיות בין {2} ובין {3}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_LessThen', '{0} must by less today.', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_LessThenDays', '{0} must by less today minus {3} days.', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_MaxLength', 'אורך של {0} חייב להיות עד {2}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_MinLength', 'אורך של {0} חייב להיות לפחות {2}', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_PositiveNumber', '{0} חייב להיות מספר חיובי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_Required', '{0} הינו חובה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'ERR_URL', '{0} חייב להיות כתובת תקנית', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'filters', 'סינון רשימה שחורה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'filterType', 'סוג סינון', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_ApplicationActivation', 'מזהה ייחודי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_BlackListFilters', 'מזהה ייחודי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_codeTable', 'מזהה ייחודי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_connectionConfigs', 'מזהה ייחודי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_privateApplications', 'מזהה ייחודי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_systemParameters', 'מזהה ייחודי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_translations', 'מזהה ייחודי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'host_connectionConfigs', 'כתובת שרת', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'LanguageCodeID_codeTable', 'קוד שפה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'LanguageCodeID_translations', 'קוד שפה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'languages', 'שפות', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'mainSearchText', 'הכנס ערך לחיפוש...', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Name_codeTable', 'ערך', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'name_privateApplications', 'שם', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'name_systemParameters', 'שם', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Name_translations', 'ערך', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'privateApplications', 'אפליקציות', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'properties', 'מאפיינים', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'protocol', 'פרוטוקול', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'protocol_connectionConfigs', 'פרוטוקול', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'sandboxHost_connectionConfigs', 'ארגז חול', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'SAVECHANGES', 'שמור', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'status', 'סטאטוס', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'status_ApplicationActivation', 'סטאטוס', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'status_privateApplications', 'סטאטוס', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Successed.', 'הצלחה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'systemParameters', 'הגדרות מערכת', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'throttlingAccess', 'אפשרויות גישה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'throttlingAccess_privateApplications', 'אפשרויות גישה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'throttlingMaxRequestCount_privateApplications', 'כמות גישות מקסימלית', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'timeout_connectionConfigs', 'זמן ריצה מקסימלי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Translation', 'תרגומים', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'translations', 'תרגומים', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'type_ApplicationActivation', 'סוג', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'type_BlackListFilters', 'סוג', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedBy_ApplicationActivation', 'עודכן על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedBy_connectionConfigs', 'עודכן על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-18 16:58:56.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedBy_privateApplications', 'עודכן על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedBy_systemParameters', 'עודכן על ידי', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedTime_ApplicationActivation', 'עודכן', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedTime_connectionConfigs', 'עודכן', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedTime_privateApplications', 'עודכן', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'updatedTime_systemParameters', 'עודכן', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'User Name', 'שם משתמש', 'A', 'admin@verifone.com', '2015-11-24 16:31:39.000000', 'admin@verifone.com', '2015-11-24 16:35:27.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'value_ApplicationActivation', 'ערך', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'value_BlackListFilters', 'ערך', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'value_privateApplications', 'ערך', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'value_systemParameters', 'ערך', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-04 15:58:18.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'version_privateApplications', 'גירסה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-18 10:48:20.000000'),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'certificate_connectionConfigs', 'תעודה', 'A', 'admin@verifone.com', '2015-11-04 15:58:18.000000', 'admin@verifone.com', '2015-11-18 10:48:20.000000');
	
