FROM ubuntu:22.04 

RUN apt update -y 

RUN apt install -y default-jre git vim 

RUN mkdir /app 

WORKDIR /app 

COPY ../spring-petclinic /app/spring-petclinic

WORKDIR /app/spring-petclinic/

RUN ./mvnw package 

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

ENV PATH $PATH:$JAVA_HOME/bin

RUN cp /app/spring-petclinic/target/*.jar spring-petclinic.jar

#ENTRYPOINT ["./mvnw", "spring-boot:run"]


ENTRYPOINT ["./mvnw", "spring-boot:run" , "-Dspring-boot.run.profiles=postgres"]


