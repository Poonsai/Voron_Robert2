# macros/filament_change.cfg

Filament change macros for mid-print material swaps.

## Macros

### CHANGE_FILAMENT

Pauses print and guides through filament change process.

**Features:**
- Pauses current print
- Heats to unload temperature
- Unloads current filament
- Waits for user to load new filament
- Heats to print temperature
- Primes new filament
- Cleans nozzle
- Optionally resumes print

**Parameters:**

| Parameter | Default | Description |
|-----------|---------|-------------|
| TEMP | 210 | Target temperature for printing (°C) |
| UNLOAD_TEMP | 180 | Temperature for unloading (°C) |
| RESUME | true | Auto-resume after change |

**Usage:**
```
CHANGE_FILAMENT              # Use defaults (210°C print, 180°C unload)
CHANGE_FILAMENT TEMP=240    # Change to PETG (240°C)
CHANGE_FILAMENT TEMP=250 RESUME=false  # Load filament, don't resume
```

**Workflow:**
1. Macro pauses the print
2. Heats to UNLOAD_TEMP (180°C default)
3. Unloads filament (50mm + 50mm + 50mm)
4. Displays "Please load new filament"
5. Waits for you to load new filament
6. Heats to TEMP (210°C default)
7. Primes new filament (50mm + 20mm)
8. Cleans nozzle
9. Resumes print (if RESUME=true)

---

### RESUME_PRINT

Alias for Klipper's built-in RESUME command.

**Usage:**
```
RESUME_PRINT
```

Or use directly:
```
RESUME
```

---

## Detailed Usage

### Basic filament change:
```
CHANGE_FILAMENT
```
- Pauses print
- Heats to 180°C
- Unloads old filament
- Prompts you to load new filament
- Heats to 210°C
- Primes new filament
- Cleans nozzle
- Resumes print

### Change to different material:
```
CHANGE_FILAMENT TEMP=240
```
- Same as above but heats to 240°C for PETG/ABS

### Load filament without resuming:
```
CHANGE_FILAMENT RESUME=false
```
- Useful when you want to load filament but not immediately resume
- After loading, manually run `RESUME`

---

## Non-Printing Usage

When NOT printing, use these simpler macros:

### Load filament:
```
LOAD_FILAMENT
```
- Loads 150mm of filament
- Only works when NOT printing

### Unload filament:
```
UNLOAD_FILAMENT
```
- Unloads filament
- Cools, retracts, unloads
- Only works when NOT printing

---

## Safety

- These macros only work when printer is in (for "Printing" state CHANGE_FILAMENT)
- LOAD_FILAMENT and UNLOAD_FILAMENT check if printing and refuse if active
- Temperature waits ensure proper heating before extrusion

## Customization

### Change default temperatures:

Edit the macro parameters:
```python
[gcode_macro CHANGE_FILAMENT]
description: Pause print and guide through filament change
gcode:
    {% set temp = params.TEMP|default(210)|int %}      # Change default
    {% set unload_temp = params.UNLOAD_TEMP|default(180)|int %}  # Change default
```

### Add custom material presets:

Create your own macro:
```
[gcode_macro LOAD_PETG]
gcode:
    CHANGE_FILAMENT TEMP=240 UNLOAD_TEMP=180
```
