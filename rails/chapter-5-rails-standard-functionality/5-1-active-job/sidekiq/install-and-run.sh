# add gem 'sidekiq' to gemfile
bundle install
docker pull redis
docker run -p 6379:6379 redis
bundle exec sidekiq
