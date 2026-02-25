# homing.cfg

Custom homing macros with increased current for reliable sensorless homing.

## Macros

### _HOME_X

Custom X homing with increased stepper current.

**Features:**
- Increases current to 1.0A during homing
- Uses kinematic position set to move toward endstop
- Returns to normal current after homing

**Usage:**
```
_HOME_X
```
Or just:
```
G28 X
```

---

### _HOME_Y

Custom Y homing with increased stepper current.

**Features:**
- Increases current to 1.0A during homing
- Uses kinematic position set to move toward endstop
- Returns to normal current after homing

**Usage:**
```
_HOME_Y
```
Or just:
```
G28 Y
```

---

### homing_override

Overrides default Klipper homing for all axes (XYZ).

**Sequence:**
```
homing_override
  └── Save gcode state
  └── Set Z kinematic to 1mm, move up 4mm
  └── If homing all or X: _HOME_X
  └── If homing all or Y: _HOME_Y
  └── If homing all or Z:
      └── Move to X175 Y175 (center-ish)
      └── Home Z (contact, calibrate)
      └── Move up 10mm
  └── Restore gcode state
```

---

## How It Works

### Increased Homing Current

Sensorless homing (TMC StallGuard) works better with higher current:

```python
{% set HOME_CURRENT = 1.0 %}
SET_TMC_CURRENT STEPPER=stepper_x CURRENT={HOME_CURRENT}
SET_TMC_CURRENT STEPPER=stepper_y CURRENT={HOME_CURRENT}
```

Normal run current: 1.4A

### Kinematic Position Set

Before moving toward endstop, sets position to avoid long travel:

```python
SET_KINEMATIC_POSITION X=15
G91
G1 X-10 F1200  # Move 10mm toward endstop
```

---

## Usage

### Home all axes:
```
G28
```

### Home specific axis:
```
G28 X
G28 Y
G28 Z
```

### Home X and Y only:
```
G28 X Y
```

---

## Configuration

### Change homing position for Z

Edit line 77 in homing.cfg:
```python
G1 X175 Y175 F12000  # Change to your preferred position
```

For Voron 2.4 350mm, 175,175 is near center.

### Change homing speed

Edit the F parameter:
```python
G1 X-10 F1200  # F1200 = 20mm/s
```

Lower = slower but more accurate.

---

## Troubleshooting

### X/Y not homing reliably
- Increase `HOME_CURRENT` to 1.2
- Increase `driver_SGTHRS` in steppers.cfg (lower = more sensitive)

### Z homing issues
- Ensure Beacon probe is calibrated: `PROBE_CALIBRATE`
- Check probe threshold in beacon.cfg

### "Kinematic position not known" error
This is normal before first home. Run `G28` first.

---

## Technical Details

### TMC2209 StallGuard

This config uses TMC2209 sensorless homing:
- No physical endstops for X/Y
- Detects motor stall using StallGuard
- DIAG pin connected (see steppers.cfg)

### Saved State

The `homing_override` saves/restores gcode state to preserve:
- Absolute/relative mode
- Position coordinates
- Feed rates
