#!/bin/sh


#displaying password
echo "connecting to mysql and updating 'golocalapp' database"
echo "(password is 'fall2015)"

#connecting to mysql and updating 'golocalapp' database
mysql -u root -p golocalapp < golocalapp.sql



