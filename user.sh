dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp user.service /etc/systemd/system/user.service
useradd roboshop
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip 
cd /app 
unzip /tmp/user.zip
cd /app 
npm install
cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.shr-eng.com </app/db/master-data.js
systemctl daemon-reload
systemctl enable user 
systemctl start user