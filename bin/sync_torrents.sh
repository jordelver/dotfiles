#!/bin/bash
#
# Requires `rsync`
#
# Create ~/.sync_torrents with the following key/values
#
# TRANSFERRED_LOG_FILE=<value>
# LOCK_FILE=<value>
# DOWNLOAD_DIRECTORY=<value>
# REMOTE=<value>
#

if [ ! -f ~/.sync_torrents ]; then
  echo "~/.sync_torrents config file not found"
  exit
fi

source ~/.sync_torrents

# Check if the job is already running, we don't want to run twice
if [ -e $LOCK_FILE ]
then
  echo "Torrent sync job already running...exiting"
  exit
fi

# Create a lock file for the check above...
touch $LOCK_FILE

# ...make sure the lock file is deleted after exit
trap 'rm $LOCK_FILE' EXIT

# Clean rsync output to get escaped file names
function clean() {
  awk 'NR > 2'     | # Remove first 2 lines
  head -n-3        | # Remove last 3 lines
  sed 's|\[|\\\[|' | # Escape [ characters
  sed 's|\]|\\\]|'i  # Escape ] characters
}

while [ 1 ]
do
  rsync -azsv --partial $REMOTE:completed/ $DOWNLOAD_DIRECTORY --exclude-from=$TRANSFERRED_LOG_FILE \
    | tee >(clean >> $TRANSFERRED_LOG_FILE)

  if [ "$?" = "0" ] ; then
    echo "Rsync completed normally"
    exit
  else
    echo "Rsync failure. Backing off and retrying..."
    sleep 180
  fi
done
