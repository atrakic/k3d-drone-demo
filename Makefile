SHELL := /bin/bash

MAKEFLAGS += --silent
CLUSTER_NAME ?= drone

K3D_URL ?= https://raw.githubusercontent.com/rancher/k3d/main/install.sh
K3D_VERSION ?= v4.4.1

.PHONY: up deploy status drone test clean
up: ##  Up
	which k3d || curl --silent --fail ${K3D_URL} | TAG=${K3D_VERSION} bash
	mkdir -p /tmp/.kube
	k3d cluster ls ${CLUSTER_NAME} || k3d cluster create --config k3d.yaml
	k3d kubeconfig get ${CLUSTER_NAME} > /tmp/.kube/config
	chmod 644 /tmp/.kube/config
	sed -i 's/0.0.0.0/k3d-drone-server-0/g' /tmp/.kube/config
	
status: export KUBECONFIG=$(shell k3d kubeconfig write ${CLUSTER_NAME})
status: ## Status
	kubectl cluster-info
	kubectl get svc,pods --all-namespaces -o wide

drone: ## Drone CI
	./$@.sh

clean: export KUBECONFIG=$(shell k3d kubeconfig write ${CLUSTER_NAME})
clean: ## Clean up
	echo -n "Are you sure? (Press Enter to continue or Ctrl+C to abort) "
	read _ 
	kubectl delete namespace ci --cascade || true
	k3d cluster stop $(CLUSTER_NAME)
	k3d cluster delete $(CLUSTER_NAME)

test:
	@[ -f ./test/test.sh ] && ./test/test.sh || true

-include include.mk
