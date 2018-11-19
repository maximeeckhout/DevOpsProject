# Lokale VM

Installeren van Jenkins en MySql op een virtuele machine

## Installeren van Java

Eerst en vooral hebben we Java nodig omdat Jenkins Java nodig heeft om te draaien.

```
sudo apt-get install -y openjdk-8-jre
```
## Installeren van Jenkins

De volgende stap is om Jenkins te installeren, eerst doen we een update van het systeem, vervolgens installeren we Jenkins en starten we de service ook.
```
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl start jenkins
systemctl status jenkins
```

## Configureren van Firewall
Om de webserver te bereiken moeten we port 8080 openen, zodat deze toegankelijk is.
```
sudo apt-get install -y firewalld
sudo systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp #install firewallD first
sudo firewall-cmd --reload
```
## MySql installeren
Voor de installatie updaten we nogmaals het systeem, vervolgens installeren we mysql-server en starten we de service. Als laatste voeren we de mysql_secure_installation uit, waar we de anonymous users en dergelijke verwijderen en een root password voor onze databank gaan instellen.
```
sudo apt-get update
sudo apt-get install -y mysql-server
sudo systemctl start mysql.service
sudo systemctl status mysql.service
sudo mysql_secure_installation
```

## Links

* <https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04>
* <https://linuxize.com/post/how-to-install-jenkins-on-ubuntu-18-04/>
