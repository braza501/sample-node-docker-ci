#!/bin/bash

docker push braza501/sample-node

ssh -t -t tenrakyshka@35.187.4.71 << EOF
docker pull braza501/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi braza501/sample-node:current || true
docker tag braza501/sample-node:latest braza501/sample-node:current
docker run -d --net my-network --restart always --name web -p 80:80 braza501/sample-node:current
EOF
