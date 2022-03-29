# docker-mongodb-replica-set
Auto setup mongodb replica set by docker compose

Add the following config to `/etc/hosts`
```
127.0.0.1	mongodb1
127.0.0.1	mongodb2
127.0.0.1	mongodb3
```

Run docker compose
```bash
$ docker-compose up
```

Access http://localhost:8081/ to open Mongo Express

Connect to mongodb by URL: `mongodb://mongodb1:27011,mongodb2:27012,mongodb3:27013/?replicaSet=rs0`

## .env
Supported environment variables for yaml

* MONGODB_VERSION - default "4.4"
* MONGO_IP - default "127.0.0.1"
* MONGOEXPRESS_IP - default "127.0.0.1"

## Cleanup after any version changes

If you don't need to keep data. Make sure to nuke the volumes/mongodb# directories and re-create them before doing a docker-compose up again.
