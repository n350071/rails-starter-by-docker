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

rails--new:
	docker-compose run web rails new . --force --no-deps --database=postgresql

db-build:
	docker-compose run web bundle exec rails db:create
	docker-compose run web bundle exec rails db:migrate
	docker-compose run web bundle exec rails db:seed

up:
	docker-compose up -d

stop:
	docker-compose stop