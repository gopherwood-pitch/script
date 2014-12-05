#!/bin/bash

date > .compute_time.txt ; ls | xargs -n1 -P7 unpack_recon.sh ; date >> .compute_time.txt 