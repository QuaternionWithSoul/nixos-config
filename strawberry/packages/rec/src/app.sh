folder="~/Screen"

audio_options="Yes\nNo!"
audio=$(echo -e "$audio_options" | rofi -dmenu -p "Do you want the sound to be recorded? (Y/N) ")


if [ "$audio" == "Yes" ]; then
    ffmpeg -f x11grab \
        -framerate 30 \
        -video_size 1920x1080 \
        -i :0.0 \
        -f pipewire \
        -i pipewire \
        -c:v libx264 \
        -preset ultrafast \
        -crf 18 \
        -c:a aac "$folder/%Y-%m-%d_%H-%M-%S.mp4"

    echo "Video + Audio"
    exit 0
elif [ "$audio" == "No!" ]; then
    ffmpeg -f x11grab \
        -framerate 30 \
        -video_size 1920x1080 \
        -i :0.0 \
        -f pipewire \
        -i pipewire \
        -f pipewire \
        -i "alsa_input.pci-0000_00_1f.3.analog-stereo" \
        -c:v libx264 \
        -preset ultrafast \
        -crf 18 \
        -c:a aac \
        -map 0:v \
        -map 1:a \
        -map 2:a "$folder/%Y-%m-%d_%H-%M-%S.mp4"

    echo "Only Video"
    exit 0
fi

exit 1
