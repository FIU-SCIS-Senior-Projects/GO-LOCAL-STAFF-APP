#!/bin/sh

#displaying info message and password
echo "connecting to mysql and importing Terms Agreements to 'golocalapp' database"
echo "(password is 'fall2015)"

#connecting to mysql and updating the users of 'golocalapp' database
mysql -u root -p golocalapp < datadump_golocalappUserAgreements.sql

