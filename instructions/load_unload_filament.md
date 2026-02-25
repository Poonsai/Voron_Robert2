# macros/load_filament.cfg & unload_filament.cfg

Basic filament loading and unloading (when NOT printing).

## Macros

### LOAD_FILAMENT

Loads filament into the extruder.

**Usage:**
```
LOAD_FILAMENT
```

**Conditions:**
- Must NOT be actively printing
- Paused prints are OK

**Sequence:**
```
LOAD_FILAMENT
  └── Save gcode state
  └── Switch to relative extrusion (M83)
  └── Extrude 50mm
  └── Extrude 50mm
  └── Extrude 50mm (150mm total)
  └── Retract 1mm
  └── Show "Filament loaded" message
  └── Restore gcode state
```

**Safety:** Refuses to run if actively printing:
```
{ action_respond_info("Filament loading disabled while printing!") }
```

---

### UNLOAD_FILAMENT

Unloads filament from the extruder.

**Usage:**
```
UNLOAD_FILAMENT
```

**Conditions:**
- Must NOT be actively printing
- Paused prints are OK

**Sequence:**
```
UNLOAD_FILAMENT
  └── Save gcode state
  └── Switch to relative (M83)
  └── Quick purge 5mm
  └── Fast retract 4mm
  └── Retract 16mm
  └── Wait 1 second (cool down)
  └── Slow retract 10mm
  └── Fast retract 125mm (total ~155mm)
  └── Show "Filament unloaded"
  └── Restore gcode state
```

---

## When to Use

| Situation | Macro |
|-----------|-------|
| Before printing (cold) | `LOAD_FILAMENT` |
| After printing | Use `END_PRINT` instead |
| Mid-print change | `CHANGE_FILAMENT` |
| Changing filament when not printing | `UNLOAD_FILAMENT` then `LOAD_FILAMENT` |

---

## Advanced: Mid-Print Changes

For changing filament mid-print, use `CHANGE_FILAMENT` macro instead:
```
CHANGE_FILAMENT TEMP=240  # For PETG
```

This handles:
- Pausing the print
- Heating to unload temp
- Unloading
- Loading new filament
- Resuming

---

## Customization

### LOAD_FILAMENT - Change load amount

Edit lines 7-9:
```python
G1 E50 F300   # Increase 50 to load more
G1 E50 F300   # Repeat for more
G1 E50 F300
```

### UNLOAD_FILAMENT - Change retract speeds

Edit lines 7-12:
```python
G1 E5 F450      # Quick purge speed
G1 E-4 F1800    # Fast retract speed
G1 E-16 F1200   # Normal retract speed
SLEEP MS=1000   # Cool down wait
G1 E-10 F300    # Slow retract
G1 E-125 F1200  # Final retract
```

---

## Temperature Requirements

These macros don't heat the nozzle. If needed, heat first:

```
M104 S200  # Heat to 200°C
M109 S200  # Wait for temp
LOAD_FILAMENT
```

Or use `CHANGE_FILAMENT` which handles heating automatically.
