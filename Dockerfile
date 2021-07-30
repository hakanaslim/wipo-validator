FROM azul/zulu-openjdk-alpine:11.0.5
LABEL maintainer="ppinta.external"

USER root
ADD wipo-sequence-validator.jar /

EXPOSE 8080
ENTRYPOINT ["/start.sh", "-jar", "${result.service}"]