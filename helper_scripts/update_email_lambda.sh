#!/bin/bash +xe
# source https://www.isc.upenn.edu/accessing-mysql-databases-aws-python-lambda-function

lambda_name="media_processing_complete_email"
cd ./terraform/lambda_s3_to_email/source

echo -e "\nEnsuring pre-reqs...\n"
pip install --user virtualenv
virtualenv ./.tmp
cd ./.tmp
source bin/activate
pip install pymysql
ls -ldah ./lib/python2.7/site-packages/pymysql
deactivate
cd ../
mv ./.tmp/lib/python2.7/site-packages/pymysql ./pymysql

echo -e "\nBuilding the processing complete email sending lambda...\n"

zip -r ./${lambda_name}.zip ./pymysql ./index.py

echo -e "\n...pushing update...\n"
# aws lambda update-function-code \
#     --function-name ${lambda_name} \
#     --zip-file "fileb://${lambda_name}.zip" \
#     --publish

echo -e "\n...removing tmp resource...\n"
rm -rf ./.tmp/

cd ../../../
echo -e "\n...done.\n"
