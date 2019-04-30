FROM ruby:2.3.8-slim-stretch
LABEL author="David J Eddy <me@davidjeddy.com>"

RUN apt-get update -y
RUN apt-get update -y && apt-get install -y apt-transport-https build-essential nodejs imagemagick mysql-client default-libmysqlclient-dev
RUN apt-get clean

# cache gem installs
COPY Gemfile* /tmp/
WORKDIR /tmp
RUN gem install bundler -v 1.17.2 && bundle install

# install app files
RUN mkdir /app
WORKDIR /app
COPY ./ /app

# DB install and migrations
RUN bundle config --delete bin && rake rails:update:bin 

# EXPOSE 3000
ENTRYPOINT ["rails", "server", "--binding", "0.0.0.0"]