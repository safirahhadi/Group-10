# Stage 1: Build WAR using Ant
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Install Ant and wget
RUN apt-get update && apt-get install -y ant wget unzip && rm -rf /var/lib/apt/lists/*

# Download CopyLibs jar from NetBeans GitHub
RUN mkdir -p /copylibs && \
    wget https://github.com/apache/netbeans/raw/master/java/java.project/ant/extra/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -O /copylibs/copylibs.jar

# Copy your project files into container
COPY . .

# Run Ant build
RUN ant -Dlibs.CopyLibs.classpath=/copylibs/copylibs.jar

# Stage 2: Deploy to Tomcat
FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat/webapps
RUN rm -rf ROOT*
COPY --from=build /app/dist/*.war ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]


