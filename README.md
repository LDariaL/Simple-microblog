# README


* Ruby 3.1.2p20 Rails 7.0.4

* DB: PostgreSQL

* Puma Application Server 5.6.5


For a proper containers work please change: 

```
# host: db    for container!
host: localhost
```
to
```
host: db  
# host: localhost
```
in config/database.yml


Start (CLI):

```
$ sudo docker-compose up --build --force
```

Use local (browser's address line):
```
localhost:3000
```
