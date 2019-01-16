FROM ruby:2.3.8-slim-stretch
LABEL author="David J Eddy <me@davidjeddy.com>"

RUN apt-get update -y
RUN apt-get update -y && apt-get install -y apt-transport-https libsqlite3-dev build-essential nodejs imagemagick yarn
RUN mkdir /app
WORKDIR /app
COPY ./ /app

# install nodeJs, npm, and cypress
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs && npm install --global yarn

RUN  gem install bundle && bundle install
# RUN bundle exec spring binstub --all # maybe for Dev. Starts rails server for testing/rake etc
# RUN rake db:migrate && rake db:setup # ./db/test.sqlite3 already exists

RUN apt-get clean

EXPOSE 3000
ENTRYPOINT ["rails", "server", "--binding", "0.0.0.0"]