#!/bin/bash

#Global variables
PATH_NAME=$()
FOLDER_NAME=$()
FOLDER_PREFIX=$()
FOLDER_SUFFIX=$()
PASTE_NUM=$()
ISZIP=$()
filename=$()

#Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

#starting function

initFunction() {
    echo "Hello $(id -un)"
    sleep 0.5s
    if [[ ${UID} -eq 0 ]]; then
        printf "Starting ... \n"
        sleep 1s
        printf "${ORANGE}Make sure you are running the script from where the folders are located ${NC}\n"
        sleep 1s
    else
        printf "${RED}ERROR ! start this script as root ${NC}\n"
        printf "${RED}exiting now...${NC}\n"
        exit 1
    fi
}

#reading and saving the file you wanna copy

readFoldersFunction() {
    dirs=(*/)

    echo ""
    printf "Select a folder you wanna copy: \n"
    echo ""

    select FOLDER_NAME in *.tar.xz *.tar.gz; do
        test -n "$FOLDER_NAME" && break
        printf "${RED}>>> Invalid Selection${NC}"
    done
}

# printing the full path

getFolderPathFunction() {

    # PATH_NAME=$(cd "$FOLDER_NAME" && pwd)
    echo ""
    printf "You selected ${FOLDER_NAME} \n"
    filename=$(basename $FOLDER_NAME)
    FOLDER_SUFFIX=${filename##*.}
    echo ""
}

extractFolderFunction() {
    #checking if its a tar file or normal so to extract

    if [ "${FOLDER_SUFFIX}" == 'xz' ] || [ "${FOLDER_SUFFIX}" == 'gz' ]; then
        read -p "Is this a 1 => theme || 2 => icon/cursor " INPUTNUM

        if [[ ${INPUTNUM} -eq 1 ]]; then
            printf "unziping the file ... $FOLDER_NAME \n"
            echo ""
            sleep 1.2
            tar -xf ${FOLDER_NAME} -C /usr/share/themes

            if [[ ${?} -ne 0 ]]; then
                printf "${RED}report errors at https://github.com/yashkathe/script-for-adding-themes-and-icons ${NC}"
                echo ""
                exit 1
            else
                printf "${GREEN}Successfully placed the folders${NC}\n"
            fi
        fi

        if [[ ${INPUTNUM} -eq 2 ]]; then
            printf "unziping the file ... $FOLDER_NAME \n"
            echo ""
            sleep 1.2
            tar -xf ${FOLDER_NAME} -C /usr/share/icons

            if [[ ${?} -ne 0 ]]; then
                printf "${RED}report errors at https://github.com/yashkathe/script-for-adding-themes-and-icons ${NC}"
                echo ""
                exit 1
            else
                printf "${GREEN}Successfully placed the folders${NC}\n"
            fi
        fi
    else
        printf "${RED}Something Went Wrong${NC}"
    fi

}

deleteFolderFunction() {
    read -p "Delete the tar.xz folder now ? (Y/n): " DELETE_FOLDER
    echo ""

    if [[ ${DELETE_FOLDER} == "Y" ]] || [[ ${DELETE_FOLDER} == "y" ]] || [[ ${DELETE_FOLDER} == "" ]]; then
        rm -rf ${FOLDER_NAME}
        sleep 1
        printf "deleting ...\n"
        sleep 1.2
        printf "${GREEN}Deleted folder successfully ${NC}\n"
        printf "${GREEN}All Operations Completed Successfully. ${NC}\n"
        printf "${GREEN}exiting now. ${NC}\n"
    else
        printf "${RED}Not deleting the folder ${NC}\n"
        printf "${RED}exiting now ${NC}\n"
    fi

}

helpFunction() {
    echo ""
    echo "Source Code: https://github.com/yashkathe/script-for-adding-themes-and-icons"
    echo ""
}

case "${1}" in
--start)
    initFunction
    readFoldersFunction
    getFolderPathFunction
    extractFolderFunction
    deleteFolderFunction
    ;;
--help)
    helpFunction
    ;;
*)
    initFunction
    readFoldersFunction
    getFolderPathFunction
    extractFolderFunction
    deleteFolderFunction
    ;;
esac
