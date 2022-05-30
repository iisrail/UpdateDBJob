
-- System parameters
UPDATE `system_parameters` SET `data_type`='list',`optional_values`='[{\'id\':\'SBOX\',\'text\':\'SANDBOX\'},{\'id\':\'DEV\',\'text\':\'DEVELOPMENT\'},{\'id\':\'PROD\',\'text\':\'PRODUCTION\'},{\'id\':\'TEST\',\'text\':\'TEST\'}]' WHERE  `name`='Environment';

