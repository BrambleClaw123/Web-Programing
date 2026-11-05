# Stage 1: Dùng JDK 21 để thực hiện biên dịch ứng dụng
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Sao chép file cấu hình pom.xml
COPY pom.xml .

# Tải trước các dependencies để tối ưu cache
RUN mvn dependency:go-offline -B

# Sao chép toàn bộ mã nguồn vào container
COPY src ./src

# ĐÂY LÀ DÒNG QUAN TRỌNG: Ghi đè cấu hình để ép Maven build ra bytecode tương thích với Java 8 của Tomcat 8.5
RUN mvn clean package -DskipTests -Dmaven.compiler.source=1.8 -Dmaven.compiler.target=1.8

# Stage 2: Deploy ứng dụng vào Tomcat 8.5.34 chạy trên nền JRE 8
FROM tomcat:8.5.34-jre8-alpine

# Xóa bỏ các ứng dụng mặc định của Tomcat để tránh tranh chấp đường dẫn
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file WAR từ Stage 1 sang và đổi tên thành ROOT.war để chạy ở đường dẫn gốc "/"
COPY --from=build /app/target/bai-1-ch02-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080 cho Render
EXPOSE 8080

# Khởi động ứng dụng
CMD ["catalina.sh", "run"]
