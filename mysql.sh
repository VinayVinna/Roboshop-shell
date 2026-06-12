source common.sh

print_head install my sql server
dnf install mysql-server -y &>> $log_file

print_head start mysql services
systemctl enable mysqld &>> $log_file
systemctl restart mysqld &>> $log_file

print_head setup root user password
mysql_secure_installation --set-root-pass RoboShop@1 &>> $log_file