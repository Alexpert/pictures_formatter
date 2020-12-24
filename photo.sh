#!/bin/bash

folders=($(find -type d -name "export"))

folder_handler () {
  for picture in $1**/export/*.jpg
  do
    IFS='/'
    read -r -a array <<< "$picture"
    echo $1'_'${array[-1]}
  done
}

for curr_folder in "${folders[@]}"
do
  echo $curr_folder
  folder_handler $curr_folder
done
