#!/bin/bash

kubectl cluster-info
kubectl get svc,pods --all-namespaces -o wide

