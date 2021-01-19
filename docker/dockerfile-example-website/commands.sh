# build image
docker build -t example-website .

# run image on local port 80
docker run -p 80:80 example-website


docker run -p 80:80 -v C:/Users/niltu/Desktop/bootcamp/docker/dockerfile-example-website/src:/usr/local/apache2/htdocs/ example-website
