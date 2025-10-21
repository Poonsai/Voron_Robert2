#!/bin/bash

# --- Configuration ---
# Path to your klipper directory
KLIPPER_DIR=~/klipper
# Web-accessible directory for the output file
OUTPUT_DIR=~/printer_data/gcodes
# Filename for the output graph
OUTPUT_NAME=shaper_graph.png

# --- Script ---
# Find the latest calibration data file in /tmp
INPUT_CSV=$(ls -t /tmp/calibration_data_*.csv | head -n 1)

# Check if a CSV file was found
if [ -z "$INPUT_CSV" ]; then
    echo "Error: No calibration_data_*.csv file found in /tmp."
    exit 1
fi

# Define the full path for the output PNG
OUTPUT_FILE="$OUTPUT_DIR/$OUTPUT_NAME"

# Run the shaper calibration script
echo "Generating graph from $INPUT_CSV..."
"${KLIPPER_DIR}/scripts/calibrate_shaper.py" "$INPUT_CSV" -o "$OUTPUT_FILE"

# Check if the graph was created successfully
if [ $? -eq 0 ]; then
    echo "Graph saved to $OUTPUT_FILE"
    echo "Access it at: http://<YOUR_PRINTER_IP>/server/files/gcodes/$OUTPUT_NAME"
else
    echo "Error: Failed to generate shaper graph."
fi
