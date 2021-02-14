rails g model Book \
name:string \
published_on:date \
price:integer

rails db:create
rails db:migrate
