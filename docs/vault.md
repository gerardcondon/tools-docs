# Vault

* Created by Hashicorp (e.g. Vagrant)
* Tool for managing secrets and storing them encrypted. It controls access to tokens, passwords, certificates, API keys etc - things that would normally not be checked into a source control system.
* It can handle all aspects of sensitive information - generation, storage, usage and revocation.

## Interface
* Vault is a go application with a REST/CLI interface
* CLI uses `vault` binary with subcommands (similar to git)
* REST API uses GET/POST/DELETE passing the token with the header `X-Vault-Token`.
* Can use Ansible to make REST requests to Vault and do something with the output

## Secrets

* Can store existing secrests or can dynamically generate new secrets to control access to third party resources or provide time limited access.
* `write` and `read` secrets from the vault.
* Can use short-lived secrets thus limiting "window of opportunity" to use stolen secrets.

## Keys
* Handles leasing, key revocation, key rolling and auditing.
* Access control policies control who can access what.
* Keys can be rolled to new versions while retaining ability to decrypt older secrets.
* Audit logs track all authenticated client interaction. These logs can be sent to multiple backends for further processing.

## Authentication

* Can use tokens - strings sent as a header on every http request
* Initial install creates a root token - similar to root user, we need to be careful using this. Should create other limited users for normal use.
* `token-create` creates a new token.
* Can also authenticate using LDAP, JW, TLS among others.
* Tokens form a hierarchy and each child can only have at most same level of privileges as the parent
* Invalidating a token also invalidates the children tokens.
* Tokens have properties
    * Policies
    * TTL
    * Can be renewed?
    * Maximum usage count

## Backends/Secret Engines

* Vault has a few backends. These are virtual file systems with some logic
* For example, AWS backend will create IAM credentials on demand - dynamic secrets.
* Persistence backend provides storage for all secrets.

## Secret Types

* Vault supports a range of secret types e.g. key-value, crypto keys, dynamically created
* Each type has a mount point (REST API prefix), set of operations and configuration parameters

### Key-Value Secrets

* key-value pairs available under the given path
* Can have versioning on the values (non versioned updates replace existing value)

### Dynamically Generated Secrets

* Generated on the fly whenever requested by an application.
* For example, Database credentials, SSH Key Pairs, X509 Certificates, AWS Credentials, Google Service accounts, Active Directory accounts.
* We provide credentials to connect to the service and a role to create the new user & grant relevant permissions
* Can expire credentials based on time and renew based on customer request and backend support.

## Sealing

* Vault doesn't store the master key in the main server so can't access data by default - in sealed state.
* Can unseal with the master key and then the Vault will be available to accept API requests.
* On initialisation Vault displays master share values (and never again). To unseal we must enter three of these.

## References
* [Hashicorp Github Page](https://github.com/hashicorp/vault)
* https://hackernoon.com/a-little-hashicorp-vault-introduction-d28382487b9f