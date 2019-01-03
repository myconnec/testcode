FROM ruby:2.3.8-alpine3.8
LABEL author  David J Eddy <me@davidjeddy.com>

RUN apk add --update build-base  mariadb-dev nodejs tzdata imagemagick
RUN echo "UTC" >  /etc/timezone

# Fix "Failed to open TCP connection to localhost:35729 (Address not available - connect(2) for "localhost" port 35729)" error
RUN cp /etc/hosts /etc/hosts.new
RUN sed -i 's/::1\tlocalhost ip6-localhost ip6-loopback/::1 ip6-localhost ip6-loopback/' /etc/hosts.new
RUN cat /etc/hosts.new > /etc/hosts

# Copy app code
RUN mkdir /app
WORKDIR /app
COPY ./ /app

# install dependencies
RUN  gem install bundle
RUN bundle install
RUN rake db:migrate
RUN rake db:setup

# expose default port
EXPOSE 3000

# run application
ENTRYPOINT ["rails", "server", "--binding", "0.0.0.0"]