# macros/end_print.cfg

End print macro with automated cleanup.

## Macros

### END_PRINT

Main end print routine. Called automatically at end of print (configure in slicer).

**Actions performed:**
1. Waits for move buffer to clear
2. Retracts filament (15mm)
3. Turns off bed, extruder, and fans
4. Homes X and Y axis
5. Raises nozzle 30mm
6. Cleans nozzle (CLEAN_NOZZLE)
7. Cleans purge bucket (CLEAN_PURGE_BUCKET)
8. Disables steppers
9. Sets chamber light to 80%
10. Turns off Nevermore fan
11. Clears bed mesh
12. Shows "Print complete!" notification

**Usage:**
```
END_PRINT
```

Configure in your slicer's "End G-code" section:
```
END_PRINT
```

---

### CLEAN_PURGE_BUCKET

Cleans the purge bucket after printing to prevent buildup.

**Configuration:**
Edit these variables in the macro:
```python
{% set bucket_x = 290 %}      # Bucket X position
{% set bucket_y = 350 %}      # Bucket Y position
{% set wipe_count = 3 %}      # Number of wipe passes
```

**Usage:**
```
CLEAN_PURGE_BUCKET
```

**Note:** The nozzle must be homed before this macro will run.

---

## Sequence

```
END_PRINT
  └── Retract filament (15mm)
  └── Turn off heaters/fans
  └── Home X, Y
  └── Raise Z to 30mm
  └── CLEAN_NOZZLE
  └── CLEAN_PURGE_BUCKET
  └── Disable steppers (M84)
  └── Set caselight to 80%
  └── Turn off Nevermore
  └── Clear bed mesh
  └── Print notification
```

## Customization

### Change retract distance

Edit line 5 in END_PRINT:
```python
G1 E-15.0 F3600  # Change -15.0 to desired mm
```

### Change final light brightness

Edit line 26:
```python
SET_PIN PIN=caselight VALUE=0.80  # 0.0 to 1.0
```

### Adjust bucket cleaning position

Edit variables in CLEAN_PURGE_BUCKET to match your purge bucket location.
