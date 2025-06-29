if [ -z $1 ]; then 
    echo "input mysql password required"
    exit 1
fi

dnf install mysql-server -y
systemctl enable mysqld
systemctl start mysqld 
#Passing passqword as varaible $1
mysql_secure_installation --set-root-pass $1