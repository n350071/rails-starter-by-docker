# docker-for-rails

Instantly, you can create a rails app.

## Screenshot

![screenshot](screenshot.png)

## Usage

### 1. Download Docker Machine
- [Docker for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
- [Docker for Ubuntu](https://docs.docker.com/v17.12/install/linux/docker-ce/ubuntu/#install-docker-ce)
- [Docker for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
- and so on..,

### 2. Clone this repository to your new app directory
```
$ mkdir new-app
$ cd new-app/
$ git clone git@github.com:nao0515ki/docker-for-rails.git
$ cp -r docker-for-rails/ .
$ rm screenshot.png
$ rm -rf docker-for-rails/
$ rm -rf .git
```

local debug
```
$ mkdir new-app
$ cd new-app/
$ cp -r ../docker/docker-for-rails/ .
$ rm screenshot.png
$ rm -rf docker-for-rails/
$ rm -rf .git
```


now, your directory should be like this.
```
$ ls -A -1
.gitignore
Dockerfile
Gemfile
Gemfile.lock
Makefile
README.md
README_template.md
database.yml
docker-compose.yml
entrypoint.sh
```

### 3. Create your project
#### 1. docker build & rails new
```
$ make init
```

#### 2. database config
```
$ mv database.yml config/database.yml
$ make db-build
```

### 3. Start your project
```
$ make up
```

It starts rails and you can check it by `http://localhost:3000`.

when you want to stop your docker, just `make stop`

### 4. Options

#### set up gitignore
```
echo -e "\n" >> .gitignore
cat >> .gitignore << EOF
# OSX system file
.DS_Store
EOF
```

#### custom README (if you want)
```
rm README.md
mv README_template.md README.md
```

## References
- [Overview of docker-compose CLI](https://docs.docker.com/compose/reference/overview/)
- [Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)
- [Google Cloud Build](https://cloud.google.com/cloud-build/)
