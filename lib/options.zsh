# ========================================================
# Options
# ========================================================

# ZSH ----------------------------------------------------

export ZSH_DIR="$HOME/zsh"
export ZLOG_ENABLED=false # <-- Enable/disable logger
export ZSH_BENCHMARK=false # <-- Enable: $(date +%s.%N)
export ZSH_FUNCTIONS=($ZSH_FUNCTIONS_DIR/*(:t))

EXPORT_ALIASES() {
    export ZSH_ALIAS="$(mktemp)"
    alias > $ZSH_ALIAS
}
ZSH_CALLBACKS+=EXPORT_ALIASES

# ZGEN ---------------------------------------------------

export ZGEN_AUTOLOAD_COMPINIT=false
export ZGEN_PLUGIN_UPDATE_DAYS=3
export ZGEN_SYSTEM_UPDATE_DAYS=3

# DESKTOP ------------------------------------------------

# EDITOR
export EDITOR="nvim"
export EDITOR_CONF="$HOME/.config/nvim"
export VISUAL=$EDITOR

# TERMINAL
export TERM="xterm-256color"
#export TERMINAL="termite"

# SEARCH
if [[ -e /usr/bin/pt ]]; then
    export SEARCH="pt"
elif [[ -e /usr/bin/ag ]]; then
    export SEARCH="ag"
else
    export SEARCH="grep"
fi

# SHELL
if [[ -e /usr/bin/zsh ]]; then
    export SHELL="zsh"
else
    export SHELL="bash"
fi

# BROWSER
if [[ -e /usr/bin/qutebrowser ]]; then
    export BROWSER="qutebrowser"
elif [[ -e /usr/bin/google-chrome-unstable ]]; then
    export BROWSER="google-chrome-unstable"
elif [[ -e /usr/bin/chromium ]]; then
    export BROWSER="chromium"
elif [[ -e /usr/bin/google-chrome ]]; then
    export BROWSER="google-chrome"
elif [[ -e /usr/bin/firefox ]]; then
    export BROWSER="firefox"
fi

# OS
export XDG_CONFIG_HOME="$HOME/.config"
export OS="archlinux"
export LANG="en_US.UTF-8"
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/id_localhost"
export DATE="$(date +20%y-%m-%d)"
export CLICOLOR=1A

# SHELL
export DIRSTACKSIZE=5
export HISTSIZE=100000
export SAVEHIST=100000
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export REPORTTIME=2
export TIMEFMT="%U user %S system %P cpu %*Es total"
export LS_COLORS='di=34:ln=32:so=1;;35:pi=1;;35:ex=1;;31:bd=45:cd=45:su=41:sg=41:tw=40:ow=40:*.rpm=1;;36'


# TERMINAL -----------------------------------------------

# tmux
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_TMUX_AUTOQUIT=$ZSH_TMUX_AUTOSTART
export ZSH_TMUX_FIXTERM=true

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# makes color constants available

# Enable global OSX colors
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
#
XDG_DESKTOP_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/downloads"
XDG_TEMPLATES_DIR="$HOME/downloads"
XDG_PUBLICSHARE_DIR="$HOME/downloads"
XDG_DOCUMENTS_DIR="$HOME/notes"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pictures"
XDG_VIDEOS_DIR="$HOME/video"
