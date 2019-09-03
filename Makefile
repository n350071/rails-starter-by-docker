help:
	cat Makefile

new-init:
	make rails--new
	make build
	make mv-database-yml
	make db-build
	make up

mv-database-yml:
	mv database.yml config/database.yml

init:
	make build
	make rails--new

build:
	docker-compose build
	make install

install:
	docker-compose run web bundle install
	docker-compose run web yarn install

# --no-deps: docker-composeのオプション ここではwebのみを動かす(dbなど他を起動しない)
# --force: Gemfile上書き
# --skip-bundle: 手順上、あとでbundleするためskip
rails--new:
	docker-compose run --no-deps web rails new . --force --skip-bundle --database=mysql

rails--console:
	docker-compose run web bundle exec rails console

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

rm:
	make stop
	docker-compose rm -f

build-with-docker-trouble:
	docker-compose build --no-cache
	make install