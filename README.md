docker-fluent-bit
=================

Docker image and example compose-file for running [Fluent Bit](https://fluentbit.io).

[![Docker Repository on Quay](https://quay.io/repository/nordstrom/fluent-bit/status "Docker Repository on Quay")](https://quay.io/repository/nordstrom/fluent-bit)

## about

The images are based on [hub.docker.come/r/fluent/fluent-bit](https://hub.docker.com/r/fluent/fluent-bit) and have been modified to run as a non-privleged user, `fluent-bit`.

## examples

Show the default user using the Busybox-based, debug image:

```
docker run --rm quay.io/nordstrom/fluent-bit:1.6.8-debug ps -o user=----------
```

Run the CPU-example from the [Getting Started](https://docs.fluentbit.io/manual/installation/docker#getting-started) documentation using the Distroless-based image:

```
docker run quay.io/nordstrom/fluent-bit:1.6.8 /fluent-bit/bin/fluent-bit -i cpu -o stdout -f 1
```

### using Docker compose

Use the [Docker compose](https://docs.docker.com/compose/) file to spin up Elasticsearch, Kibana, and Fluent Bit together. Send some logs to Fluent Bit and view them with Kibana!

1. Clone this repo and change to the root of the project:

```
git clone https://github.com/Nordstrom/docker-fluent-bit.git
cd docker-fluent-bit
```

2. Run Docker compose to start the containers:
```
docker-compose up
```

3. Wait a few moments for all the container to start and connect to each other, then send a test log that Fluent Bit will discover:

```
echo "hello world" >> log/hello.log
```

4. Use your browser to connect to Kibana: `http://localhost:5601`

5. Create an index pattern for `fluent_bit*` and visit the Discover view.

## building

To update the version of Fluent Bit, update the `fluentbit_version` variable in the `Makefile`:

```
fluentbit_version="x.x.x"
```

Build and push images:

```
make build
make push
```
