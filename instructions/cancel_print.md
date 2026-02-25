# macros/cancel_print.cfg

Cancel print macro with cleanup routine.

## Macro

### CANCEL_PRINT

Cancels current print and performs cleanup. Overrides Klipper's default.

**Features:**
- Smart filament retraction based on temperature
- Turns off heaters
- Clears pause state
- Cleans nozzle
- Parks

**Usage nozzle:**
```
CANCEL_PRINT
```

Or from Mainsail/Fluidd UI button.

---

## Sequence

```
CANCEL_PRINT (rename_existing: BASE_CANCEL_PRINT)
  └── Wait for move buffer (M400)
  └── Zero extruder (G92 E0)
  └── Retract filament (15mm if >220°C, 5mm otherwise)
  └── TURN_OFF_HEATERS
  └── CLEAR_PAUSE
  └── SDCARD_RESET_FILE
  └── Move up 1mm, away 20mm X/Y
  └── TURN_OFF_HEATERS
  └── CLEAN_NOZZLE
  └── Turn off fan (M107)
  └── Move up 4mm
  └── Park at X175 Y340
  └── Turn off Nevermore
```

---

## Smart Retraction

The macro automatically adjusts retraction based on nozzle temperature:

| Temp | Retraction |
|------|------------|
| > 220°C (PETG/ABS) | 15mm |
| <= 220°C (PLA) | 5mm |

This prevents strings at high temps while being gentle on PLA.

---

## Slicer Integration

Configure in slicer:

**Cura:**
```
Cancel button: CANCEL_PRINT
```

**PrusaSlicer:**
In Print Settings > Output Options > Output file:
```
After print job: CANCEL_PRINT
```

Or simply press Cancel in Mainsail/Fluidd UI.

---

## Customization

### Change park position

Edit line 22:
```python
G0 X175 Y340 F3600  # Change X175 Y340 to desired position
```

### Change retraction amounts

Edit lines 8-10:
```python
{% if printer[printer.toolhead.extruder].target > 220 %}
    G1 E-20.0 F3600  # Increase for more retraction
{% else %}
    G1 E-8.0 F3600   # Increase for PLA
{% endif %}
```

### Disable nozzle cleaning

Comment out line 18:
```python
#CLEAN_NOZZLE
```
