FROM debian:jessie
ENV VNC_PW Ssrmit09
RUN apt-get update && \
	apt-get install -y sudo wget iceweasel tightvncserver fluxbox ca-certificates \
	libasound2 libdbus-glib-1-2 libgtk2.0-0 libxrender1 libxt6
RUN sudo sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list 
#user section
ENV USER developer
ENV HOME "/home/$USER"

RUN useradd --create-home --home-dir $HOME --shell /bin/bash $USER && \
	mkdir $HOME/.vnc/
COPY vnc.sh $HOME/.vnc/
COPY xstartup $HOME/.vnc/
RUN chmod 760 $HOME/.vnc/vnc.sh $HOME/.vnc/xstartup && \
	chown -R $USER:$USER $HOME

USER "$USER"

#Setup a VNC password
RUN	echo $VNC_PW | vncpasswd -f > ~/.vnc/passwd && \
	chmod 600 ~/.vnc/passwd

EXPOSE 5901

CMD ["/home/developer/.vnc/vnc.sh"]
