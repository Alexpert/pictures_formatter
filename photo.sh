#!/bin/bash

folders=($(find -type d -name "Export"))


folder_handler () {
  numFiles=$(ls $1/*.jpg | wc -l)
  indexFile=0
  for picture in $1/*.jpg
  do
    echo -e "\tShrinking photo $indexFile of $numFiles: $picture"
    ((indexFile+=1))
    identity=$(identify $picture 2> /dev/null)
    if [ "$identity" != '' ]
    then
        exportFile=${picture/.\//}
        exportFile=${exportFile/\/Export\//_}
        exportFile=${exportFile/\//_}
        
        convert $picture -resize 1920x1920 resize/$exportFile
    fi
  done
}

mkdir resize
numDir=${#folders[@]}
indexDir=0
for curr_folder in "${folders[@]}"
do
  ((indexDir+=1))
  echo -e "\nDir $indexDir of $numDir : $curr_folder"
  folder_handler $curr_folder
done
