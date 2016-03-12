# Load module
zmodload -ab regex pcre pcre_compile pcre_study pcre_match
setopt rematch_pcre # =~ uses pcre library

# regexp related stuff
#
# [[ "foobar_123" -regex-match "^([a-zA-Z0-9]+)_([0-9]+)$" ]] && echo match || echo no match
# [[ "foobar_123" -pcre-match "^(\w+)_(\d+)$" ]] && echo match || echo no match
#
# pcre_compile "^(\w+)_(\d+)$"
# pcre_match "foobar_123" && echo match || echo no match
#
# pcre_compile -i "^foobar\s+\d+$"
# pcre_match "fOoBaR   123" && echo match || echo no match
#
# [[ "fOoBaR   123" -pcre-match "^[fF][oO]{2}[bB][aA][rR]\s+\d+$" ]] && echo match || echo no match
#
# Note: if you are using complex regular expressions you can improve speed via pcre_study.

# EXAMPLES:
# pcre_compile -m '^URL:\s+(.*?)$[.\n]*^Repository Root:\s+(.*?)$' && pcre_match "$info" && echo ${match[1]##$match[2]}
#
# Execute POSIX ERE
# [[ "foobar_123" -regex-match "^([a-zA-Z0-9]+)_([0-9]+)$" ]] && echo match || echo no match
#
# # Execute PCRE
# [[ "foobar_123" -pcre-match "^(\w+)_(\d+)$" ]] && echo match || echo no match

