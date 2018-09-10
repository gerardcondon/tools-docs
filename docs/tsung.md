# TSung

* Written in Erlang
* Able to simulate a huge number of simultaneous connections from a single machine - use for high load tests

## Features

* High Performance - simulate large numbers of users and alias IP addresses
* Distributed
* Can support multiple protocols and SSL
* XML configuration system
* Dynamic scenarios - get data from server and re-inject in subsequent requests
* Mixed behaviours and randomize timings
* Generate reports - graphs

## Running

* Command is `tsung`.
* Various options. Can specify a config file.
* There appear to be various recorders for creating tests.

## Config File

* Tsung config file has option for logging html
* Can monitor the remote server to get stats such as cpu activity, load average and memory usage.
* Can configure various user and session settings in the config file
* There is built in support for various protocol types or you can use the raw option to send any kind of traffic to the server.
* Can match the server's response against given strings or regexps and increment counters or log

## Statistics

* Can output various statistics using the `tsung_stats.pl` and `tsung_plotter` scripts.