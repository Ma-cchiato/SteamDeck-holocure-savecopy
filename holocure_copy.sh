#!/bin/bash

compatdata_dir="/home/deck/.local/share/Steam/steamapps/compatdata"

holocure_kr_dir=$(find $compatdata_dir -maxdepth 8 -type d -name "HoloCureKR" | head -n 1)
holocure_dir="$compatdata_dir/2420510/pfx/drive_c/users/steamuser/AppData/Local/HoloCure"

echo ""
echo "'HoloCureKR', 'HoloCure (Steam)' 디렉터리를 찾는 중입니다."
echo ""

if [ -d "$holocure_kr_dir" ]; then
    echo -e "HoloCureKR 디렉터리를 찾았습니다: $holocure_kr_dir\n"
    
    if [ -d "$holocure_dir" ]; then
        echo -e "HoloCure (Steam) 디렉터리를 찾았습니다: $holocure_dir\n"
        echo -e "심볼릭 링크를 생성 중입니다.\n"
        if [ -L "$holocure_dir" ]; then
            echo -e "이미 심볼릭 링크가 생성되어 있습니다. $holocure_dir\n"
        else
            mv "$holocure_dir" "$holocure_dir"_bak
            ln -s "$holocure_kr_dir/../HoloCure" "$holocure_dir"
            echo -e "원본 HoloCure 디렉터리 백업 완료: "$holocure_dir"_bak\n"
            echo -e "심볼릭 링크 생성 완료: $holocure_dir\n"
        fi
    else
        echo "Error: HoloCure (Steam) directory not found."
    fi
else
    echo "Error: HoloCureKR directory not found."
fi
