rails new actioncable-sample
rails g controller rooms show

rails g model message content:text
rails db:create
rails db:migrate

rails g channel room speak


bundle exec puma cable/config.ru

rails g model User name
