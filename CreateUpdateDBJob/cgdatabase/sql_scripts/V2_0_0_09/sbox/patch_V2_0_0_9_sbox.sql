INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_09', 'patch_V2_0_0_9_sbox.sql', NOW());

-- create db user for running from Jenkins board
-- DROP USER IF EXISTS 'fluxboardDbUser_Sbox'@'%';
CREATE USER 'fluxboardDbUser_Sbox'@'%' IDENTIFIED BY 'PMSSSR2rP';
GRANT SELECT, INSERT, UPDATE  ON TABLE `activation_states` TO 'fluxboardDbUser_Sbox'@'%';
GRANT SELECT  ON TABLE `applications` TO 'fluxboardDbUser_Sbox'@'%';
FLUSH PRIVILEGES;
