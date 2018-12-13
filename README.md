Connechub

# Setup

```bash
    git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/ConnecHub
    gem install bundler
    ./bin/bundle install
    ./bin/rake db:migrate
    ./bin/rails server -e development
```

docker build --compress -t connecbub
docker run -it -p 3000:3000 --rm  --name ConnecHub --mount type=bind,source="$(pwd)"/,target=/app connechub

# Test

```bash

```