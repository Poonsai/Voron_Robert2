# autocommit.sh

Automatic backup script that commits config changes to GitHub.

## Features

- Skips commit if no changes detected (prevents empty commits)
- Backs up Moonraker SQLite database
- Captures Klipper, Moonraker, Mainsail version info in commit message
- Dry-run mode for testing
- Logging with timestamps

## Configuration

Edit these variables at the top of the script:

```bash
config_folder=~/printer_data/config     # Your Klipper config directory
klipper_folder=~/klipper               # Klipper installation
moonraker_folder=~/moonraker           # Moonraker installation  
mainsail_folder=~/mainsail             # Mainsail installation
branch=main                            # Git branch to push to
db_file=~/printer_data/database/moonraker-sql.db  # Database location
DRY_RUN=false                          # Set to true to test without pushing
```

## Usage

Run manually:
```bash
sh ~/printer_data/config/autocommit.sh
```

Or trigger from Klipper console:
```
RUN_SHELL_COMMAND CMD=backup_cfg
```

Or use the macro:
```
BACKUP_CFG
```

## Dry Run Mode

To test without pushing:
```bash
DRY_RUN=true sh ~/printer_data/config/autocommit.sh
```

## Notes

- The script checks if `moonraker-sql.db` is in `.gitignore` before backing it up
- If no changes are detected, the script exits gracefully without creating a commit
- Version info is captured from Git describe tags and .version files
