#!/bin/bash

ofile=get_drive_info_output.tsv

header="device\tdevice_model\tserial_number\tfirmware_version\tuser_capacity\tsector_sizes\trotation_rate\tform_factor\tata_version_is"

echo -e "${header}" > ${ofile}

for device in /dev/sd[a-z] /dev/sd[a-z][a-z]
do
    info=`smartctl --info ${device}`

    device_model=`echo "${info}" | grep "Device Model" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    serial_number=`echo "${info}" | grep "Serial Number" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    firmware_version=`echo "${info}" | grep "Firmware Version" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    user_capacity=`echo "${info}" | grep "User Capacity" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    sector_sizes=`echo "${info}" | grep "Sector Sizes" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    rotation_rate=`echo "${info}" | grep "Rotation Rate" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    form_factor=`echo "${info}" | grep "Form Factor" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    ata_version_is=`echo "${info}" | grep -E "^ATA Version is" | awk -F: '{print $2}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`

    line="${device}\t"
    line="${line}${device_model}\t"
    line="${line}${serial_number}\t"
    line="${line}${firmware_version}\t"
    line="${line}${user_capacity}\t"
    line="${line}${sector_sizes}\t"
    line="${line}${rotation_rate}\t"
    line="${line}${form_factor}\t"
    line="${line}${ata_version_is}"
    echo -e "${line}" >> ${ofile}

done
