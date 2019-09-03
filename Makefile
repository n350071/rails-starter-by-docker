help:
	cat Makefile

init:
	make build
	make rails--new

build:
	docker-compose build
	make install

build-with-docker-trouble:
	docker-compose build --no-cache
	make install

install:
	docker-compose run web bundle install
	docker-compose run web yarn install

# --force: Gemfile上書き
# --skip-bundle: 手順上、あとでbundleするためskip
# --no-deps: 
rails--new:
	docker-compose run web rails new . --force --skip-bundle --no-deps --database=mysql

db-build:
	docker-compose run web bundle exec rails db:create
	docker-compose run web bundle exec rails db:migrate
	docker-compose run web bundle exec rails db:seed

up:
	docker-compose up

up-d:
	docker-compose up -d

stop:
	docker-compose stop