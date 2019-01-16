FROM ruby:2.3.8-slim-stretch
LABEL author="David J Eddy <me@davidjeddy.com>"

RUN apt-get update -y
RUN apt-get update -y && apt-get install -y apt-transport-https libsqlite3-dev build-essential imagemagick
# Cypress requirements
RUN apt-get install -y xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 
RUN mkdir /app
WORKDIR /app
COPY ./ /app

# install nodeJs, npm, and cypress
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs && npm install --global yarn

# ConnecHub gem installatin
RUN  gem install bundle && bundle install
# maybe for Dev. Starts rails server for testing/rake etc
RUN bundle exec spring binstub --all
# ./db/test.sqlite3 already exists
RUN rake db:migrate && rake db:setup 

RUN apt-get clean

EXPOSE 3000
ENTRYPOINT ["rails", "server", "--binding", "0.0.0.0"]