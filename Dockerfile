FROM centos:latest
MAINTAINER ueno.k

# Ansibleパッケージ類インストール
RUN set -x && \
    yum install -y epel-release && \
    yum install -y ansible && \
    curl -kL https://bootstrap.pypa.io/get-pip.py | python && \
    mkdir /usr/ansible && \

    # WORKDIR /usr/ansible
    # ADD hosts /usr/ansible/

    RUN set -x && \
    sed -i -e 's%#inventory      = /etc/ansible/hosts%inventory       = /usr/ansible/hosts%' /etc/ansible/ansible.cfg && \
    sed -i -e 's/#deprecation_warnings = True/deprecation_warnings = False/g' /etc/ansible/ansible.cfg && \
    sed -i -e 's/^#retry_files_enabled/retry_files_enabled/g' /etc/ansible/ansible.cfg && \
    sed -i -e 's/ControlPersist=60s/ControlPersist=300s/g' /etc/ansible/ansible.cfg && \
    sed -i -e 's/^#ssh_args/ssh_args/g' /etc/ansible/ansible.cfg

ENTRYPOINT [ "ansible-playbook" ]
