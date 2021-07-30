FROM azul/zulu-openjdk-alpine:11.0.5
LABEL maintainer="ppinta.external"

ADD resources/wipo-sequence-validator.jar /
RUN chmod 777 /*.sh

EXPOSE 8080