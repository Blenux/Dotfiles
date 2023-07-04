#!/bin/bash

# Array of source files and folders to symlink
declare -a sources=(
  # "source_file1"
  # "source_folder1"
  "test"
  # ".bashrc"
  # ".config"
)

# Destination directory
destination="$HOME/"

# Loop through the sources and create symlinks
for source in "${sources[@]}"; do
  # Get the basename of the source
  base=$(basename "$source")

  # Check if the file/folder already exists in the destination directory
  if [[ -e "${destination}/${base}" ]]; then
    # Move the existing file/folder to a backup file
    mv "${destination}/${base}" "${destination}/${base}.BK"
    echo "Moved ${destination}/${base} to ${destination}/${base}.BK"
  fi

  # Create symlink
  ln -sfn "$(realpath "$source")" "${destination}/${base}"
done
