component=dispatch
source common.sh

dnf install golang -y
useradd roboshop

artifact_download
cd /app
go mod init dispatch
go get
go build

systemd_setup