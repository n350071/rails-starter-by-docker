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
```
$ git clone git@github.com:nao0515ki/docker-for-rails.git
```

#### 3. Put files into your project

#### 4. Custom for your project
- README.md
- Gemfile
- .gitignore

#### 5. Create your project
- `$ make rails--new`
- ensure it works

### Start CICD
- setup GitHub
- setup CircleCI
- setup circleci/config.yml
- ensure it works

## Work with your colleague
### Share these informations
- share GitHub repository
- share CircleCi url
- (Project Management System)
- (Invite Slack)
- Download Docker Machine

## How to use after creation
### Docker rebuild
### Start Server
