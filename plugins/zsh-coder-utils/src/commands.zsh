typeset -A _Module

# =====================================================
# Commands
# =====================================================

_Module=(
    Id     "commands"
    Name   "Commands"
    About  "Authentication and option verification utilities for ZSH programs"
    Author "Dan McGrady <dan@dmix.ca>"
    Repo   "https://github.com/dmix/zsh"
)

RootAccess() {
    # Authorize
    if [ "$(whoami)" = "root" ]; then
        true
    else
        Logger red "Error: root access required"
        false
    fi
}

ValidCommand() {
    if [[ "${(@k)Commands}" != *$1* ]]; then
        Logger prefix ""
        Logger red "Command not found"
        Info "Here are the valid commands"
        for k in "${(@k)Commands}"; do
            Log " $ $Module[Id] $k"
        done
        Logger prefix "[$Module[Id]] ---"
        false
    else
        true
    fi
}

RequireArg() {
    if [ -z "$2" ]; then
        Logger red "Argument error: $1"
        exit
    fi
}
