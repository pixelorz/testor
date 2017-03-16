FROM debian:jessie

ENV VNC_PW "Ssrmit09"
RUN apt-get update && \
	apt-get install -y sudo wget iceweasel x11vnc xvfb ca-certificates \
	libasound2 libdbus-glib-1-2 libgtk2.0-0 libxrender1 libxt6
RUN sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list 
RUN mkdir ~/.vnc
ADD vnc.sh xstartup /
RUN chmod u+x /vnc.sh /xstartup
#Setup a VNC password
RUN x11vnc -storepasswd $VNC_PW ~/.vnc/passwd

EXPOSE 5901

CMD ["/vnc.sh"]
