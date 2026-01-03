#!/bin/bash

# Получаем математическое выражение от пользователя
expression=$(echo "" | wofi --dmenu --prompt "Введите выражение:" --width 400 --style ~/.config/wofi/style_catppuccin.css)

# Проверяем, что ввод не пустой
if [ -n "$expression" ]; then
    # Вычисляем результат с помощью bc
    result=$(echo "scale=10; $expression" | bc -l 2>/dev/null)
    
    # Проверяем успешность вычисления
    if [ $? -eq 0 ] && [ -n "$result" ]; then
        # Убираем лишние нули после запятой
        if [[ "$result" == *.* ]]; then
            result=$(echo "$result" | sed 's/\.0*$//')
        fi
        
        # Показываем результат
        echo "Результат: $result (скопировано в буфер)" | wofi --dmenu --prompt "Готово" --width 400 --style ~/.config/wofi/style_catppuccin.css
        
        # Копируем результат в буфер обмена
        echo -n "$result" | wl-copy
    else
        echo "Ошибка: некорректное выражение" | wofi --dmenu --prompt "Ошибка" --width 400 --style ~/.config/wofi/style_catppuccin.css
    fi
fi
