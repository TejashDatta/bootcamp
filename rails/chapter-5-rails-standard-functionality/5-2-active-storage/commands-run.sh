rails new portraits_uploader

rails active_storage:install

rails g scaffold user name portrait:attachment

rails db:migrate
