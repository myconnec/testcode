#!/bin/bash +xe
# source https://www.isc.upenn.edu/accessing-mysql-databases-aws-python-lambda-function

lambda_name="media_processing_complete_email"

echo -e "\nEnsuring pre-reqs...\n"
pip install --user virtualenv

cd ./terraform/lambda_s3_to_email/source
virtualenv ${lambda_name}
cd ./${lambda_name}
source bin/activate
pip install pymysql
ls -ldah ./lib/python2.7/site-packages/pymysql
deactivate

echo -e "\nBuilding the processing complete email sending lambda...\n"
cp -r lib/python2.7/site-packages/pymysql ./pymysql
chmod 755 ./index.py
chmod 755 ./pymysql -R
zip -r ./${lambda_name}.zip ./pymysql ./index.py

echo -e "\n...pushing update...\n"
aws lambda update-function-code \
    --function-name ${lambda_name} \
    --zip-file "fileb://${lambda_name}.zip" \
    --publish

echo -e "\n...removing tmp resource...\n"
rm -rf ./pymysql
rm -rf ./index.py
rm -rf ./${lambda_name}.zip

cd ../../../
echo -e "\n...done.\n"
