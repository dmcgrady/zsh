sudo pip install percol

if [ $OS = "OSX" ]; then
    brew install peco
    brew install fzf

    # Install shell extensions
    /usr/local/opt/fzf/install
fi

if [ $OS = "archlinux" ]; then
	go get github.com/peco/peco/cmd/peco

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
