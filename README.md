OpenSALT
========

This repository holds a set of scripts that can be used to bring up an
instance of OpenSALT.


Installation
------------

* Ensure [docker](https://docs.docker.com/get-docker/) and
  [docker-compose](https://docs.docker.com/compose/install/) are installed

* Clone this repository

* Copy `.env.dist` to `.env`
 
* Update `.env` as desired

* Create a volume for the mysql data using `docker volume create --name=opensalt-mysql-data`
  (replacing _opensalt_ with the value of _COMPOSE_PROJECT_NAME_ in `.env` if changed)

* Run `make up` to start OpenSALT

* Wait 30 seconds or so to allow the database to warm up

* Run `make migrate` to set up the database

* Run `bin/console salt:org:add` to create your first organisation

* Run `bin/console salt:user:add` to create your first user

* Get IP address of web container using
  `docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' opensalt_web_1`
  (replacing _opensalt_ with the value of _COMPOSE_PROJECT_NAME_ in `.env` if changed)

* Go to `http://<IP of container>/` to get to the initial page

