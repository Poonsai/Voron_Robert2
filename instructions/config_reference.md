# Configuration Files Reference

Core configuration files for Voron_Robert2 3D printer.

## File Overview

| File | Description |
|------|-------------|
| printer.cfg | Main config (includes all others) |
| board.cfg | BTT Octopus V1 pin mappings |
| steppers.cfg | Stepper motor configuration |
| extruder_config.cfg | Extruder and hotend settings |
| bed.cfg | Heated bed configuration |
| beacon.cfg | Beacon probe configuration |
| nitehawk-sb.cfg | LDO Nitehawk-SB toolboard |
| fans.cfg | Fan configuration |
| homing.cfg | Custom homing macros |

---

## printer.cfg

**Purpose:** Main configuration file that includes all others.

**Key Settings:**
- CoreXY kinematics
- Bed mesh: 15x15 points, bicubic algorithm
- Input shaper: X=56.8Hz, Y=40Hz (mzv)
- Force move enabled
- Idle timeout: 30 minutes

**Includes:**
```ini
[include board.cfg]
[include steppers.cfg]
[include extruder_config.cfg]
[include bed.cfg]
[include nitehawk-sb.cfg]
[include macros.cfg]
[include stealthburner_leds.cfg]
[include homing.cfg]
[include fans.cfg]
[include beacon.cfg]
[include nozzle_scrub.cfg]
[include macros/*.cfg]
```

---

## board.cfg

**Purpose:** BigTreeTech Octopus V1 main controller configuration.

**MCU:**
- Serial: `/dev/serial/by-id/usb-Klipper_stm32f446xx_370025001550535556323420-if00`
- Restart method: command

**Kinematics:**
- CoreXY
- Max velocity: 500 mm/s
- Max acceleration: 12000 mm/s²
- Max Z velocity: 8 mm/s
- Max Z acceleration: 120 mm/s²

---

## steppers.cfg

**Purpose:** Stepper motor and TMC driver configuration.

### X Stepper (Right)
- Stepper: LDO 42sth48-2804AH
- Microsteps: 32
- Run current: 1.4A
- Sensorless homing (StallGuard)
- Rotation distance: 40mm

### Y Stepper (Left)
- Stepper: LDO 42sth48-2804AH
- Microsteps: 32
- Run current: 1.4A
- Sensorless homing (StallGuard)
- Rotation distance: 40mm

### Z Steppers (x4)
- Stepper: LDO 42sth48-2004AC
- Gear ratio: 80:16
- Microsteps: 32
- Run current: 0.6A
- Uses Beacon probe for Z homing

---

## extruder_config.cfg

**Purpose:** Extruder and hotend configuration.

**Extruder:**
- Type: BMG (Bondtech)
- Gear ratio: 9:1
- Microsteps: 16
- Nozzle: 0.4mm
- Filament: 1.75mm

**Hotend:**
- Heater: PA2
- Thermistor: PT1000
- Max temp: 320°C

**Pressure Advance:**
- Value: 0.04
- Smooth time: 0.040s

---

## bed.cfg

**Purpose:** Heated bed configuration.

**Heater:**
- Pin: PA1 (SSR controlled)
- Thermistor: ATC Semitec 104NT-4-R025H42G
- Max temp: 120°C
- Max power: 0.8

---

## beacon.cfg

**Purpose:** Beacon surface scanner probe configuration.

**Probe Settings:**
- Serial: `/dev/serial/by-id/usb-Beacon_Beacon_RevH_6508B1645157355957202020FF100322-if00`
- X offset: 0mm
- Y offset: -25mm
- Mesh: 15x15 points
- Speed: 300mm/s

**Resonance Tester:**
- Accel chip: beacon
- Probe point: 175, 175, 20

---

## nitehawk-sb.cfg

**Purpose:** LDO Nitehawk-SB toolboard configuration.

**MCU:**
- Serial: `/dev/serial/by-id/usb-Klipper_rp2040_4E363334320D7E20-if00`

**Features:**
- Extruder on toolboard
- 3x Neopixel LEDs (StealthBurner)
- ADXL345 accelerometer
- Temperature sensor (NH36)

---

## fans.cfg

**Purpose:** Fan configuration.

| Fan | Pin | Description |
|-----|-----|-------------|
| Part cooling | nhk:gpio6 | Toolhead fan |
| Hotend | nhk:gpio5 | Heat sink fan |
| Controller | PD12 | Box fan |
| Nevermore | PD13 | Exhaust fan |

---

## homing.cfg

**Purpose:** Custom homing with increased current for sensorless homing.

See [homing.md](homing.md) for details.

---

## Input Shaper Settings

**Current values:**
- X: 56.8 Hz (mzv), damping: 0.052
- Y: 40.0 Hz (mzv), damping: 0.054

**To recalibrate:**
1. Run `SHAPER_CALIBRATE`
2. Run `SAVE_CONFIG`
3. Update printer.cfg if needed
