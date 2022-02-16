FROM cypress/browsers:node16.13.2-chrome97-ff96

WORKDIR /app

# error: ALSA lib confmisc.c:767:(parse_card) cannot find card '0'
# source: https://github.com/cypress-io/cypress-docker-images/issues/52#issuecomment-446144630
# COPY ./ /app && cp -f /app/libs/asound.conf /etc/asound.conf

RUN npm update npm && npm install --save-dev
