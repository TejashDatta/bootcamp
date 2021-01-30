# image

# remove images without tag and container
docker image prune

# remove images without container
docker image prune -a

docker image prune -a --filter "until=12h"

# without confirmation prompt
docker image prune -f
# or
docker image prune --force


# container
docker container prune

# volume
docker volume prune --filter "label!=keep"

# network
docker network prune

# system: prune all
docker system prune

# prune volumes too
docker system prune --volumes
