#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <project_name> <shot_prefix>"
	exit 1
fi

# Assign the arguments to variables
project_name=$1
shot_prefix=$2

dir_prefix="/lola/projects/$project_name/shots"

if [ ! -d "~/pulled_shots" ]; then
	mkdir "~/pulled_shots"
fi

if [ ! -d "~/pulled_shots/$project_name" ]; then
	mkdir "~/pulled_shots/$project_name"
fi

# Find all directories with the given prefix in the specific directory
for dir in "/$dir_prefix/$shot_prefix"*; do
	$shot_name = $(basename $dir)
	# Check if the directory exists and is a directory
	if [ -d "$dir" ]; then
		latest_date_folder=$(ls "$dir_prefix/$shot_name/images/2d_renders/comps" | sort -r | head -n 1)
		if [ ! -z $latest_date_folder ]; then
			mkdir "~/pulled_shots/$project_name/$shot_name/$comp"
			ln -s "$latest_date_folder"/* "~/pulled_shots/$project_name/$shot_name/$comp/"
		fi
		# Copy all files from the specific subdirectory to the new location
		ln -s "$dir/images/plates"/* "~/pulled_shots/$project_name/"
	fi
done
