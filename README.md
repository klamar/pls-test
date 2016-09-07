# General 

Many testers are reporting to waste much time in setting up the environment. So please ensure to be comfortable 
with the environment before the test starts. 

* Maybe you want to try to install stuff using composer? (you are allowed to install any library you want) 
* Have you checked phpmyadmin or phppgadmin?
* Did you check if .htaccess files are working properly (the test does not require .htaccess file knowledge, but
  the libraries you may want to use might require it)

General information about Docker and docker-compose if you are not so familiar with these tools:

* [What is Docker?](https://www.docker.com/what-docker)
* [Docker Compose overview](https://docs.docker.com/compose/overview/)
* [Docker Compose command-line reference](https://docs.docker.com/compose/reference/)

# Prerequesites

* Install docker
```
curl -sSL https://get.docker.com/ | sh
```
* Add your user to docker group (requires logging out and in again)
```
sudo usermod -aG docker $USER
```
* Install docker-compose
```
    curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
```
* Stop applications listening on these ports (before starting these containers):
    * 80 (apache/nginx)
    * 3306 (mysql) 
    * 5432 (postgresql)
    * 8080 - this port can be changed in docker-compose.yml
    * 8088 - this port can be changed in docker-compose.yml

# How to use Docker container

* Start container
```
    docker-compose up
```

* Stop container
```
    docker-compose stop
```

* Install a library using composer
```
    docker-compose exec www bash -c "cd /var/www/html && composer require laravel/laravel" 
```

* Enter container
```
    docker-compose exec www bash
```

# URLs

your project: http://localhost

phpMyAdmin: http://localhost:8080

phpPgAdmin: http://localhost:8088/phppgadmin

# Credentials

## MySQL

    host: mysql
    user: root
    password: password

## Postgres

    host: db
    user: postgres
    password: password

# Finishing the test

Do not forget to add a SQL file or a dump for creating the database structure. 
Simply add the sql/dump files somewhere to the project archive.
Some frameworks support migrations. You could also create a migration. 
Please provide instructions (framework specific) on how to get your database structure to run on a different computer.

* [Phpmyadmin: How do I backup/create dump of my MySQL database?](https://support.fluidhosting.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=89)
* [Phppgadmin: How do I backup/create dump of my PostgreSQL database?](https://support.fluidhosting.com/index.php?_m=knowledgebase&_a=viewarticle&kbarticleid=152)


Archiving your project directory

    tar czf pls-test.tar.gz --exclude=data <project-root>
    
or

    zip -r pls-test.zip * -x data/\*
    
    