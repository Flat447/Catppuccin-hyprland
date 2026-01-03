if status is-interactive
    zoxide init fish | source
    starship init fish | source
    fastfetch -c ~/.config/fastfetch/mini_conf.jsonc
    # echo -e "\e[34m   davay eBash\e[0m"
end
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -la"
alias ff="fastfetch"
alias v="vim"
alias g="git"
alias q="exit"
alias cd="z"
alias dn="sudo nvim"
alias pizdec="sudo archarchive"
alias suka="sudo archarchive"
alias blyat="sudo archarchive"
alias otkat="sudo archarchive"
alias nazad="sudo archarchive"
alias mfetch="fastfetch -c ~/.config/fastfetch/mini_conf.jsonc"
alias nitch="fastfetch -c ~/.config/fastfetch/nitch.jsonc"
alias update="sudo pacman -Syu"
alias sysfetch="~/.config/hypr/.sysfetch.sh"
alias fetch="~/.config/hypr/.fetch.sh"
set fish_greeting ""
alias tomas="sl"
alias n="nvim"
alias start="hyprctl dispatch exec''"
alias arch="fastfetch -c ~/.config/fastfetch/arch_config.jsonc"
alias install="sudo pacman -S"
alias remove="sudo pacman -R"
alias query="pacman -Qi"
alias clear_pacman_cache="sudo pacman -Scc"
alias zoff="sudo systemctl stop zapret.service"
alias zon="sudo systemctl start zapret.service"
alias webcam="mpv av://v4l2:/dev/video0"
# ======== TIDE =========
set -g tide_prompt_color_finished brgreen
set -g tide_prompt_color_failure brred
set -g tide_git_bg_color blue
set -g tide_git_color black
set -g tide_character_color brgreen
# ========= FISH =========
set -g fish_color_command green
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection magenta
set -g fish_color_error red
set -g fish_color_autosuggestion brblack

# Created by `pipx` on 2025-12-14 12:14:06
set PATH $PATH /home/flat/.local/bin
