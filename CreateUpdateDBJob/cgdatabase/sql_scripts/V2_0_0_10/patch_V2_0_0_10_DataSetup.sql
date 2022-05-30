INSERT INTO dbversion_history (guid, version, script_name, created_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_10', 'patch_V2_0_0_10_DataSetup.sql', NOW());

UPDATE `system_parameters` SET `data_type`='password' WHERE  `name`='ESBAdminAPIPwd';
