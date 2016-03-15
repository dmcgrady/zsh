#
# Import
#

Usage=$(cat <<EOL

    Usage:
        via $PATH:

           Import shml

        via local filepath:

           Import /usr/share/libz/help.zsh

        BinKit module:

           Import binkit
           Import binkit/logger

        Github Module (remote)

           Import github.com/dmix/bins/zsh_functions

EOL
)

#-- options -------------------------------------------

Sources=(
    /bin
    /usr/bin
    /usr/local/bin
    ~/.bin
)

#-- import -------------------------------------------

function Import() {
    [ $(is_string $1) ] && import-string $1
    [ $(is_assoc  $1) ] && import-assoc $1
    [ $(is_eol    $1) ] && import-eol $1
    [ $(is_array  $1) ] && import-array $1
}

import-string() {

}

import-assoc() {

}

import-array() {

}

import-locate() {
    for s in $Sources; do
        find $s -print
    done
}
_cache="$(locate-bins)"


function import() {
# determine type of elemnt
# syntax:
#     - single string
#     - string block
#     - array
# locates:
# errors if not found
    typeset -A optA
    typeset -a opta
    optA=(
        one two
        one two
    )
    opta=(
        one
        two
    )
    optS="test"
}

function locate-plugin() {
    echo $files | grep "$1" | sort -d | head -1
}

function each() {
    while IFS= read -r line; do $2 $line; done <<< $1
}

#-- test -------------------------------------------

function test() {

import $(cat <<EOL
exports.zsh
aliases.zsh
logger.zsh
EOL
)

}
