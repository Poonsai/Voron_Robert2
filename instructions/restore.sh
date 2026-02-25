#!/bin/bash
set -e

#######################################################################
## restore.sh
## Restore Klipper config from GitHub backup
#######################################################################

CONFIG_FOLDER=~/printer_data/config
DB_FILE=~/printer_data/database/moonraker-sql.db
GIT_REPO="https://github.com/Poonsai/Voron_Robert2.git"

log(){
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

usage(){
    echo "Usage: $0 [branch]"
    echo "  branch: Git branch to restore from (default: main)"
    echo ""
    echo "Example:"
    echo "  $0          # Restore from main branch"
    echo "  $0 backup   # Restore from backup branch"
    exit 1
}

# Get branch from argument or use default
BRANCH=${1:-main}

log "Starting restore from branch: $BRANCH"

# Check if git repo exists
if [ -d "$CONFIG_FOLDER/.git" ]; then
    log "Git repository found in $CONFIG_FOLDER"
else
    log "No git repository found. This script expects to run on the Pi with existing config."
    log "The config folder should already be initialized with this repository."
    log "Git repo: $GIT_REPO"
    exit 1
fi

# Backup current config (keep as backup)
BACKUP_FOLDER="${CONFIG_FOLDER}_backup_$(date +%Y%m%d_%H%M%S)"
log "Creating backup of current config to: $BACKUP_FOLDER"
cp -r "$CONFIG_FOLDER" "$BACKUP_FOLDER"

# Fetch latest from remote
log "Fetching latest from origin/$BRANCH..."
git fetch origin "$BRANCH"

# Reset to latest commit
log "Restoring files..."
git checkout origin/"$BRANCH" -- .

# Restore database if it exists in backup
if [ -f "$BACKUP_FOLDER/moonraker-sql.db" ]; then
    log "Restoring Moonraker database..."
    cp "$BACKUP_FOLDER/moonraker-sql.db" "$DB_FILE"
    log "Database restored. Restart Moonraker to apply."
fi

log "Restore complete!"
log "Backup kept at: $BACKUP_FOLDER"
log ""
log "Next steps:"
log "1. Restart Klipper: sudo systemctl restart klipper"
log "2. Check config is working in Mainsail"
log "3. If issues, restore from backup: cp -r $BACKUP_FOLDER/* $CONFIG_FOLDER/"
