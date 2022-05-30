INSERT INTO dbversion_history (guid, version, script_name, created_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_08', 'patch_V2_0_0_8_DataSetup.sql', NOW());

Delete from `translations` where `code_id`='Status'; 
Delete from `translations` where `code_id`='CallBackHandler';

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'extractCSRData', 'Extract CSR data', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'extractCSRData', 'הוצאת פרטי תעודה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'createCert', 'Create certificate', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'createCert', 'יצירת תעודה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'revokeCert', 'Revoke certificate', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'revokeCert', 'לבטל תעודה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'extractCertData', 'Extract certificate data', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'extractCertData', 'הוצאת פרטי תעודה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'validateSignature', 'Validate signature', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'validateSignature', 'אישור תעודה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'signData', 'Sign data', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'signData', 'חתימת תעודה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'activeOn', 'Activate terminal', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'activeOn', 'להפעיל טרמינל', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'signedUrl', 'Generate url for upload', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'signedUrl', 'לייצר כתובת להעלת קובץ', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),	
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'Status', 'Status', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'Status', 'סטאטוס', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'CallBackHandler', 'Login screen', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'CallBackHandler', 'מסך ראשי', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());