# Misc Topics

## Error Handling

* Centralise Logging e.g. ELK
* Intermittent/Non Critical Errors. Keep a counter and when a threshold is reached, log it
* Tag or Label logs. Could log as json or some structured format. Makes it easier to query.

Reference [1](https://www.openmymind.net/Basic-Brain-Dump-On-Dealing-With-Errors/)

## JQ

* Tool used for processing json objects from the command line
* To delete a field from json `'del(.["uniqueIdentifier"])'`
