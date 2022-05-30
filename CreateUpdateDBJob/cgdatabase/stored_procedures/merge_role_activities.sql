DROP PROCEDURE IF EXISTS merge_role_activities;

DELIMITER $$
  
CREATE PROCEDURE `merge_role_activities`(IN debug_mode int)
	MODIFIES SQL DATA
BEGIN

 DECLARE v_finished INTEGER DEFAULT 0;
 DECLARE v_guid BINARY(16);
 DECLARE v_id INTEGER DEFAULT 0;
 DECLARE v_role_name varchar(100) DEFAULT "";
 DECLARE v_uri varchar(500) DEFAULT ""; 
 DECLARE v_method varchar(100) DEFAULT ""; 
 
 -- declare cursor for role_activities
 DEClARE role_activities_cursor CURSOR FOR 
 SELECT guid,id,role_name,uri,method from permision_all2 pa where (pa.uri,pa.method,pa.name,pa.role_name) not in
	(
		select uri,method,name,role_name from permision_same_role2
	);
 
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
	 GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	 SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	 SELECT @full_error;
    ROLLBACK;

 	 DELETE FROM role_activities;
 	 DELETE FROM activities;
	 DELETE FROM menu_nodes;
	
	 INSERT INTO activities SELECT * FROM activities2;
	 INSERT INTO menu_nodes SELECT * FROM menu_nodes2;
	 INSERT INTO role_activities SELECT * FROM role_activities2;
 END;
 
 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
 
 START TRANSACTION;
 DROP TEMPORARY TABLE IF EXISTS permision_same_role;
 DROP TABLE IF EXISTS permision_same_role;
CREATE TEMPORARY TABLE permision_same_role AS (select distinct
act.uri, act.method, act.name, ra.role_name
from
role_activities ra,activities act,
role_activities2 ra2,activities2 act2
where
ra.activity_guid=act.guid and
ra2.activity_guid=act2.guid and
act2.uri = act.uri and act2.method = act.method and act2.name = act.name and ra2.role_name = ra.role_name
);

DROP TEMPORARY TABLE IF EXISTS permision_all;
DROP TABLE IF EXISTS permision_all;
CREATE TEMPORARY TABLE permision_all AS (select distinct
ra.guid ,act.uri, act.method, act.name, ra.role_name
from
role_activities ra,activities act,
role_activities2 ra2,activities2 act2
where
ra.activity_guid=act.guid and
ra2.activity_guid=act2.guid and
act2.uri = act.uri and act2.method = act.method and act2.name = act.name
);
    
 if (debug_mode > 0) then
 select * from permision_all pa where (pa.uri,pa.method,pa.name,pa.role_name) not in
(
select uri,method,name,role_name from permision_same_role
) into outfile "/tmp/delete_role_activities.txt" FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n';
 end if;

delete from role_activities where guid in (
	select pa.guid from permision_all pa where (pa.uri,pa.method,pa.name,pa.role_name) not in
	(
		select uri,method,name,role_name from permision_same_role
	)
);


DROP TEMPORARY TABLE IF EXISTS permision_same_role2;
DROP TABLE IF EXISTS permision_same_role2;
CREATE TEMPORARY TABLE permision_same_role2 AS (select distinct
act.uri, act.method, act.name, ra.role_name
-- ra.guid as ra_guid, act.guid as act_guid
from
role_activities2 ra,activities2 act,
role_activities ra2,activities act2
where
ra.activity_guid=act.guid and
ra2.activity_guid=act2.guid and
act2.uri = act.uri and act2.method = act.method and act2.name = act.name and ra2.role_name = ra.role_name
);


DROP TEMPORARY TABLE IF EXISTS permision_all2;
DROP TABLE IF EXISTS permision_all2;
CREATE TEMPORARY TABLE permision_all2 AS (select distinct
act2.guid ,act2.id, act.uri, act.method, act.name, ra.role_name
-- ra.guid as ra_guid, act.guid as act_guid
from
role_activities2 ra,activities2 act,
role_activities ra2,activities act2
where
ra.activity_guid=act.guid and
ra2.activity_guid=act2.guid and
act2.uri = act.uri and act2.method = act.method and act2.name = act.name
);

 if (debug_mode > 0) then
select * from permision_all2 pa where (pa.uri,pa.method,pa.name,pa.role_name) not in
(
select uri,method,name,role_name from permision_same_role2
) into outfile "/tmp/insert_role_activities.txt" FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n';
 end if;
 
OPEN role_activities_cursor;
 
 get_role_activities: LOOP
 
 FETCH role_activities_cursor INTO v_guid,v_id,v_role_name,v_uri,v_method;
 
 
 IF v_finished = 1 THEN 
 LEAVE get_role_activities;
 END IF;
 
INSERT INTO role_activities (guid, role_name, activity_guid, activity_id, created_by, created_time, updated_by, updated_time) VALUES 
(UNHEX(REPLACE(UUID(),'-','')),v_role_name,v_guid,v_id,'admin@verifone.com', NOW(), 'admin@verifone.com', NOW());
 
 
 END LOOP get_role_activities;
 
 CLOSE role_activities_cursor;

 COMMIT;
END$$
 
DELIMITER ;