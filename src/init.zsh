#!/usr/local/bin/zsh

#=========================================================
#
#                      ---ZSH Config---
#
#=========================================================

locate-config() {
    local _config=$(find $1 -maxdepth 4 -type f -name "config.zsh" -print)
    source $_config
}

if [[ -e "$ZSH_DIR/config.zsh" ]]; then
    source $ZSH_DIR/config.zsh
else
    if [[ -e "$HOME/zsh" ]]; then
        locate-config $HOME/zsh
    else
        echo "ERROR: ZSH_DIR and/or `config.zsh` not found!"
        echo "Make sure you run `zs` from ZSH_DIR"
    fi
fi

export ZSH_CALLBACKS=()
export ZSH_LOADING=true

#---------------------------------------------------------
#                          Paths
#---------------------------------------------------------

fpath=(
    $ZSH_DIR/functions
    $ZSH_DIR/completions
    ${fpath[@]}
)

path=(
    $path
    $ZSH_BIN_DIR
    $HOME/.bin
    /usr/local/bin
    $HOME/.local/bin
    $HOME/.cabal/bin
    $HOME/.xmonad/bin
    $HOME/.rvm/bin
    $HOME/.gem/bin
    $GOPATH/bin
    $ZSH_DIR/functions
)

#---------------------------------------------------------
#                        Autoload
#---------------------------------------------------------

autoload +X $ZSH_DIR/functions/*(:t) \
            $ZSH_DIR/completions/_*(:t)

autoload -Uz zrecompile \
             compinit \
             colors \
             throw
compinit
colors

#---------------------------------------------------------
#                       Setup Callbacks
#---------------------------------------------------------

function execute() {
    {
        $1
    } always {
        if catch MyError; then
            echo "MyError detected"
        fi
        if catch ''; then
            echo "ERROR: $CAUGHT"
        fi
        if catch *; then
            echo "ERROR: $CAUGHT"
        fi
    }
}

ZSH_FINISHED_LOADING() {
    ZSH_LOADING=false
}

# NOTE: To call a function when ZSH finishes loading,
# append the function name to $ZSH_CALLBACKS, for ex:

ZSH_CALLBACKS+=(ZSH_FINISHED_LOADING)

#---------------------------------------------------------
#                        Modules
#---------------------------------------------------------

typeset -a ZSH_MODULES SYSTEM_CONFIGS

SYSTEM_CONFIGS=(
    /etc/X11/xinit/xinitrc.d/40-libcanberra-gtk-module.sh
    /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
    /etc/X11/xinit/xinitrc.d/60-xdg-user-dirs.sh
    /etc/X11/xinit/xinitrc.d/infinality-settings.sh
    /etc/X11/xinit/xinitrc.d/xft-settings.sh
)

ZSH_MODULES+=(
    osx
    logger
    zgen
    regex
    plugins
    keybindings
    login
    aliases
    theme
)

#each $SYSTEM_CONFIGS source
import $ZSH_MODULES

#---------------------------------------------------------
#                        Validation
#---------------------------------------------------------

[ ! -d $ZSH_DIR ] && \
    zlog red "Error: please define ZSH_DIR in your ~/.zshrc." && \
    zlog gray "For example: \texport ZSH_DIR='~/zsh'\n" && exit

#---------------------------------------------------------
#                  Execute Callbacks
#---------------------------------------------------------

each $ZSH_CALLBACKS execute

#=========================================================

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#eval "$(rbenv init - --no-rehash)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
