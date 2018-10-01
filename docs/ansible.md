# Ansible

* IT Automation & Orchestration Engine
* Automation Language to describe an IT Application - human and machine readable
* Tasks executed in order
* Agentless - SSH to automate - no other software to install or ports to open - no resources consumed on target machines when Ansible is not managing them.

## Components

* Inventories are lists of hosts - static or dynamic
* Playbooks are YAML files that describe the desired end state of something. They contain plays.
* Plays contain tasks and execute them sequentially.
* Variables can be set in lots of different places and can be used to control execution of playbooks
* Modules - Ansible provided and custom
* Roles are special kind of playbooks that are fully self contained and portable
* plugins

## Modes
* Dry-run or check mode can validate state of the system

## Tower
* Layers in control, knowledge and delegation components
* UI dashboard and RESTful API
* Integrates with CI/CD
* Integrates with LDAP and can provide access based on this - role based access control
* Push button deployent - store all config in a job template - playbook + job parameters
* Centralised logging and auditing

## Galaxy
* Community and vendor provided Ansible Roles to help get started faster

## Architecture
* Ansible connects to the nodes and pushes out small programs called modules to them.
* It invokes these via SSH and removes them once finished
* Should use SSH keys instead of passwords. Can login as any user and su or sudo to another user.

## Inventories
* Ansible represents the machines it manages in simple INI files called inventories
* Machines can be grouped together
* If there is another source of truth for the infrastructure then Ansible can plugin to that - dynamic inventories

## Playbooks
* Include features that allow for complex automation flow
    * conditional execution of tasks
    * gather variables and information from the remote system
    * spawn long running tasks asynchronously
    * check mode to test for pending changes
    * Tag plays and tasks

## Extensibility

* Can write custom modules in any language - only required to take JSON as input and produce JSON as output
* Dynamic inventories allow for Ansible playbooks to be run against machines discovered at runtime
* Can write plugins for Ansible itself e.g. output plugin to handle Ansible output and send it somewhere, or connection plugin to connect to or discover new nodes


