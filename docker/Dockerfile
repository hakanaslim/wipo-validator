FROM azul/zulu-openjdk-alpine:11.0.5
LABEL maintainer="ppinta.external"

ADD resources/wipo-sequence-validator.jar /
ADD resources/start.sh /
RUN chmod 777 /*.sh

EXPOSE 8080
ENTRYPOINT ["/start.sh", "-jar", "wipo-sequence-validator.jar"]