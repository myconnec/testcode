FROM ruby:2.3.8-alpine3.8
LABEL Author  David J Eddy <me@davidjeddy.com?

RUN apk add --update build-base sqlite-dev sqlite nodejs tzdata imagemagick
RUN echo "UTC" >  /etc/timezone

RUN mkdir /app
WORKDIR /app
COPY ./ /app

RUN  gem install bundle
RUN bundle install
RUN rake db:migrate
RUN rake db:setup

EXPOSE 3000
ENTRYPOINT ["rails", "server", "--binding", "0.0.0.0"]