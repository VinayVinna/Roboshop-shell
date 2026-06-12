source common.sh

print_head copy mangodb repo file
cp Mango.repo /etc/yum.repos.d/mongo.repo &>> $log_file

print_head install mangodb
dnf install mongodb-org -y &>> $log_file

print_head update mangodb file
sed -i -e 's|127.0.0.1|0.0.0.0|'  /etc/mongod.conf &>> $log_file

print_head start mangodb service
systemctl enable mongodb &>> $log_file
systemctl restart mongodb &>> $log_file