# Ansible

* IT Automation & Orchestration Engine
* Automation Language to describe an IT Application - human and machine readable
* Tasks executed in order
* Agentless - SSH to automate - no other software to install or ports to open

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