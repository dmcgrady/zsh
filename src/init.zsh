#!/usr/local/bin/zsh

#=========================================================
#
#                      ---ZSH Config---
#
#=========================================================

locate-config() {
    local _config=$(find $1 -maxdepth 4 -type f -name "config.zsh" -print)
    source $_config
}

if [[ -e "$ZSH_DIR/config.zsh" ]]; then
    source $ZSH_DIR/config.zsh
else
    if [[ -e "$HOME/zsh" ]]; then
        locate-config $HOME/zsh
    else
        echo "ERROR: ZSH_DIR and/or `config.zsh` not found!"
        echo "Make sure you run `zs` from ZSH_DIR"
    fi
fi

export ZSH_CALLBACKS=()
export ZSH_LOADING=true

#---------------------------------------------------------
#                          Paths
#---------------------------------------------------------

fpath=(
    $ZSH_DIR/functions
    $ZSH_PLUGINS_DIR/zsh-coder-utils/functions
    $ZSH_DIR/completions
    ${fpath[@]}
)

path=(
    $HOME/.bin
    /usr/local/sbin
    /usr/local/bin
    $HOME/.local/bin
    $HOME/.cabal/bin
    $HOME/.xmonad/bin
    $HOME/.rvm/bin
    $HOME/.gem/bin
    $GOPATH/bin
    $ZSH_DIR/functions
    $path
)

#---------------------------------------------------------
#                        Autoload
#---------------------------------------------------------

autoload +X $ZSH_DIR/functions/*(:t) \
            $ZSH_DIR/completions/_*(:t)

autoload -Uz zrecompile \
             compinit \
             colors \
             throw
compinit
colors

#---------------------------------------------------------
#                        Plugins
#---------------------------------------------------------

# --- Verify ZGEN is installed ---
export ZGEN_CONFIG=($(find $ZSH_BASE_DIR/ -maxdepth 5 -type f -name 'zgen.zsh'  -print))
[[ -z "$ZGEN_CONFIG" ]] && \
   zlog red "Error: ZGEN not found!" && \
   zlog gray "Please install it from github to $ZSH_DIR/vendor/zgen" && exit

## ++ zgen
#zlog gray "zgen: sourcing $ZGEN_CONFIG"
source $ZGEN_CONFIG

# --- Load plugins ---
if ! zgen saved; then
    zlog green "Loading ZGEN plugins..."

    zgen oh-my-zsh
    zgen oh-my-zsh themes/arrow

    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/rebar
    zgen oh-my-zsh plugins/ruby
    zgen oh-my-zsh plugins/rails
    zgen oh-my-zsh plugins/gem
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/cabal
    zgen oh-my-zsh plugins/postgres
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/mix
    zgen oh-my-zsh plugins/redis-cli

    $LINUX && zgen oh-my-zsh plugins/archlinux
    if $OSX; then
        zgen load mkwmms/dotstrap-osx
        zgen oh-my-zsh plugins/osx
        zgen oh-my-zsh plugins/brew
    fi

    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/bgnotify
    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/nmap
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/cp
    zgen oh-my-zsh plugins/copyfile
    zgen oh-my-zsh plugins/copydir
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/adb
    zgen oh-my-zsh plugins/man
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/pass
    zgen oh-my-zsh plugins/torrent
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/jsontools
    zgen oh-my-zsh plugins/httpie
    zgen oh-my-zsh plugins/urltools
    zgen oh-my-zsh plugins/zsh_reload

    zgen loadall <<EOPLUGINS
	    rupa/z
        rimraf/k
        mafredri/zsh-async
        jocelynmallon/zshmarks
        srijanshetty/node.plugin.zsh
        djui/alias-tips
        TBSliver/zsh-plugin-tmux-simple
        arzzen/calc.plugin.zsh

        zsh-users/zsh-completions
        zsh-users/zsh-autosuggestions
        zsh-users/zsh-history-substring-search
EOPLUGINS
    zgen load $HOME/zsh/plugins/zsh-archlinux/
    zgen load $HOME/zsh/plugins/zsh-coder-aliases
    zgen load $HOME/zsh/plugins/zsh-coder-keybindings
    zgen load $HOME/zsh/plugins/zsh-coder-osx
    zgen load $HOME/zsh/plugins/zsh-coder-regex
    #zgen load $HOME/zsh/plugins/zsh-coder-theme
    zgen load $HOME/zsh/plugins/zsh-coder-utils
    zgen load $HOME/zsh/plugins/zsh-archlinux
    zgen load $HOME/zsh/plugins/zsh-base16-theme-installer
    zgen load $HOME/zsh/plugins/zsh-os
    zgen load $HOME/zsh/plugins/zsh-torrents
    zgen load $HOME/zsh/plugins/zsh-v

    # Load last
    zgen load zsh-users/zsh-syntax-highlighting
    # Save all to init script
    zgen save
    zlog green "ZGEN Plugins Loaded."
fi

# --- PLUGINS CMDS ---

autoload -Uz async && async

# TODO: erase?
# Enable autosuggestions automatically
# zle-line-init() {
# 	zle
# }
#zle -N zle-line-init

#---------------------------------------------------------
#                       Setup Callbacks
#---------------------------------------------------------

function execute() {
    {
        $1
    } always {
        if catch MyError; then
            echo "MyError detected"
        fi
        if catch ''; then
            echo "ERROR: $CAUGHT"
        fi
        if catch *; then
            echo "ERROR: $CAUGHT"
        fi
    }
}

ZSH_FINISHED_LOADING() {
    ZSH_LOADING=false
}

# NOTE: To call a function when ZSH finishes loading,
# append the function name to $ZSH_CALLBACKS, for ex:

ZSH_CALLBACKS+=(ZSH_FINISHED_LOADING)

#---------------------------------------------------------
#                        Modules
#---------------------------------------------------------

typeset -a ZSH_MODULES

ZSH_MODULES+=(
    osx
    logger
    zgen
    regex
    plugins
    keybindings
    login
    aliases
    theme

    zsh-archlinux.zsh
    aliases.zsh
    emoticons.zsh
    keybindings.zsh
    osx.zsh
    regex.zsh
    theme.zsh
    zsh-torrents.zsh
)

#import $ZSH_MODULES

#---------------------------------------------------------
#                        Validation
#---------------------------------------------------------

[ ! -d $ZSH_DIR ] && \
    zlog red "Error: please define ZSH_DIR in your ~/.zshrc." && \
    zlog gray "For example: \texport ZSH_DIR='~/zsh'\n" && exit

#---------------------------------------------------------
#                  Execute Callbacks
#---------------------------------------------------------

each $ZSH_CALLBACKS execute

#=========================================================

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#eval "$(rbenv init - --no-rehash)"
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias todo="nvim $HOME/TODO.tasks"
#eval $(/usr/local/bin/docker-machine env default)
#clear
