# Stage 1: Build WAR using Ant
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Install Ant
RUN apt-get update && apt-get install -y ant wget unzip && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . .

# Copy the CopyLibs jar from your local system (must be in the build context)
COPY org-netbeans-modules-java-j2seproject-copylibstask.jar /copylibs/copylibs.jar

# Build with Ant using the CopyLibs classpath
RUN ant -Dlibs.CopyLibs.classpath=/copylibs/copylibs.jar

# Stage 2: Deploy to Tomcat
FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat/webapps
RUN rm -rf ROOT*
COPY --from=build /app/dist/*.war ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

