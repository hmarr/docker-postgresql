# docker-postgres

A docker image for postgres with built-in support for replication.

### Create a master

```
docker run -e DB_USER=test -e DB_PASSWORD=test -e DB_NAME=test -e REP_USER=rtest -e REP_PASSWORD=test -e ROLE=master --name pg-master -p 5432 -d hmarr/postgresql
```

### Create a slave

```
MASTER_HOST=$(docker inspect pg-master | jq -r ".[].NetworkSettings.IPAddress")
docker run -e DB_USER=test -e DB_PASSWORD=test -e DB_NAME=test -e REP_USER=rtest -e REP_PASSWORD=test -e ROLE=slave -e MASTER_HOST=$MASTER_HOST -e MASTER_PORT=5432 --name pg-slave -p 5432 -d hmarr/postgresql
```

