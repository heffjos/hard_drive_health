#!/bin/bash

ofile=mdadm_examine_drives.txt
echo > ${ofile}

for device in /dev/sd[a-z] /dev/sd[a-z][a-z]
do
    echo ${device} >> ${ofile}

    mdadm --examine ${device} >> ${ofile}
done
