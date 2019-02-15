docker-fluent-bit
=================

##### Fluent-bit's docker image running as a non-root user

Example:

```
docker run --rm \
  --name fluent-bit \
  --log-driver journald \
  --publish 24224:24224 \
  -v /etc/fluent-bit/fluent-bit.conf:/fluent-bit/etc/fluent-bit.conf:ro \
  -v /etc/fluent-bit/parsers.conf:/fluent-bit/etc/parsers.conf:ro \
  -v /var/log/journal:/var/log/journal:ro \
  quay.io/nordstrom/fluent-bit:1.0.4
```

#### Using docker compose

You can use the docker-compose file to spin up an elasticsearch, kibana, 
and fluent-bit container to test it out.

1. Clone this repo and change to the root of the project:

```
git clone https://github.com/Nordstrom/docker-fluent-bit.git
cd docker-fluent-bit
```

2. Run docker compose to start the containers, wait a few minutes for
all the container to start and connect to each other.

```
docker-compose up
```

3. Use your browser to connect to kibana http://localhost:5601

4. Send a test log that fluent-bit should pickup

```
echo "hello world" >> log/hello.log
```

5. From kibana you'll need to create an index pattern for `fluent_bit*`


#### Building docker images

To update the version of fluent-bit, update the fluentbit_version 
variable in the Makefile.

```
fluentbit_version="1.0.4"
```

Then build and push images:

```
make build
make push
```
