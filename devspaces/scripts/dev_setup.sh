#!/bin/sh

cp ~/dev/bigbluebutton/bigbluebutton-client/resources/config.xml.template ~/dev/bigbluebutton/bigbluebutton-client/src/conf/config.xml && \
sed -i s/HOST/localhost/g ~/dev/bigbluebutton/bigbluebutton-client/src/conf/config.xml

echo "
location /client/BigBlueButton.html {
	root /home/dev/dev/bigbluebutton/bigbluebutton-client;
	index index.html index.htm;
	expires 1m;
}

# BigBlueButton Flash client.
location /client {
	root /home/dev/dev/bigbluebutton/bigbluebutton-client;
	index index.html index.htm;
}
" | sudo tee /etc/bigbluebutton/nginx/client_dev && \
sudo ln -f -s /etc/bigbluebutton/nginx/client_dev /etc/bigbluebutton/nginx/client.nginx
