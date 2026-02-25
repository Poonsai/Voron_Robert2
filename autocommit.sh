#!/bin/bash
set -e

#######################################################################
## NOTE: This script originates from here but I tweaked the pull     ##
## command, changed default location for backup, and added a comment ##
## for reference later.                                              ##
#######################################################################

#####################################################################
### Please set the paths accordingly. In case you don't have all  ###
### the listed folders, just keep that line commented out.        ###
#####################################################################
### Path to your config folder you want to backup
config_folder=~/printer_data/config

# NOTE: The above should work for just about everyone, but a somewhat
# recent update to moonraker changed paths, etc. You can run the 
# provided moonraker script 'data-path-fix.sh' to fix/update
# older installs

### Path to your Klipper folder, by default that is '~/klipper'
klipper_folder=~/klipper

### Path to your Moonraker folder, by default that is '~/moonraker'
moonraker_folder=~/moonraker

### Path to your Mainsail folder, by default that is '~/mainsail'
mainsail_folder=~/mainsail

### Path to your Fluidd folder, by default that is '~/fluidd'
#fluidd_folder=~/fluidd

### The branch of the repository that you want to save your config
### By default that is 'main'
branch=main

db_file=~/printer_data/database/moonraker-sql.db

# Set to true to see what would be committed without pushing
DRY_RUN=false

#####################################################################
#####################################################################



#####################################################################
################ !!! DO NOT EDIT BELOW THIS LINE !!! ################
#####################################################################
log(){
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

grab_version(){
    m1=""
    m2=""
    m3=""
    m4=""
    
    if [ -n "$klipper_folder" ] && [ -d "$klipper_folder/.git" ]; then
        klipper_commit=$(git -C "$klipper_folder" describe --always --tags --long 2>/dev/null | awk '{gsub(/^ +| +$/,"")} {print $1}')
        m1="Klipper version: $klipper_commit"
        log "Found Klipper: $klipper_commit"
    fi
    if [ -n "$moonraker_folder" ] && [ -d "$moonraker_folder/.git" ]; then
        moonraker_commit=$(git -C "$moonraker_folder" describe --always --tags --long 2>/dev/null | awk '{gsub(/^ +| +$/,"")} {print $1}')
        m2="Moonraker version: $moonraker_commit"
        log "Found Moonraker: $moonraker_commit"
    fi
    if [ -n "$mainsail_folder" ] && [ -f "$mainsail_folder/.version" ]; then
        mainsail_ver=$(head -n 1 "$mainsail_folder/.version" 2>/dev/null)
        m3="Mainsail version: $mainsail_ver"
        log "Found Mainsail: $mainsail_ver"
    fi
    if [ -n "$fluidd_folder" ] && [ -f "$fluidd_folder/.version" ]; then
        fluidd_ver=$(head -n 1 "$fluidd_folder/.version" 2>/dev/null)
        m4="Fluidd version: $fluidd_ver"
        log "Found Fluidd: $fluidd_ver"
    fi
}

backup_db(){
    if [ -f "$db_file" ]; then
        if [ -f "$config_folder/.gitignore" ] && grep -q "moonraker-sql.db" "$config_folder/.gitignore" 2>/dev/null; then
            log "Database ignored in .gitignore, skipping backup"
        else
            log "SQLite database found. Copying..."
            cp "$db_file" "$config_folder/"
        fi
    else
        log "SQLite database not found at $db_file"
    fi
}

push_config(){
    cd "$config_folder"
    
    # Check for changes
    if [ -z "$(git status --porcelain)" ]; then
        log "No changes to commit"
        return 0
    fi
    
    log "Changes detected, proceeding with commit..."
    
    git pull origin "$branch" --no-rebase
    
    git add .
    current_date=$(date +"%Y-%m-%d %H:%M:%S")
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would commit with message: Autocommit from $current_date"
        log "Would include: $m1 | $m2 | $m3 | $m4"
        return 0
    fi
    
    git commit -m "Autocommit from $current_date" -m "$m1" -m "$m2" -m "$m3" -m "$m4"
    log "Commit created, pushing..."
    git push origin "$branch"
    log "Push complete"
}

log "Starting autocommit script..."
grab_version
backup_db
push_config
log "Done!"
