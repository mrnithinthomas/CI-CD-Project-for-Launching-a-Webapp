FROM tomcat:latest

COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080
