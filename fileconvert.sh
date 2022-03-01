#!/bin/sh
rm -f *.frame0.gif *.fixed.gif

for file in *; do
    if [ -f "$file" ]; then 
        convert "$file[0]" "$file.frame0.gif"
        convert $file "$file.frame0.gif" "$file.fixed.gif"
    fi
done

rm -f *.frame0.gif
