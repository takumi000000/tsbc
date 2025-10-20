FROM ruby:3.2

RUN apt-get update -qq && \
    apt-get install -y nodejs npm sqlite3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . /app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
