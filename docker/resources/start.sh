#! /bin/sh

#_JVM_DEBUG='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8001'
#_JVM_PROXY_SETTINGS='-Dhttp.proxyHost=proxylb.internal.epo.org -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxylb.internal.epo.org -Dhttps.proxyPort=8080 -Dhttp.nonProxyHosts=localhost|127.0

#_JVM_PROTOCOL='-Dsun.net.http.allowRestrictedHeaders=true'
_JVM_DEBUG='-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n'
#_JVM_SECURITY='-Djava.security.auth.login.config=/etc/krb/login.conf -Djava.security.krb5.conf=/etc/krb/krb5.conf -Dorg.epo.security.protocol.wrapper.http.url2spn-mapping-file=/etc/krb/url-to-spn-mappings.properties'
_JVM_PROXY_SETTINGS='-Dhttp.proxyHost=proxylb.internal.epo.org -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxylb.internal.epo.org -Dhttps.proxyPort=8080 -Dhttp.nonProxyHosts=localhost|127.0.0.1|*.local|*.internal.epo.org'
_JVM_TIMEZONE='-Duser.timezone=Europe/Amsterdam'

/usr/bin/java $_JVM_PROXY_SETTINGS $*
