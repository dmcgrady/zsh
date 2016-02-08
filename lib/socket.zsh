#!/usr/bin/zsh
zmodload zsh/net/socket

zsocket -v /var/run/log

# zmodload zsh/net/tcp
# ztcp localhost 256
print hello socket world >&$REPLY
