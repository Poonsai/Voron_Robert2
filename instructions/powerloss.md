# configs/powerloss.cfg

Power loss recovery - resume prints after power outage.

## Features

- Automatically saves print state when power is lost
- Resume from exact position when power returns
- Enhanced resume with safety checks

## Setup

Power loss recovery is already enabled in printer.cfg:

```ini
[powerloss_recovery]
filename: ~/printer_data/config/powerloss.cfg
```

---

## How It Works

1. During print, Klipper periodically saves state to `powerloss.cfg`
2. If power is lost, the last saved position is preserved
3. When printer restarts, you can resume the print

---

## Usage

### After Power Loss

When the printer powers back on:

1. Home axes: `G28`
2. Resume print: `RESUME`

The print will continue from where it left off (within a few layers).

### Enhanced RESUME

The config includes an enhanced `RESUME_PRINT` macro:

```
RESUME                    # Normal resume
RESUME SPEED=50          # Resume at 50% speed initially
```

---

## Customization

### Resume Speed

Edit `macros/powerloss.cfg` to adjust default behavior.

### Disable Recovery

To disable, comment out in printer.cfg:
```ini
#[powerloss_recovery]
#filename: ~/printer_data/config/powerloss.cfg
```

---

## Notes

- Powerloss recovery only works with prints started from SD card
- There may be a small gap (1-2 layers) depending on save interval
- Test occasionally by pausing and checking `powerloss.cfg` is created
