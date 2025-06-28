dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp catalogue.service /etc/systemd/system/catalogue.service
useradd roboshop
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip 
cd /app 
unzip /tmp/catalogue.zip
cd /app 
npm install
cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.shr-eng.com </app/db/master-data.js
systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue