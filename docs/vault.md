# Vault

* Created by Hashicorp (e.g. Vagrant)
* Tool for managing secrets. It controls access to tokens, passwords, certificates, API keys etc.
* Handles leasing, key revocation, key rolling and auditing.
* Can store existing secrests or can dynamically generate new secrets to control access to third party resources or provide time limited access.
* Access control policies control who can access what.
* Keys can be rolled to new versions while retaining ability to decrypt older secrets.
* Audit logs track all authenticated client interaction. These logs can be sent to multiple backends for further processing.

