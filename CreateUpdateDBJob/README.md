The project enable to run sql scripts to create or update database. 
The purpose access the zip file which packages all needed sql scripts 
files and located on destined bucket and folder. It unzips the files
sortes thems according to the version and run them one after the another, 
in the same time updating DB_HISTORY table.

Parameters:

"JOB_NAME", "CreateUpdateDBJob", "Batch job name"
"DATASOURCE", "jdbc:mysql://cd1rg3usmplyedd.cwegnemmy1on.us-east-1.rds.amazonaws.com:3306/mysql?useUnicode=true&characterEncoding=UTF-8", "MySQL data source"		
"USER", "DBUser", "MySQL user name"
"PASSWORD", "UOe2D3CFnPdM", "MySQL user password"
"AWS_ACCESS_KEY", "xxxx", "AWS access key"
"AWS_SECRET_KEY", "xxxxx", "AWS secret key"
SCRIPTS_ZIP", "sql_scripts.zip", "Zip file with the DB scripts"
"BUCKET_NAME", "verifone-cg-db-scripts", "Bucket name for the zip"
"FROM_SCRATCH", "true", "Check if you want to create or update database"
"LAST_VERSION", "none", "If you create a database, you can fix ntil version to run scripts. In case of update from which version"
"DB_ACTION",["create","update"],"Kind of action we are going to execute on our database schema"
"ENV",["dev","test","sbox","prodeu","produs", "prod","cgext","staging1"],"Environment"


The following command should be running from Jenkins's Execute shell form in the end


java -jar fluxboard-jobs/database-run-scripts-dev/create-update-db-job-1.0.0.jar $JOB_NAME $DATASOURCE $DB_SCHEMA $USER $PASSWORD $AWS_ACCESS_KEY $AWS_SECRET_KEY $ENV $BUCKET_NAME $FROM_SCRATCH $LAST_VERSION $SCRIPTS_ZIP
  
