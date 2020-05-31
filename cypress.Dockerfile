FROM cypress/base:10

WORKDIR /app

COPY ./cypress ./cypress
COPY ./cypress.json ./cypress.json
COPY ./paclage.json ./package.json

RUN npm i && npx cypress run --headless --browser chrome
