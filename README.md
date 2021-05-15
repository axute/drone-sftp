# Deploy to SFTP server from Drone CI <br />(username and password)

[![Docker Build](https://img.shields.io/docker/cloud/automated/axute/drone-sftp.svg)](https://hub.docker.com/r/axute/drone-sftp/)
[![Docker Layers](https://img.shields.io/docker/image-size/axute/drone-sftp)](https://hub.docker.com/r/axute/drone-sftp/)

## Usage

You have to set the username and password for your SFTP server in the `username` and `password` secret.

## Required settings

```yaml
settings:
  host: ssh.strato.de
  username:
    from_secret: username
  password:
    from_secret: password
  source: relative/dir/in/project
  target: /absolute/dir/on/server
```

## Optional settings

```yaml
settings:
  debug: true
  exclude: (egrep like pattern matching)
```

## Full file example

```yaml
kind: pipeline
name: default
type: docker
steps:
  - name: deploy
    image: axute/drone-sftp
    settings:
      host: ssh.strato.de
      source: relative/dir/in/project
      target: /absolute/dir/on/server
      username:
        from_secret: username
      password:
        from_secret: password
      debug: true
      exclude:
        - ^\.git/$
        - ^\cache/$
    when:
      branch:
      - master
      event:
      - push
```
