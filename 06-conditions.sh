#!/bin/bash

date
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:Please make sure that you are a root user"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "Mysql Installation....Failure"
else 
    echo "Mysql Installation....Success"

fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Git Installation....Failure"
else 
    echo "Git Installation....Success"
fi
