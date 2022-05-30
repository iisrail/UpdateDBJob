INSERT INTO system_parameters (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Approval_NONPROD_Pwd', '5c48409575fdbb51a5fcad1512c6f446', 'password', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters  (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Approval_NONPROD_Type', 'luna', 'string', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Manifest_NONPROD_Pwd', '0ca52b72ec76a7ff1ebecfaf61cf9d0a', 'password', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters  (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Manifest_NONPROD_Type', 'luna', 'string', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Token_NONPROD_Pwd', 'changeit', 'password', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters  (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Token_NONPROD_Type', 'luna', 'string', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());