#!/bin/bash


date
USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

VALIDATE() {
            if [ $1 -ne 0 ]
            then 
              echo "$2....Failure"
            else 
              echo "$2....Success"
            fi
}

echo "Script started executing at $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then 
    echo "ERROR:Please make sure that you are a root user"
    exit 1
fi

for package in $@
do 
   dnf list installed $package &>>$LOG_FILE_NAME
   if [ $? -ne 0]
   then 
       dnf install $package -y &>>$LOG_FILE_NAME
   else 
       echo "Package already INSTALLED"
   fi

done
