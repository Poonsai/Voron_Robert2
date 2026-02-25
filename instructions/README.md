# How-To Instructions

Documentation for all scripts and macros in this project.

## Automated Backups

| File | Description |
|------|-------------|
| [autocommit.sh](autocommit.md) | Manual backup script |
| [autocommit.service](autocommit.service) | Systemd service |
| [autocommit.timer](autocommit.timer) | Systemd timer (runs every 6h) |
| [restore.sh](restore.sh) | Restore from GitHub backup |

## Scripts (Root)

| File | Description |
|------|-------------|
| [autocommit.sh](autocommit.md) | Automatic Git backup script |
| [generate_shaper_graph.sh](generate_shaper_graph.md) | Generate input shaper graphs |

## Macros (macros/)

| File | Description |
|------|-------------|
| [end_print.md](end_print.md) | End print with auto cleanup |
| [material_presets.md](material_presets.md) | PLA/PETG/ABS/TPU presets |
| [filament_change.md](filament_change.md) | Mid-print filament change |

## Project Info

- **Printer:** Voron 2.4 350mm
- **Firmware:** Klipper
- **Controller:** BTT Octopus V1
- **Toolboard:** LDO Nitehawk-SB

## Quick Reference

### Run backup:
```
BACKUP_CFG
```

### Material presets:
```
SET_PLA
SET_PETG
SET_ABS
SET_TPU
```

### Filament change:
```
CHANGE_FILAMENT TEMP=240
```

### Check temps:
```
PRINT_Temps
```
