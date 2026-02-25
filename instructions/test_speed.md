# macros/test_speed.cfg

Test for maximum speed and acceleration without skipping steps.

## Macro

### TEST_SPEED

Tests your printer's ability to handle high speed/acceleration without losing steps.

**Usage:**
```
TEST_SPEED              # Default values
TEST_SPEED SPEED=300    # Custom speed
TEST_SPEED ACCEL=5000   # Custom acceleration
TEST_SPEED ITERATIONS=10  # More test cycles
```

**Parameters:**

| Parameter | Default | Description |
|-----------|---------|-------------|
| SPEED | max_velocity | Max speed to test (mm/s) |
| ACCEL | max_accel | Max acceleration to test (mm/s²) |
| ITERATIONS | 5 | Number of test cycles |
| MIN_CRUISE_RATIO | 0.5 | Minimum cruise ratio |
| BOUND | 20 | Bounding inset (mm) |

---

## How It Works

1. Homes all axes
2. Runs QGL if configured
3. Homes again for accuracy
4. Gets initial position from MCU
5. Runs toolhead through diagonal moves at specified speed/accel
6. Homes again
7. Compares final position to initial

**If positions match:** No steps skipped - settings are safe

**If positions differ:** Steps were lost - reduce speed/accel

---

## Usage Examples

### Test default settings:
```
TEST_SPEED
```

### Test higher speed:
```
TEST_SPEED SPEED=400 ACCEL=8000
```

### Quick test (1 iteration):
```
TEST_SPEED ITERATIONS=1
```

### Conservative test:
```
TEST_SPEED SPEED=200 ACCEL=3000
```

---

## Interpreting Results

### Success (No Skipping)
```
MCU stepper positions match
```

### Failure (Skipping Detected)
```
ERROR: Stepper positions differ by X steps
```

If you see position differences:
- Reduce acceleration first (try 50% less)
- Then reduce speed if needed
- Check belt tension
- Check for loose pulleys

---

## When to Run

- After building/rebuilding printer
- After changing stepper drivers
- When experiencing layer shifts
- After adjusting belt tension

---

## Safe Starting Values

For Voron 2.4 350mm with LDO motors:

| Setting | Safe Start | Aggressive |
|---------|------------|------------|
| Speed | 200-300 mm/s | 400+ mm/s |
| Accel | 3000 mm/s² | 8000+ mm/s² |

---

## Customization

### Change bounding box

If toolhead hits frame, increase BOUND:
```
TEST_SPEED BOUND=30
```

### Change small pattern size

For smaller print area:
```
TEST_SPEED SMALLPATTERNSIZE=10
```

---

## Technical Details

### Test Pattern

The macro runs two patterns:
1. **Large diagonals** - Corner to corner
2. **Small center box** - Quick moves at center

### Position Comparison

Compares MCU stepper positions before/after:
- If difference > microstep count = skipped steps
- Accounts for endstop variance

### Velocity Limits

Temporarily sets new limits during test:
```
SET_VELOCITY_LIMIT VELOCITY={speed} ACCEL={accel}
```

---

## Troubleshooting

### "Error: Must home first"
Run `G28` before testing.

### Steps skipped at low values
- Check belt tension
- Check grub screws on pulleys
- Check motor connectors
- Verify current settings in steppers.cfg

### Inconsistent results
- Ensure printer is warm (run a print first)
- Check for loose rails
