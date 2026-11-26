# Stage 1: Build bằng JDK 24
FROM maven:3.9-eclipse-temurin-24 AS build

WORKDIR /app

# Cấu hình Maven tải qua Google Mirror để tránh lỗi 429 trên Render
RUN mkdir -p /root/.m2 && \
    echo '<settings><mirrors><mirror><id>google</id><mirrorOf>central</mirrorOf><url>https://maven-central.storage-download.googleapis.com/maven2/</url></mirror></mirrors></settings>' > /root/.m2/settings.xml

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Giữ Tomcat 10.1.61
FROM tomcat:10.1.61-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]