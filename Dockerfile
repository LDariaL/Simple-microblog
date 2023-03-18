
FROM ruby:3.2.1

RUN useradd app

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    git \
    libpq-dev \
    nodejs\
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
 RAILS_ENV=development

RUN gem update --system && gem install bundler

USER app

WORKDIR /home/app

COPY --chown=app Gemfile* ./

RUN bundle config frozen true \
 && bundle config jobs 4 \
 && bundle config deployment true \
 && bundle install

COPY --chown=app . ./

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]