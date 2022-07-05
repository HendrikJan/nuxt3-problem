FROM bitnami/openresty:latest

USER root
RUN mkdir /.opm
RUN touch /.opmrc
RUN chown 1001:1001 /.opm
RUN chown 1001:1001 /.opmrc
RUN chmod -R a+rw /opt/bitnami/openresty/site

USER 1001

RUN echo "download_server = https://opm.openresty.org" > /.opmrc

# Install lua-resty-http, lua-resty-session and lua-resty-, needed for openId
RUN opm get ledgetech/lua-resty-http
RUN opm get bungle/lua-resty-session
RUN opm get cdbattags/lua-resty-jwt

# Now install lua-resty-openidc
RUN opm install zmartzone/lua-resty-openidc

WORKDIR /var/www/html