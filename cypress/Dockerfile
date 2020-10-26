FROM cypress/browsers:node12.14.1-chrome83-ff77

WORKDIR /app

# error: ALSA lib confmisc.c:767:(parse_card) cannot find card '0'
# source: https://github.com/cypress-io/cypress-docker-images/issues/52#issuecomment-446144630
COPY ./cypress/support/asound.conf /etc/asound.conf

COPY ./cypress ./cypress
COPY ./cypress.json ./cypress.json
COPY ./package-lock.json ./package-lock.json
COPY ./package.json ./package.json

RUN npm update npm
RUN npm install --save-dev
