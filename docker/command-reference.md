# docker build
build image

docker build -t [tag-name] directory-of-dockerfile 
eg docker build -t getting-started .

options:
-t tag: specify tag/image name
-f or --file specify Dockerfile location
--no-cache

# docker run
run image

docker run [tag-name]
eg docker run -p 80:80 httpd:2.4

docker run [tag-name] [command]
eg docker run -it ubuntu ls /

options:
-p port: eg -p 80:80
-d detached: run in background
-i interactive: take input
-t terminal: provide terminal
-e environment variable set
-v volume: named volume or bind volume
-w working directory in image

# docker ps
list containers

eg docker ps

# docker stop
stop container

docker stop [container-id]
eg docker stop cool_proskuriakova

# docker rm
remove container

docker rm [stopped-container-id]
eg docker stop cool_proskuriakova

options:
-f forced: stop and remove container

# docker pull
download image without running

docker pull [tag-name]
eg docker pull ubuntu

# docker login
login to docker hub account

eg docker login -u tejashdatta

# docker tag
set tag

docker tag old-tag USER-NAME/tag
eg docker tag node-app tejashdatta/node-app

# docker image ls
list downloaded images

# docker push
upload image to repository

docker push USER-NAME/tag
eg docker push tejashdatta/node-app

# docker exec
execute command on running container

docker exec [container-id] [command]
eg docker exec evil_ptolemy ls

# docker volume create
create named volume

docker volume create [name]
eg docker volume create app-data

# docker volume inspect
docker volume inspect [name]
eg docker volume inspect app-data

# docker logs

docker logs [container-name]
eg docker logs -f optimistic_heyrovsky

options:
-f follow log output continuously

# docker network create

docker network create [network-name]
eg docker network create todo-app

# docker-compose commands

# docker-compose up

options:
-d

# docker-compose logs

eg docker-compose logs

docker-compose logs [service-name]
eg docker-compose logs app

# docker-compose down
options:
--volumes delete volumes

# docker scan
examine security vulnerabilities
セキュリティの脆弱性を調べる

docker scan [image-name]
eg docker scan node-app

# docker image history
view image layer history

docker image history [image-name]
eg docker image history node-app

options:
--no-trunc untruncated output
