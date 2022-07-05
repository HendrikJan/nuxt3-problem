FROM bitnami/openresty:latest

USER root
RUN mkdir /.opm
RUN touch /.opmrc
RUN chown 1001:1001 /.opm
RUN chown 1001:1001 /.opmrc
RUN chmod -R a+rw /opt/bitnami/openresty

USER 1001

RUN echo "download_server = https://opm.openresty.org" > /.opmrc

# Now install lua-resty-openidc
RUN opm install zmartzone/lua-resty-openidc

WORKDIR /var/www/html