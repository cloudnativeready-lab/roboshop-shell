source common.sh
component=user
nodejs
cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y

mongosh --host mongodb-dev.shr-eng.com </app/db/master-data.js
