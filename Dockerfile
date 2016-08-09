FROM node:latest

# General sanity
RUN apt-get update;

# Install chrome to run the tests
RUN apt-get install -y curl
RUN curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google.list
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# Install xvfb so we can run tests headless
RUN apt-get install -y xvfb;

# Install git, needed by bower
RUN apt-get install git -y

# Install java, needed by selenium
RUN apt-get install default-jre -y

# Some cleanup
RUN apt-get clean
