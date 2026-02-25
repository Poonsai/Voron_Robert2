# restore.sh

Restore Klipper config from GitHub backup.

## Features

- Backs up current config before restoring
- Fetches latest from GitHub
- Restores all config files
- Restores Moonraker database
- Clear instructions for next steps

## Usage

```bash
# Make executable
chmod +x ~/printer_data/config/instructions/restore.sh

# Run restore (from Pi)
sh ~/printer_data/config/instructions/restore.sh

# Or restore from specific branch
sh ~/printer_data/config/instructions/restore.sh backup
```

## What It Does

1. Checks for existing git repository
2. Creates timestamped backup of current config
3. Fetches latest from GitHub
4. Restores files to config folder
5. Restores Moonraker database if present

## After Restore

1. Restart Klipper:
   ```bash
   sudo systemctl restart klipper
   ```

2. Verify config in Mainsail

3. If issues, manually restore from backup:
   ```bash
   cp -r ~/printer_data/config_backup_YYYYMMDD_HHMMSS/* ~/printer_data/config/
   ```

## Database Restore Note

After restoring the database, you MUST restart Moonraker:
```bash
sudo systemctl restart moonraker
```

Or the printer may show as "disconnected" in Mainsail.