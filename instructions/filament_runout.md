# configs/filament_runout.cfg

Filament runout sensor configuration for detecting empty filament spools.

## Setup

### 1. Hardware

Connect your filament sensor to the Nitehawk-SB toolboard:
- Pin: GPIO3 (nhk:gpio3)
- Use a switch-type sensor or Hall effect sensor

### 2. Enable Sensor

Edit `configs/filament_runout.cfg` and uncomment the appropriate sensor type:

**Switch sensor:**
```ini
[filament_switch_sensor filament_runout]
switch_pin: nhk:gpio3
pause_on_runout: True
runout_gcode:
    M118 Filament runout detected!
    PAUSE
```

### 3. Restart Klipper

```
sudo systemctl restart klipper
```

---

## Usage

### Manual Check

```
CHECK_RUNOUT
```

Shows if filament is present or not.

---

## Sensor Types

| Type | Description | Pin |
|------|-------------|-----|
| Switch | Basic mechanical switch | nhk:gpio3 |
| Hall | Magnetic hall sensor | nhk:gpio3 |
| BTT SFS | Smart filament sensor | nhk:gpio3 |

---

## Troubleshooting

### Sensor not detected
- Check wiring
- Verify pin in config matches hardware
- Restart Klipper

### False triggers
- Adjust sensor position
- Check for debris
- Increase `runout_gap` if supported

### Doesn't pause
- Verify `pause_on_runout: True`
- Check `runout_gcode` is not commented
