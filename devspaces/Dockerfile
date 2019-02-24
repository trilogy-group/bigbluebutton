FROM bigbluebutton/bigbluebutton

LABEL \
    "com.trilogy.product"="BigBlueButton" \
    "com.trilogy.company"="External" \
    "com.trilogy.stage"="dev" \
    "com.trilogy.maintainer.skype"="otaviocx" \
    "com.trilogy.maintainer.email"="otaviocalaca.xavier@aurea.com" \
    "description"="This file generates a docker image containing Open JDK 8, Flex and tools needed to build BigBlueButton project"

ENV HOME=/root
ENV FLEX_HOME=$HOME/dev/tools/flex
ENV PATH=$PATH:$FLEX_HOME/bin \
    ANT_OPTS="-Xmx512m -XX:MaxPermSize=512m" \
    LANG="en_US.UTF-8"

ADD scripts /opt

# Install needed tools
RUN chmod a+x /opt/*.sh && \
    apt-get update && \
    apt-get install -y ant curl git-core mlocate openjdk-8-jdk unzip xmlstarlet zip && \
    rm -rf /var/lib/apt/lists/* && \
    # Install Gradle, Grails, Maven, Flex and other needed dependencies
    /opt/install.sh && \
    ln -s /data ~/dev/bigbluebutton

WORKDIR /data
