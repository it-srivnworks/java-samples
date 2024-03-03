FROM openjdk:17-alpine
VOLUME /tmp
EXPOSE 8000
ADD target/*.jar java-samples.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /java-samples.jar" ]