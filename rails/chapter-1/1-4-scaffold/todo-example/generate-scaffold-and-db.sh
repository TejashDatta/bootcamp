rails g scaffold task content:text

rails db:create
rails db:migrate
rails db:migrate:status

rails dbconsole
# in db sqlite shell
.schema task
