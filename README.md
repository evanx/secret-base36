
# secret-base36

Try my pre-built image on DockerHub

```
docker run evanxsummers/secret-base36
```

This image is built by
```
docker build -t secret-base36 https://github.com/evanx/secret-base36.git
```
from the Dockerfile
```
FROM mhart/alpine-node
CMD ["node", "-p", "(Date.now()*Math.random()).toString(36).replace(/\\./, '')"]
```
where we double-escape the backslash as `\\`

Alternatively
```
echo "(Date.now()*Math.random()).toString(36).replace(/\./, '')" |
  docker run -i `
    echo '
      FROM node:7.4.0
      CMD ["node", "-p"]
    ' | docker build -q -
  `
```
where we are using the official Node 7.4.0 image.
