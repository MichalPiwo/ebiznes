FROM ubuntu

RUN apt-get update && apt-get -y upgrade

#wget
RUN apt-get install -y wget

#java8
RUN apt-get install -y openjdk-8-jdk openjdk-8-jre

#scala 2.12
RUN wget https://downloads.lightbend.com/scala/2.12.10/scala-2.12.10.deb
RUN dpkg -i scala-2.12.10.deb

#needed to install sbt
RUN apt install -y gnupg

#sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" |  tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install -y sbt

#npm
RUN apt install -y npm
RUN npm install -g npm@latest

#add user
RUN useradd -ms /bin/bash michal
USER michal
WORKDIR /home/michal/app

#ports for react and play
EXPOSE 3000
EXPOSE 9000

VOLUME /home/michal/app

ENTRYPOINT bash
