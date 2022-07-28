
# Bash script for adding themes and icons 

This script directly helps to directly add themes and icons to the respective folder after
you have downloaded the tar.xz file for themes and icons
## Working

The script consists of 5 main functions

1. For adding themes and icons to respective folders:

-	initFunction \
    The starting function to check if sudo is operating it 

- readFoldersFunction \
    Giving user option to select the folder 
    
- getFolderPathFunction \
    To get the path of the folder

- extractFolderFunction \
    extracting the folder using tar -xf

- deleteFolderFunction \
    delete(user choice) the tar.xz folder as it is no longer needed     

2. For deleting already existing themes and icons folders with --delete option:

-	mainDeleteFunction \
    Check if user wants to delete icons or themes folder

-	deleteTheme and deleteIcons \
    To delete themes and icons according to input received in first function 

## Download the script 

```bash
  wget https://raw.githubusercontent.com/yashkathe/script-for-adding-themes-and-icons/master/addtheme.sh
```

## Running this script

To run this script , 
extract the script in the directory where the themes and icons folders are located and run the following command


```bash
  sudo ./addtheme.sh 
```

To delete already existing themes or icons, run the script with additional argument


```bash
  sudo ./addtheme.sh --delete
```


## Screenshots

1 . Run the script with sudo \
![Step 1](https://raw.githubusercontent.com/yashkathe/script-for-adding-themes-and-icons/master/assets/step1.gif)

2 . Select the respective file.tar.xz \
![Step 2](https://raw.githubusercontent.com/yashkathe/script-for-adding-themes-and-icons/master/assets/step2.gif)

3 . Select where you want to add the unzipped folder \
![Step 3](https://raw.githubusercontent.com/yashkathe/script-for-adding-themes-and-icons/master/assets/step3.gif)

## Feedback

If you have any feedback, please reach out to me at katheyash@yahoo.com
