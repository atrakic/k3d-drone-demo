# k3d-drone-demo

This repo shows how to run kubectl commands against [k3d](https://k3d.io) by using [Drone CI pipeline](https://drone.io/).

## Demo
Drone pipeline steps inside ephemeral Docker container triggered by [Github actions](https://github.com/atrakic/k3d-drone-demo/actions)


## Drone local build

```console
$ make up
$ make drone
```

## Resources
- <https://k3d.io/>
- <https://hub.docker.com/r/bitnami/kubectl>
- <https://docs.drone.io>
- <https://github.com/marketplace/actions/absaoss-k3d-action>


## TODO
- Figure out how to use docker network without editing kubeconfig: https://discourse.drone.io/t/networks-field-in-pipeline/2051/8


## CREDITS
- <https://github.com/iwilltry42/k3d-demo.git>
