#!/bin/sh

for file in *; do
    if [ -f "$file" ]; then 
        convert $file +flop "$file.flopped.gif"
    fi
done
