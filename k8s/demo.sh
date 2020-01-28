#!/bin/bash

_YAML="playground-deployment.yaml"
[ -n "${1}" ] && {
 _YAML="playground-deployment-${1}.yaml"
}

echo ">> kubectl apply -f ${_YAML}"
kubectl apply -f ${_YAML}
echo ">> kubectl expose deployment playground-deployment --type=NodePort"
kubectl expose deployment playground-deployment --type=NodePort
echo ">> kubectl describe svc/playground-deployment"
kubectl describe svc/playground-deployment

#forkbomb: :(){ :|: & };:
# playground: http://169.61.166.248:$NODEPORT

# mknod /dev/mtdblock0 b 31 0
