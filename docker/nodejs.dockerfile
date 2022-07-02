FROM node:16.15

# Create app directory
WORKDIR /var/app

# Install packages
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y less
RUN apt-get install -y telnet

# Bundle app source
COPY . .

# NodeJS www Server
EXPOSE 3000

# entrypoint
COPY ./docker/nodejs_entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

# So we can easily run "ncu" to update the node_modules
RUN npm install -g npm-check-updates

# Make bash history inside the container work a little better
# Remove duplicates from history
RUN echo "export HISTCONTROL=ignoreboth:erasedups" >> ~/.bashrc

# entrypoint
ENTRYPOINT /entrypoint.sh
