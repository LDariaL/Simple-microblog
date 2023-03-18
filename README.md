# README

* Ruby 3.2.1 Rails 7.0.4

* DB: PostgreSQL

For properly working please change:

```
# host: db    for container!
host: localhost
```

to

```
host: db  
# host: localhost
```

in /config/database.yml

Start (CLI):

```
$ sudo docker-compose up --build
```

Use local (browser's address line):

```
localhost:3000
```
