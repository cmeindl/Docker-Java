FROM ubuntu:latest
# based on image by MAINTAINER nicolas.deloof@gmail.com <Nicolas De Loof>
MAINTAINER cameron.meindl@me.com <Cameron Meindl>
# install curl so we can download JDK
RUN apt-get update
RUN apt-get -y install curl

# Download JDK 8u51 from Oracle download site
RUN cd /opt &&  curl -L 'http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz

ENV JAVA_HOME /opt/jdk1.8.0_51
RUN ln -s /opt/jdk1.8.0_51/bin/* /usr/local/bin/
COPY *.jar /usr/src/myapp/myapp.jar
WORKDIR /usr/src/myapp
CMD ["java", "-jar","myapp.jar"]
