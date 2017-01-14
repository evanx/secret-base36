
# secret-base36

Containerized util to generate secret (random) string using NodeJS.

Perhaps interesting as a minimal Node Docker demo.

Try my pre-built image on DockerHub
```
docker run evanxsummers/secret-base36
```
```
FROM mhart/alpine-node
CMD ["node", "-p", "(Date.now()*Math.random()).toString(36).replace(/\\./, '')"]
```
Alternatively
```shell
echo "(Date.now()*Math.random()).toString(36).replace(/\./, '')" |
  docker run -i `
    echo '
      FROM node:7.4.0
      CMD ["node", "-p"]
    ' | docker build -q -
  `
```
where we are using the official Node 7.4.0 image as per following Dockerfile:
```shell
curl -s https://raw.githubusercontent.com/evanx/secret-base36/master/Dockerfile.node740 |
  docker build -t secret-base36 -
docker inspect secret-base36 | grep 'CMD'  
docker run secret-base36
```
