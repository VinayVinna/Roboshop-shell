component=catalogue
source common.sh

print_head copy mangodb repo file
cp Mango.repo /etc/yum.repos.d/mongo.repo &>>$log_file

nodejs_app_setup

print_head install mangodb
dnf install mongodb-mongosh -y &>>$log_file

print_head load mangodb master data
mongosh --host mango-dev.vdevops21.online </app/db/master-data.js &>>$log_file