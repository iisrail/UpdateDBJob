DROP EVENT clean_activation_states;

CREATE EVENT clean_activation_states
ON SCHEDULE
	EVERY 1 DAY
    STARTS '2016-04-01 01:00:00' ON COMPLETION PRESERVE ENABLE
DO
	CALL cpp.clean_activation_states();
	