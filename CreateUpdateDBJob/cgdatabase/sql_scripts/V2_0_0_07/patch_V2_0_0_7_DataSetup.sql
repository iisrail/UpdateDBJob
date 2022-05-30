INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_07', 'patch_V2_0_0_7_DataSetup.sql', NOW());

UPDATE `system_parameters` SET `value`='/opt/applications/keystore/' WHERE  `name`='KeyStore_Folder';

INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `optional_values`, `created_by`, `created_time`, `updated_by`, `updated_time`) 
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'S3_Commom_Access', 'AKIAIISDWJKEI5LJPCOA', 'string', NULL, 'admin@verifone.com', now(), 'admin@verifone.com', now());

INSERT INTO `system_parameters` (`guid`, `name`, `value`, `data_type`, `optional_values`, `created_by`, `created_time`, `updated_by`, `updated_time`) 
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'S3_Commom_Key', 'MN+4itsvWGSmSfkWtmO7LupRK8PS47jVSJmuLACw', 'string', NULL, 'admin@verifone.com', now(), 'admin@verifone.com', now());


-- remove re-encrypt-pan

DELETE FROM `request_processings` WHERE `code_id`='RE-ENCRYPT-PAN';

-- use new Enterprise CA and OCSP - in future only for NON-PROD

UPDATE system_parameters set value='https://ejbca-ent.svccg.verifone.internal:8443/ejbca/ejbcaws/ejbcaws?wsdl' where name='CAMasterHost';

UPDATE system_parameters set value='http://test.cg-ocsp.verifone.com:8080/status/ocsp' where name='OCSPMasterHost';
