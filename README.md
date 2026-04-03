# 実行方法

## for Demo

```shell
podman compose up -d
```
Top Page: http://localhost:8080

## for Development
Software
- Java 21
- Maven
- Podman

### Windows
```
chcp 65001
mvn package
set JAVA_OPTS=-XX:StartFlightRecording=name=default,dumponexit=true,filename=%CD%\dump_recording.jfr -Xlog:gc*:file=%CD%\target\server\standalone\log\gc.log:time,uptimemillis,level:filecount=5,filesize=3M
target\server\bin\standalone.bat
podman compose -f docker-compose-dev.yaml up -d
```

### Linux / Mac
```
mvn package
export JAVA_OPTS=-XX:StartFlightRecording=name=default,dumponexit=true,filename=dump_recording.jfr -Xlog:gc*:file=`pwd`/target/server/standalone/log/gc.log:time,uptimemillis,level:filecount=5,filesize=3M
target\server\bin\standalone.sh
podman compose -f docker-compose-dev.yaml up -d
```