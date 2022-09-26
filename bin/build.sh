#!/bin/bash

# Simulates projects usage on Babbel's *.infrastructure repos. Terraform configurations are grouped in
# directories for convenience, but projects sees subdirectories as modules. Instead, the configuration is
# recursively combined into one file.

set -eu

output_file=_build.tf

if test -f $output_file; then
  rm $output_file
fi

directories=(_shared)
directories+=("$@")

for directory in "${directories[@]}"; do
  files=($(find $directory *.tf | grep -e $directory.*\.tf$))

  for file in "${files[@]}"; do
    printf "\n" >> $output_file
    cat $file >> $output_file
  done
done
