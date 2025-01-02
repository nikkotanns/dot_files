#!/usr/bin/env bash

if pgrep -x "waybar" > /dev/null; then
    echo "Waybar запущен. Завершаем процесс..."
    pkill -x "waybar"
else
    echo "Waybar не запущен. Запускаем..."
    waybar &
fi
