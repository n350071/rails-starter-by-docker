help:
	cat Makefile

# Start & Stop docker
up:
	docker-compose up

up-d:
	docker-compose up -d

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

rails-console:
	docker-compose run web bundle exec rails console

db-migrate:
	docker-compose run web bundle exec rails db:migrate

rollback:
	docker-compose run web bundle exec rails db:rollback


# commands for init project
cp-build-files:
	cp -r . ../
	cd ../
	rm screenshot.png
	rm -rf .git
	rm -rf rails-starter-kit-with-docker/
	ls -A -1

init-project:
	make rails-new
	sh gitignore.sh
	rm gitignore.sh
	make docker-build-no-cache
	make install
	mv database.yml config/database.yml
	make db-create
	make up-d
	echo '🎉 http://localhost:3000'
	echo 'if you want to stop docker-compose, type "make stop"'
	git add .
	git commit -m ":tada: first commit"

# options
## docker-compose --no-deps: Don't start linked services. (only starts web service.)
## rails new --force: to overwrite Gemfile
## rails new --skip-bundle: we will bundle later, so skip
rails-new:
	docker-compose run --no-deps web rails new . --force --skip-bundle --database=mysql

db-create:
	docker-compose run web bundle exec rails db:create