# Bash Scripting

* Create the file with a `.sh` extension.
* Chmod with some user `+x` to enable execution

## Running

* Can run directly from the command line e.g. `.my_script.sh`
* Can run using `bash` command. This is useful for passing flags e.g. `bash -x my_script`

## Set Options

* `set -x` - this displays each line that is executed
* `set -u` - this does not allow unbound variables
* `set -e` - aborts the script upon encountering an error
* `set -o pipefail` - raises an error if any part of a pipeline command fails
* Reference - [Bash's unofficial strict mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)

## Linting

[ShellCheck][] is a linter for bash scripts. This is a Haskell program and can be installed through the package manager.

If this is not available on your OS e.g. early versions of CentOS then they distribute it via [Docker][] images.

    docker pull koalaman/shellcheck
    docker run -v $(pwd):/scripts koalaman/shellcheck /scripts/myscript.sh

Need to invcoke this with the `-x` argument to make it follow scripts that were sourced by the current script.

## Logging

In order to prevent logging info getting mixed up with stdout or stderr we can log to a different bash file descriptor. Then the caller of the script can chose where to redirect the log to.

    log() {
        # If a file descriptor exists for stream 3 then log to it
        if command >&3
        then datestring=$(date +'%Y-%m-%d %H:%M:%S')
             echo "$datestring $1" >&3
        fi 2> /dev/null
    }

Invoke the script using `./myscript.sh 3>log.txt`

## Functions in Bash

You can create functions in bash but getting output from them is a bit tricky. The `return` statement in bash just returns a status code from the function. Instead you echo the output you want to stdout. The calling code wraps the call to the function with `$( )` and assigns it to a variable. Another way to get information out of a function is to assign values to global variables.

    my_func() {
        arg=$1
        echo "Output $arg"
        echo "More output"
    }

    my_var=$(my_func "arg1")

## Source File Organization

You can include scripts from other scripts using the `source` keyword. This will execute the other script in place. All the function definitions are imported and all non function statements are executed.

## Arguments

Can use getopts to check mandatory command line arguments.

For lots of arguments it may be worth sourcing a config file instead. This allows the same params to be used by multiple different scripts.

### Sample

```bash
 #!/bin/bash w
 # options explanation at http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
#IFS=$'\n\t'

display_usage() {
    cat <<EOF
    Usage: $0 [options]

    -h    Display the help text
    -c    Path to the config file
EOF
}

check_mandatory_argument() {
    if [[ -z "${!1:-}" ]]; then
        echo "Missing required argument ${1}." >&2
        display_usage >&2
        exit 1
    fi
}

check_mandatory_config_option() {
    if [[ -z "${!1:-}" ]]; then
        echo "Config File is missing required option ${1}." >&2
        display_usage >&2
        exit 1
    fi
}

parse_arguments() {
    local OPTIND
    while getopts :hc: opt; do
    case $opt in
        h)
            display_usage
            exit 0
            ;;
        c)
            config_file_path=${OPTARG}
            ;;
        \?) echo "An invalid option has been entered: $OPTARG"
            display_usage >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            display_usage >&2
            exit 1
            ;;
        *)
            display_usage >&2
            exit 1
            ;;
    esac
done
echo $config_file_path
}

check_mandatory_argument "arg1"
check_mandatory_argument "arg2"
```

[ShellCheck]: https://github.com/koalaman/shellcheck
[Docker]: https://www.docker.com/
