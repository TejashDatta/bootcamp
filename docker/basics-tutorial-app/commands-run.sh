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
