 DROP PROCEDURE IF EXISTS clean_activation_states;
 
 DELIMITER //
 CREATE PROCEDURE clean_activation_states()
   BEGIN

   SET SQL_SAFE_UPDATES = 0;
 
   -- Delete activation states with specific version that doesn't have related application
   DELETE FROM activation_states
   WHERE app_version != '*' AND
         NOT EXISTS (SELECT NULL FROM applications a WHERE a.is_deleted = 'N' AND a.app_id = activation_states.app_id AND a.version = activation_states.app_version);
         
   -- Delete activation states with '*' version that doesn't have related application
   DELETE FROM activation_states
   WHERE app_version = '*' AND
         app_id NOT IN (SELECT app_id FROM applications a WHERE a.is_deleted = 'N');
   
   END //
 DELIMITER; 
 