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

