FROM ruby:2.3.8-slim-stretch
LABEL author="David J Eddy <me@davidjeddy.com>"

RUN apt-get update -y
RUN apt-get update -y && apt-get install -y apt-transport-https libsqlite3-dev build-essential nodejs imagemagick
RUN mkdir /app
WORKDIR /app
COPY ./ /app

RUN  gem install bundle && bundle install
RUN rake db:migrate && rake db:setup

RUN apt-get clean

EXPOSE 3000
ENTRYPOINT ["rails", "server", "--binding", "0.0.0.0"]