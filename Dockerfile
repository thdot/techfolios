FROM ubuntu:22.04

RUN apt-get update                                                            \
    && DEBIAN_FRONTEND=noninteractive                                         \
       apt-get install --no-install-recommends --yes                          \
           ruby-full build-essential zlib1g-dev                               \
    && gem install jekyll bundler

WORKDIR /work

COPY Gemfile /work
RUN bundle install
