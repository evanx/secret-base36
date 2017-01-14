FROM mhart/alpine-node
CMD ["node", "-p", "(Date.now()*Math.random()).toString(36)"]
