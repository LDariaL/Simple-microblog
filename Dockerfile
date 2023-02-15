
FROM ruby:3.1.2-alpine3.16 AS build

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client
RUN mkdir /microblog
WORKDIR /microblog
COPY Gemfile /microblog/Gemfile
COPY Gemfile.lock /microblog/Gemfile.lock
RUN bundle install
EXPOSE 3000
CMD ["bash"]