FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install
COPY . /myapp

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
