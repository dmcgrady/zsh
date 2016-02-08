# ================================================================
# KEYBINDINGS
# ================================================================

# --- CHARACTERS ---

# Inject ====... (x50)
# Inject ---... (x50)
# Inject "--- [insert] ---"
# Inject lamda
# Inject bullet
# Inject x
# Inject checkmark
#================================================================
#•
#❌
#✔
#◯
#▬▶
#❱
#➔
#✭
#▌
#▍
#▎
#┃
#│
#░
#▞
#┆
#┇
#─
#━
#┄
#┅
#╌


# --- VI MODE ---
bindkey -v
bindkey "^F" vi-cmd-mode # toggle vi-mode
bindkey '^f' vi-forward-word # bind f to autosuggest move forward

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

# Bind UP and DOWN arrow keys (compatibility fallback
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# Bind k and j for VI mode
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

# Bind CTRL+k and CTRL+j to substring search
#bindkey '^j' history-substring-search-up
#bindkey '^k' history-substring-search-down

# Search history with `fzf`
bindkey -s "^H" "^[Ihistory | fzf-tmux --tac --no-sort^[A"
alias hh="history | fzf --tac --no-sort"

# --- AUTOSUGGEST ----

bindkey '^f' vi-forward-word # bind f to autosuggest move forward

