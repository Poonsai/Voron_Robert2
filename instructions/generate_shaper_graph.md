# generate_shaper_graph.sh

Generates input shaper graphs from Klipper calibration data.

## Features

- Automatically finds latest calibration CSV in /tmp
- Timestamped output filenames (prevents overwriting)
- Configurable timestamp option
- Error handling and logging

## Configuration

Edit these variables at the top of the script:

```bash
KLIPPER_DIR=~/klipper              # Klipper installation path
OUTPUT_DIR=~/printer_data/gcodes   # Web-accessible output directory
TIMESTAMP=true                     # Add timestamp to filename (true/false)
```

## Usage

Run manually:
```bash
sh ~/printer_data/config/generate_shaper_graph.sh
```

Or from Klipper console:
```
RUN_SHELL_COMMAND CMD=generate_shaper_graph
```

Or use the macro (configured in macros/shaper_graph.cfg):
```
generate_shaper_graph
```

## Output

Graph is saved to: `~/printer_data/gcodes/shaper_graph_YYYYMMDD_HHMMSS.png`

Access via:
```
http://<printer-ip>/server/files/gcodes/shaper_graph_YYYYMMDD_HHMMSS.png
```

## How It Works

1. Finds the most recent `calibration_data_*.csv` in /tmp
2. Runs Klipper's calibrate_shaper.py script
3. Saves PNG to gcodes folder for web access
4. Outputs URL for accessing the graph

## Notes

- Calibration data is created by running `SHAPER_CALIBRATE` command in Klipper
- The script uses the newest CSV file if multiple exist
- Set `TIMESTAMP=false` if you want fixed filename
