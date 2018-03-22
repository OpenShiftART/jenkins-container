#!/bin/sh

#JENKINS_PORT=
#JENKINS_LISTEN_ADDRESS=
#
#JENKINS_HTTPS_PORT=
#JENKINS_HTTPS_LISTEN_ADDRESS
#JENKINS_HTTPS_KEYSTORE=
#JENKINS_HTTPS_KEYSTORE_PASSWORD=

#JENKINS_LOGFILE
#JENKINS_WEBROOT

# -- JENKINS
# JENKINS_JAVA_OPTIONS
# JENKINS_LISTEN_ADDRESS
# JENKINS_ARGS

exec /usr/bin/java \
     -Dcom.sun.akuma.Daemon=daemonized \
     -Djava.awt.headless=true \
     -Djava.net.preferIPv4Stack=true \
     -Djenkins.branch.WorkspaceLocatorImpl.PATH_MAX=0 \
     -Djenkins.install.runSetupWizard=false \
     -jar /usr/lib/jenkins/jenkins.war 
