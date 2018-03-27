FROM centos:latest
MAINTAINER ueno.k

# Ansible Install
RUN set -x && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y ansible && \
    curl -kL https://bootstrap.pypa.io/get-pip.py | python && \
    mkdir /opt/ansible

WORKDIR /opt/ansible
COPY requirements.txt /opt/ansible/

# pip install
RUN pip install -r requirements.txt

ENTRYPOINT [ "ansible-playbook" ]
