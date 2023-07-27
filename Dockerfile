FROM ruby:3.0.2

WORKDIR /app

RUN apt update
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY package.json .
COPY package-lock.json .
RUN npm install

COPY . .

EXPOSE 4000

RUN yarn build
RUN yarn build:css

CMD ["rails", "server"]