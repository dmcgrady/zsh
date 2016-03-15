#!/usr/bin/env zsh

# --------------------------------------------------------
# TORRENT-KIT
# --------------------------------------------------------
#
# Features:
#     - Automated categorizer
#       - Automate sorting of books, films, music, and softwarej
#       - Unzip all
#       - Delete old .torrent files
#     - List unwatched / unopened files
#     - Recommend watched/old torrent files to delete['pl']
#     - Auto-copy/rename subtitle files
#
# --------------------------------------------------------

# CATEGORIES -----------------------------------------------------

software_dir=$HOME/Software
books_dir=$HOME/Books
rovies_dir=$HOME/Movies
music_dir=$HOME/Music

# PATTERNS ------------------------------------------------------

typeset -A movie_patterns book_patterns software_patterns music_patterns
typeset -a blacklist watch_dirs root_dirs category_dirs

watch_dirs=(
    "$HOME/Torrents" "$HOME/Downloads" "$HOME/Desktop" "$HOME"
)

category_dirs=(
    $_BOOKS $_MOVIES $_SOFTWARE $_MUSIC
)

root_dirs=(
    $watch_dirs $category_dirs "tmp/" "*incomplete*"
)

deletelist=(
    ".spam"
)
blacklist=(
    ".part" ".torrent"
)

book_patterns=(
    # Filenames
    "text" "document" "ebook" "book" "ibook" "kindle"

    # Formats
    "cbr" "cbz" "cb7" "cbt" "cba" "djvu" "doc" "docx" "epub" "fb2" "html"
    "ibook" "inf" "azw" "lit" "prc" "mobi" "pdb" "txt" "pdb"
    "pdf" "tr2" "tr3" "oxps" "xps"
)

music_patterns=(
    # Filenames
    "VA"  "CD" "ALBUM" "Billboard" "song" "320" "256" "FLAC" "loseless" "vinyl" "EP" "lp" "kbps"
    "cbr" "deluxe" "mixtape" "mixfiend" "soundcloud" "songza" "DJ " "ak" "single" "cue" "bootleg"
    "itunes" "master"

    # Formats
    "3gp" "com" "com" "aac" "aax" "com" "com" "act" "aiff" "amr" "ape" "awb"
    "722" "dct" "dss" "dvf" "flac" "gsm" "iklax" "ivs" "m4a" "m4b" "m4p"
    "mmf" "mmf" "mp3" "mpc" "msv" "ogg" "oga" "Org" "opus" "raw" "sln" "tta"
    "vox" "wav" "wma" "wavpa" "com" "htm" "webm"
)

movie_patterns=(
    # Filenames
    "XVID" "HDTV" "blueray" "bluray" "ac3" "x264" "webrip" "season" "s0" "DVD" "scr"
    "720p" "1080p" "1080i" "subtitle" "eng"

    # Formats
    "webm" "mkv" "flv" "264" "264" "flv" "264" "vob" "262" "vob" "ogv"
    "ogg" "drc" "gif" "gifv" "webm" "gifv" "mng" "avi" "mov" "wmv" "net"
    "yuv" "rmvb" "asf" "mp4" "m4p" "m4v" "264" "mpg" "mp2" "mpeg" "mpe"
    "mpv" "mpg" "mpeg" "m2v" "262" "m4v" "264" "svi" "3gp" "263" "264" "3g2"
    "263" "264" "mxf" "roq" "nsv" "flv" "f4v" "f4p" "f4a" "f4b"
)

software_patterns=(
    # Keywords
    "activator" "activated" "keygen" "x86" "x64" "Win10" "demo" "trial"
    "photoshop" "cracked" "MAC" "OSX" "Microsoft" "windows" "archlinux" "debian"

    # Apps
    "app" "dmg" "pkg" "exe" "iso"

    # Archives
    "cpio" "shar" "LBR" "LBR" "LQR" "lbr" "mar" "tar" "tar" "tar.bz2"
    "tar" "bz2" "lzma" "lzo" "sfark" "TQT" "CQM" "EQE" "LBR" "LQR" "LBR"
    "infl" "s7z" "ace" "afa" "alz" "apk" "andro" "packa" "arc"
    "arj" "org" "html" "cab" "car" "cfs" "cpt" "dar" "dgc" "ear" "gca"
    "hki" "ice" "jar" "kgb" "lzh" "lha" "lzx" "cab" "chm" "pak" "parti"
    "paq6" "paq7" "paq8" "net" "pea" "pim" "pit" "qda" "rar" "zip" "sda"
    "sea" "sea" "sen" "sfx" "sit" "sitx" "sit" "sqx" "tar" "tgz" "tar"
    "tar.bz2" "tbz2" "tar.lzma" "tlz" "uc0" "uc2" "ucn" "ur2" "ue2" "uca"
    "uha" "war" "wim" "xar" "xp3" "yz1" "zip" "zipx" "zoo" "zpaq" "ecc"
    "par" "par2"
)

# PROGRAM --------------------------------------------------------

# Plan:

# 1) Build list of files in watch dirs
#   - Locate all files in watch dir
#       - assoc array?
#   - Loop through each file/dir
#       - Lowercase all
#       - Filter blacklist files
#       - rm spammy files in deletelist
tor-files-locate() {

}

# 2) Group by directory
#   - filter by root_dirs
#   - max 3 dirs deep
#   - Example
#       - a) torrents/file.mpv ===> file.mpv
#       - b) torrents/dir/files.mpv ===> ./dir/*
tor-files-group() {

}

# 3) Pattern match groups for each category
#   - convert patterns into regex
#   - loops through all files and pattern match
#   - record matches in group counter (and maybe file counter)
#   - sort/rank by number of pattern matches
#   - categorize each group by highest # of matches
tor-files-categorize() {

}

# 4) Categorized files into folders
#    - mv dirs ==> $HOME/Category
#    - print out zero-matches
tor-files-move() {

}
