FROM tomcat:9-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/campusmart.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 10000

CMD ["sh", "-c", "sed -i \"s/8080/${PORT:-10000}/g\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]