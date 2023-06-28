FROM tomcat:8.0.20-jre8
### Good stuff
# great
#great
COPY target/*.war /usr/local/tomcat/webapps/wfapp.war
