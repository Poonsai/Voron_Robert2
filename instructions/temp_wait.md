# macros/temp_wait.cfg

Temperature control and preheat macros.

## Macros

### PREHEAT

Preheat bed and/or hotend.

```
PREHEAT BED=60 HOTEND=200       # Heat both
PREHEAT BED=60                  # Heat bed only
PREHEAT HOTEND=210              # Heat hotend only
PREHEAT BED=80 HOTEND=240 WAIT=false  # Don't wait
```

### WAIT_HEATERS

Wait for heaters to reach target.

```
WAIT_HEATERS
```

### COOLDOWN

Turn off all heaters.

```
COOLDOWN
```

### TEMP_STATUS

Show current temperature status.

```
TEMP_STATUS
```

Shows:
- Bed target/actual
- Hotend target/actual
- Estimated time to ready

---

## Usage

Pre-heat before loading filament:

```
PREHEAT BED=60 HOTEND=200
```

Check temps:

```
TEMP_STATUS
```
