# docker-domoticz-fr-ssl
docker build --no-cache --pull -t domoticz/focal:{version} .
docker save -o ../domoticz.focal.{version}.tar domoticz/focal:{version}
