# Dockerfile for Ansible
FROM blackeyetechnology/ttydsecure:1.0.0

LABEL maintainer="Black Eye Technology"

ENV ANSIBLE_USER=ansible
ENV TTYD_OS_USER=$ANSIBLE_USER

RUN set -e && \
    apt-get update && \
    apt-get install -y gnupg && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> \
    /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -y --no-install-recommends ansible && \
    groupadd $ANSIBLE_USER && \
    useradd -m --gid $ANSIBLE_USER --shell /bin/bash $ANSIBLE_USER && \
    usermod -aG sudo $ANSIBLE_USER && \
    echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

USER $ANSIBLE_USER

VOLUME ["/home/ansible"]
WORKDIR /home/ansible

CMD ["bash"]
