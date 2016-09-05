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
