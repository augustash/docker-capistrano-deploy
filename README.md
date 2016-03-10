![https://www.augustash.com](http://augustash.s3.amazonaws.com/logos/ash-inline-color-500.png)

[![](https://badge.imagelayers.io/augustash/capistrano-deploy:legacy.svg)](https://imagelayers.io/?images=augustash/capistrano-deploy:legacy 'Get your own badge on imagelayers.io')

**This Capistrano container is not currently aimed at public consumption. It exists as an internal tool for August Ash deployments and is built upon [Phusion](http://phusion.github.io/baseimage-docker/).**

## About

This image is built to allow easy deployment of Capistrano 2 based projects without requiring the necessary Ruby environment locally. This container assumes your `Capfile` contains the Github repository URL configured to authenticate using a personal access token. If you don't have one, [https://help.github.com/articles/creating-an-access-token-for-command-line-use/](generate a token).

## Setup

To properly run this container you need to specify an environment file that contains your Github personal access token. Create a file called `capistrano.env` in your project directory that looks like:

```bash
GITHUB_AUTH_TOKEN=1234
```

## Deploying

The container is set to function as the Capistrano process. By default the `--tasks` switch is passed and will display the available tasks to run. We're using the `multistage` extension. Navigate to your project directory containing your `Capfile` and deploy.

**Using Docker Compose:**

```bash
docker-compose run --rm capistrano {staging,production} deploy
```

**Using Docker:**

```bash
docker run --rm -it -v $(pwd):/src --env-file=capistrano.env augustash/capistrano-deploy:legacy {staging,production} deploy
```
