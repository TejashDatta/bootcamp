FROM centos:7
RUN yum update -y && yum install -y openssh* initscripts
RUN service sshd start
EXPOSE 22
COPY ./authorized_keys /root/.ssh/
