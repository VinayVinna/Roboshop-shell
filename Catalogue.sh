component=catalogue
source common.sh

cp Mango.repo /etc/yum.repos.d/mongo.repo

nodejs_app_setup

dnf install mongodb-mongosh -y
mongosh --host mango-dev.vdevops21.online </app/db/master-data.js