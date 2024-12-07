folder="$HOME/MyMedia"
name=$(date +"%Y-%m-%d_%H-%M-%S")


video=$(echo -e "Yes\nNo" | rofi -dmenu -p "Video: ")

if [ "$video" ==  "Yes" ]; then
    sound=$(echo -e "Desk + Mic\nOnly Desk\nNo" | rofi -dmenu -p "Sound: ")
    rate=$(echo -e "12\n24\n48" | rofi -dmenu -p "FPS: ")

    if [ "$sound" ==  "Desk + Mic" ]; then
        ffmpeg \
            -f x11grab -framerate "$rate" -i "$DISPLAY" \
            -f pulse -i default \
            -f pulse -i default.monitor \
            -filter_complex "[1:a][2:a]amix=inputs=2:duration=longest" \
            -c:v libx264 -c:a libmp3lame "$folder/$name.mp4"
        exit 0

    elif [ "$sound" ==  "Only Desk" ]; then
        ffmpeg \
            -f x11grab -framerate "$rate" -i "$DISPLAY" \
            -f pulse -i default.monitor \
            -c:v libx264 -c:a libmp3lame "$folder/$name.mp4"
        exit 0

    elif [ "$sound" == "No" ]; then
        ffmpeg \
            -f x11grab -framerate "$rate" -i "$DISPLAY" \
            -c:v libx264 "$folder/$name.mp4"
        exit 0
    fi

    exit 1
elif [ "$video" == "No" ]; then
    sound=$(echo -e "Desk + Mic\nOnly Desk\nOnly Mic\nNo" | rofi -dmenu -p "Sound: ")

    if [ "$sound" ==  "Desk + Mic" ]; then
        ffmpeg \
            -f pulse -i default \
            -f pulse -i default.monitor \
            -filter_complex "[0:a][1:a]amix=inputs=2:duration=longest" \
            -c:a libmp3lame "$folder/$name.mp3"
        exit 0

    elif [ "$sound" ==  "Only Desk" ]; then
        ffmpeg \
            -f pulse -i default.monitor \
            -c:a libmp3lame "$folder/$name.mp3"
        exit 0

    elif [ "$sound" ==  "Only Mic" ]; then
        ffmpeg \
            -f pulse -i default \
            -c:a libmp3lame "$folder/$name.mp3"
        exit 0

    elif [ "$sound" == "No" ]; then
        exit 1
    fi

    exit 1
fi

exit 1