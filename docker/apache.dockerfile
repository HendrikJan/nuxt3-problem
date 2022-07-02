# https://www.middlewareinventory.com/blog/docker-reverse-proxy-example/
FROM httpd:2.4 AS apache

# Install packages
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y less
RUN apt-get install -y telnet
RUN apt-get install --no-install-recommends -y libapache2-mod-auth-openidc

# set corrent TimeZone
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Load configuration
COPY ./docker/apache/httpd.conf /usr/local/apache2/conf/httpd.conf

# Start the server
CMD ["httpd", "-D", "FOREGROUND"]