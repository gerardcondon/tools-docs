# ACK

[Ack][] is a replacement for grep for programming use cases.
Grep is a general text search tool.
Ack is more aware of code layouts and what are relevant files so it is able to search your source code.

Usage `ack --<language> <search_query>`
* this will recursively search for the given search_query
* language is the programming language whose files to search in e.g. python.

To install you can use a package manager like yum or just download the perl file directly from their [website](https://beyondgrep.com/install/)

## Options

* `-i` - ignore case

<!-- Investigate Ack.Vim - https://github.com/mileszs/ack.vim -->

[Ack]: https://beyondgrep.com/