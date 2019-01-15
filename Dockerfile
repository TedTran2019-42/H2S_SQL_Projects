# Create an image based on this existing ruby image
FROM ruby:2.5.1

# Install the software you need
RUN apt-get update \
&& apt-get install -y \
apt-utils \
build-essential \
libpq-dev \
libjpeg-dev \
libpng-dev \
nodejs \ 
postgresql postgresql-client \ 
vim \
sudo \
sqlite3

# Create a directory for your app
RUN mkdir -p /app

# Copy the files needed for the bundle install
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
COPY ./assignment_1 /app/assignment_1
COPY ./assignment_2 /app/assignment_2
COPY ./sql_zoo /app/sql_zoo

# Set the working directory for all following commands
WORKDIR /app

# Install gems
RUN gem install pry
RUN bundle install