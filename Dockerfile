FROM tomcat:8.0.20-jre8
### Good stuff
COPY /home/ansible/auto/workspace/'Ansible Pipeline'/target/*.war /usr/local/tomcat/webapps/tesla.war
