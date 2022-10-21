# docker-mongodb-replica-set
Auto setup mongodb replica set by docker compose

Add the following config to `/etc/hosts`
```
127.0.0.1	mongo1
127.0.0.1	mongo2
127.0.0.1	mongo3
```

Run docker compose
```bash
$ docker-compose up
```

Access http://localhost:8081/ to open Mongo Express

Connect to mongodb by URL: `mongodb://mongo1:27011,mongo2:27012,mongo3:27013/?replicaSet=rs0`

## .env
Supported environment variables for yaml

* MONGODB_VERSION - default "4.4"
* MONGO_IP - default "127.0.0.1"
* MONGOEXPRESS_IP - default "127.0.0.1"

## Networks
If local containers need to connect to database using container networks then create the network in your environment
I recommend doing this before doing a 'docker-compose up -d'
```bash
docker network create internal-network
```

And then ensure your other docker-compose.yaml files include the following:
```yaml
networks: 
  default: 
    external: 
      name: internal-network
```
## Auth setup

*** WITH AUTH OFF
*** Before auth is ever configured!!!
*** Before the keyFile is ever configured!!!

Connect to the primary db server and run the following using mongosh
```mongosh
use admin
db.createUser({user:"<rootUsername>",pwd:"<rootPassword>",roles:["root"]})
```

## keyFile setup
### Generate key
```bash
openssl rand -base64 741 > mongodb.key
chmod 600 mongodb.key
```
Make sure resulting key file is copied to each of the db servers and the db servers are configured for
## Cleanup after any version changes

If you don't need to keep data. Make sure to nuke the volumes/mongodb# directories and re-create them before doing a docker-compose up again.
