#!/bin/bash

date
USERID=$(id -u)

VALIDATE() {
            if [ $1 -ne 0 ]
            then 
              echo "$2....Failure"
            else 
              echo "$2....Success"
            fi
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR:Please make sure that you are a root user"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then

    dnf install mysql -y
    VALIDATE $? "Installing MySQL"

    
else 
    echo "My Sql software is already INSTALLED"

fi

dnf list installed git
if [ $? -ne 0 ]
then

    dnf install git -y
    VALIDATE $? "Installing GIT"

else 
    echo "GIT software is already INSTALLED"
fi
