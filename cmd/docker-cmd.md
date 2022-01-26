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

docker run -it -p 80:3000 -v $(pwd):/app -v /app/node_modules/ --network="host" urn-type:0.0.x


#### START THE CONTAINER (INTERACTIVE)

docker start -i container_name

#### CREATE A CONTAINER WITH DIFFERENT ENTRYPOINT FOR KEEPING IT RUNNING

docker create --entrypoint="tail -f /dev/null" image_name

#### ENTER CONATINER IN BASH

docker exec -it container_name bash


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


#### START A STOPPED CONTAINER WITH ANOTHER CMD

https://stackoverflow.com/questions/32353055/how-to-start-a-stopped-docker-container-with-a-different-command

This command saves modified container state into a new image user/test_image

```
docker commit $CONTAINER_ID new_image
```
```
docker run -ti --entrypoint=sh new_image
```

#### REMOVE CONTAINER AFTER STOPPING IT

```
--rm

docker run -it --rm ...
```

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


#### DOCKER BUILDKIT

To enable docker BuildKit by default, set daemon configuration in
`/etc/docker/daemon.json` feature to true and restart the daemon:

```
{
	"debug": true,
	"experimental": true,
	"features": { "buildkit": true }
}
```

Also possible to set manually every time before building with:
```
export DOCKER_BUILDKIT=1
```


#### SSH KEY

The command `--ssh default` will pass to the installer the default ssh key of the client
```
docker build --ssh default -t urn-xxx:0.0.1 .
```

Create and start a container with its own node_modules folder
```
docker run -it -v $(pwd):/app -v /app/node_modules/ --network="host" urn-xxx:0.0.1
```

#### Start container

##### Start the container with Docker
```
docker start -i container_name
```

##### Start the container with Docker Compose

Docker compose must be version 1.25.1 or higher

In order to start developing use:

```
docker-compose up --build
```

After built
```
docker-compose up
```





























