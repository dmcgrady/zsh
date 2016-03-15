#┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
#                           Aliases
#┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄

export ZSH_ALIAS_DIR=$ZSH_PLUGINS_DIR/zsh-coder-aliases/aliases

# Functions
# --------------------------------------------------
import-aliases() {
    source $ZSH_ALIAS_DIR/$1
}

edit-alias() {
    local _name=$1
    local _file="$ZSH_ALIAS_DIR/$1"
    local _shortcut=z-aliases-$_name[0,-7]

    alias $_shortcut="cd $ZSH_ALIAS_DIR && $EDITOR $_file"
}

edit-function-alias() {
    local _dir=$ZSH_FUNCTIONS_DIR
    local _file="$ZSH_FUNCTIONS_DIR/$1"
    local _shortcut=z-functions-$1

    alias $_shortcut="cd $_dir && $EDITOR $_file"
}

# Generate aliases
# --------------------------------------------------
alias a="cd $ZSH_ALIAS_DIR"
each $ZSH_ALIAS_DIR/*(:t) import-aliases
each $ZSH_ALIAS_DIR/*(:t) edit-alias
each $ZSH_FUNCTIONS_DIR/*(:t) edit-function-alias


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
