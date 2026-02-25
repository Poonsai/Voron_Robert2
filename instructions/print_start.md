# macros/print_start.cfg

Main print start sequence with auto homing, QGL, and bed mesh.

## Macro

### PRINT_START

Complete print initialization routine. Called from slicer at print start.

**Parameters (from slicer):**

| Parameter | Description | Example |
|-----------|-------------|---------|
| BED | Bed temperature | 60 |
| EXTRUDER | Nozzle temperature | 210 |

**Slicer Configuration:**

Configure in your slicer's "Start G-code":

```
PRINT_START BED={first_layer_bed_temperature} EXTRUDER={first_layer_temperature}
```

**Cura:**
```
PRINT_START BED={material_bed_temperature_layer_0} EXTRUDER={material_nozzle_temperature_layer_0}
```

**PrusaSlicer / SuperSlicer:**
```
PRINT_START BED=[first_layer_bed_temperature] EXTRUDER=[first_layer_temperature]
```

---

## Sequence

```
PRINT_START
  └── Set caselight to 100%
  └── Turn on Nevermore fan
  └── Get temps from slicer params
  └── Clear bed mesh
  └── Home XYZ (proximity)
  └── Home Z (contact)
  └── Position at Z=2mm for heat soak
  └── Heat bed to target
  └── Wait for chamber temp (if BED >= 80°C)
  └── Heat nozzle to 150°C
  └── CLEAN_NOZZLE
  └── Home Z (contact)
  └── STATUS_LEVELING (LEDs)
  └── QUAD_GANTRY_LEVEL
  └── STATUS_MESHING (LEDs)
  └── BED_MESH_CALIBRATE (adaptive, 2 runs)
  └── Home Z (calibrate offset)
  └── Move to center
  └── Heat to print temp
  └── STATUS_PRINTING (LEDs)
  └── Prime line
  └── Retract slightly
```

---

## Features

### Chamber Heating
If bed temp >= 80°C, waits for chamber to reach target temperature before proceeding. Uses Nitehawk-SB temperature sensor (NH36).

### Adaptive Bed Mesh
Runs bed mesh with:
- `ADAPTIVE=1` - Only meshes printed area
- `RUNS=2` - Averages 2 measurements per point
- Uses Beacon probe (PROXIMITY method)

### Quad Gantry Level (QGL)
Levels the gantry before each print to compensate for Z-axis twist.

### Nozzle Cleaning
Cleans nozzle at 150°C before QGL to ensure accurate Z-probing.

### Prime Line
Extrudes a prime line at print start to ensure smooth extrusion.

---

## Customization

### Change prime line position

Edit line 75:
```python
G0 X{x_wait - 50} Y4 F10000  # Adjust x_wait - 50 to change X position
```

### Disable QGL

Comment out line 56:
```python
#QUAD_GANTRY_LEVEL
```

### Disable adaptive mesh

Edit line 61:
```python
BED_MESH_CALIBRATE PROBE_METHOD=PROXIMITY ADAPTIVE=0 RUNS=1
```

### Change nozzle clean temp

Edit line 48:
```python
M109 S150  # Change 150 to desired temp
```

---

## Troubleshooting

### Print starts without homing
Check slicer is passing BED and EXTRUDER params correctly.

### QGL fails
Ensure Beacon probe is working: `PROBE_CALIBRATE`

### Bed mesh takes too long
Reduce `RUNS=2` to `RUNS=1` or disable adaptive: `ADAPTIVE=0`
