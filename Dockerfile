FROM ruby:2.7.2-alpine

RUN apk add --update \
  build-base \
  && rm -rf /var/cache/apk/*

ENV RACK_ENV "development"
ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle install

EXPOSE 9292

CMD ["bundle", "exec"]

