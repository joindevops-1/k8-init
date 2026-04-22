#!/bin/bash

if [ -f /secrets/mysql-root-password.txt ]; then
    PASSWORD=$(cat /secrets/mysql-root-password.txt)
    echo "Accessed MySQL root password"
else
    echo "MySQL Root password file not found"
    exit 1
fi

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm -rf /secrets/mysql-root-password.txt
exec exec /usr/local/bin/docker-entrypoint.sh mysqld