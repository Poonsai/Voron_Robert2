# macros/material_presets.cfg

Quick temperature and settings presets for common filament types.

## Macros

### SET_PLA

Sets optimal temperatures for PLA filament.

**Settings:**
- Nozzle: 205°C
- Bed: 60°C
- Fan: 100%
- Retraction: 0.8mm
- Z-hop: 0.8mm
- Pressure Advance: 0.04

**Usage:**
```
SET_PLA
```

---

### SET_PETG

Sets optimal temperatures for PETG filament.

**Settings:**
- Nozzle: 240°C
- Bed: 80°C
- Fan: 60%
- Retraction: 0.9mm
- Z-hop: 0.8mm
- Pressure Advance: 0.045

**Usage:**
```
SET_PETG
```

---

### SET_ABS

Sets optimal temperatures for ABS filament.

**Settings:**
- Nozzle: 250°C
- Bed: 100°C
- Fan: 30%
- Retraction: 1.0mm
- Z-hop: 1.0mm
- Pressure Advance: 0.05

**Usage:**
```
SET_ABS
```

**Warning:** Ensure enclosure is heated before printing ABS!

---

### SET_TPU

Sets optimal temperatures for TPU filament.

**Settings:**
- Nozzle: 220°C
- Bed: 50°C
- Fan: 100%
- Retraction: 0.6mm
- Z-hop: 0.5mm
- Pressure Advance: 0.03

**Usage:**
```
SET_TPU
```

**Note:** Reduce print speed for TPU!

---

### PRINT_Temps

Displays current print temperatures and settings.

**Shows:**
- Bed target temperature
- Nozzle target temperature
- Fan speed percentage
- Pressure advance value

**Usage:**
```
PRINT_Temps
```

---

## Usage Examples

### Before printing:
```
SET_PLA
# Wait for temperatures to stabilize
# Start print
```

### Check current settings:
```
PRINT_Temps
```

### Change material mid-print:
```
SET_PETG
# Wait for temperature to stabilize
# Continue printing
```

## Customization

Edit the values in each macro to match your preferences:

```python
[gcode_macro SET_PLA]
gcode:
    M104 S205    # Change nozzle temp
    M140 S60     # Change bed temp
    M106 S255    # Change fan speed (0-255)
```

## Integration with Slicer

You can call these macros from your slicer:

**Cura Start G-code:**
```
SET_PLA
```

**PrusaSlicer / SuperSlicer Start G-code:**
```
SET_PLA
```

Or set temperatures in slicer and use these macros for quick adjustments.
