app_setup() {
    useradd roboshop
    mkdir /app 
    curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip 
    cd /app 
    unzip /tmp/${component}.zip
}

systemd_setup() {
    cp ${component}.service /etc/systemd/system/${component}.service
    systemctl daemon-reload
    systemctl enable ${component} 
    systemctl start ${component}
}

nodejs() {
    dnf module disable nodejs -y
    dnf module enable nodejs:20 -y
    dnf install nodejs -y
    app_setup
    npm install
    systemd_setup
}

mongo_setup() {
    cp mongo.repo /etc/yum.repos.d/mongo.repo
    dnf install mongodb-org -y
    sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
    systemd_setup
}

mysql_setup() {
    dnf install mysql-server -y
    systemd_setup
    mysql_secure_installation --set-root-pass RoboShop@1
}

python_setup() {
    dnf install python3 gcc python3-devel -y
    app_setup
    pip3 install -r requirements.txt
    systemd_setup
}

java_setup() {
    dnf install maven -y
    app_setup
    mvn clean package 
    mv target/${component}-1.0.jar ${component}.jar
    mysql_client_setup
    systemd_setup
}

mysql_client_setup() {
    dnf install mysql -y
    mysql -h mysql-dev.shr-eng.com -uroot -pRoboShop@1 < /app/db/schema.sql
    mysql -h mysql-dev.shr-eng.com -uroot -pRoboShop@1 </app/db/app-user.sql
    mysql -h mysql-dev.shr-eng.com -uroot -pRoboShop@1 </app/db/master-data.sql
}

go_setup() {
    dnf install golang -y
    app_setup
    go mod init dispatch
    go get 
    go build
    systemd_setup
}