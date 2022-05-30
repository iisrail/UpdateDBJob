INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_01', 'patch_V2_0_0_1.sql', NOW());


-- system_parameters is_shared:

ALTER TABLE `system_parameters`	ADD COLUMN `is_shared` VARCHAR(1) NOT NULL DEFAULT 'N' AFTER `optional_values`;

ALTER TABLE `activation_states`	ADD COLUMN `note` VARCHAR(1024) NULL AFTER `updated_time`;
