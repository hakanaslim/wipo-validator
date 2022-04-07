FROM openjdk:8-jdk-alpine
LABEL maintainer="haslim.external,slarie.external"

RUN addgroup --system javauser && \
    adduser -S -s /bin/false -G javauser javauser && \
    mkdir /app && \
    chown -R javauser:javauser /app && \
    mkdir -p /temp/ST26/inbox && \
    mkdir -p /temp/ST26/process/full && \
    mkdir -p /temp/ST26/process/formality && \
    mkdir -p /temp/ST26/outbox && \
    mkdir -p /temp/ST26/reports && \
    mkdir -p /temp/ST26/params && \
    chown -R javauser:javauser /temp

ADD --chown=javauser:javauser resources/*.jar /app/app.jar
ADD --chown=javauser:javauser resources/example/*.xml /temp/ST26/inbox/
ADD --chown=javauser:javauser resources/example/*.txt /temp/ST26/inbox/


WORKDIR /app
ENV SERVER_PORT=8080 \
    JVM_DEBUG="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n" \
    JVM_PROXY_SETTINGS="-Dhttp.proxyHost=proxylb.internal.epo.org -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxylb.internal.epo.org -Dhttps.proxyPort=8080 -Dhttp.nonProxyHosts=localhost|127.0.0.1|*.local|*.internal.epo.org" \
    JVM_TIMEZONE="-Duser.timezone=Europe/Amsterdam" \
    JVM_OPTS="-server -Dfile.encoding=UTF-8 -XX:InitialRAMPercentage=30.0 -XX:MinRAMPercentage=30.0 -XX:MaxRAMPercentage=70.0 -Dserver.port=8080"
USER javauser
EXPOSE $SERVER_PORT
CMD java $JVM_PROXY_SETTINGS $JVM_OPTS -jar /app/app.jar