#!/bin/bash
kubectl apply -f playground-deployment.yaml
kubectl expose deployment playground-deployment --type=NodePort
kubectl describe svc/playground-deployment

#forkbomb: :(){ :|: & };:
# playground: http://169.61.166.248:$NODEPORT

# mknod /dev/mtdblock0 b 31 0
