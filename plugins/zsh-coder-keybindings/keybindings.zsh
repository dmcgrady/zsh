# ================================================================
# KEYBINDINGS
# ================================================================

zmodload zsh/terminfo
export KEYTIMEOUT=1

# --- VI MODE ---
bindkey -v
bindkey "^F" vi-cmd-mode # toggle vi-mode
bindkey '^f' vi-forward-word # bind f to autosuggest move forward
# bindkey '^ ' autosuggest-accept
# bindkey '^-' autosuggest-clear

# --- COMMAND PROMPT ---

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word

# --- SUDO ---
bindkey -s "^S" "^[Isudo ^N^[A" # repeat last cmd with sudo

# --- HISTORY ---

### Arrow Keys ###########################################

# Bind up/down arrow keys to navigate through your history
# bindkey '\e[A' directory-history-search-backward
# bindkey '\e[B' directory-history-search-forward

if $OSX; then
    # OPTION 1: for iTerm2 running on Apple MacBook laptops
    bindkey "$terminfo[cuu1]" history-substring-search-up
    bindkey "$terminfo[cud1]" history-substring-search-down
else
    # OPTION 2: for most systems
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down
fi

## VI mode ##############################################

# Bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Bind CTRL+k and CTRL+j to substring search
bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down
# Search history with `fzf`
# bindkey -s "^H" "^[Ihistory | fzf-tmux --tac --no-sort^[A"
alias hh="history | fzf --tac --no-sort"
