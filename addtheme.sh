#!/bin/bash

#Global variables
PATH_NAME=$()
FOLDER_NAME=$()
FOLDER_PREFIX=$()
FOLDER_SUFFIX=$()
PASTE_NUM=$()
ISZIP=$()
filename=$()

#starting function

initFunction() {
	echo "Hello $(id -un)"
	sleep 0.5s
	if [[ ${UID} -eq 0 ]]; then
		echo "Starting ... "
		sleep 1s
		echo "Make sure you are running the script from where the folders are located"
		echo "Icons and Cursors are located in /usr/share/icons"
		echo "Themes are located in /usr/share/themes"
		sleep 1s
	else
		echo "ERROR ! start this script as root"
		echo "exiting ..."
		exit 1
	fi
}

#reading and saving the file you wanna copy

readFoldersFunction() {
	dirs=(*/)

	echo ""
	echo "select a folder you wanna copy"
	echo ""

	printf "Please select file:\n"

	select FOLDER_NAME in *.tar.xz; do
		test -n "$FOLDER_NAME" && break
		echo ">>> Invalid Selection"
	done

	echo "you selected $FOLDER_NAME"

}

# printing the full path

getFolderPath() {

	# PATH_NAME=$(cd "$FOLDER_NAME" && pwd)

	echo ""
	echo "You selected '$FOLDER_NAME'"
	echo ""
	filename=$(basename $FOLDER_NAME)
	FOLDER_SUFFIX=${filename##*.}
}

extractFolder() {
	#checking if its a tar file or normal so to extract

	if [[ "${FOLDER_SUFFIX}" -eq 'xz' ]]; then
		echo ""
		echo "unziping the file ... $FOLDER_NAME "
		tar -xf ${FOLDER_NAME}
		sleep 1s
		FOLDER_PREFIX=${filename%%.*}
		echo "folder just unzipped was $FOLDER_PREFIX"
	else
		echo "not xz"
	fi
}

pasteFoldersFunction() {
	echo ""
	read -p "Enter: 1 if this is a theme | Enter: 2 for icons and cursor: " PASTE_NUM

	if [[ ${PASTE_NUM} -eq 1 ]]; then
		mv ${FOLDER_PREFIX} /home/themes
	elif [[ ${PASTE_NUM} -eq 2 ]]; then
		mv ${FOLDER_PREFIX} /home/icons
	else
		echo "enter correct folder"
	fi
}

exitFunction() {
	echo "start this script with --start"
}

case "${1}" in
--start)
	initFunction
	readFoldersFunction
	getFolderPath
	extractFolder
	pasteFoldersFunction
	;;
*)
	exitFunction
	;;
esac

	*)
	exitFunction
	;;
esac

