#!/bin/bash

folders=($(find -type d -name "export"))


folder_handler () {
  for picture in $1/*.jpg
  do
    identity=$(identify $picture 2> /dev/null)
    if [ "$identity" != '' ]
      then
        
        echo $picture' is valid'
      fi
    picture=${picture/.\//}
    picture=${picture/\/export\//_}
    picture=${picture/\//_}

  done
}

for curr_folder in "${folders[@]}"
do
  folder_handler $curr_folder
done
