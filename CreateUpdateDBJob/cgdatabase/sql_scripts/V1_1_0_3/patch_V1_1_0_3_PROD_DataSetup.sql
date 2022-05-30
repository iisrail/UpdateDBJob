INSERT INTO system_parameters (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Approval_PROD_Pwd', 'changeit', 'password', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters  (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Approval_PROD_Type', 'luna', 'string', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Manifest_PROD_Pwd', 'changeit', 'password', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters  (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Manifest_PROD_Type', 'luna', 'string', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Token_PROD_Pwd', 'changeit', 'password', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters  (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Token_PROD_Type', 'luna', 'string', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, data_type, optional_values, created_by, created_time, updated_by, updated_time) VALUES (UNHEX(REPLACE(UUID(),'-','')), 'KeyStore_Sponsor_PROD_Pwd', '3bdf7eb396ac87e33c47cdb4452d1519', 'password', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());