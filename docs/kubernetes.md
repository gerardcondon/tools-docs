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

* Abstraction that represents a group of one or more application containers and some shared resources for the containers e.g. shared storage, networking
* Models a 
* Run inside Kubernetes on a private, isolated network - visible inside the cluster but not outside the network