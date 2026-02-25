#!/bin/bash
set -e

# --- Configuration ---
# Path to your klipper directory
KLIPPER_DIR=~/klipper
# Web-accessible directory for the output file
OUTPUT_DIR=~/printer_data/gcodes
# Add timestamp to filename (true/false)
TIMESTAMP=true

# --- Script ---
log(){
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Find the latest calibration data file in /tmp
INPUT_CSV=$(ls -t /tmp/calibration_data_*.csv 2>/dev/null | head -n 1)

# Check if a CSV file was found
if [ -z "$INPUT_CSV" ]; then
    log "Error: No calibration_data_*.csv file found in /tmp."
    exit 1
fi

# Generate output filename
if [ "$TIMESTAMP" = true ]; then
    TIMESTAMP_STR=$(date +"%Y%m%d_%H%M%S")
    OUTPUT_NAME="shaper_graph_${TIMESTAMP_STR}.png"
else
    OUTPUT_NAME="shaper_graph.png"
fi

OUTPUT_FILE="$OUTPUT_DIR/$OUTPUT_NAME"

# Run the shaper calibration script
log "Generating graph from $INPUT_CSV..."
"${KLIPPER_DIR}/scripts/calibrate_shaper.py" "$INPUT_CSV" -o "$OUTPUT_FILE"

# Check if the graph was created successfully
if [ $? -eq 0 ]; then
    log "Graph saved to $OUTPUT_FILE"
    log "Access it at: http://<YOUR_PRINTER_IP>/server/files/gcodes/$OUTPUT_NAME"
else
    log "Error: Failed to generate shaper graph."
    exit 1
fi
