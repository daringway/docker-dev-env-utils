# DaringWay Dev Container

Support for Docker Desktop, GitHub Codespace, and GitPod

This is a base dockerfile use to created GitPod Workspaces Dev Environments that are pinned to specific versions of software.  Documentation on how to use this dockerfile is in the associated [gitpod template](https://github.com/daringway/gitpod-template) repo.

# HowTo 

See [DaringWay GitPod Workspace Template](https://github.com/daringway/gitpod-template) on how to use.

# Testing
See [trying out your dockerfile](https://www.gitpod.io/docs/config-docker) for details.
```
docker build -f Dockerfile -t dev-env-utils-test --target test .
docker run -it dev-env-utils-test  /dw/test/all
```

Interactive check dockerfile after build
```
docker run -it dev-env-utils-test
```
