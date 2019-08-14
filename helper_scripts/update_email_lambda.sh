#!/bin/bash +xe
# source https://www.isc.upenn.edu/accessing-mysql-databases-aws-python-lambda-function

lambda_name="test_lambda_fn"

echo -e "\nEnsuring pre-reqs...\n"
pip install --user virtualenv

mkdir -p ./.tmp
cd ./.tmp
virtualenv ${lambda_name}
cd ./${lambda_name}
source bin/activate
pip install pymysql
ls -ldah ./lib/python2.7/site-packages/pymysql
deactivate
cd ../../

echo -e "\nBuilding the processing complete email sending lambda...\n"
cp ./terraform/lambda_s3_to_transcoder/lambda_source/processing_complete.py ./lambda_function.py
chmod 755 ./lambda_function.py
zip -r ./${lambda_name}.zip ./.tmp/${lambda_name}/lib/python2.7/site-packages/pymysql ./lambda_function.py

echo -e "\n...pushing update...\n"
aws lambda update-function-code \
    --function-name ${lambda_name} \
    --zip-file "fileb://${lambda_name}.zip" \
    --publish

echo -e "\n...removing tmp resource...\n"
rm -f ./lambda_function.py
rm -f ./${lambda_name}.zip

echo -e "\n...done.\n"
