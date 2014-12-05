#!/bin/bash

all_files=`ls`

date > .fsl_compute_time.txt ; echo ${all_files} | xargs -n1 -P7 unpack_run_first_all.sh ; date >> .fsl_compute_time.txt 