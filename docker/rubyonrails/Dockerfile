FROM ruby:2.3.8-slim-stretch
LABEL author="David J Eddy <me@davidjeddy.com>"

ARG ENV

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

# Create and install self signed SSL/TLS cert
RUN mkdir /usr/.ssl
RUN openssl req -nodes -new -newkey rsa:2048 -keyout /usr/.ssl/localhost.key -out /usr/.ssl/localhost.crt -sha256 -days 365 -x509  -subj "/C=US/ST=FL/L=Tampa/O=ConnecHub/OU=Engineering/CN=localhost"

# DB install and migrations
RUN bundle config --delete bin && rake rails:update:bin 

EXPOSE 3000
CMD ["thin -d --ssl --ssl-key-file /usr/.ssl/localhost.key --ssl-cert-file /usr/.ssl/localhost.crt start"]