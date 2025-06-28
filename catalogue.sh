source common.sh
component=catalogue
nodejs
dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.rdevopsb85.online </app/db/master-data.js