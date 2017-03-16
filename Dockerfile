FROM debian:jessie
ENV VNC_PW "Ssrmit09"
RUN apt-get update && \
	apt-get install -y sudo wget iceweasel tightvncserver fluxbox ca-certificates \
	libasound2 libdbus-glib-1-2 libgtk2.0-0 libxrender1 libxt6
RUN sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list 
RUN mkdir ~/.vnc
ADD vnc.sh xstartup ~/.vnc/
RUN chmod +x ~/.vnc/vnc.sh ~/.vnc/xstartup
#Setup a VNC password
RUN echo $VNC_PW | vncpasswd -f > ~/.vnc/passwd &&\
	chmod 600 ~/.vnc/passwd

EXPOSE 5901

CMD ["/root/.vnc/vnc.sh"]
