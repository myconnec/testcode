#!/bin/bash

cp ./input/database.sql ./output/database.sql

export FILE=./output/database.sql

# sed find/replace format: sed -i 's///g' ${FILE}

sed -i ':a;N;$!ba;s/BEGIN TRANSACTION;\n//g' ${FILE}
sed -i 's/COMMIT;//g' ${FILE}
sed -i 's/CREATE TABLE IF NOT EXISTS/CREATE TABLE/g' ${FILE}

# # 't', 1,
sed -i "s/'t'/1/g" ${FILE}

# AUTOINCREMENT AUTO_INCREMENT
sed -i 's/AUTOINCREMENT/AUTO_INCREMENT/g' ${FILE}
# varchar VARCHAR(32)
sed -i 's/varchar/VARCHAR\(32\)/g' ${FILE}
# datetime DATETIME
sed -i 's/datetime/DATETIME/g' ${FILE}
# boolean BOOLEAN
sed -i 's/boolean/BOOLEAN/g' ${FILE}
# integer INT(11)
sed -i 's/integer/INT\(11\)/g' ${FILE}
# text TEXT
sed -i 's/text/TEXT/g' ${FILE}

# `email`	VARCHAR(32)
# `email`	VARCHAR(1024)
sed -i 's/`email`	VARCHAR(32)/`email`	VARCHAR(1024)/g' ${FILE}

# `encrypted_password`	VARCHAR(32)
# `encrypted_password`	VARCHAR(1024)
sed -i 's/`encrypted_password`	VARCHAR(32)/`encrypted_password`	VARCHAR(1024)/g' ${FILE}

# `reset_password_token`	VARCHAR(32)
# `reset_password_token`	VARCHAR(1024)
sed -i 's/`reset_password_token`	VARCHAR(32)/`reset_password_token`	VARCHAR(1024)/g' ${FILE}

# `bio`	VARCHAR(32)
# `bio`	VARCHAR(1024)
sed -i 's/`bio`	VARCHAR(32)/`bio`	VARCHAR(1024)/g' ${FILE}

# `avatar_file_name`	VARCHAR(32),
# `avatar_file_name`	VARCHAR(1024)
sed -i 's/`avatar_file_name`	VARCHAR(32)/`avatar_file_name`	VARCHAR(1024)/g' ${FILE}

# `title`	VARCHAR(32)
# `title`	VARCHAR(128)
sed -i 's/`title`	VARCHAR(32)/`title`	VARCHAR(128)/g' ${FILE}

# `request_hash`	VARCHAR(32)
# `request_hash`	VARCHAR(256)
sed -i 's/`request_hash`	VARCHAR(32)/`request_hash`	VARCHAR(256)/g' ${FILE}

# `ip_address`	VARCHAR(32)
# `ip_address`	VARCHAR(39)
sed -i 's/`ip_address`	VARCHAR(32)/`ip_address`	VARCHAR(39)/g' ${FILE}
