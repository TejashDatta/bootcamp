docker-compose run --no-deps web rails new . --force --database=postgresql

sudo chown -R $USER:$USER .

docker-compose build

# in config/database.yml add:
# host: db
#   username: postgres
#   password: password

docker-compose up

docker-compose run web rake db:create
