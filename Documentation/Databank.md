# Set Up Database

## Install

Code voor de installatie van de database (nadat MySQL geïnstalleerd is)

```
mysql -u root -p
mysql> CREATE DATABASE IdeaalDuaal;
mysql> SHOW DATABASES;
mysql> CREATE USER 'DBStudent4' IDENTIFIED BY 'DBStudent418';
mysql> GRANT ALL PRIVILEGES ON * . * TO 'DBStudent4';
mysql> SELECT DISTINCT user FROM mysql.user
mysql> SHOW GRANTS DBStudent4;
```

## Jenkins Back-Up

Via Jenkins maken we elke maandag en vrijdag een backup van de database.

Code voor backup te maken:
```
export MYSQL_PWD=StudentStudent18
mysqldump -u root IdeaalDuaal > database_backup.sql
```

Installeer eerst Go en de github release aan de hand van deze [link](https://github.com/aktau/github-release)

Code om backup te releasen naar Github
```
filename=database_backup_$(date +'%Y-%m-%d').sql
export GITHUB_TOKEN=372ba634c71bbe5436b4bc6cb85b9f7ae543787c
export GOPATH=/usr/local/go/bin
GITHUB_ORGANIZATION=HoGent-Projecten3
GITHUB_REPO=projecten3-1819-backend-groep9-ideaalduaal
VERSION_NAME=v$(date +'%Y-%m-%d')

cp database_backup.sql ${filename}
rm database_backup.sql

#echo "Deleting release from github before creating new one"
#github-release delete --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME}

echo "Creating a new release in github"
github-release release --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "${VERSION_NAME}"

echo "Uploading the artifacts into github"
github-release upload --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "database_backup_${VERSION_NAME}.sql" --file ${filename}
```
