FROM azul/zulu-openjdk-alpine:11.0.5
LABEL maintainer="ppinta.external"

ADD resources/wipo-sequence-validator.jar /
ADD resources/start.sh /

EXPOSE 8080

ENTRYPOINT ["/start.sh", "-jar", "${result.service}"]