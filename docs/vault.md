# Vault

* Created by Hashicorp (e.g. Vagrant)
* Tool for managing secrets and storing them encrypted. It controls access to tokens, passwords, certificates, API keys etc - things that would normally not be checked into a source control system.
* It can handle all aspects of sensitive information - generation, storage, usage and revocation.

* Seal?

## Interface
* Vault is a go application with a REST/CLI interface
* CLI uses `vault` binary with subcommands (similar to git)
* REST API uses GET/POST/DELETE passing the token with the header `X-Vault-Token`.
* Can use Ansible to make REST requests to Vault and do something with the output

## Secrets

* Can store existing secrests or can dynamically generate new secrets to control access to third party resources or provide time limited access.
* `write` and `read` secrets from the vault.

## Keys
* Handles leasing, key revocation, key rolling and auditing.
* Access control policies control who can access what.
* Keys can be rolled to new versions while retaining ability to decrypt older secrets.
* Audit logs track all authenticated client interaction. These logs can be sent to multiple backends for further processing.

## Token

* `token-create` creates a new token

## Backends

* Vault has a few backends. These are virtual file systems with some logic
* For example, AWS backend will create IAM credentials on demand - dynamic secrets.


## References
* [Hashicorp Github Page](https://github.com/hashicorp/vault)
* https://hackernoon.com/a-little-hashicorp-vault-introduction-d28382487b9f