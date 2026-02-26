# macros/z_offset.cfg

Save and load z-offset for different filament types.

## Macros

### SAVE_Z_OFFSET

Save current z-offset for a material.

```
SAVE_Z_OFFSET                    # Save as "default"
SAVE_Z_OFFSET MATERIAL=pla     # Save as "pla"
SAVE_Z_OFFSET MATERIAL=petg     # Save as "petg"
```

### LOAD_Z_OFFSET

Load saved z-offset.

```
LOAD_Z_OFFSET
LOAD_Z_OFFSET MATERIAL=pla
```

### LIST_Z_OFFSETS

List all saved z-offsets.

```
LIST_Z_OFFSETS
```

### QUICK_Z_OFFSET

Quick adjust during print.

```
QUICK_Z_OFFSET ADJUST=0.01    # Add 0.01mm
QUICK_Z_OFFSET ADJUST=-0.01   # Subtract 0.01mm
```

---

## Usage

After calibrating z-offset:

```
CALIBRATE_Z_OFFSET
SAVE_Z_OFFSET MATERIAL=pla
```

Before printing different material:

```
LOAD_Z_OFFSET MATERIAL=petg
CALIBRATE_Z_OFFSET   # Apply the offset
```

Note: True z-offset change requires probe recalibration.
