# macros/pause.cfg & print_stats.cfg

Advanced pause and print monitoring macros.

## Pause Macros

### PAUSE

Enhanced pause with filament retraction and smart parking.

**Usage:**
```
PAUSE                    # Default: retract 5mm, lift 10mm
PAUSE RETRACT=10         # Retract 10mm
PAUSE LIFT=20            # Lift Z 20mm
PAUSE PARK=false         # Don't park
```

**Features:**
- Retracts filament (prevents ooze)
- Lifts Z (prevents hitting print)
- Parks at rear of bed
- Turns off fan

---

### PRINT_STATUS

Shows current print status.

**Usage:**
```
PRINT_STATUS
```

**Displays:**
- Print state (Printing/Idle)
- X/Y/Z position
- Extruder temp (target/actual)
- Bed temp (target/actual)
- Current filename
- Progress %
- Print time
- Estimated remaining

---

## Print Stats Macros

### PRINT_STATS

Detailed print statistics.

**Usage:**
```
PRINT_STATS
```

**Shows:**
- Filename
- Print state
- Print time
- Total time
- Progress %
- Estimated remaining
- Filament used

---

### JOB_STATUS

Quick one-line status for display.

**Usage:**
```
JOB_STATUS
```

**Shows:**
```
Printing 45% | 32min
```

---

### CLEAR_STATS

Reset print statistics.

**Usage:**
```
CLEAR_STATS
```

---

## Usage Examples

### Pause mid-print:
```
PAUSE
# Do something
RESUME
```

### Check progress:
```
PRINT_STATS
```

### Quick status:
```
JOB_STATUS
```

### After power loss:
```
G28
RESUME
```
