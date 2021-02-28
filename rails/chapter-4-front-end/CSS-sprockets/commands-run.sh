rails new sprockets-example
rails g scaffold comment name:string body:text
rails db:create
rails db:migrate

rails assets:precompile
rails assets:clobber
RAILS_ENV=production rails assets:precompile

RAILS_ENV=production rails db:setup
RAILS_ENV=production rails s

RAILS_SERVE_STATIC_FILES=1 RAILS_ENV=production rails s
