# k3d-drone-demo

This repo shows how to run kubectl commands by using [Drone CI pipeline](https://drone.io/).

## Demo
Drone pipeline steps inside ephemeral Docker container triggered by [Github actions](https://github.com/atrakic/k3d-drone-demo/actions)


## K3d local

```console
$ make up
$ CLUSTER_NAME=drone
$ export KUBECONFIG=$(k3d kubeconfig write ${CLUSTER_NAME})
$ kubectl get svc,po --all-namespaces 
```

## Resources
- <https://hub.docker.com/r/bitnami/kubectl>
- <https://hub.docker.com/r/rancher/k3s>
- <https://docs.drone.io>
