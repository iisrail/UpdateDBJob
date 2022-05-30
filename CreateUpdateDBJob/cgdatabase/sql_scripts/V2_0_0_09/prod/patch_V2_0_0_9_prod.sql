INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_09', 'patch_V2_0_0_9_prod.sql', NOW());

-- create db user for running from Jenkins board
-- DROP USER IF EXISTS 'fluxboardDbUser_Prod'@'%';
CREATE USER 'fluxboardDbUser_Prod'@'%' IDENTIFIED BY 'PMDDDR2rP';
GRANT SELECT, INSERT, UPDATE  ON TABLE `activation_states` TO 'fluxboardDbUser_Prod'@'%';
GRANT SELECT  ON TABLE `applications` TO 'fluxboardDbUser_Prod'@'%';
FLUSH PRIVILEGES;
