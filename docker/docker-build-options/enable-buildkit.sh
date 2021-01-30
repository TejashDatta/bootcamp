# set in environment variable
DOCKER_BUILDKIT=1 docker build .

# set in config
vi /etc/docker/daemon.json
# in file
# { "features": { "buildkit": true } }
