INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_04', 'patch_V2_0_0_4_DataSetup.sql', NOW());

-- System parameters new
INSERT INTO system_parameters (guid, name, value, data_type, optional_values, is_shared, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'S3_Activation_Bucket', 'verifone-cg-activation-import', 'string', NULL, 'N', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

