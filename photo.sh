#!/bin/bash

folders=($(find -type d -name "export"))


folder_handler () {
  for picture in $1/*.jpg
  do
    identity=$(identify $picture 2> /dev/null)
    if [ "$identity" != '' ]
      then
        resolution=$(echo $identity | cut -d' ' -f3)
        echo $picture $resolution
        if [ $(echo $resolution | cut -d'x' -f1) \> $(echo $resolution | cut -d'x' -f2) ]
          then
            echo "paysage"
          else
            echo "portrait"
          fi
        picture=${picture/.\//}
        picture=${picture/\/export\//_}
        picture=${picture/\//_}
      fi
  done
}

for curr_folder in "${folders[@]}"
do
  folder_handler $curr_folder
done
