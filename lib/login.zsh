# ================================================================
# ZSH Login
# ================================================================

if [ ! $ZSH_LOADING ]; then

    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx

    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

fi
