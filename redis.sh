source common.sh

print_head disbale redis default
dnf module disable redis -y &>> $log_file

print_head enable redis 7
dnf module enable redis:7 -y &>> $log_file

print_head install redis
dnf install redis -y &>> $log_file

print_head updare redis file
sed -i -e 's|127.0.0.1|0.0.0.0|'-e '/protected-mode/ c protected-mode no'  /etc/redis/redis.conf &>> $log_file

print_head start redis services
systemctl enable redis &>> $log_file
systemctl restart redis &>> $log_file