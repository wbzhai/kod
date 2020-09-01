FROM centos:6.8
RUN yum install openssh-server -y
RUN /etc/init.d/sshd start
RUN echo "root:123456"|chpasswd
RUN yum install httpd -y
RUN yum install php* -y
RUN yum install wget unzip -y
RUN cd /var/www/html &&  wget https://gitee.com/kalcaddle/KODExplorer/repository/archive/master.zip && unzip master.zip && chmod -Rf 777 ./*
EXPOSE 22  #指定随机端口和-P对应
EXPOSE 80
COPY init.sh /init.sh
CMD ["/bin/bash","/init.sh"]
