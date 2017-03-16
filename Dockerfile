FROM debian:jessie
RUN apt-get update && \
	apt-get install -y sudo wget iceweasel tightvncserver fluxbox ca-certificates \
	libasound2 libdbus-glib-1-2 libgtk2.0-0 libxrender1 libxt6
RUN sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list 
RUN mkdir ~/.vnc
ADD vnc.sh xstartup /
RUN chmod u+x /vnc.sh /xstartup
#Setup a VNC password
USER root
RUN echo Ssrmit09 | vncpasswd -f > ~/.vnc/passwd &&\
	chmod 600 ~/.vnc/passwd

EXPOSE 5901

CMD ["/vnc.sh"]
