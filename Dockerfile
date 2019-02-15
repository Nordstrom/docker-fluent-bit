ARG FLUENTBIT_VERSION

FROM fluent/fluent-bit:${FLUENTBIT_VERSION}

COPY etc/* /etc/

USER fluent-bit 
