# macros/led_notifications.cfg

LED notification patterns for status alerts.

## Macros

### LED_COMPLETE

Print complete pattern (green pulse).

```
LED_COMPLETE
```

### LED_ERROR

Error pattern (red blink).

```
LED_ERROR
```

### LED_PAUSED

Paused pattern (yellow blink).

```
LED_PAUSED
```

### LED_CUSTOM

Custom LED color.

```
LED_CUSTOM R=255 G=0 B=0       # Red
LED_CUSTOM R=0 G=255 B=0       # Green
LED_CUSTOM R=0 G=0 B=255       # Blue
LED_CUSTOM WHITE=255           # White
LED_CUSTOM INDEX=2 R=255       # Specific LED
```

### LED_OFF

Turn off all LEDs.

```
LED_OFF
```

---

## Usage

Call after print complete in END_PRINT (already configured).

Manual alerts:

```
LED_ERROR    # Something wrong
LED_CUSTOM R=255 G=127 B=0  # Orange
```
