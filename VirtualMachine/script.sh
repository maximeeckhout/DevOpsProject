#https://linuxize.com/post/how-to-install-jenkins-on-centos-7/



sudo yum install java-1.8.0-openjdk-devel -y
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo systemctl start jenkins
systemctl status jenkins

run on boot: sudo systemctl enable jenkins

sudo yum install firewalld -y
sudo systemctl start firewalld

sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp #install firewallD first
sudo firewall-cmd --reload

sudo systemctl daemon-reload

#complete installation and afterwards: http://192.168.1.6:8080/manage to manage

#sudo yum install -y yum-utils device-mapper-persistent-data lvm2 //already completed
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#sudo yum-config-manager --enable docker-ce-edge
#sudo yum-config-manager --enable docker-ce-test
#sudo yum-config-manager --disable docker-ce-edge

#Docker Compose gebruiken

sudo yum install docker-ce -y -y
sudo systemctl start docker
sudo docker run hello-world





