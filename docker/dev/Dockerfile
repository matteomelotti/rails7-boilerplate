FROM ruby:3.1.2

ENV BUNDLER_VERSION=2.3.12

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  postgresql-client \
  nodejs \
  openssh-client \
  ca-certificates \
  graphviz

RUN gem install bundler -v "${BUNDLER_VERSION}"

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY ./vendor /app/vendor
# RUN bundle install -j4

RUN rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/*

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]