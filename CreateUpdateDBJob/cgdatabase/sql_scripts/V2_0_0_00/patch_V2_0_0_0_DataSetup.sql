INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_0', 'patch_V2_0_0_0_DataSetup.sql', NOW());

DELETE FROM `translations` WHERE `language_code_id`='he' and `code_id`='systemParameters';
DELETE FROM `translations` WHERE `language_code_id`='en-us' and `code_id`='systemParameters';

INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'system', 'System', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'system', 'מערכת', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'systemParameters', 'Parameters', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'systemParameters', 'פרמטרים', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'systemdbVersion', 'DB Version', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'systemdbVersion', 'גרסת מאגר מידע', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());


INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'guid_systemdbVersion', 'Guid', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'guid_systemdbVersion', 'מס"ד', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'version_systemdbVersion', 'Version', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'version_systemdbVersion', 'גרסה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'script_name_systemdbVersion', 'Script Name', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'script_name_systemdbVersion', 'שם סקריפט', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'created_time_systemdbVersion', 'Created Time', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'created_time_systemdbVersion', 'שעת יצירה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'dbversionHistory', 'DB Version History', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),

(UNHEX(REPLACE(UUID(),'-','')), 'he', 'dbversionHistory', 'היסטורית גרסת מסד נתונים', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());


INSERT INTO `request_processings` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
	(UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'RE-ENCRYPT-PAN', 'RE-ENCRYPT-PAN', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
	(UNHEX(REPLACE(UUID(),'-','')), 'he', 'RE-ENCRYPT-PAN', 'RE-ENCRYPT-PAN', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

-- generalize value for request processings using CGE (tokenization/reEncrypt)
	
UPDATE system_parameters SET value=REPLACE(value,'/latest/token','') where name='CGExtentionURL';

-- system_parameters clear cache

INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `optional_values`, `created_by`, `created_time`, `updated_by`, `updated_time`) 
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'ClearISCacheEnabled', 'true', 'list', '[{\'id\':\'true\',\'text\':\'TRUE\'},{\'id\':\'false\',\'text\':\'FALSE\'}]', 'admin@verifone.com', now(), 'admin@verifone.com', now());

INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `optional_values`, `created_by`, `created_time`, `updated_by`, `updated_time`) 
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'ClearISCacheURL', 'http://localhost:8280/services/clearISCache', 'string', NULL, 'admin@verifone.com', now(), 'admin@verifone.com', now());


-- translations for splunk alerts
INSERT INTO `translations` (`guid`, `language_code_id`, `code_id`, `name`, `status_id`, `created_by`, `created_time`, `updated_by`, `updated_time`) VALUES 
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'alerts.list', 'Alerts', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'alerts.list', 'התראות', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditDescriptionSave', 'Save', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditDescriptionSave', 'שמור', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditDesc', 'Description', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditDesc', 'תיאור', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditSearch', 'Search', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditSearch', 'חפש', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditEarliest', 'Earliest', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditEarliest', 'מ', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditLatest', 'Latest', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditLatest', 'עד', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditcron_schedule', 'Cron Expression', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditcron_schedule', 'ביטוי רגולרי', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditresultsCount', 'Trigger when number of results is greater than', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditresultsCount', 'חסם מלעייל על כמות התוצאות', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditSuppressFields', 'Suppress results containing field value', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditSuppressFields', 'סנן לפי', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditEmailTo', 'To', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditEmailTo', 'אל', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditPriority', 'Priority', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditPriority', 'עדיפות', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditSubject', 'Subject', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditSubject', 'נושא', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditMessage', 'Message', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditMessage', 'הודעה', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditSendcsv', 'Attach CSV', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditSendcsv', 'הדבק CSV', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'en-us', 'AlertsEditSendpdf', 'Attach PDF', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW()),
               (UNHEX(REPLACE(UUID(),'-','')), 'he', 'AlertsEditSendpdf', 'הדבק PDF', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());