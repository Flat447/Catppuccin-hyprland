#!/bin/env sh

TMP_FILE="$XDG_RUNTIME_DIR/hyprland-show-desktop"

CURRENT_WORKSPACE=$(hyprctl monitors -j | jq '.[] | .activeWorkspace | .name' | sed 's/"//g')

if [ -s "$TMP_FILE-$CURRENT_WORKSPACE" ]; then
  # Восстанавливаем окна из временного файла
  readarray -d $'\n' -t ADDRESS_ARRAY <<< $(< "$TMP_FILE-$CURRENT_WORKSPACE")

  for address in "${ADDRESS_ARRAY[@]}"
  do
    CMDS+="dispatch movetoworkspacesilent name:$CURRENT_WORKSPACE,address:$address;"
  done

  hyprctl --batch "$CMDS"

  rm "$TMP_FILE-$CURRENT_WORKSPACE"
else
  # Получаем только активное окно
  ACTIVE_WINDOW=$(hyprctl activewindow -j | jq -r '.address')
  
  if [[ -n "$ACTIVE_WINDOW" && "$ACTIVE_WINDOW" != "null" ]]; then
    # Сохраняем адрес активного окна во временный файл
    echo "$ACTIVE_WINDOW" > "$TMP_FILE-$CURRENT_WORKSPACE"
    
    # Перемещаем только активное окно на специальный рабочий стол
    hyprctl dispatch movetoworkspacesilent special:desktop,address:$ACTIVE_WINDOW
  fi
fi
