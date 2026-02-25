# macros/pid_tune.cfg

Auto-tune PID controllers for accurate temperature control.

## Macros

### PID_TUNE_BED

Auto-tune the bed heater PID.

**Usage:**
```
PID_TUNE_BED              # Default: 60°C, 8 cycles
PID_TUNE_BED TEMP=80     # Tune at 80°C
PID_TUNE_BED TEMP=100 CYCLES=10  # Custom
```

**Parameters:**
| Parameter | Default | Description |
|-----------|---------|-------------|
| TEMP | 60 | Target temperature |
| CYCLES | 8 | Number of tuning cycles |

---

### PID_TUNE_EXTRUDER

Auto-tune the extruder heater PID.

**Usage:**
```
PID_TUNE_EXTRUDER              # Default: 200°C, 8 cycles
PID_TUNE_EXTRUDER TEMP=240    # Tune at 240°C
```

**Parameters:**
| Parameter | Default | Description |
|-----------|---------|-------------|
| TEMP | 200 | Target temperature |
| CYCLES | 8 | Number of tuning cycles |

---

### PID_TUNE_ALL

Auto-tune both bed and extruder in sequence.

**Usage:**
```
PID_TUNE_ALL                    # Default temps
PID_TUNE_ALL BED_TEMP=80 EXTRUDER_TEMP=240
```

---

## When to Run

- After initial printer setup
- After changing heaters or thermistors
- If temperatures overshoot or oscillate
- Seasonally (temperature compensation)

---

## How It Works

1. heater is turned on and off repeatedly
2. Temperature response is measured
3. PID values (Kp, Ki, Kd) are calculated
4. Values are saved to config

The printer will make clicking sounds - this is normal!

---

## Notes

- Make sure ambient temperature is stable
- Don't run with doors open (drafts affect readings)
- After tuning, values are saved automatically
- Check in Mainsail/Fluidd console for results
