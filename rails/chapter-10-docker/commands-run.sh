docker build -t myrailsapp . 
docker run -p 3000:3000 myrailsapp

# build with cache
DOCKER_BUILDKIT=1 docker build -t myrailsapp -f Dockerfile-buildkit .
