
-- Application
INSERT INTO applications (guid, app_id, name, version, status, throttling_access, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('16e8a6c3-10d1-4c2d-8ddc-86601dbc9a5c','-','')), 'App1', 'First Application', '1.0.0.0', 'A', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO applications (guid, app_id, name, version, status, throttling_access, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('99e516bd-1465-4054-abde-597eb6a060fa','-','')), 'App2', 'Second Application', '1.0.0.0','A', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO applications (guid, app_id, name, version, status, throttling_access, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('9b96abc7-508e-4831-b5de-5eef754b1b98','-','')), 'App3', 'Third Application', '1.0.0.0', 'A', 'A', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

-- Connection config
INSERT INTO connection_configs (guid, app_guid, host, sandbox_host, protocol, timeout, certificate, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('5479d364-fcac-4068-9a34-9b3cc204a806','-','')),UNHEX(REPLACE('16e8a6c3-10d1-4c2d-8ddc-86601dbc9a5c','-','')), 'qwww395.americanexpress.com/sandbox/smartrewards/v1/getrewardsbalance', NULL, 'https', '60', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO connection_configs (guid, app_guid, host, sandbox_host, protocol, timeout, certificate, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('5d90638a-3f6b-466c-9ac6-35e3de5c4cf9','-','')),UNHEX(REPLACE('16e8a6c3-10d1-4c2d-8ddc-86601dbc9a5c','-','')), 'qwww395.americanexpress.com/smartrewards/v1/getrewardsbalance', NULL, 'https', '60', '-----BEGIN CERTIFICATE-----
MIIDXTCCAkWgAwIBAgIJAJC1HiIAZAiIMA0GCSqGSIb3DQEBBQUAMEUxCzAJBgNV
BAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBX
aWRnaXRzIFB0eSBMdGQwHhcNMTExMjMxMDg1OTQ0WhcNMTIxMjMwMDg1OTQ0WjBF
A .... MANY LINES LIKE THAT .... .... MANY LINES LIKE THAT .... 
JjyzfN746vaInA1KxYEeI1Rx5KXY8zIdj6a7hhphpj2E04LDdw7r495dv3UgEgpR
C3Fayua4DRHyZOLmlvQ6tIChY0ClXXuefbmVSDeUHwc8YufRAERp2GfQnL2JlPUL
B7xxt8BVc69rLeHV15A0qyx77CLSj3tCx2IUXVqRs5mlSbq094NBxsauYcm0A6Jq
vA==
-----END CERTIFICATE-----', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO connection_configs (guid, app_guid, host, sandbox_host, protocol, timeout, certificate, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('08eab3dc-c68c-4db2-a6c4-aa58299f26bd','-','')),UNHEX(REPLACE('99e516bd-1465-4054-abde-597eb6a060fa','-','')), 'qwww395.americanexpress.com/sandbox/smartrewards/v1/paywithrewards', NULL, 'https', '60', NULL, 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO connection_configs (guid, app_guid, host, sandbox_host, protocol, timeout, certificate, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('2c6e13bc-d891-40e5-bc60-08f48e4f330c','-','')),UNHEX(REPLACE('9b96abc7-508e-4831-b5de-5eef754b1b98','-','')), 'qwww395.americanexpress.com/smartrewards/v1/paywithrewards', NULL, 'https', '60', '-----BEGIN CERTIFICATE-----
MIICUTCCAfugAwIBAgIBADANBgkqhkiG9w0BAQQFADBXMQswCQYDVQQGEwJDTjEL
MAkGA1UECBMCUE4xCzAJBgNVBAcTAkNOMQswCQYDVQQKEwJPTjELMAkGA1UECxMC
VU4xFDASBgNVBAMTC0hlcm9uZyBZYW5nMB4XDTA1MDcxNTIxMTk0N1oXDTA1MDgx
NDIxMTk0N1owVzELMAkGA1UEBhMCQ04xCzAJBgNVBAgTAlBOMQswCQYDVQQHEwJD
TjELMAkGA1UEChMCT04xCzAJBgNVBAsTAlVOMRQwEgYDVQQDEwtIZXJvbmcgWWFu
ZzBcMA0GCSqGSIb3DQEBAQUAA0sAMEgCQQCp5hnG7ogBhtlynpOS21cBewKE/B7j
V14qeyslnr26xZUsSVko36ZnhiaO/zbMOoRcKK9vEcgMtcLFuQTWDl3RAgMBAAGj
gbEwga4wHQYDVR0OBBYEFFXI70krXeQDxZgbaCQoR4jUDncEMH8GA1UdIwR4MHaA
FFXI70krXeQDxZgbaCQoR4jUDncEoVukWTBXMQswCQYDVQQGEwJDTjELMAkGA1UE
CBMCUE4xCzAJBgNVBAcTAkNOMQswCQYDVQQKEwJPTjELMAkGA1UECxMCVU4xFDAS
BgNVBAMTC0hlcm9uZyBZYW5nggEAMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEE
BQADQQA/ugzBrjjK9jcWnDVfGHlk3icNRq0oV7Ri32z/+HQX67aRfgZu7KWdI+Ju
Wm7DCfrPNGVwFWUQOmsPue9rZBgO
-----END CERTIFICATE-----', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

-- Activation states
INSERT INTO activation_states (guid, app_guid, app_id, app_version, status, type, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('16e8a6c3-20d1-4c2d-8ddc-86601dbc9a5c','-','')), UNHEX(REPLACE('16e8a6c3-10d1-4c2d-8ddc-86601dbc9a5c','-','')), 'App1', '1.0.0.0', 'A', 'SPONSOR', 'sponsor1', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());

INSERT INTO activation_states (guid, app_guid, app_id, app_version, status, type, value, created_by, created_time, updated_by, updated_time)
VALUES (UNHEX(REPLACE('16e8a6c3-21d1-4c2d-8ddc-86601dbc9a5c','-','')), UNHEX(REPLACE('99e516bd-1465-4054-abde-597eb6a060fa','-','')), 'App2', '1.0.0.0', 'A', 'SERIAL_NUMBER', 'sn1', 'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());
