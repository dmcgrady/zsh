#┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
#                           Aliases
#┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄

# Functions
# --------------------------------------------------
import-aliases() {
    source $ZSH_DIR/aliases/$1
}

edit-alias() {
    local _name=$1
    local _file="$ZSH_DIR/aliases/$1"
    local _shortcut=z-aliases-$_name[0,-7]

    alias $_shortcut="cd $ZSH_DIR && $EDITOR $_file"
}

edit-function-alias() {
    local _dir="$ZSH_DIR/functions"
    local _file="$ZSH_DIR/functions/$1"
    local _shortcut=z-functions-$1

    alias $_shortcut="cd $_dir && $EDITOR $_file"
}

# Generate aliases
# --------------------------------------------------
alias a="cd $HOME/zsh/aliases"
each $ZSH_DIR/aliases/*(:t) import-aliases
each $ZSH_DIR/aliases/*(:t) edit-alias
each $ZSH_DIR/functions/*(:t) edit-function-alias


# Aliases (Manual)
# --------------------------------------------------
# zsh_aliases=(
#     "apps"
#     "android"
#     "code"
#     "dirs"
#     "git"
#     "linux"
#     "rc"
#     "pacman"
#     "search"
#     "zsh"
# )
#each $zsh_aliases edit-function-alias

