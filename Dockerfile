# Base Image
FROM jenkins/jenkins:latest 

# Install Jenkins agent Java jdk file
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Call environment variable to take local yaml file to push into docker image
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

EXPOSE 8080

# Copy text file to selected location
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Run copied text file via install-plugins.sh file
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Store local yaml file in selected location
COPY casc.yaml /var/jenkins_home/casc.yaml

