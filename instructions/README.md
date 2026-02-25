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
| [print_start.md](print_start.md) | Print start sequence |
| [end_print.md](end_print.md) | End print with auto cleanup |
| [cancel_print.md](cancel_print.md) | Cancel print with cleanup |
| [material_presets.md](material_presets.md) | PLA/PETG/ABS/TPU presets |
| [filament_change.md](filament_change.md) | Mid-print filament change |
| [load_unload_filament.md](load_unload_filament.md) | Basic load/unload filament |
| [nozzle_scrub.md](nozzle_scrub.md) | Nozzle cleaning macro |
| [homing.md](homing.md) | Custom homing with higher current |
| [test_speed.md](test_speed.md) | Speed/accel testing |
| [pid_tune.md](pid_tune.md) | PID tuning for heaters |
| [pause_print_stats.md](pause_print_stats.md) | Advanced pause & print stats |

## Configuration (configs/)

| File | Description |
|------|-------------|
| [filament_runout.md](filament_runout.md) | Filament runout sensor |
| [powerloss.md](powerloss.md) | Power loss recovery |

## Configuration Reference

| File | Description |
|------|-------------|
| [config_reference.md](config_reference.md) | Core config files overview |

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

### Print start/end:
```
PRINT_START BED=60 EXTRUDER=210
END_PRINT
CANCEL_PRINT
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

### Test speed:
```
TEST_SPEED
```

### PID tuning:
```
PID_TUNE_BED
PID_TUNE_EXTRUDER
PID_TUNE_ALL
```

### Pause/Resume:
```
PAUSE
RESUME
PRINT_STATUS
```

### Print stats:
```
PRINT_STATS
JOB_STATUS
```

### Home:
```
G28
```
