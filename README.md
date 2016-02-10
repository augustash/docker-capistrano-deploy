![https://www.augustash.com](http://augustash.s3.amazonaws.com/logos/ash-inline-color-500.png)

[![](https://badge.imagelayers.io/augustash/capistrano-deploy:legacy.svg)](https://imagelayers.io/?images=augustash/capistrano-deploy:legacy 'Get your own badge on imagelayers.io')

**This Capistrano container is not currently aimed at public consumption. It exists as an internal tool for August Ash deployments and is built upon [Phusion](http://phusion.github.io/baseimage-docker/).**

## About

This image is built to allow easy deployment of Capistrano 2 based projects without requiring the necessary Ruby environment locally. This container assumes your `Capfile` contains the Github repository URL configured to authenticate using a personal access token. If you don't have one, [https://help.github.com/articles/creating-an-access-token-for-command-line-use/](generate a token).

## Deploying

The container is set to function as the Capistrano process. By default the `--tasks` switch is passed and will display the available tasks to run. We're using the `multistage` extension. Navigate to your project directory containing your `Capfile` and deploy to staging:

```bash
docker run --rm -it -v $(pwd):/src -e GITHUB_AUTH_TOKEN=<TOKEN> augustash/capistrano-deploy:legacy staging deploy
```

To deploy to production:

```bash
docker run --rm -it -v $(pwd):/src -e GITHUB_AUTH_TOKEN=<TOKEN> augustash/capistrano-deploy:legacy production deploy
```
