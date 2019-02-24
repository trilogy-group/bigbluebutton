#!/bin/bash

echo "Installing SDKMan and required packages"
curl -s "https://get.sdkman.io" | bash && \
source "/home/dev/.sdkman/bin/sdkman-init.sh" && \
sdk install gradle 2.12 && \
sdk install grails 2.5.2 && \
sdk install sbt 0.13.9 && \
sdk install maven 3.5.0
echo "Installation finished SDKMan and required packages"

echo "Installing Apache Flex"
mkdir -p ~/dev/tools && \
cd ~/dev/tools && \
wget https://archive.apache.org/dist/flex/4.13.0/binaries/apache-flex-sdk-4.13.0-bin.tar.gz -O flex.tar.gz && \
tar xvfz flex.tar.gz && \
mv apache-flex-sdk-4.13.0-bin flex && \
wget --content-disposition https://github.com/swfobject/swfobject/archive/2.2.tar.gz && \
tar xvfz swfobject-2.2.tar.gz && \
cp -r swfobject-2.2/swfobject flex/templates/ && \
cd flex/ && \
mkdir -p in/ && \
wget http://download.macromedia.com/pub/flex/sdk/builds/flex4.6/flex_sdk_4.6.0.23201B.zip -P in/ && \
yes | ant -f frameworks/build.xml thirdparty-downloads && \
find ~/dev/tools/flex -type d -exec chmod o+rx '{}' \; && \
chmod 755 ~/dev/tools/flex/bin/* && \
chmod -R +r ~/dev/tools/flex && \
ln -s ~/dev/tools/flex ~/dev/tools/flex && \
mkdir -p ~/dev/tools/flex/frameworks/libs/player/11.2 && \
cd ~/dev/tools/flex/frameworks/libs/player/11.2 && \
wget http://fpdownload.macromedia.com/get/flashplayer/installers/archive/playerglobal/playerglobal11_2.swc && \
mv -f playerglobal11_2.swc playerglobal.swc && \
cd ~/dev/tools/flex && \
sed -i "s/11.1/11.2/g" frameworks/flex-config.xml && \
sed -i "s/<swf-version>14<\/swf-version>/<swf-version>15<\/swf-version>/g" frameworks/flex-config.xml && \
sed -i "s/{playerglobalHome}\/{targetPlayerMajorVersion}.{targetPlayerMinorVersion}/libs\/player\/11.2/g" frameworks/flex-config.xml && \
echo "Removing installers" && \
rm -f ~/dev/tools/flex.tar.gz && \
rm -f ~/dev/tools/swfobject-2.2.tar.gz && \
echo "Installation finished Apache Flex"
