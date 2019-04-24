help:
	cat Makefile

rails--new:
	docker-compose run web rails new . --force --no-deps --database=postgresql

init:
	make build
	make db-build

build:
	docker-compose build
	make install

install:
	docker-compose run web bundle install

db-build:
	docker-compose run web bundle exec rails db:create
	docker-compose run web bundle exec rails db:migrate
	docker-compose run web bundle exec rails db:seed

up:
	docker-compose up
