FROM openjdk:8-jdk-alpine
LABEL maintainer="ppinta.external"

ADD resources/wipo-sequence-validator.jar /
ADD resources/start.sh /
RUN chmod 777 /*.sh

EXPOSE 8080
ENTRYPOINT ["/start.sh","-Dfile.encoding=UTF-8", "-jar", "wipo-sequence-validator.jar"]