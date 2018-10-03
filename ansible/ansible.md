# Ansible

* IT Automation & Orchestration Engine
* Automation Language to describe an IT Application - human and machine readable
* Tasks executed in order
* Agentless - SSH to automate - no other software to install or ports to open - no resources consumed on target machines when Ansible is not managing them.
* Automates the process of getting context (Facts in Ansible terms) before running tasks
* Idempotent - e.g. it doesn't attempt to reinstall things if run multiple times whereas bash scripts are usually not.
* You define the state you want to be in rather than the change you want - Ansible will decide if a change is needed.

## Components

* Inventories are lists of hosts - static or dynamic
* Playbooks are YAML files that describe the desired end state of something. They contain plays.
* Plays contain tasks and execute them sequentially.
* A handler is the same as a task but it will only run when called (notified) by another task
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

## Remote Connection
* Uses OpenSSH if available, otherwise Paramiko.
* Should use SSH keys instead of passwords. Can login as any user and su or sudo to another user.
* Ansible-pull mode can invert the connection and have the systems phone home to the control machine.
* Can also run commands locally - not over ssh

## Inventories
* Ansible represents the machines it manages in simple INI files called inventories
* Machines can be grouped together
* If there is another source of truth for the infrastructure then Ansible can plugin to that - dynamic inventories
* Can use Ansible variables to define a host and then refer to the variable from then on
* Can use patterns e.g. `www[01-50]`
* Variables can be applied to a group
* Default groups are `all` and `ungrouped`
* Shouldn't store variables in the inventory files - can split these out into separate YAML files for groups and host.

### Dynamic Inventory
* Ansible supports external inventory systems e.g. Tower, AWS
* Secript that calls the external service and returns the inventory in JSON
* Can cache calls to this to speed up subsequent runs

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

## Command Line Tools

* `ansible <host-pattern> [options]` Define and run a single playbook against a set of hosts.
* `ansible-config [view|dump|list] [--help] [options] [ansible.cfg]` view, edit and manage ansible configuration.
* `ansible-console [<host-pattern>] [options]` REPL for executing Ansible tasks.
* `ansible-doc [-l|-F|-s] [options] [-t <plugin type> ] [plugin]` Plugin documentation tool. Displays info on plugins installed. Can create a snippet for a plugin.
* `ansible-galaxy [delete|import|info|init|install|list|login|remove|search|setup] [--help] [options] ...` Command to manager Ansible Roles in shared repositories - default of which is Ansible Galaxy.
* `ansible-inventory [options] [host|group]` used to display or dump the configured inventory as Ansible sees it
* `ansible-playbook [options] playbook.yml [playbook2 ...]` tool used to run Ansible playbooks.
* `ansible-pull -U <repository> [options] [<playbook.yml>]` used to set up a remote copy of ansible on each node. These will pull the playbook source from a repo and execute it according to a cron scheduled
* `ansible-vault [create|decrypt|edit|encrypt|encrypt_string|rekey|view] [options] [vaultfile.yml]` encryption/decryption utility for Ansible data files. Can enrypt any structured data used by Ansible.

## Ad-Hoc Commands
* Once off commands that are executed immediately e.g. reboot, copy commands, update yum packages, create users, manage services, gather facts about system
* Can apply to groups of servers from an inventory

## Ansible Vault

* Ansible Vault can encrypt any yaml file. Need to set a password and will be prompted for that when editing the file. Uses the `EDITOR` environment variable to select the editor.
* Encrypted variables are used like normal within the YAML files. Need to run `ansible-playbook` with the `--ask-vault-pass` option when using an encrypted file.

## Roles
* Roles organise related tasks and data into one coherent structure. THe should be stored in a directory called `roles`.
* Can use `ansible-galaxy` command to create a new role e.g. `ansible-galaxy init <role-name>`.
* Folders
* * defaults - contains a `main.yml` with the default variables used by a role
  * files - stores files to be copied to the server
  * handlers - targets for notify directives - almost always associated with services e.g. after something has restarted
  * meta - desfines role dependencies and data relating to the role e.g. author, license, platforms etc. Roles dependencies are executed before the role that includes them and may be recursive.
  * template - similar to fiels but support modification via jinja2 templating. In playbooks are defined using src to point to the template and dest to point to where it ends up on the destination file system
  * variables - can override the values set in defaults
  * tasks - series of Ansible plays
* Define the role in the playbook file and use the other files to store the specific details
* By default roles only run once. Can get around this by passing different parameters to the role or adding `allow_duplicates:true` to the `meta/main.yml` file.

## Ansible Modules
* Modules are the building blocks for building Ansible playbooks. They are small pieces of Python code that can be triggered from the playbook.
* Custom modules can be a nice way to interact with services that provide a REST API instead of using the URI module.
* `main()` is the main entrypoint into the module. `AnsibleModule` helps with handling incoming parameters and exiting the program.
* Define args as a Python dictionary. For each arg can define its type, required, default, range of values
* Can add `DOCUMENTATION` and `EXAMPLES` strings to explain how the modules can be used.
* To achieve idempotency the module should check if we are already in the end state before doing any actions.
* Most modules take `key=value`arguments except for `command` and `shell` which take a list of arguments.

References
* [Getting Started](https://www.ansible.com/resources/get-started#)
* [How Ansible Works](https://www.ansible.com/overview/how-ansible-works)
* [Ansible Docs](https://docs.ansible.com/index.html)
* [Ansible Cheat Sheet](https://gist.github.com/andreicristianpetcu/b892338de279af9dac067891579cad7d)
* [Ansible 2 Tutorial](https://serversforhackers.com/c/an-ansible2-tutorial)
* [Ansible Roles Tutorial](http://www.azavea.com/blogs/labs/2014/10/creating-ansible-roles-from-scratch-part-1/)