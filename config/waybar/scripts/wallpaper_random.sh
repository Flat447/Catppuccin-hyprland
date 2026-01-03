#!/bin/bash

# Путь к папке с обоями
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Проверка существования папки
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Ошибка: Папка $WALLPAPER_DIR не существует!"
    exit 1
fi

# Проверка установки swww
if ! command -v swww &> /dev/null; then
    echo "Ошибка: swww не установлен!"
    exit 1
fi

# Получение списка изображений (поддерживаемые форматы)
wallpapers=($(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \)))

# Проверка наличия изображений
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "Ошибка: В папке $WALLPAPER_DIR нет изображений!"
    exit 1
fi

# Выбор случайного изображения
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

echo "Устанавливаю обои: $(basename "$random_wallpaper")"

# Инициализация swww (если еще не инициализирован)
swww init 2>/dev/null || true

# Установка обоев
swww img "$random_wallpaper"  --transition-type=wipe  --transition-angle=45  --transition-fps=60  --transition-duration=2  --transition-pos=center
