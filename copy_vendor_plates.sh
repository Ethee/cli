#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <source_path_with_range>"
	exit 1
fi

# Split the source path into the base path and the range
source_path_with_range=$1
destination_directory=$2

IFS=',' read -ra ADDR <<<"$source_path_with_range"
source_path=${ADDR[0]}
range=${ADDR[1]}

# Split the range into the start and end
IFS='-' read -ra RANGE <<<"$range"
start=${RANGE[0]}
end=${RANGE[1]}

# Extract the project path from the source path
IFS='/' read -ra PATH_PARTS <<<"$source_path"
client_delivery="${PATH_PARTS[0]}/${PATH_PARTS[1]}/${PATH_PARTS[2]}/client_deliveries"

# Check if today's client delivery directory exists
today=$(date +%Y%m%d)
if [ ! -d "$client_delivery/$today" ]; then
	mkdir -p "$client_delivery/$today"
fi

# Check if the destination directory exists
if [ ! -d "$client_delivery/$today/vendor" ]; then
	mkdir -p "$client_delivery/$today/vendor"
fi

destination_directory="$client_delivery/$today/vendor/"

# Copy each file in the range to the destination directory
for ((i = start; i <= end; i++)); do
	# Generate the source file path
	source_file=$(printf "$source_path" $i)

	# Copy the file to the destination directory
	echo "rsync -av $source_file $destination_directory"
done
