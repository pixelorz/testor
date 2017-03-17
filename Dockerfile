FROM centos:6
RUN yum update && yum install -y tigervnc-server xterm xsetroot twm

RUN mkdir -p /.vnc
RUN echo projectD | vncpasswd -f > /.vnc/passwd
RUN chmod 600 /.vnc/passwd

CMD vncserver :1 -name vnc -geometry 1366x768 && tail -f /.vnc/*:1.log

EXPOSE 5901
