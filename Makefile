help:
	cat Makefile

# Start & Stop docker
# for the binding.pry, use 'run' instead of the 'up'
up:
	docker-compose run --service-ports web

webpacker:
	docker-compose run web bin/webpack-dev-server

stop:
	docker-compose stop

## Remove stopped containers
rm:
	make stop
	docker-compose rm -f

## danger: Stop and remove containers, networks, images, and volumes
down:
	docker-compose down

# commands for development
docker-build:
	docker-compose build

docker-build-no-cache:
	docker-compose build --no-cache

install:
	docker-compose run web bundle install
	docker-compose run web yarn install

webpacker-install:
	docker-compose run web bundle exec rails webpacker:install

rails-console:
	docker-compose run web bundle exec rails console

db-migrate:
	docker-compose run web bundle exec rails db:migrate

rollback:
	docker-compose run web bundle exec rails db:rollback


# commands for init project
init-project:
	# 初回ビルドでは、Gemfileになにも書いてなくて、bundle installしても何も起こらない。(vendor/bundle上書き問題対応のため)
	make docker-build-no-cache
	# Gemfileを記述する
	sh gemfile.sh
	# railsのインストール
	docker-compose run --no-deps web bundle install
	# rails new
	make rails-new
	# (rails newの時点で動いているっぽいので一旦コメントアウト)
	# make webpacker-install
	make install
	mv database.yml config/database.yml
	make db-create
	make up-d
	sh gitignore.sh
	git add .
	git commit -m ":tada: first commit"
	echo '🎉 http://localhost:3000'
	echo '⛔️ if you want to stop docker-compose, type "make stop"'

# options
## docker-compose --no-deps: Don't start linked services. (only starts web service.)
## rails new --force: to overwrite Gemfile
## rails new --skip-bundle: we will bundle later, so skip
rails-new:
	docker-compose run --no-deps web rails new . --force --database=mysql --skip-turbolinks --skip-test

db-create:
	docker-compose run web bundle exec rails db:create

up-d:
	docker-compose run -d --service-ports web
