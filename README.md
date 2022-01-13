
# Bash script for adding themes and icons 

This script directly helps to directly add themes and icons to the respective folder after
you have downloaded the tar.xz file for themes or icons
## Algorithm

The script consists of 5 main functions

-	initFunction \
    The starting function to check if sudo is operating it 

- readFoldersFunction \
    Giving user option to select the folder 
    

- getFolderPath \
    To get the path of the folder

- extractFolder \
    extracting the folder using tar -xf

- pasteFoldersFunction \
    pasting the folder in respective folders of themes(/usr/share/themes) or icons(/usr/share/icons)
    
## Running this script

To run this script , 
extract ther file in the directory where the themes and icons folders are located and run the following command


```bash
  sudo ./theme-script.sh --start
```


## Feedback

If you have any feedback, please reach out to me at katheyash@yahoo.com
