FROM alpine:3.9 AS builder

ENV ECS_GOPLOY_VERSION=v0.5.0

RUN apk --no-cache add wget
RUN wget https://github.com/h3poteto/ecs-goploy/releases/download/${ECS_GOPLOY_VERSION}/ecs-goploy_${ECS_GOPLOY_VERSION}_linux_amd64.zip \
  && unzip -d /usr/local/bin/ ecs-goploy_${ECS_GOPLOY_VERSION}_linux_amd64.zip

FROM alpine:3.9

COPY --from=builder /usr/local/bin/ecs-goploy /usr/local/bin/ecs-goploy
ENTRYPOINT ["ecs-goploy"]
