CREATE TABLE `dbversion_history` (
	`guid` BINARY(16) NOT NULL,
	`version` VARCHAR(100) NOT NULL,
	`script_name` VARCHAR(100) NOT NULL,
	`created_time` DATETIME(6) NOT NULL,
	PRIMARY KEY (`guid`)
)
ENGINE=InnoDB;

INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_0', 'patch_V2_0_0_0.sql', NOW());

-- Remove foreign key between applications and activation_states tables
 alter table activation_states
 drop foreign key activation_states_ibfk_1;
 
 -- Delete app_guid from the activation_states table
 alter table activation_states
 drop column app_guid;
 
 -- Drop index by app_guid, type and value
 drop index `index_app_type_value` ON activation_states;
 
  -- Create unique index by app_id, app_version, type and value
 alter table activation_states
 add unique index index_app_type_value (app_id, app_version, type, value);
 
 -- Add is_deleted column to the applications table
 alter table applications
 add column is_deleted char(1) NOT NULL DEFAULT 'N';
 