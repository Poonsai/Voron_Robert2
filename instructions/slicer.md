# macros/slicer.cfg

Pre-print validation and setup macros.

## Macros

### CHECK_SETUP

Show pre-print checklist.

```
CHECK_SETUP
```

Shows:
- Homing status
- Temperature status
- Filament detection
- Bed mesh status
- SD card status

### VALIDATE_PRINT

Check if printer is ready.

```
VALIDATE_PRINT
```

Returns error if:
- Not homed
- Bed not at temp
- Hotend not at temp

### QUICK_START

Home, heat, and validate in one command.

```
QUICK_START              # Default temps
QUICK_START BED=80 HOTEND=240
```

---

## Usage

Before every print:

```
CHECK_SETUP
VALIDATE_PRINT
```

Or use quick start:

```
QUICK_START BED=60 HOTEND=210
```
