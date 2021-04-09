docker build -t myrailsapp . 
docker run -p 3000:3000 myrailsapp

# build with cache
DOCKER_BUILDKIT=1 docker build -t myrailsapp -f Dockerfile-buildkit .

# run in development environment

docker volume create myrailsapp_bundle
docker volume create myrailsapp_node_modules

docker run -i -t \
  -v $(pwd):/app  \
  -v myrailsapp_bundle:app/vendor/app/bundle \ 
  -v myrailsapp_node_modules:app/node_modules \
  -p 3000:3000 \
  myrailsapp

# run docker compose
docker-compose run --service-ports app

# install rollbar
rails g rollbar
