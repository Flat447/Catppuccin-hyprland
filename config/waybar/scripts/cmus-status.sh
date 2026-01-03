#!/bin/bash
cmus_output=$(cmus-remote -Q 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "∅"
    exit 0
fi

status=$(echo "$cmus_output" | grep "status" | cut -d " " -f 2)
if [ "$status" = "stopped" ]; then
    echo "■"
    exit 0
fi

artist=$(echo "$cmus_output" | grep "tag artist" | cut -d " " -f 4-)
title=$(echo "$cmus_output" | grep "tag title" | cut -d " " -f 4-)

if [ -n "$artist" ] && [ -n "$title" ]; then
    output="$artist - $title"
elif [ -n "$title" ]; then
    output="$title"
else
    file=$(echo "$cmus_output" | grep "file" | cut -d " " -f 2-)
    output=$(basename "${file%.*}")
fi

if [ "$status" = "paused" ]; then
    output="⏸ $output"
else
    output="▶ $output"
fi

echo "$output"
