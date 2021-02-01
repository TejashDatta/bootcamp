FROM ruby:2.6.6

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
