#!/bin/bash


name=$(basename $1)
name="${name%%.*}"
path=$(dirname $1)

pushd "$path"
codebraid pandoc --overwrite --from markdown --to revealjs -d /code/params.yaml -o "$name.html" "$name.md"
popd
