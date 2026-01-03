#!/bin/bash

DOTFILES_DIR=$(pwd)
CONFIG_DIR="config"
BACKUP_SUFFIX=".bak"

mapfile -t CONFIG_FILES < <(ls "$CONFIG_DIR")

mkdir -p "$HOME/.config"

for config in "${CONFIG_FILES[@]}"; do
    SOURCE_PATH="$DOTFILES_DIR/$CONFIG_DIR/$config"
    DEST_PATH="$HOME/$CONFIG_DIR/$config"

    if [ -e "$DEST_PATH" ] || [ -L "$DEST_PATH" ]; then
        echo "Backing up existing $DEST_PATH to $DEST_PATH$BACKUP_SUFFIX"
        mv "$DEST_PATH" "$DEST_PATH$BACKUP_SUFFIX"
    fi

    echo "Copying $config"
    cp -r "$SOURCE_PATH" "$DEST_PATH"
done

echo "Installation complete! 🎉"
