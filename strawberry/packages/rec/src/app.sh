folder="~/Screen"

audio_options="Yes\nNo!"
audio=$(echo -e "$audio_options" | rofi -dmenu -p "Do you want the sound to be recorded? (Y/N) ")


if [ "$audio" == "Yes" ]; then
    echo "Video + Audio"
    exit 0
elif [ "$audio" == "No!" ]; then
    echo "Only Video"
    exit 0
fi

exit 1
