FROM tomcat:9-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/campusmart.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]