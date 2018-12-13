FROM ruby:2.3.8-slim-stretch

# throw errors if Gemfile has been modified since Gemfile.lock
RUN apt-get update -y && apt-get install -y \
    build-essential \
    curl \
    libsqlite3-dev \
    nodejs \
    sqlite3

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && apt-get install -y nodejs

RUN mkdir /app
COPY ./ /app
WORKDIR /app
RUN  gem install bundler
RUN bundle install
RUN rake db:migrate
EXPOSE 3000
CMD ["rails", "server", "-e", "development", "--binding", "0.0.0.0"]