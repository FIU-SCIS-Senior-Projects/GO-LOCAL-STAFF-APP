#!/bin/sh

#displaying info message and password
echo "connecting to mysql and exporting Terms Agreements from 'golocalapp' database"
echo "(password is 'fall2015)"

#connecting to mysql and exporting the users from 'golocalapp' database
mysqldump -u root -p golocalapp > datadump_golocalappUserAgreements.sql

