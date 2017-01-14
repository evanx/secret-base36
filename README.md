
# secret-base36

Containerized util to generate secret (random) string using NodeJS.

Perhaps interesting as a minimal Node Docker demo.

Try my pre-built image on DockerHub:
```
docker run evanxsummers/secret-base36
```
This image is built by:
```
docker build -t secret-base36 https://github.com/evanx/secret-base36.git
```
from the Dockerfile:
```
FROM mhart/alpine-node
CMD ["node", "-p", "(Date.now()*Math.random()).toString(36).replace(/\\./, '')"]
```
where we double-escape the backslash as `\\`

Alternatively we fetch `Dockerfile.node740`
```shell
curl -s https://raw.githubusercontent.com/evanx/secret-base36/master/Dockerfile.node740 |
  docker build -t secret-base36 -
docker inspect secret-base36 | grep 'CMD'  
docker run secret-base36
```
where this uses the official Node 7.4.0 image, similarly to the following demo:
```shell
echo "(Date.now()*Math.random()).toString(36).replace(/\./, '')" |
  docker run -i `
    echo '
      FROM node:7.4.0
      CMD ["node", "-p"]
    ' | docker build -q -
  `
```
where our command is `node -p` to print the result of the executed script piped in, hence `docker run -i`
