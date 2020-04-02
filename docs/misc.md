# Misc Topics

## Error Handling

* Centralise Logging e.g. ELK
* Intermittent/Non Critical Errors. Keep a counter and when a threshold is reached, log it
* Tag or Label logs. Could log as json or some structured format. Makes it easier to query.

Reference [1](https://www.openmymind.net/Basic-Brain-Dump-On-Dealing-With-Errors/)

## JQ

* Tool used for processing json objects from the command line
* To delete a field from json `'del(.["uniqueIdentifier"])'`

## Elastic Search

* Uses a scripting language called painless. These can be used in queries and inserts.
* [Update API](https://www.elastic.co/guide/en/elasticsearch/reference/6.8/docs-update.html)

* You can't rename an index but you can copy the data from one index to another using a [`reindex`](https://www.elastic.co/guide/en/elasticsearch/reference/6.8/docs-reindex.html) command.
