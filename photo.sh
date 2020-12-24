#!/bin/bash

folders=($(find -type d -name "export"))

folder_handler () {
  for picture in $1/*.jpg
  do
    echo $picture
  done
}

for curr_folder in "${folders[@]}"
do
  folder_handler $curr_folder
done
