FROM base
MAINTAINER Arcus "http://arcus.io"
RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget git-core openssh-server
RUN mkdir /var/run/sshd
RUN wget https://raw.github.com/progrium/gitreceive/master/gitreceive -O /usr/local/bin/gitreceive
RUN chmod +x /usr/local/bin/gitreceive
RUN /usr/local/bin/gitreceive init
ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
ADD sshkey.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/local/bin/run"]
