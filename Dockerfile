FROM openjdk:17-jdk-slim

ENV FILE luklak-api-1.0.0-SNAPSHOT-fat.jar

ENV HOME /app

EXPOSE 8080

COPY target/$FILE $HOME/
COPY config/hazelcast.yaml $HOME/config

WORKDIR $HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -Dhazelcast.config=$HOME/config/hazelcast.yaml -jar $FILE"]
