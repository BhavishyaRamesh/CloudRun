FROM centos:7.5.1804

ARG JMETER_VERSION="5.2.1"
ENV JMETER_HOME /opt/apache-jmeter-5.5
ENV JMETER_BIN  /opt/apache-jmeter-5.5/bin
ENV JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.5tgz
ENV JAVA_HOME=/usr/lib/jvm/java-11.0.17-openjdk/jre

WORKDIR /opt/apache-jmeter-5.5

ARG TZ="Europe/Amsterdam"
RUN yum update -y
RUN yum install java-11.0.17-openjdk java-11.0.17-openjdk-devel -y
RUN yum install wget -y
RUN wget http://apache.stu.edu.tw//jmeter/binaries/apache-jmeter-5.5tgz
RUN tar -xzf apache-jmeter-5.5tgz 
RUN mv apache-jmeter-5.5/* /opt/apache-jmeter-5.5
RUN rm -r /opt/apache-jmeter-5.5/apache-jmeter-5.5

RUN mkdir code/

ENTRYPOINT ["/opt/apache-jmeter-5.5/code/entry.sh"]
