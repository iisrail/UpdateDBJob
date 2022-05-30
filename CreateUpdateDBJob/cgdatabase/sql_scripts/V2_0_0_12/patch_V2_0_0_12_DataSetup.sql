INSERT INTO dbversion_history (guid, version, script_name, created_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_12', 'patch_V2_0_0_12_DataSetup.sql', NOW());

update system_parameters set value=750000 where name = 'MaximumResponseSize';

UPDATE `system_parameters` SET `is_shared`='Y' WHERE `name` IN ('ClearISCacheURL', 'ClearISCacheEnabled');
UPDATE `system_parameters` SET `is_shared`='N' WHERE `name` IN ('LanguageDefault');
