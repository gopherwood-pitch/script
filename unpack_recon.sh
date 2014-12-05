#!/bin/bash

if [ $# -eq 1 ] ; then
    file=$1
    if [ -d "${file}" ] ; then
	n=`cat .success.txt 2>/dev/null | grep ^"${file}"' ':* | wc -l`
	if [ $n -gt 0 ] ; then
	    echo "${file} : completed."
	    exit 0
	fi
	cd ${file}
	if [ $? -eq 0 ] ; then
	    echo "${file} : processing."
	    find . \! -name *.nii -delete
	    source $FREESURFER_HOME/SetUpFreeSurfer.sh 
	    SUBJECTS_DIR=`pwd`
	    recon-all -i ${file}.nii -subjid ${file} 1>>${file}_unpack.out 2>>${file}_unpack.err
	    recon-all -s ${file} -all -hippo-subfields 1>>${file}_recon.out 2>>${file}_recon.err
	    success=$?
	    cd ..
	    if [ "${success}" -eq 0 ] ; then
		echo ${file} : `date` >> .success.txt
	    else
		echo ${file} : `date` >> .failed.txt
	    fi
	fi
    else
	echo "Error: ${file} is not a directory." >&2
    fi
else
    echo "Error: should have exactly one input." >&2
fi

