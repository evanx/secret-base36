
# secret-base36

```
docker run evanxsummers/secret-base36
```

This image is built 
```
docker build -t secret-base36 https://github.com/evanx/secret-base36.git
```
from the Dockerfile
```
FROM mhart/alpine-node
CMD ["node", "-p", "(Date.now()*Math.random()).toString(36).replace(/\\./, '')"]
```
