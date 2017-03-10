#test-elk
FROM centos/systemd
MAINTAINER dmytro@sumy.net

RUN yum clean all && \
    yum -y install which epel-release && \
    yum -y install ansible

CMD echo "[local]\nlocalhost\n" > /etc/ansible/hosts

RUN mkdir /opt/ansible
ADD ansible-elk /opt/ansible/ansible-elk

RUN ansible-playbook -i /opt/ansible/ansible-elk/hosts /opt/ansible/ansible-elk/install/elk.yml -c local
RUN ansible-playbook -i /opt/ansible/ansible-elk/hosts /opt/ansible/ansible-elk/install/elk-client.yml -c local --extra-vars 'elk_server=127.0.0.1'

EXPOSE 80
CMD ["/usr/sbin/init"]
