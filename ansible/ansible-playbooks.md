# Playbooks

* Expressed in YAML format. Aim is to be human readable with a minimum of syntax.
* Composed of 'plays' in a list
* Plays operate on hosts and execute tasks on them
* Plays run in the order specified in the playbook - top to bottom

## Basics

* `hosts` line is a list of one or more groups or host patterns. Can select the order in which the hosts are run from some predefined choices.
* `remote_user` is the name of the user account - can also be defined per task
* Tasks List - executed in order against all machines matched by the host pattern.
* Handlers - Notify is triggered once at the end of each block of tasks in a play. If nothing notifies a handler then it will not run. Handlers can listen to topics and tasks notify these topics. This is useful for 3rd party roles to decouple handlers from their names - as if two handlers exist with the same name then only one will be run.
* Can run playbook with `--syntax-check` flag to verify that playbok is syntactically correct.
* Ansible uses [Jinja2](http://jinja.pocoo.org/docs/2.10/) templating e.g. `"{{ var-name }}"`
* Before running tasks Ansible will gather facts about the system it is to provision. These begin with `ansible_` and are globally available to use anywhere that variables can be used.

## Reusable playbooks

* `import` - static - preprocessed at playbook parsing time
* `include` - dynamic - processed at runtime when task is encountered
* `include` is better for looping as the task will be executed once for each item in the loop
* `include` limitations - tags and tasks don't show up in list output. Can't notify a handler which only exists in a dynamic include
* `import` limitations - loops cannot be used. Variables from inventory sources cannot be used.

## Commands
* `import_playbooks`, `include_playbooks`
* `import_tasks`, `include_tasks`
* `import_roles`, `include_roles`

## Variables
* Can be defined in playbooks and roles
* Facts are variables that are discovered, not set by the user - fact gathering can be turned off if not needed. Can add user supplied facts using `facts.d`.
* Don't use names that conflict with attributes and methods of Python dictionaries
* Can use `register` to save the result of a module into a variable. These are then valid for the remainder of the playbook run.
* Can use external variables file to separate sensitive variables from rest of source
* Extra variables can be passed on the command line using `--extra-vars`.

## Conditionals
* `when:` clauses can be used to conditionally execute tasks
* This takes a raw Jinja2 expression without the curly braces

## Loops
* Can use `loop:` tag with a list
* Can use `query` to return the list
* Can use do until loops to handle retries
* Can use register to capture all output from the loop
* Ansible sets the variable `item` for each iteration of the loop