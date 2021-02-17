rails g scaffold Blog name:string
rails g scaffold Entry title:string body:text blog:references

rails db:create RAILS_ENV=production

rails db:migrate
rails db:migrate:status

rails db:rollback STEP=2

rails db:seed
rails db:seed:replant

rails runner 'p Blog.count'

rails db:drop
rails db:setup
rails db:prepare

rails db:create:sub

rails g model author name:string --database=sub
rails db --database sub
