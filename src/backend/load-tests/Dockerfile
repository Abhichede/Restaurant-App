FROM golang:1.20 as builder

RUN go install go.k6.io/xk6/cmd/xk6@latest
# For our example, we'll add support for output of test metrics to InfluxDB v2.
# Feel free to add other extensions using the '--with ...'.
RUN xk6 build \
    --with github.com/szkiba/xk6-faker@v0.3.0 \
    --with github.com/grafana/xk6-output-influxdb \
    --output /k6

FROM grafana/xk6
COPY --from=builder /k6 /usr/bin/k6
ENTRYPOINT ["k6"]