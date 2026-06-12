component=shipping
source common.sh

maven_app_setup

print_head install mqsql
dnf install mysql -y &>> $log_file

print_head load schema
mysql -h mysql-dev.vdevops21.online -uroot -pRoboShop@1 < /app/db/schema.sql &>> $log_file

print_head load user creation
mysql -h mysql-dev.vdevops21.online -uroot -pRoboShop@1 < /app/db/app-user.sql &>> $log_file

print_head load master data
mysql -h mysql-dev.vdevops21.online -uroot -pRoboShop@1 < /app/db/master-data.sql &>> $log_file

