# The FROM instruction sets the Base Image for subsequent instructions.
FROM maven:3.2-jdk-7
RUN wget http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.2.17.v20160517/jetty-distribution-9.2.17.v20160517.tar.gz 
RUN tar -zxf jetty-distribution-9.2.17.v20160517.tar.gz
RUN rm -rf jetty-distribution-9.2.17.v20160517.tar.gz
RUN mv jetty-distribution-9.2.17.v20160517 /usr/jetty
ONBUILD add . /usr/src/app
ONBUILD WORKDIR /usr/src/app
ONBUILD RUN mvn install
ONBUILD RUN cp target/*.war /usr/jetty/webapps
ONBUILD RUN rm -rf *
ONBUILD WORKDIR /usr/jetty
CMD ["java","-jar","start.jar"]

# The RUN instruction will execute any commands
# Adding HelloWorld page into Nginx server

# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime

# The CMD instruction provides default execution command for an container
# Start Nginx and keep it from running background

