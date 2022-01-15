
# Bash script for adding themes and icons 

This script directly helps to directly add themes and icons to the respective folder after
you have downloaded the tar.xz file for themes or icons
## Working

The script consists of 5 main functions

-	initFunction \
    The starting function to check if sudo is operating it 

- readFoldersFunction \
    Giving user option to select the folder 
    

- getFolderPathFunction \
    To get the path of the folder

- extractFolderFunction \
    extracting the folder using tar -xf

- pasteFoldersFunction \
    pasting the folder in respective folders of themes(/usr/share/themes) or icons(/usr/share/icons)
    
## Running this script

To run this script , 
extract the script in the directory where the themes and icons folders are located and run the following command


```bash
  sudo ./addtheme.sh 
```


## Screenshots

1  Run the script with sudo \
![Step 1](https://raw.githubusercontent.com/yashkathe/script-for-adding-themes-and-icons/master/assets/stepOne.gif)

2  Select the respective file.tar.xz \
![Step 2](https://raw.githubusercontent.com/yashkathe/script-for-adding-themes-and-icons/master/assets/stepTwo.gif)

3  Select if where you want to add the unzipped folder \
![Step 3](https://raw.githubusercontent.com/yashkathe/script-for-adding-themes-and-icons/master/assets/stepThree.gif)

## Feedback

If you have any feedback, please reach out to me at katheyash@yahoo.com
