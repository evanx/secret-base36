
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

Incidently can inspect the image:
```
docker inspect evanxsummers/secret-base36 | grep CMD
```
to see:
```
"CMD [\"node\" \"-p\" \"(Date.now()*Math.random()).toString(36).replace(/\\\\./, '')\"]"
```

Let's fetch the `Dockerfile` and build ourselves:
```shell
curl -s https://raw.githubusercontent.com/evanx/secret-base36/master/Dockerfile |
  docker build -t secret-base36 -
docker inspect secret-base36 | grep 'CMD'  
docker run secret-base36
```
or alternatively `Dockerfile.node740` for the official Node 7.4.0 image, similarly to the following demo:
```shell
echo "(Date.now()*Math.random()).toString(36).replace(/\./, '')" |
  docker run -i `
    echo '
      FROM node:7.4.0
      CMD ["node", "-p"]
    ' | docker build -q -
  `
```
where:
- our command is `node -p` to print the result of the JavaScript piped in.
- to enable standard input, we use `docker run -i`
- we pipe Dockerfile contents to `docker build -`
- `docker build -q` prints the built container ID only


https://twitter.com/@evanxsummers
