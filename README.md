## What is this?
For the quick start a new project, I prepare a boilerplate code to start project and CICD. This repository goal is you only press "Make rails--new" then, everything is prepared.

I'm going to prepare these things.
- prepare Docker and Docker-compose
- prepare Gemfile (You should choose what you really use)
- prepare circleci/config.yml
- prepare k8s (in the future)
- guide for GCP / AWS & Github & circleci

## Usage

### Create Project
#### 1. Download Docker Machine
- [Docker for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
- [Docker for Ubuntu](https://docs.docker.com/v17.12/install/linux/docker-ce/ubuntu/#install-docker-ce)
- [Docker for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
- and so on..,

#### 2. Clone this repository
naoki$mkdir new-app
naoki$cd new-app/
- `$ git clone git@github.com:nao0515ki/docker-for-rails.git`

#### 3. Put files into your project
- put files
  ```
  cp -r docker-for-rails/* .
  cp docker-for-rails/.gitignore .
  rm -rf docker-for-rails/
  ```

#### 4. Custom for your project
- Gemfile

#### 5. Create your project
- Create rails app and configure it
  ```
  make rails--new
  docker-compose build
  ```
- connect to db
  ```
  cp config/database.yml app/config/database.yml
  docker-compose up
  docker-compose run web rake db:create
  ```
- ensure it works
  - http://localhost:3000
- replace/append boilerplate
  - gitignore
    ```
    echo -e "\n" >> .gitignore
    cat >> .gitignore << EOF
    # OSX template
    .DS_Store
    EOF
    ```
  - README
    ```
    rm README.md
    mv README_template.md README.md
    ```
- git commit
  - add .DS_Store to .gitignore
  ```
  naoki$git init
  naoki$git add -A
  naoki$git commit -m "first commit"
  ```

### Set up CICD
- push it to GitHub
  - make a GitHub repository
    - Repository name : project name
    - others : Empty / None
  - push it
    - `git remote add origin git@github.com:nao0515ki/{repository-name}.git`
    - `git push origin master`
- set up GCP
- setup GCB (Google Cloud Build)
  - [install Cloud Build to GitHub](https://cloud.google.com/cloud-build/docs/run-builds-on-github) or [configure Cloud Build](https://github.com/settings/installations)
- ensure it works

## References
- [Overview of docker-compose CLI](https://docs.docker.com/compose/reference/overview/)
- [Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)
- [Google Cloud Build](https://cloud.google.com/cloud-build/)
