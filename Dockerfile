FROM eclipse-temurin:21-jdk-jammy
EXPOSE 8080
ADD target/Spring-Boot-Jenkins-Docker-Intg.jar Spring-Boot-Jenkins-Docker-Intg.jar
ENTRYPOINT ["java","-jar","/Spring-Boot-Jenkins-Docker-Intg.jar"]