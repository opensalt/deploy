OpenSalt
========

This repository holds a set of scripts that can be used to bring up an
instance of OpenSalt.


Installation
------------

* Ensure [docker](https://docker.com/) is installed

* Clone this repository

* Copy `.env.dist` to `.env`

* Run `make up` to start OpenSALT

* Wait a few seconds or so to allow the database to warm up

* Run `make migrate` to set up the database

* Run `bin/console salt:user:add` to create your first user

* Go to `http://localhost.localdomain:4000/` to get to the initial page

