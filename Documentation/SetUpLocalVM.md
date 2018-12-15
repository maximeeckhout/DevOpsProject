# Lokale VM

1. Run ```script.sh```

```
#!/bin/sh
echo "#####################################################################"
echo "									   "
echo "INSTALL JAVA"
echo "									   "
echo "#####################################################################"

sudo apt-get install -y openjdk-8-jre

echo "#####################################################################"
echo "									   "
echo "INSTALL JENKINS"
echo "									   "
echo "#####################################################################"

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl start jenkins
systemctl status jenkins

echo "#####################################################################"
echo "									   "
echo "CONFIGURE FIREWALL"
echo "									   "
echo "#####################################################################"

sudo apt-get install -y firewalld
sudo systemctl start firewalld

sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp #install firewallD first
sudo firewall-cmd --reload

echo "#####################################################################"
echo "									   "
echo "INSTALL MYSQL"
echo "									   "
echo "#####################################################################"

sudo apt-get update
sudo apt-get install -y mysql-server
sudo systemctl start mysql.service
sudo systemctl status mysql.service
sudo mysql_secure_installation

```
