#!/bin/bash

compatdata_dir="/home/deck/.local/share/Steam/steamapps/compatdata"

holocure_kr_dir=$(find $compatdata_dir -maxdepth 8 -type d -name "HoloCureKR" | head -n 1)
holocure_dir="$compatdata_dir/2420510/pfx/drive_c/users/steamuser/AppData/Local/HoloCure"
echo $holocure_kr_dir
echo $holocure_dir

echo ""
echo "Search the directories 'HoloCureKR', 'HoloCure (Steam)"
echo ""

if [ -d "$holocure_kr_dir" ]; then
    echo "holocurekr directory found: $holocure_kr_dir"

    if [ -d "$holocure_dir" ]; then
        echo "holocure directory found: $holocure_dir"

        if [ -L "$holocure_dir" ]; then
            echo "Symbolic link already exists at $holocure_dir. Skipping renaming and linking."
        else
            mv "$holocure_dir" "$holocure_dir"_bak
            ln -s "$holocure_kr_dir/../HoloCure" "$holocure_dir"
            echo "HoloCure directory renamed to HoloCure_bak and symbolic link created to local/HoloCure in holocure_kr_dir"
        fi
    else
        echo "Error: HoloCure (Steam) directory not found."
    fi
else
    echo "Error: HoloCureKR directory not found."
fi