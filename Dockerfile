FROM azul/zulu-openjdk-alpine:11.0.5
LABEL maintainer="ppinta.external"

USER root
ADD resources/wipo-sequence-validator.jar /
ADD resources/start.sh /
EXPOSE 8080
ENTRYPOINT ["/start.sh", "-jar", "${result.service}"]