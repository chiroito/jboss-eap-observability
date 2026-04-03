# 実行方法

## for Demo

```shell
podman compose up -d
```
Top Page: http://localhost:8080

## for Development

### Windows
```
chcp 65001
mvn package
podman compose -f docker-compose.yaml up -d
set JAVA_OPTS=-XX:StartFlightRecording=name=default,dumponexit=true,filename=%CD%\dump_recording.jfr -Xlog:gc*:file=%CD%\target\server\standalone\log\gc.log:time,uptimemillis,level:filecount=5,filesize=3M
target\server\bin\standalone.bat
```