#!/usr/bin/zsh

#=========================================================
#
#                      ---ZSH Config---
#
#=========================================================

export ZSH_DIR="$HOME/zsh"
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
    $HOME/.bin
    $HOME/.local/bin
    $HOME/.cabal/bin
    $HOME/.xmonad/bin
    $HOME/.rvm/bin
    $HOME/.gem/bin
    $GOPATH/bin
    $path
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

typeset -a ZSH_MODULES
ZSH_MODULES+=(
    options
    logger
    zgen
    plugins
    aliases
    keybindings
    login
    benchmark
)
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
