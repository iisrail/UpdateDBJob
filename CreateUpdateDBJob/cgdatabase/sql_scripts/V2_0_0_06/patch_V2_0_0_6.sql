INSERT INTO dbversion_history (guid, version, script_name, created_time)
VALUES (UNHEX(REPLACE(UUID(),'-','')), 'V2_0_0_06', 'patch_V2_0_0_6.sql', NOW());

-- Change activities table
ALTER TABLE activities
CHANGE visible is_visible char(1) NOT NULL,
ADD id int NOT NULL,
ADD node_id int NOT NULL,
ADD method varchar(10) NOT NULL,
ADD mutual_ssl char(1) DEFAULT 'N',
ADD allow_all char(1) DEFAULT 'N';

-- Change menu_nodes table
ALTER TABLE menu_nodes
CHANGE visible is_visible char(1) NOT NULL;

ALTER TABLE `menu_nodes` ADD COLUMN `id` INT NOT NULL AFTER `guid`, ADD COLUMN `parent_guid` BINARY(16) AFTER `id`, ADD COLUMN `parent_id` INT AFTER `parent_guid`;


-- Define role-activity assignments table
CREATE TABLE IF NOT EXISTS role_activities 
(
  `guid` binary(16) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `activity_guid` binary(16) NOT NULL,
  `activity_id` int NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE `index_role_activity` (`role_name`,`activity_guid`),
  FOREIGN KEY fk_node(`activity_guid`)
   REFERENCES activities(`guid`)
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);