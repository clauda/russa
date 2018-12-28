FROM ruby:2.5.3-alpine

RUN apk add --update \
  build-base \
  && rm -rf /var/cache/apk/*

ENV RACK_ENV "development"
ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

EXPOSE 9292

CMD ["bundle", "exec"]

