FROM maven:3.2-jdk-7
RUN mvn help:system
add http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.2.17.v20160517/jetty-distribution-9.2.17.v20160517.tar.gz /usr/jetty.tar.gz
WORKDIR /usr
RUN tar -zxf jetty.tar.gz
RUN rm -rf jetty.tar.gz
RUN mv jetty* jetty
add jetty.xml jetty/etc/jetty.xml
RUN mkdir -p /usr/src/app
ONBUILD add . /usr/src/app
ONBUILD WORKDIR /usr/src/app
ONBUILD RUN mvn install
ONBUILD RUN cp target/*.war /usr/jetty/webapps/
ONBUILD WORKDIR /usr/src
ONBUILD RUN rm -rf *
ONBUILD WORKDIR /usr/jetty
CMD ["java","-jar","start.jar"]
