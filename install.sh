#!/bin/sh

PILAU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONFIG_DIR=$HOME/.config

DIRS=(dunst i3 polybar rofi termite)
FILES=(compton.conf)

if [ ! -d $CONFIG_DIR ]; then
    echo "creating config directory: $CONFIG_DIR"
    mkdir $CONFIG_DIR
else
    echo "found config directory: $CONFIG_DIR"
fi

for d in "${DIRS[@]}"; do
    echo "linking $d"
    ln -sfn $PILAU_DIR/$d $CONFIG_DIR/$d
done

for f in "${FILES[@]}"; do
    echo "linking $f"
    ln -sfn $PILAU_DIR/$f $CONFIG_DIR/$f
done

echo "done!"
