Ansible playbook for setting up the ELK stack and Filebeat client in Docker to test logstash filters, plugins etc.
Usage:
$ docker build . -t 'test-elk:latest'
$ docker run --privileged --name test-elk -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 -d test-elk

See ansible-elk/install/roles/logstash/files for logstash stuff.

Based on https://github.com/sadsfae/ansible-elk 