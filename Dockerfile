FROM debian:jessie

#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US.UTF-8
#ENV LC_ALL en_US.UTF-8
ENV VNC_PW "Ssrmit09"
RUN apt-get update && \
	apt-get install -y sudo wget iceweasel x11vnc xvfb ca-certificates \
	libasound2 libdbus-glib-1-2 libgtk2.0-0 libxrender1 libxt6
RUN sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list 
RUN mkdir ~/.vnc
#Setup a VNC password
RUN x11vnc -storepasswd $VNC_PW ~/.vnc/passwd

EXPOSE 5900

RUN echo "firefox" >> /.bashrc
