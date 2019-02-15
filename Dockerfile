ARG FLUENTBIT_VERSION

FROM fluent/fluent-bit:${FLUENTBIT_VERSION}

COPY files/* /etc/

USER fluent-bit 
