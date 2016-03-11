# ================================================================
# PLUGINS
# ================================================================

# --- Verify ZGEN is installed ---
#
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

    zgen loadall <<EOPLUGINS
        mafredri/zsh-async
	    rupa/z
        zsh-users/zsh-syntax-highlighting
        jocelynmallon/zshmarks
        Tarrasch/zsh-bd
        srijanshetty/node.plugin.zsh
        djui/alias-tips
        TBSliver/zsh-plugin-tmux-simple
        zsh-users/zsh-completions
        zsh-users/zsh-history-substring-search
EOPLUGINS
        #zsh-users/zaw
        #horosgrisa/zsh-konsole-theme-changer
        #RobSis/zsh-completion-generator
        #gusaiani/elixir-oh-my-zsh
        #tymm/zsh-directory-history
        #b4b4r07/enhancd
        #hchbaw/auto-fu.zsh
        #bobthecow/git-flow-completion
        #arzzen/calc.plugin.zsh
        #rimraf/k

    # theme
    zgen oh-my-zsh themes/arrow

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/wd
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/nmap
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/cpv
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/adb
    zgen oh-my-zsh plugins/golang
    zgen oh-my-zsh plugins/man
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/pass
    zgen oh-my-zsh plugins/rebar
    zgen oh-my-zsh plugins/ruby
    zgen oh-my-zsh plugins/rsync
    zgen oh-my-zsh plugins/torrent
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/urltools
    zgen oh-my-zsh plugins/zsh_reload
    zgen oh-my-zsh plugins/zsh-navigation-tools
    zgen oh-my-zsh plugins/zsh-navigation-tools
    zgen oh-my-zsh plugins/z

    # subdirs
    #zgen load junegunn/fzf shell
    zgen load ascii-soup/zsh-url-highlighter url
    zgen load zsh-users/zsh-completions src
    # Load last:
    zgen load tarruda/zsh-autosuggestions

    if [[ $OSX ]]; then
       zgen load mkwmms/dotstrap-osx
    fi

    # save all to init script
    zgen save
    zlog green "ZGEN Plugins Loaded."
fi

compinit -d $ZSH_CACHE_DIR/zcomp-$HOST "${ZGEN_DIR}/zcompdump"

# --- DIRECTORY HISTORY ---

#
# zle -N zle-line-init
#ENHANCD_FILTER=peco
#export ENHANCD_FILTER

autoload -Uz async && async
## AUTOFU
#zstyle ':completion:*' completer _oldlist _complete
#zle -N zle-keymap-select auto-fu-zle-keymap-select

# Enable autosuggestions automatically
zle-line-init() {
#	zle auto-fu-init
	zle autosuggest-start
}

zle -N zle-line-init
