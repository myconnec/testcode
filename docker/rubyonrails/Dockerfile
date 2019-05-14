FROM ruby:2.3.8-slim-stretch
LABEL author="David J Eddy <me@davidjeddy.com>"

RUN apt-get update -y
RUN apt-get clean && apt-get autoclean && apt-get autoremove -y && apt-get update -y
RUN apt-get install -y awscli apt-transport-https build-essential python-minimal python-setuptools python-pip software-properties-common
RUN apt-get install -y nodejs imagemagick mysql-client default-libmysqlclient-dev s3fs
RUN apt-get clean

# cache gem installs
COPY Gemfile* /tmp/
WORKDIR /tmp
RUN gem install bundler -v 1.17.2 && bundle install

# install app files
RUN mkdir /app
WORKDIR /app
COPY ./ /app
RUN chmod 0600 /app/.passwd-s3fs

# DB install and migrations
RUN bundle config --delete bin && rake rails:update:bin

# EXPOSE 3000
ENTRYPOINT ["rails", "server", "--binding", "0.0.0.0"]
