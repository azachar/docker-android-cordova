FROM bitriseio/docker-android:latest

# ------------------------------------------------------
# --- Install required tools

RUN apt-get update -qq

# ------------------------------------------------------
# --- Node JS

# Node JS
# Add the Node.js-maintained repositories to Ubuntu package source list
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
# The nodejs package contains the nodejs binary as well as npm
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
# "build-essential" required, but were pre-installed in base image
RUN nodejs -v
RUN npm -v

# ------------------------------------------------------
# --- Cordova, bower, grunt, gulp CLI

RUN npm install -g cordova bower grunt gulp
RUN cordova -v
RUN bower -version
RUN grunt -version
RUN gulp -version

# ------------------------------------------------------
# --- Cleanup and rev num

# Cleaning
RUN apt-get clean

ENV BITRISE_DOCKER_REV_NUMBER_ANDROID_CORDOVA 2016_07_10_1
CMD bitrise -version
