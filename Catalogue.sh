component=catalogue
source common.sh

print_head copy mangodb repo file
cp Mango.repo /etc/yum.repos.d/mongo.repo &>>$log_file
exit_status_print $?

nodejs_app_setup

print_head install mangodb
dnf install mongodb-mongosh -y &>>$log_file
exit_status_print $?

print_head load mangodb master data
mongosh --host mangodb.vdevops21.online </app/db/master-data.js &>>$log_file
exit_status_print $?