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
		echo ""
		echo "Make sure you are running the script from where the folders are located"
		echo ""
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
}

# printing the full path

getFolderPathFunction() {

	# PATH_NAME=$(cd "$FOLDER_NAME" && pwd)

	echo ""
	echo "You selected '$FOLDER_NAME'"
	echo ""
	filename=$(basename $FOLDER_NAME)
	FOLDER_SUFFIX=${filename##*.}
}

extractFolderFunction() {
	#checking if its a tar file or normal so to extract

	if [[ "${FOLDER_SUFFIX}" -eq 'xz' ]]; then
		echo ""
		echo "unziping the file ... $FOLDER_NAME "
		sleep 1.2
		tar -xf ${FOLDER_NAME}

		#exit if there is a error

		if [[ ${?} -ne 0 ]]; then
			echo ""
			echo "report errors at https://github.com/yashkathe/script-for-adding-themes-and-icons"
			echo ""
			exit 1
		else
			FOLDER_PREFIX=${filename%%.*}
			echo ""
			echo "folder just unzipped was $FOLDER_PREFIX"
			echo ""
		fi

	else
		echo "not xz"
	fi
}

pasteFoldersFunction() {
	echo ""
	read -p "Enter: 1 if this is a theme | Enter: 2 for icons/cursor: " PASTE_NUM

	if [[ ${PASTE_NUM} -eq 1 ]]; then
		mv ${FOLDER_PREFIX} /usr/share/themes
		if [[ ${?} -ne 0 ]]; then
			echo ""
			echo "report errors at https://github.com/yashkathe/script-for-adding-themes-and-icons"
			echo "exiting now"
			echo ""
			exit 1
		else
			echo ""
			echo "file moved successfully"
			echo ""
		fi
	elif [[ ${PASTE_NUM} -eq 2 ]]; then
		sleep 1.5
		mv ${FOLDER_PREFIX} /usr/share/icons
		if [[ ${?} -ne 0 ]]; then
			echo ""
			echo "report errors at https://github.com/yashkathe/script-for-adding-themes-and-icons"
			echo "exiting now"
			echo ""
			exit 1
		else
			echo ""
			echo "file moved successfully"
			echo ""
		fi
	else
		echo "enter correct folder"
	fi
}

helpFunction() {
	echo ""
	echo "Source Code: https://github.com/yashkathe/script-for-adding-themes-and-icons"
	echo ""
}

exitFunction() {
	echo "start this script with --start"
}

case "${1}" in
--start)
	initFunction
	readFoldersFunction
	getFolderPathFunction
	extractFolderFunction
	pasteFoldersFunction
	;;
--help)
	helpFunction
	;;
*)
	initFunction
	readFoldersFunction
	getFolderPathFunction
	extractFolderFunction
	pasteFoldersFunction
	;;
esac
