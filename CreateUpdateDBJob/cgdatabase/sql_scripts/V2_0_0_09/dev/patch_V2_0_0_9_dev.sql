INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_09', 'patch_V2_0_0_9_dev.sql', NOW());

-- create db user for running from Jenkins board
-- DROP USER IF EXISTS 'fluxboardDbUser_Dev'@'%';
CREATE USER 'fluxboardDbUser_Dev'@'%' IDENTIFIED BY 'PMZZZR2rP';
GRANT SELECT, INSERT, UPDATE  ON TABLE `activation_states` TO 'fluxboardDbUser_Dev'@'%';
GRANT SELECT  ON TABLE `applications` TO 'fluxboardDbUser_Dev'@'%';
FLUSH PRIVILEGES;
