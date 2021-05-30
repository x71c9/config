### Docker deamon

Restart Docker deamon `dockerd`
```
sudo service docker status
sudo service docker stop
sudo service docker start
sudo service docker restart
```

### Docker commands

#### LIST IMAGES

docker image ls -a


#### LIST CONTAINERS

docker container ls -a


#### LIST RUNNING CONTAINERS

docker ps


#### STOP ALL RUNNING CONTAINERS

docker stop $(docker ps -aq)


#### REMOVE ALL CONTAINERS

docker rm $(docker ps -aq)


#### REMOVE ALL IMAGES

docker rmi $(docker images -q)


#### REMOVE EVERYTHING

docker system prune -a


#### BUILD AN IMAGE TAGGED 0.0.x

docker build -t urn-type:0.0.x


#### CREATE A CONTAINER WITH ITS OWN NODE_MODULES FOLDER

docker run -it -p 80:3000 -v $(pwd):/app -v /app/node_modules/ --network="host" urn-type:0.0.x¶


#### START THE CONTAINER (INTERACTIVE)

docker start -i container_name



### DOCKER COMPOSE

#### START DOCKER COMPOSE

docker-compose up


#### REBUILD AND START DOCKER COMPOSE

docker-compose up --build


#### STOP AND DELETE ALL CREATED CONTAINERS

docker-compose down


#### CONNECT TO SHELL

docker-compose exec server bash
docker-compose exec service_name /bin/bash


#### PRINT LOGS

docker-compose logs --follow service_name


#### UPGRADE DOCKER COMPOSE

First, remove the old version:

If installed via apt-get
```
sudo apt-get remove docker-compose
```

If installed via curl
```
sudo rm /usr/local/bin/docker-compose
```

If installed via pip
```
pip uninstall docker-compose
```

Then find the newest version on the release page at GitHub
https://github.com/docker/compose/releases

DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod 755 $DESTINATION






























