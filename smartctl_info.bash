#!/bin/bash

ofile=smartctl_info_output.txt

echo > ${ofile}

for device in /dev/sd[a-z] /dev/sd[a-z][a-z]
do
    echo ${device} >> ${ofile}
    smartctl --info ${device} >> ${ofile}
done

