# Base image for all the other development images
FROM ubuntu:18.04

## System upgrade + add some requirements
RUN ( \
    apt update && \
    apt upgrade -y && \
    apt dist-upgrade -y && \
    apt install -y sudo locales repo make python3 python3-venv python3.8 python3.8-venv && \
    apt -y autoclean && \
    apt -y autoremove \
    )

# UTF8 support
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Let user running sudo
# + work around for `dpkg: unrecoverable fatal error, aborting:`
# + work around for `unknown group 'crontab' in statoverride file`
RUN ( \
    echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user && \
    sed -i '/crontab/d' /var/lib/dpkg/statoverride && \
    sed -i '/messagebus/d' /var/lib/dpkg/statoverride \
    )

# Add user
RUN ( \
    useradd -d /home/user -ms /bin/bash -G sudo -p $(echo "password" | openssl passwd -1 -stdin) user && \
    mkdir -p /home/user && \
    cp -a /etc/skel/.bash* /etc/skel/.profile* /home/user && \
    chown -R user.user /home/user \
    )
USER user
WORKDIR /home/user
