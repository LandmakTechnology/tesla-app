FROM tomcat:8.0.20-jre8
### Good stuff
COPY tesla.war /usr/local/tomcat/webapps/
#COPY target/*.war /usr/local/tomcat/webapps/tesla.war
#if prefix isn't taken out use target/*.war
