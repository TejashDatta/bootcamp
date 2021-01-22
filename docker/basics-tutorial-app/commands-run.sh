# build and start container
docker pull httpd:2.4
docker build -t node-app .
docker run -dp 3000:3000 node-app

# stop and remove container
docker ps
docker stop cool_proskuriakova
docker rm cool_proskuriakova
docker rm -f cool_proskuriakova

# login and push to docker hub repository
docker login -u tejashdatta
docker image ls
docker tag node-app tejashdatta/node-app
docker push tejashdatta/node-app

docker run -dp 3000:3000 tejashdatta/node-app

# create and use volume
docker volume create app-data
docker volume inspect app-data

docker run -dp 3000:3000 -v app-data:/etc/todos node-app

# bind mount dev server
docker run -dp 3000:3000 -w /app -v "$(pwd):/app" node:12-alpine sh -c "yarn install && yarn run dev"
docker run -dp 3000:3000 -w /app -v Desktop/bootcamp/docker/basics-tutorial-app:/app node:12-alpine sh -c "yarn install && yarn run dev"

# create network
docker network create todo-app

# mysql container
#create
docker run -d \
  --network todo-app --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7

#login
docker exec -it strange_lalande mysql -p

# connect app to mysql db
docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"

# docker-compose 

docker-compose up -d

docker-compose logs -f
docker-compose logs -f app

docker-compose down


docker scan node-app

docker image history node-app
