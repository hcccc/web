FROM ruby:2.2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install --without development test
ADD . /usr/src/app
ADD entrypoint /entrypoint
