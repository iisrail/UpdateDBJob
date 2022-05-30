 DROP PROCEDURE IF EXISTS swapConfigDataToProcessing ;
 
 DELIMITER $$

 CREATE PROCEDURE swapConfigDataToProcessing()
		MODIFIES SQL DATA
   BEGIN
		DECLARE v_connection_guid   BINARY(16);
		DECLARE v_request_processings VARCHAR(1024);
		DECLARE v_crypto_scenario VARCHAR(80);
		DECLARE v_created_by VARCHAR(255);
		DECLARE v_created_time DATETIME(6);
		DECLARE v_updated_by VARCHAR(255);
		DECLARE v_updated_time DATETIME(6);		
		DECLARE v_finished INTEGER DEFAULT 0;
		DECLARE splitted_value VARCHAR(80);
		DECLARE i INT DEFAULT 0;
		DECLARE delim char(1) DEFAULT ',';
		DECLARE occurrences INT DEFAULT 0;
	
 		
		DECLARE cursor_connection_config_request CURSOR FOR 
			SELECT c.guid, c.request_processings,c.crypto_scenario,c.created_by,c.created_time,c.updated_by,c.updated_time FROM connection_configs c where c.request_processings is not null;
		-- declare NOT FOUND handler
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;	
		
		OPEN cursor_connection_config_request;
		
		into_pre_processing: LOOP
		
			FETCH cursor_connection_config_request INTO v_connection_guid,v_request_processings,v_crypto_scenario,v_created_by,v_created_time,v_updated_by,v_updated_time;
			
			IF v_finished = 1 THEN 
				LEAVE into_pre_processing;
			END IF;			 
			
			SET occurrences = (SELECT CHAR_LENGTH(v_request_processings) - CHAR_LENGTH(REPLACE(v_request_processings, delim, '')) + 1);
			
			SET i=1;
			WHILE i <= occurrences DO
				SET splitted_value = (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_request_processings, delim, i), delim, -1)));
				
				IF (splitted_value = "PAN-HEADER" OR splitted_value = "PAN-BODY") AND (v_crypto_scenario!= "MASTERCARD" ) THEN	set v_crypto_scenario = "SYMMETRIC";
				ELSEIF (splitted_value = "PAN-HEADER" OR splitted_value = "PAN-BODY") AND (v_crypto_scenario= "MASTERCARD") THEN	set v_crypto_scenario = "SYMMETRIC";
				ELSEIF (splitted_value = "PANTOKEN-HEADER" OR splitted_value = "PANTOKEN-BODY") THEN	set v_crypto_scenario = "Weaver";
				END IF;
			INSERT INTO processings(guid,connection_guid,`type`,name,scenario,created_by,created_time,updated_by,updated_time)  
			VALUES(UNHEX(REPLACE(UUID(),'-','')),v_connection_guid,'PRE',splitted_value,v_crypto_scenario,v_created_by,v_created_time,v_updated_by,v_updated_time);					
				SET i = i + 1;
			END WHILE;

			
		END LOOP into_pre_processing;
		CLOSE cursor_connection_config_request;
   END$$
   
 DELIMITER ;
