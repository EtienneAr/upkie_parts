#!/bin/sh
#
# Copyright 2022 Stéphane Caron
#
# Run this script from the host to configure a target Raspberry Pi system.

set -e

if [ $# -ne 1 ]
then
    echo "Usage: $0 <[user@]host>"
    exit
fi

SCRIPT_DIR=$(dirname $0)
UPKIE=${1}  # [user@]hostname of target platform

scp ${SCRIPT_DIR}/remote/setup-system.py ${UPKIE}:setup-system.py
ssh ${UPKIE} sudo ./setup-system.py
