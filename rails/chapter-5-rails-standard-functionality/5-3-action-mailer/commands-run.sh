rails new action_mailer_app
rails g scaffold user name email
rails db:create
rails db:migrate

rails g mailer UserMailer
