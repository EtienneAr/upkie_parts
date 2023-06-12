#!/bin/sh
#
# Copyright 2022 Stéphane Caron
#
# Run this script from the host to configure a target Raspberry Pi system.

set -e

if [ $# -ne 6 ]
then
    echo "Usage: $0 <[user@]host> <ssid> <wifi-password> <country> <wifi-prefix> <eth-prefix>"
    exit
fi

CURDIR=$(dirname $0)
UPKIE=${1}  # [user@]hostname of target platform
SSID=${2}
WIFI_PASSWORD=${3}
COUNTRY=${4}
WIFI_PREFIX=${5}
ETH_PREFIX=${6}

scp -r ${CURDIR}/scripts ${UPKIE}:scripts
ssh ${UPKIE} sudo ./scripts/setup-system.py ${SSID} ${WIFI_PASSWORD} ${COUNTRY} ${WIFI_PREFIX} ${ETH_PREFIX}
