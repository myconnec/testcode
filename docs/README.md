# README

RoR migrations

```sh
# load schema SQL
rake db:schema:load
# down 1
rake db:rollback STEP=1
# up
    rake db:migrate
```
