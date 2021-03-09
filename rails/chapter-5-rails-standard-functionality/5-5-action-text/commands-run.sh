rails new action_text_sample
rails g scaffold message

rails action_text:install
rails db:migrate

rails g scaffold message content:rich_text
