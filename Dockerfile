FROM tigberd/reversal-ruby

RUN apt-get update && \
      apt-get install -y --no-install-recommends \
        libmysqlclient-dev && \
      apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install --without development test
ADD . /usr/src/app
ADD entrypoint /entrypoint
