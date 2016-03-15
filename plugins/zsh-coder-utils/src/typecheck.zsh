#!/usr/bin/zsh

# ZSH type utilities

typecheck() {
    _test=$1
    local _array="$(typeset  +m $_test | grep 'array')"
    local _assoc="$(typeset  +m $_test | grep 'association')"
    [ -n "$_assoc" ] && echo "assoc"  && return
    [ -n "$_array" ] && echo "array"  && return
    [ -n "$_test"  ] && echo "string" && return
}

is_string() {
    [ $(typecheck $1) = "string" ] && echo true
}

is_assoc() {
    [ $(typecheck $1) = "assoc" ] && echo true
}

is_array() {
    [ $(typecheck $1) = "array" ] && echo true
}

is_eol() {
    [ $(is_assoc $1) ] && return
    [ $(is_array $1) ] && return
    while IFS= read -r line; do
       echo true
       break
    done <<< $($1)
}

each() {
    while IFS= read -r line; do $2 $line; done <<< $1

}
