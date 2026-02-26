# macros/bed_mesh_profiles.cfg

Save and load multiple bed mesh profiles for different materials.

## Macros

### SAVE_MESH

Save current bed mesh as named profile.

```
SAVE_MESH              # Save as "default"
SAVE_MESH NAME=pla    # Save as "pla"
SAVE_MESH NAME=petg   # Save as "petg"
```

### LOAD_MESH

Load a saved bed mesh profile.

```
LOAD_MESH              # Load "default"
LOAD_MESH NAME=pla    # Load "pla"
```

### LIST_MESHES

List all saved profiles.

```
LIST_MESHES
```

### DELETE_MESH

Delete a profile.

```
DELETE_MESH NAME=pla
```

### CALIBRATE_MESH

Run calibration and save as profile.

```
CALIBRATE_MESH              # Default, 2 runs
CALIBRATE_MESH RUNS=3       # 3 runs, save as default
CALIBRATE_MESH NAME=petg RUNS=2
```

---

## Usage

Save different meshes for different materials:

1. Tune your mesh for PLA → `SAVE_MESH NAME=pla`
2. Tune your mesh for PETG → `SAVE_MESH NAME=petg`
3. Load appropriate mesh before printing
