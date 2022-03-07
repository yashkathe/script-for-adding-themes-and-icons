#!/bin/bash

#Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

#starting function
initFunction() {
    printf "Starting ... \n"
    echo
    sleep 0.5s
    if [[ ${UID} -eq 0 ]]; then
        printf "You are running this script as $(id -un) \n"
        echo
        printf "${ORANGE}The extracted files will be stored in /usr/share/.. \nand will be available to every user on this system\n"
        printf "To not store themes globally, run this script without being a root user\n${NC}"
        sleep 1s
    else
        printf "You are running this script as $(id -un) \n"
        echo
        printf "${ORANGE}The extracted files will be stored in .local/share/.. \nand will only be available to the user running this script\n"
        printf "To store any theme globally run this script as root \n${NC}"
    fi
}

case "${1}" in
--start)
    initFunction
    ;;
*)
    initFunction
    ;;
esac
