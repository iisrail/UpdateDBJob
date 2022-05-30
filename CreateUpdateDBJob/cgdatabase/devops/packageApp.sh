## This script does the following things:
## 1. Build the wso2 cc jars 2. Creates the target directory 3. Copies all

DEVOPS_DIR=`pwd`

## START
echo "********** Package App script started **********"

## Step 1: Create target directory
echo "********** Create Target Directory **********"
TARGET_DIR=$DEVOPS_DIR/../target
mkdir $TARGET_DIR

## Step 3: zip database folder as is including all the scripts 
echo "********** Zipping database folder to the targer directory **********"
DATABASE_DIR=$DEVOPS_DIR/../sql_scripts
DATABASE_ZIP=$TARGET_DIR/sql_scripts.zip
cd $DATABASE_DIR
zip -r $DATABASE_ZIP . 
[ $? -eq 0 ] || exit $?;

## DONE
echo "********** Package DB script is done **********"