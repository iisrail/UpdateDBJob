INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_09', 'patch_V2_0_0_9_test.sql', NOW());

-- create db user for running from Jenkins board
-- DROP USER IF EXISTS 'fluxboardDbUser_Test'@'%';
CREATE USER 'fluxboardDbUser_Test'@'%' IDENTIFIED BY 'PMTTTR2rP';
GRANT SELECT, INSERT, UPDATE  ON TABLE `activation_states` TO 'fluxboardDbUser_Test'@'%';
GRANT SELECT  ON TABLE `applications` TO 'fluxboardDbUser_Test'@'%';
FLUSH PRIVILEGES;
