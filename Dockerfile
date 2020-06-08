#
# MockServer Dockerfile
#
# https://github.com/mock-server/mockserver
# http://www.mock-server.com
#

# build image
FROM openjdk:8-alpine

# maintainer details
MAINTAINER Manu Shesha "manuatvit@gmail.com"

# expose ports.
EXPOSE 1080

# copy in jar
COPY mockserver-netty/target/mockserver-netty-5.10.1-SNAPSHOT-jar-with-dependencies.jar /apps/mockserver-netty-jar-with-dependencies.jar

WORKDIR /apps

ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=85.0", "-Dfile.encoding=UTF-8", "-XX:+HeapDumpOnOutOfMemoryError", "-XX:HeapDumpPath=/opt/heap", "-XX:+UseConcMarkSweepGC", "-XX:+UseCMSInitiatingOccupancyOnly", "-XX:CMSInitiatingOccupancyFraction=70", "-XX:-UseBiasedLocking", "-Dmockserver.disableSystemOut=true", "-Dmockserver.nioEventLoopThreadCount=50", "-jar", "mockserver-netty-jar-with-dependencies.jar", "-serverPort", "1080"]

CMD ["-logLevel", "INFO"]
