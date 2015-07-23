#!/bin/bash

if [ "$#" -ne 1 ]
then
    echo "Illegal option. Usage: ./alien_register.sh [output_module_name]"
else
    output_module="$1"
    output_module="${output_module}.swift"

    #echo $output_module
    cmd="cat main.swift $output_module > combine.swift"

    eval "$cmd"
    swift ./combine.swift
fi
