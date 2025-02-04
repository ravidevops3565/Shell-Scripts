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

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then

    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySQL"

    
else 
    echo "My Sql software is already INSTALLED"

fi

dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then

    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing GIT"

else 
    echo "GIT software is already INSTALLED"
fi
