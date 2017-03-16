FROM debian:jessie

RUN apt-get update && \
	apt-get install -y sudo wget iceweasel tightvncserver lxterminal fluxbox ca-certificates \
	libasound2 libdbus-glib-1-2 libgtk2.0-0 libxrender1 libxt6
RUN sudo sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

####user section####
ENV USER developer
ENV HOME "/home/$USER"
RUN useradd --create-home --home-dir $HOME --shell /bin/bash $USER && \
	mkdir $HOME/.vnc/
COPY vnc.sh $HOME/.vnc/
COPY xstartup $HOME/.vnc/
RUN chmod 760 $HOME/.vnc/vnc.sh $HOME/.vnc/xstartup

USER "$USER"
###/user section####

####Setup a VNC password####
RUN	echo vncpassw | vncpasswd -f > ~/.vnc/passwd && \
	chmod 600 ~/.vnc/passwd

EXPOSE 5901
####/Setup VNC####

CMD ["/home/developer/.vnc/vnc.sh"]
