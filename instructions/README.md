# Instructions Index

Documentation for all scripts and macros in this project.

## Scripts (Root)

| File | Description |
|------|-------------|
| [autocommit.sh](autocommit.md) | Automatic Git backup script |
| [generate_shaper_graph.sh](generate_shaper_graph.md) | Generate input shaper graphs |

## Macros (macros/)

| File | Description |
|------|-------------|
| [end_print.cfg](end_print.cfg) | End print with auto cleanup |
| [material_presets.cfg](material_presets.md) | PLA/PETG/ABS/TPU presets |
| [filament_change.cfg](filament_change.md) | Mid-print filament change |

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
