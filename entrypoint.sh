#!/bin/bash
set -euo pipefail

# Logging function with timestamps
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $@"
}

download_and_extract() {
    local dir="$1"
    local path="./data/$dir"
    if [ ! -d "$path" ]; then
        log "$dir directory not found. Downloading..."
        mkdir -p ./data
        cd ./data

        local zipfile="assets-master.zip"
        local repo_url="https://github.com/tibia-oce/assets/archive/refs/heads/master.zip"

        # Download the zip file
        if wget -q --show-progress "$repo_url" -O "$zipfile"; then
            log "Downloaded $zipfile successfully."
        else
            log "Error downloading $zipfile from $repo_url"
            exit 1
        fi

        # Unzip the specific directory
        if unzip -q "$zipfile" "assets-master/$dir/*" -d .; then
            log "Extracted $dir from $zipfile successfully."
        else
            log "Error extracting $dir from $zipfile"
            exit 1
        fi

        # Move and clean up
        mv assets-master/"$dir" ./"$dir"
        rm -rf assets-master "$zipfile"
        cd ..
    else
        log "$dir directory already exists. Skipping download."
    fi
}

# Download and extract necessary directories
download_and_extract "world"
download_and_extract "items"

# Start the executable
if [ -x "./Black-Tek-Server" ]; then
    log "Starting Black-Tek-Server...\n"
    exec ./Black-Tek-Server
else
    log "Executable ./Black-Tek-Server not found or not executable."
    exit 1
fi
