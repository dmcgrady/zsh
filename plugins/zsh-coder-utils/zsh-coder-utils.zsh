#
# ZSH Coder utilities
#

coder_utils=$ZSH_PLUGINS_DIR/zsh-coder-utils

for src in $(ls $coder_utils/src); do
    source $coder_utils/src/$src
done

fpath=(
    $coder_utils/functions
    $fpath
)
