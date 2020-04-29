# rails-starter-kit-with-docker

You can create a rails app on docker with only 3 commands.

## Screenshot

![screenshot](screenshot.png)

## Usage
### Assumptions
I suppose that you already have docker machine.
If you don't have it, please install it.
- [Docker for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
- [Docker for Ubuntu](https://docs.docker.com/v17.12/install/linux/docker-ce/ubuntu/#install-docker-ce)
- [Docker for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

And also, you're at the project root directory like `new-app`.
If you haven't been yet, type following commands.

```
mkdir new-app
cd new-app/
```

### 1. Clone this repository to your new app directory
```
git clone git@github.com:n350071/rails-starter-kit-with-docker.git
```

### 2. Copy build files
```
sh rails-starter-kit-with-docker/cp_build_file.sh
```

You can rename the app name from `myapp` with replace command.
There is a CAPITAL `MYAPP`, so take care of it.

### 3. Initialize your new project
```
make init-project
```

It starts rails and you can check it by `http://localhost:3000`.
when you want to stop your docker, please type

```
make stop
```

## Help
```
make help
```