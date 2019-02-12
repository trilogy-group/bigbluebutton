FROM bigbluebutton/bigbluebutton

ENV FLEX_HOME=$HOME/dev/tools/flex \
    PATH=$PATH:$FLEX_HOME/bin \
    ANT_OPTS="-Xmx512m -XX:MaxPermSize=512m" \
    LANG="en_US.UTF-8"

ADD install.sh /
RUN chmod a+x install.sh && \
    apt-get update && \
    apt-get install -y ant curl git-core mlocate openjdk-8-jdk unzip zip && \
    rm -rf /var/lib/apt/lists/* && \
    # Create the non-root user
    adduser --disabled-password --gecos '' dev && \
    adduser dev sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown -R dev /data

USER dev

RUN /install.sh

WORKDIR /data

ENTRYPOINT ["sudo", "/root/setup.sh", "-h", "localhost"]
