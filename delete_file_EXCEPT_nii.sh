#!/bin/bash

rm -rf .success.txt

for file in [0-9][0-9][0-9]_S_[0-9][0-9][0-9][0-9]
do
    cd $file
    if [ $? -eq 0 ] ; then
	find . \! -name *.nii -delete
	cd ..
    fi
done

