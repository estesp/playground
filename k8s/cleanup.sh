#!/bin/bash
kubectl delete svc/playground-deployment
kubectl delete -f playground-deployment.yaml
