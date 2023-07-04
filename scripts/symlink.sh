#!/bin/bash

# Check if script is run with sudo
if [ "$(id -u)" -ne 0 ]; then
  echo "This script requires superuser privileges. Please run it with sudo."
  exit 1
fi

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

# Get the original user's home directory
original_home=$(eval echo ~$SUDO_USER)

# Loop through the sources and create symlinks
for source in "${sources[@]}"; do
  # Get the basename of the source
  base=$(basename "$source")

  # Check if the file/folder already exists in the destination directory
  if [[ -e "${destination}/${base}" ]]; then
    # Check if a backup file already exists
    if [[ -e "${destination}/${base}.BK" ]]; then
      echo "Backup file ${destination}/${base}.BK already exists. Skipping..."
      continue
    fi

    # Move the existing file/folder to a backup file
    mv -n "${destination}/${base}" "${destination}/${base}.BK"
    echo "Moved ${destination}/${base} to ${destination}/${base}.BK"
  fi

  # Create symlink in the original user's home directory
  ln -sfn "$(realpath "$source")" "${destination}/${base}"
done
