#! /bin/sh

_JVM_DEBUG='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8001'
_JVM_PROXY_SETTINGS='-Dhttp.proxyHost=proxylb.internal.epo.org -Dhttp.proxyPort=8080 -Dhttps.proxyHost=proxylb.internal.epo.org -Dhttps.proxyPort=8080 -Dhttp.nonProxyHosts=localhost|127.0
_JVM_SECURITY=''

/usr/bin/java $_JVM_PROXY_SETTINGS *