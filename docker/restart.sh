# default
docker run --restart no cool_proskuriakova

docker update --restart on-failure cool_proskuriakova
docker update --restart always cool_proskuriakova
docker update --restart unless-stopped cool_proskuriakova
