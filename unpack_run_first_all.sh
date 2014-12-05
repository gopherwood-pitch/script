#!/bin/bash

if [ $# -eq 1 ] ; then
    run_first_all -i $1 -o $1
else
    echo "Error: "`basename $0`" accepts exactly one input." >&2
    exit 1
fi
