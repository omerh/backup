#!/bin/bash

set -e

function backup {
  restic --repo ~/Dropbox/Backups/restic-backup backup \
    --files-from ./backup_list.txt \
    --exclude="node_modules" --exclude=".terraform" \
    --exclude=".m2"
}

function rotate {
  restic --repo ~/Dropbox/Backups/restic-backup forget --keep-last 4
}

function health {
  restic -r  ~/Dropbox/Backups/restic-backup check --read-data
}

function dedup {
  restic -r  ~/Dropbox/Backups/restic-backup prune
}

function move {
  cd `dirname "$0"`
}

move
backup
health
rotate
dedup