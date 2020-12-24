#!/bin/bash

folders=($(find -type d -name "export"))

echo "toto"

folder_handler () {
  for picture in $1/*.jpg
  do
    picture=${picture/.\//}
    picture=${picture/\/export\//_}
    picture=${picture/\//_}
    echo $picture

  done
}

for curr_folder in "${folders[@]}"
do
  folder_handler $curr_folder
done
