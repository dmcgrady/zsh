# ================================================================
# Colors
# ================================================================

colors

typeset -A glacier-colors

glacier-colors=(
    # Xresources
    color00 "0E/15/1B" # Black
    color01 "D7/50/3C" # Red
    color02 "52/EA/A9" # Green
    color03 "FF/B4/54" # Yellow
    color04 "26/6B/85" # Blue
    color05 "CB/25/3D" # Magenta
    color06 "89/96/A8" # Cyan
    color07 "FE/FE/FE" # White
    color08 "23/32/3F" # Bright Black
    color09 "F0/5E/33" # Bright Red
    color10 "76/FF/CD" # Bright Green
    color11 "FF/E7/92" # Bright Yellow
    color12 "3C/AD/D7" # Bright Blue
    color13 "D7/3C/4D" # Bright Magenta
    color14 "AF/C4/DB" # Bright Cyan
    color15 "FF/FF/FF" # Bright White
    color16 "F5/75/42" # Orange
    color17 "9F/3A/2C" # Brown
    color18 "3C/44/4D" # Dark Grey
    color19 "51/5C/68" # Grey
    color20 "B0/B3/BA" # Bright Grey
    color21 "FF/FF/FF" # White

    # RGB
    black "0e/15/1b"
    red "d7/50/3c"
    green "52/ea/a9"
    yellow "ff/b4/54"
    blue "26/6b/85"
    magenta "cb/25/3d"
    cyan "89/96/a8"
    white "fe/fe/fe"
    bright_black "23/32/3f"
    bright_red "f0/5e/33"
    bright_green "76/ff/cd"
    bright_yellow "ff/e7/92"
    bright_blue "3c/ad/d7"
    bright_magenta "d7/3c/4d"
    bright_cyan "af/c4/db"
    bright_white "ff/ff/ff"
    orange "f5/75/42"
    brown "9f/3a/2c"
    dark_grey "3c/44/4d"
    grey "51/5c/68"
    bright_grey "b0/b3/ba"
    white "ff/ff/ff"
    )
    # HEX
    color_Black "0E151B"
    color_Red "D7503C"
    color_Green "52EAA9"
    color_Yellow "FFB454"
    color_Blue "266B85"
    color_Magenta "CB253D"
    color_Cyan "8996A8"
    color_White "FEFEFE"
    color_Bright_Black "23323F"
    color_Bright_Red "F05E33"
    color_Bright_Green "76FFCD"
    color_Bright_yellow "FFE792"
    color_Bright_Blue "3CADD7"
    color_Bright_Magenta "D73C4D"
    color_Bright_Cyan "AFC4DB"
    color_Bright_White "FFFFFF"
    color_Darker "1B2735"
    color_Grey "B0B3BA"
    color_Bright_White "FFFFFF"
    color_orange "F57542"
    color_brown "9F3A2C"
}

export-colors() {
    local colors=$1
    for k in "${(@k)$colors}"; do
        export $k="$$colors[$k]"
    done
}

if [[ $ZSH_EVAL_CONTEXT != 'toplevel' ]]; then
    # Script is being sourced so run the generator
    export-colors $glacier-colors
fi
# Additional HEX
#  color_green             = "4ABE95"
#  color_green_2           = "43AE88"
#  color_bright_green_2    = "5EEBB8"
#  color_dark_red          = "BD4230"
#  color_mustard           = "DDB700"
#  color_yellow_2          = "F7F09D"
#  color_yellow_3 (greener)= "F3FFB5"
#  color_black             = "0C1217"
#  color_black_2           = "0D1319"
#  color_black_3           = "0E151B"
#  color_black_5           = "23323F"
#  color_black_6           = "233345"
#  color_black_7           = "263445"
#  color_grey              = "3C444D"
#  color_grey_2            = "3E4751"
#  color_grey_3            = "515C68"
#  color_bright grey       = "B0B3BA"
#  color_brigher grey      = "EFEFEF"
#  color_white             = "F8F8F8"

# 16 color space
# printf "\e]4;0;rgb:$color00\e\\"
# printf "\e]4;1;rgb:$color01\e\\"
# printf "\e]4;2;rgb:$color02\e\\"
# printf "\e]4;3;rgb:$color03\e\\"
# printf "\e]4;4;rgb:$color04\e\\"
# printf "\e]4;5;rgb:$color05\e\\"
# printf "\e]4;6;rgb:$color06\e\\"
# printf "\e]4;7;rgb:$color07\e\\"
# printf "\e]4;8;rgb:$color08\e\\"
# printf "\e]4;9;rgb:$color09\e\\"
# printf "\e]4;10;rgb:$color10\e\\"
# printf "\e]4;11;rgb:$color11\e\\"
# printf "\e]4;12;rgb:$color12\e\\"
# printf "\e]4;13;rgb:$color13\e\\"
# printf "\e]4;14;rgb:$color14\e\\"
# printf "\e]4;15;rgb:$color15\e\\"

#
# # 256 color space
# if [ "$TERM" != linux ]; then
#   printf "\e]4;16;rgb:$color16\e\\"
#   printf "\e]4;17;rgb:$color17\e\\"
#   printf "\e]4;18;rgb:$color18\e\\"
#   printf "\e]4;19;rgb:$color19\e\\"
#   printf "\e]4;20;rgb:$color20\e\\"
#   printf "\e]4;21;rgb:$color21\e\\"
# fi

# # clean up
# unset color00
# unset color01
# unset color02
# unset color03
# unset color04
# unset color05
# unset color06
# unset color07
# unset color08
# unset color09
# unset color10
# unset color11
# unset color12
# unset color13
# unset color14
# unset color15
# unset color16
# unset color17
# unset color18
# unset color19
# unset color20
# unset color21
#
