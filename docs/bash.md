# BASH

## Reload

* Run `exec bash` to start a new bash terminal in place of the current one.

## Bookmarking locations

* I use the method described by Jeroen Janssens in his blog [post](http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html).
* I got the jump scripts from [here](https://github.com/neuhalje/homesick-bash-mark_jump/blob/master/home/.bashrc-plugin.bash-jump.d/common/plugin.conf).

## Completion

* You want to enable extra completion to get completion for e.g. Makefile targets
* The [bash-completion](https://github.com/scop/bash-completion) plugin provides this and can be installed via your package manager

## Sudoers

* [Link](http://askubuntu.com/questions/7477/how-can-i-add-a-new-user-as-sudoer-using-the-command-line?newreg=069e40909cc04369bfdbfcaec0afadd7) showing how to add user to sudoers

## Search and Replace Text in a file

* Use and external program like perl or sed
* `perl -pi -e 's/abc/XYZ/g' /tmp/file.txt`
* `sed -i -e 's/abc/XYZ/g' /tmp/file.txt`
* `mssql-server` package ships with a `replace` tool
    - `replace "abc" "XYZ" -- file1.txt`

## Extract Files from an RPM

* `rpm2cpio ./packagecloud-test-1.1-1.x86_64.rpm | cpio -idmv`

## Check the dependencies of a program

* `ldd /usr/bin/ffmpeg`

## Extract column from data

* `awk '{print $2}'` prints the second column of data

## Copy list of files to another folder and maintain folder structure

* `<command to generate file list> | cpio --pass-through --verbose --make-directories -u ../tmp/f1/f2/`

## Find unique entries in a file

* If sorted then `uniq -c`
* If not sorted then either `sort | uniq -c` or `awk '~cnts[$0]++'`. The awk version has the advantage of not needing to sort the file first so can operate on larger files. See [here](http://blog.jpalardy.com/posts/unsorted-uniq/)

## Tree

* This is a useful command to print the contents of a folder in a tree like manner.

## File System maintenance

* `lsblk` will list the volumes and where they're mounted in a tree like manner.
* [Extend or reduce LVMs](https://www.tecmint.com/extend-and-reduce-lvms-in-linux/). Shows how to create the physical partitions, extend the logical partitions and resize the file system.

## Ncdu

* This is a terminal based program to show disk usage and which folders are taking up the most space. You can navigate the file system from it and delete files and folders. Install using `yum`.

## Wrapping Command Line tools

* Can wrap command line tools by creating a function of the same name which performs what every operations you want and then delegates to the built in function. See [here](http://blog.jpalardy.com/posts/wrapping-command-line-tools/)

## AWK

* Awk [tips and tricks](http://blog.jpalardy.com/posts/my-best-awk-tricks/)
* Print first field in a string `awk '{print $1}'`

## Replace common prefix of files

* `rename <old_prefix> <new_prefix> <files>`

## Git

* Reset local master to be the same as the remote master branch
```
    git fetch origin
    git reset --hard origin/master
```
* You have a local .gitignore file at `.git/info/excludes`
* Pass `--remote` to the submodule update command to always pull the latest for that submodule.
* Change previous commit message `git commit --amend -m "an updated commit message"`
* Add a new remote `git remote add [remote name] [remote url]` 

## Misc

* Resolve the ipaddress of any host. One of the following should work depending on what's on your system. The `getent` approach should definitely work as it only depends on `glibc` which should be on every linux box.
 	* `getent hosts unix.stackexchange.com | awk '{ print $1 }'`
 	* `dig +short unix.stackexchange.com`
 	* `host unix.stackexchange.com | awk '/has address/ { print $4 }'`
	* `nslookup unix.stackexchange.com | awk '/^Address: / { print $2 }'`
* Instead of creating an alias that takes a parameter you can create a function to do so and export that from the `bashrc`
* To disable strict host checking in ssh can use `ssh -o StrictHostKeyChecking=no`
* Follow redirects in curl with `curl -L`
