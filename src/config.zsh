# ========================================================
# Options
# ========================================================

export NAME="Tim Godin"
export EMAIL="t1m0thyg0d1n1987@gmail.com"

# FUNCTIONS ----------------------------------------------

bin-exists() {
    local bin_path="$(which $1)"
    if [[ $bin_path =~ "not found" ]]; then
        false
    else
        true
    fi
}

# ZSH ----------------------------------------------------

export SHELL="zsh"
export ZSH_BASE_DIR="$HOME/zsh"
export ZSH_DIR="$ZSH_BASE_DIR/src"
export ZSH_VENDOR_DIR="$ZSH_BASE_DIR/vendor"
export ZSH_PLUGINS_DIR="$ZSH_BASE_DIR/plugins"

export ZLOG_ENABLED=false # <-- Enable/disable logger
export ZSH_BENCHMARK=false # <-- Enable: $(date +%s.%N)
export ZSH_FUNCTIONS_DIR="$ZSH_DIR/functions"
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

# TASKS
export TODO="$HOME/TODO.tasks"

# EDITOR
export EDITOR="nvim"
export VISUAL=$EDITOR

# TERMINAL
export TERM="xterm-256color"

# SEARCH
if bin-exists "pt"; then
    export SEARCH="pt"
elif bin-exists "ag"; then
    export SEARCH="ag"
else
    export SEARCH="grep"
fi

# BROWSER
if bin-exists "qutebrowser"; then
    export BROWSER="qutebrowser"
elif bin-exists "google-chrome-unstable"; then
    export BROWSER="google-chrome-unstable"
elif bin-exists "chromium"; then
    export BROWSER="chromium"
elif bin-exists "google-chrome-unstable"; then
    export BROWSER="google-chrome-unstable"
elif bin-exists "google-chrome-dev"; then
    export BROWSER="google-chrome-dev"
elif bin-exists "google-chrome"; then
    export BROWSER="google-chrome"
elif bin-exists "firefox"; then
    export BROWSER="firefox"
else
    export BROWSER="google-chrome-canary"
fi

# Detect OSX
export UNAME="$(uname -a)"
[[ $UNAME =~ "Darwin" ]] && export OSX=true        && export OS="OSX"
[[ $UNAME =~ "Linux" ]]  && export LINUX=true      && export OS="linux"
[[ $UNAME =~ "ARCH" ]]   && export ARCHLINUX=true  && export OS="archlinux"

# OS
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

if [[ $LINUX ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DESKTOP_DIR="$HOME/"
    export XDG_DOWNLOAD_DIR="$HOME/downloads"
    export XDG_TEMPLATES_DIR="$HOME/downloads"
    export XDG_PUBLICSHARE_DIR="$HOME/downloads"
    export XDG_DOCUMENTS_DIR="$HOME/notes"
    export XDG_MUSIC_DIR="$HOME/music"
    export XDG_PICTURES_DIR="$HOME/pictures"
    export XDG_VIDEOS_DIR="$HOME/video"
fi

# TERMINAL -----------------------------------------------

# tmux
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_TMUX_AUTOQUIT=$ZSH_TMUX_AUTOSTART
export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_ITERM2=false

# skip verification when using fc or !!
setopt no_hist_verify

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# Enable global OSX colors
export CLICOLOR=1
