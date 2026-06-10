source common.sh

print_head  disbale nginx
dnf module disable nginx -y &>> $log_file

print_head  enable nginx 24
dnf module enable nginx:1.24 -y &>> $log_file

print_head  install nginx
dnf install nginx -y &>> $log_file

print_head  copy nginx file
cp nginx.conf  /etc/nginx/nginx.conf &>> $log_file

print_head  clean old content
rm -rf /usr/share/nginx/html/*  &>> $log_file

print_head  download app content
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>> $log_file
cd /usr/share/nginx/html

print_head  extract app content
unzip /tmp/frontend.zip &>> $log_file

print_head  start nginx services
systemctl enable nginx &>> $log_file
systemctl start nginx &>> $log_file