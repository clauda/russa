### RUSSA - Rack Upload Service Sample App

[![CircleCI](https://circleci.com/gh/clauda/russa.svg?style=svg)](https://circleci.com/gh/clauda/russa)  

Rack-App + Shrine + AWS S3  

#### Setup

In order to start our app you need to run the following command: 

Installing dependencies:

```sh
bundle install
``` 

#### Usage

You need Ruby >= 2.5 in order to run this project. Or you also can use a docker container (instructions below).

To start the server, run the following command: 

```sh
bundle exec rackup
``` 

The application will be avaliable on the [http://localhost:9292](http://localhost:9292)

#### Using Docker

You can use docker to run this project.

You need first build the docker image running 

```sh
docker build . --tag russa:latest
```

and then...

```sh 
docker run -it --rm -v "$PWD":/app -p 9292:9292 russa:latest rackup -o 0.0.0.0
``` 

to up the server.

And the application also will be avaliable on the [http://localhost:9292](http://localhost:9292)

To run tests: 

```sh
docker run -it --rm -v "$PWD":/app -w /app russa:latest rake
```

#### Endpoints

The main upload endpoint: `{URL}/upload`

Sample request:

```sh
curl -X POST -F file=@/test/files/mary.jpg http://localhost:9292/upload
```