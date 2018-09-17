# Kubernetes

* Open source system for automating deployment, scaling, and management of containerized applications.
* Groups containers that make up an application into logical units for easy management and discovery.

## Features

* Automatic binpacking - automatically place containers across a cluster based on their resource requirements and constraints
* Horizontal scaling
* Self-healing - restarts containers that fail, kill containers that don't respond to health checks
* Service discovery and load balancing using IPs addresses and DNS name
* Automated rollouts and rollbacks - rolling upgrades
* Secret and configuration management
* Storage orchestration - mount filesystems e.g. AWS, NFS

## Overview

* Use Kubernetes API objects to describe the cluster's desired state and the Control Plane will make the cluster's current state match the desired state. It does this by starting containers, scaling the number of replicas of an application etc.
* The Control Plane maintains record of all objects in the system and its control loops respond to changes and work to make cluster match desired state.

## Objects

* Basic
    * Pod
    * Service
    * Volume
    * Namespace
* Higher Level
    * ReplicaSet
    * Deployment
    * StatefulSet
    * DaemonSet
    * Job

## Cluster

* Consists of a master node and worker nodes
* Master node runs apiserver, controller-manager and scheduler. It is responsible for maintaining desired state of the cluster. It co-ordinates all activites in the cluster e.g. scheduling applications, maintaining desired state, scaling applications and rolling out new updates
* A node is a VM or physical computer that serves as a worker machine in a cluster. These nodes run kubelet (to communicate with master) and proxy. We rarely interact with nodes directly. They should be able to run containers e.g. Docker.

## Deployment

* Responsible for creating and updating instances of your application.
* Deployment configuration instructs Kubernetes how to create and update instances of your application

## Pod

* Atomic unit on the Kubernetes platform - always runs on a node.
* Abstraction that represents a group of one or more application containers and some shared resources for the containers e.g. shared storage, networking
* Models an application specific logical host - can contain different application containers which are tightly coupled.
* Run inside Kubernetes on a private, isolated network - visible inside the cluster but not outside the network

## Services

* An abstraction layer which defines a logical set of Pods and enables external traffix exposure, load balancing and service discovery for those pods
* Enable a loose coupling between dependent pods. This is defined by a YAML file.
* Routes traffic across a set of Pods - allows pods to die and replicate without impacting the application
* Services match a set of Pods using labels and selectors
* Pod IP addresses are private unless exposes outside the cluster by using a service.
* There are a few different types of service:
    * ClusterIP - default - internal IP in the cluster
    * NodePort - exposes service on <NodeIP>:<NodePort> for each node in the cluster
    * LoadBalancer - Fixed external IP to the Service - superset of NodePort
    * ExternalName - Exposes the service using an arbitrary name via CNAME record

## Kubectl Commands

* `kubectl get` - list resources
* `kubectl describe` - shows detailed information about a resource
* `kubectl logs` - print the logs from a container in a pod
* `kubectl exec` - execute a command on a container in a pod