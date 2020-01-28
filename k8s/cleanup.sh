#!/bin/bash

_YAML="playground-deployment.yaml"
[ -n "${1}" ] && {
 _YAML="playground-deployment-${1}.yaml"
}

kubectl delete svc/playground-deployment
kubectl delete -f ${_YAML}
