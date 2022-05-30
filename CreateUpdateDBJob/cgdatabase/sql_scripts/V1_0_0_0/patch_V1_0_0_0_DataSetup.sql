

-- System parameters
INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'LogAppRequestPayload', 'False', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'LogAppResponsePayload', 'False', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'DefaultAppTimeout', '3000', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'DefaultLimit', '10', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'MaximumResponseSize', '750000', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'Environment', 'SABDBOX', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'ThrottlingUnitTime', '50000', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'ThrottlingProhibitTimePeriod', '5000', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'ESBAdminAPIUser', 'admin', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'ESBAdminAPIPwd', 'admin', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'ESBMasterHost', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'APIRetriesCount', '3', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO system_parameters (guid, name, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'APITimeout', '10000', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());
