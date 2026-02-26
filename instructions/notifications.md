# configs/notifications.cfg

Telegram/Discord notification configuration.

## Setup

### Moonraker Configuration

Add to your `moonraker.conf`:

```
[telegram]
bot_token: YOUR_BOT_TOKEN
chat_id: YOUR_CHAT_ID

[discord]
webhook_url: YOUR_WEBHOOK_URL
```

Then restart Moonraker:

```
sudo systemctl restart moonraker
```

## Macros

### NOTIFY_PRINT_START

Send notification when print starts.

### NOTIFY_PRINT_END

Send notification when print completes.

### NOTIFY_ERROR

Send error notification.

```
NOTIFY_ERROR MSG="Filament runout!"
```

---

## Usage

Add to your macros to receive alerts:

In PRINT_START:
```
NOTIFY_PRINT_START
```

In END_PRINT:
```
NOTIFY_PRINT_END
```

On errors:
```
NOTIFY_ERROR MSG="Print failed"
```
