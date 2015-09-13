#!/bin/sh


# check cmd ling args are provided
if [ $1 ]
then
  git pull
  git add .
  git commit -m "$*"
  git push
  # echo "valid args"
  # cmdvar=1
else  
  echo "usage: sh gitpush.sh comments go here"
  # echo "not valid args"
  # cmdvar=0
fi

exit 0