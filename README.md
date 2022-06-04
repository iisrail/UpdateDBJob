# UpdateDBJob
Manage Source Version Control for Your Database such as 'Flyway DB'

The Goal of the Job
The job has 3 main goals 

Automatic update of the last scripts in the development environment 
Initiated update of the not run scripts in none development environments such as test, staging, sbox and production.
Creation of the new database from the scratch
The work flow
The CI database job is composed of two Jenkins jobs. The first is CP_CGDatabase job  is found on the Verifone Jenkins machine and the second is database-run-scripts which is found on the fluxboard machine. The first job checks  the Git development branch and in the case that the some change happen on the branch the following steps are launched:

All script files are packaged to sql_scripts.zip file
The archive is uploaded to Amazon's S3 bucket to its environment folder
The CP_CGDatabase  activate the fluxboard  database-run-scripts with parameters ENV=dev and DB_ACTION=update
The database-run-scripts with the help of Java program downloads the sql_scripts.zip file from S3 bucket
Extracts files from the zip file to temp directory
Find the last run version, and take only the  files that are newer than the just found version
Sort the files and put the sorted files into a list
Run the files from the list one after another
Send email to developer team about job status
File structures and conventions
The structure of SQL scripts on file system
sql_scripts/

         V1_0_0_00

         V1_0_0_01 

        ............

       V2_0_0_09/

                 patch_V2_0_0_9.sql

                  patch_V2_0_0_9_DataSetup.sql

                  dev/

                       patch_V2_0_0_9_dev.sql

                 prod

                 sbox

                staging1

                 test

     .............       

     V2_0_0_41

Name conventions
The folders under sql_scripts folder are named by the version name such as V2_0_0_09, perhaps the next name for the folder after V2_0_0_99 will be V3_0_0_00, and then V3_0_0_01. Under the version's folder can be found environment folders for example dev, sbox. The scripts name have to start with patch_V prefix, otherwise the script will not be executed. The scripts that execute Data Manipulation Language (DML) statements have suffix '_DataSetup', while the scripts that execute  Data Definition Language (DDL) statements don't have the addition. 

Why do we need environment folders? 
There are times when we need different data between one environment and another. In this case only the script of selected environment will be executed.

Sorting                 
  The sorting is done as follows:

First of all we sort the folders with the name of versions in alphabetical order.
Then we order in alphabetical order the scripts under versions' folders. 
And finally order scripts under an environment folder.
Handling Stored Procedure
Create 3 separate files
The first file can be named as 'patch_V2_0_0_80_a.sql'. The file will contain number of regular sql comands and in addition command that drops procedure:

DROP PROCEDURE IF EXISTS swapConfigDataToProcessing;


Save stored procedure code as a separate file with extension 'sp' and not sql for example 'patch_V2_0_0_80_b.sp'

CREATE PROCEDURE swapConfigDataToProcessing()
   BEGIN
        DECLARE v_connection_guid   BINARY(16);
............
END


In one additional file you could call the stored procedure and to drop the stored procedure,  the file can be named for examle 'patch_V2_0_0_80_c.sql'

call swapConfigDataToProcessing();
DROP PROCEDURE IF EXISTS swapConfigDataToProcessing;


As far as you see I use letters a,b,c in the names of the scripts in order to arrange a strict order of calling the scripts, first of all we drop procedure, then we create procedure and finally we call the procedure.
-----------------------------------------------------------------------------------------------------------------------------


The project enable to run sql scripts to create or update database. 
The purpose access the zip file which packages all needed sql scripts 
files and located on destined bucket and folder. It unzips the files
sortes thems according to the version and run them one after the another, 
in the same time updating DB_HISTORY table.

Parameters:

"JOB_NAME", "CreateUpdateDBJob", "Batch job name"

"DATASOURCE", "jdbc:mysql://cd1rg3usmplyedd.cwegnemmy1on.us-east-1.rds.amazonaws.com:3306/mysql?useUnicode=true&characterEncoding=UTF-8", "MySQL data source"	

"USER", "DBUser", "MySQL user name"

"PASSWORD", "xxxxx", "MySQL user password"

"AWS_ACCESS_KEY", "xxxx", "AWS access key"

"AWS_SECRET_KEY", "xxxxx", "AWS secret key"

SCRIPTS_ZIP", "sql_scripts.zip", "Zip file with the DB scripts"

"BUCKET_NAME", "verifone-cg-db-scripts", "Bucket name for the zip"

"FROM_SCRATCH", "false", "Check if you want to create or update database"

"LAST_VERSION", "none", "If you create a database, you can fix ntil version to run scripts. In case of update from which version"

"DB_ACTION",["create","update"],"Kind of action we are going to execute on our database schema"

"ENV",["dev","test","sbox","prodeu","produs", "prod","cgext","staging1"],"Environment"


The following command should be running from Jenkins's Execute shell form in the end


java -jar fluxboard-jobs/database-run-scripts-dev/create-update-db-job-1.0.0.jar $JOB_NAME $DATASOURCE $DB_SCHEMA $USER $PASSWORD $AWS_ACCESS_KEY $AWS_SECRET_KEY $ENV $BUCKET_NAME $FROM_SCRATCH $LAST_VERSION $SCRIPTS_ZIP
  
