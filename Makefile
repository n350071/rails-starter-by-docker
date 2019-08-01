help:
	cat Makefile

init:
	make build
	make rails--new

build:
	docker-compose build
	make bundle-install

bundle-install:
	docker-compose run web bundle install

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