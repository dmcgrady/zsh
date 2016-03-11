# ================================================================
# ZSH Login
# ================================================================

source $HOME/.exports

if [ ! $ZSH_LOADING ]; then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 && $LINUX ]] && startx
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
