# nozzle_scrub.cfg

Nozzle cleaning macro for Voron StealthBurner brush.

## Macro

### CLEAN_NOZZLE

Cleans nozzle using the stealthburner brush.

**Usage:**
```
CLEAN_NOZZLE
```

**Requirements:**
- Nozzle must be hot (150°C+ recommended)
- Brush must be installed

---

## Configuration

Edit these variables at the top of the macro:

```python
variable_start_x: 308   # Starting X position (right side)
variable_start_y: 346   # Starting Y position (front)
variable_start_z: 2    # Z height (barely touches brush)
variable_x_min: 260     # Left side of brush
variable_x_max: 305     # Right side of brush
variable_y_min: 347     # Front of brush (last bristle line)
variable_y_max: 354     # Rear of brush (first bristle line)
variable_z1: 1.3        # Second Z (slightly sunk in)
variable_z2: 1.0        # Third Z (fully in brush)
variable_wipe_qty: 2    # Number of wipe cycles
variable_wipe_spd: 100  # Wipe speed (mm/s)
variable_raise_distance: 30  # Z height after cleaning
```

---

## How It Works

The macro performs two types of cleaning:

1. **Horizontal wipes** - Moves nozzle left-right across brush
2. **Diagonal wipes** - Moves nozzle diagonally for thorough cleaning

Each pass varies Z-height (start_z → z1 → z2) to clean all sides of the nozzle.

---

## Setup

### Brush Position

Adjust these variables to match your brush location:

| Variable | Description | Your Value |
|----------|-------------|-------------|
| start_x | Right side of brush | 308 |
| start_y | Front of brush | 346 |
| x_min | Left side of brush | 260 |
| x_max | Right side of brush | 305 |
| y_min | Front edge | 347 |
| y_max | Rear edge | 354 |

### Finding Your Brush Position

1. Home printer
2. Move nozzle to brush:
   ```
   G1 X260 Y347 F9000
   ```
3. Lower Z until nozzle barely touches bristles (Z ~1-2mm)
4. Note the X/Y coordinates for front-left corner
5. Repeat for all corners
6. Update variables in nozzle_scrub.cfg

---

## Usage in Macros

This macro is automatically called by:
- `PRINT_START` - Before QGL/mesh
- `END_PRINT` - After print completes
- `CANCEL_PRINT` - After cancel

You can also call manually:
```
CLEAN_NOZZLE
```

---

## Troubleshooting

### Nozzle not touching brush
- Lower `start_z`, `z1`, `z2` values
- Example: `variable_z2: 0.8`

### Nozzle hitting brush bottom
- Increase `z1` and `z2` values

### Brush too far forward/back
- Adjust `y_min` and `y_max`

### Cleaning not effective
- Increase `wipe_qty` to 3 or 4
- Increase `wipe_spd` to 150

---

## Safety

The macro checks if axes are homed before running:
```python
{% if "xyz" not in printer.toolhead.homed_axes %}
    G28
{% endif %}
```

If not homed, it homes first.
