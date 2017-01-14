
# secret-base36

```
docker run evanxsummers/secret-base36
```

This image is built from the Dockerfile:
```
FROM mhart/alpine-node
CMD ["node", "-p", "(Date.now()*Math.random()).toString(36).replace(/\\./, '')"]
```
