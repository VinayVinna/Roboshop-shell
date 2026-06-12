source common.sh

print_head copy rabbitmq repo file
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>> $log_file

print_head install rabbitmq server
dnf install rabbitmq-server -y &>> $log_file

print_head start rabbitmq services
systemctl enable rabbitmq-server &>> $log_file
systemctl restart rabbitmq-server &>> $log_file

print_add add root user
rabbitmqctl add_user roboshop roboshop123 &>> $log_file

print_head update the root user permissions
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>> $log_file