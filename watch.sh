#!/bin/sh
php portable.php > index.html

dir1="./content/*"
dir2="./img/*"

inotifywait -m $dir1 $dir2 -e create,delete,move,modify |
    while read path action file; do
        php portable.php > index.html
    done