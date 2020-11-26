#!/bin/bash

# Script searches for file matching particular file extension.
# Renames them by adding postfix before extension.
# Example: db_schema.json => db_schema_newpostfix.json

# Start search in the current directory and search only in it (-maxdepth 1)
# -regextype posix-extended: extended regular expressions, egrep
# -regex '.*\.txt|.*\.json': find files ending with txt or json
# -exec bash -c: execute bash command for all found files
# -exec command {} +: this form of exec appends all found files in one line
# None: name of the bash script; assigned to $0 parameter
# $@: array of all the parameters  (file names)
# ${f#./}: parameter substitution, removes minimum occurence of the pattern in the fron end of a variable; removes leading ./ from the filename
# ${f%.*}: parameter substitution, remove the shortest part matching the pattern from the backend of a variable; .(dot) and everything else; in param expansion .(dot)
# doesn't match any symbol
# ${f##*.}: parameter substitution, remove the longest part matching the pattern from the front end of a variable; any symbol till the last dot 

find . -maxdepth 1 -type f -regextype posix-extended -regex '.*\.txt|.*\.json' -exec bash -c 'for f in "$@"; do f=${f#./}; mv "$f" "./${f%.*}_newpostfix.${f##*.}"; done' None {} +

# Copies files and changes prefix
find . -maxdepth 1 -type f -regextype posix-extended -regex '.*\.json' -exec bash -c 'for f in "$@"; do f=${f#./}; cp "$f" "./stg_${f#raw_}"; done' None {} +
