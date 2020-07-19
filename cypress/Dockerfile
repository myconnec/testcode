FROM cypress/browsers:node12.14.1-chrome83-ff77

WORKDIR /app

COPY ./cypress ./cypress
COPY ./cypress.json ./cypress.json
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm update npm
RUN npm install cypress cypress-image-snapshot --save-dev
