#!/usr/bin/zsh

source binkit

typeset -A Module Commands

# ------------------------------------------------------
# Name
# ------------------------------------------------------

Module=(
    Id     'xbin' # Unique program identifier
    Name   'XBin' # Human-friendly name for program
    About  'Insert a short description'
    Author 'Dan McGrady <dan@dmix.ca>'
    Repo   'https://github.com/dmix/xbin'
)

# -- Help ---

Help() { cat << EOF

  Usage:

      xbin <start|stop>

  Example:

      $ xbin start
      > Starting xbin

EOF
exit
}

# --- Options ---

[ ! $1 ] && Help

Commands=(
    'start' xbin-start
    'stop'  xbin-stop
)

# --- XBin ---

xbin-start() {
    Info "START: Example program running"
    Log "<< Insert Program output >>"
    Success "It worked!"
}

xbin-stop() {
    Info "STOP: Example program shutting down..."
    Warn "Shutting down!"
    exit
}

# --- Initialize ---

if ValidCommand $1; then
    ! RootAccess && exec -- sudo "$0" "$@"
    LogWelcome
    $Commands[$1] $@
    LogGoodbye
fi
