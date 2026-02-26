# macros/utilities.cfg

System utilities and controls.

## Macros

### WIFI_STATUS

Check WiFi connection.

```
WIFI_STATUS
```

### PS_ON / PS_OFF

Power supply control (requires hardware).

```
PS_ON
PS_OFF
```

### EMERGENCY_STOP

Immediate emergency stop.

```
EMERGENCY_STOP
```

### SOFT_STOP

Gentle stop with save.

```
SOFT_STOP
```

### TIMELAPSE_TRIGGER

Trigger timelapse frame.

```
TIMELAPSE_TRIGGER
TIMELAPSE_TRIGGER LAYER=50
```

### RESTART_KLIPPER

Restart Klipper service.

```
RESTART_KLIPPER
```

### RESTART_MOONRAKER

Restart Moonraker service.

```
RESTART_MOONRAKER
```

### SYSTEM_INFO

Show system info.

```
SYSTEM_INFO
```

---

## Usage

Emergency:

```
EMERGENCY_STOP
```

After print issue:

```
SOFT_STOP
```
