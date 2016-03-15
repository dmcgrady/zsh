#!/usr/bin/env zsh

zmodload zsh/regex zsh/pcre
autoload -U regexp-replace
setopt re_match_pcre

test_filenames=(
    "OREILLY.THINK.BAYES.BAYESIAN.STATISTICS.IN.PYTHON.2013.RETAIL.EPUB.EBOOK-kE"
    "Think\ Stats.epub"
    "Alfred\ 2.8.2_MAC599"
    "Windows\ 10\ Pro\ v.1511\ En-us\ x64\ Feb\ 2016\ Incl\ Activator-=TEAM\ OS=-"
    "\[\ UsaBit.com\ \]\ -\ Moneyball\ 2011\ BRRip\ XviD-FTW"
    "A\ Walk\ to\ Remember\ \(2002\)\ \[1080p\]"
    "\(T\)error\ 2015\ Dk-subs\ 480p\ WEB-DL\ \ mp4-Andreas94Dk"
    "Thinking\ with\ Data\ -\ How\ to\ Turn\ Information\ into\ Insights"
    "Viscosity\ \(1.5.10\).dmg"
    "Wag\ The\ Dog\ \[HDTV\ m-720p\ Dual\ AC3\ Esp-Eng\].mkv"
    "Analysis\ and\ Modeling\ of\ Complex\ Data\ in\ Behavioral\ and\ Social\ Sciences\ \[Dr.Soc\].pdf"
    "Andrii\ Sergiienko\ -\ WebRTC\ Cookbook\ -\ 2015"
    "Apress\ The\ Definitive\ Guide\ to\ HTML5\ WebSocket\ 2013\ RETAiL\ eBOOk-rebOOk"
    "Better.Call.Saul.S02E04.HDTV.x264-FUM\[ettv\]"
    "CARROT\ Weather\ \(1.1\).dmg"
    "Cartel\ Land\ 2015\ English\ Movies\ 720p\ HDRip\ XviD\ AAC\ New\ Source\ with\ sample\ \~\ ☻rDX☻"
    "CleanMyMac\ 3.2.1\ Pre-Activated"
    "Data\ Science\ at\ the\ Command\ Line.pdf"
    "Fantastical_v2.1.5"
)

test_normalized_filenames=(
    "OREILLY_THINK_BAYES_BAYESIAN_STATISTICS_IN_PYTHON_2013_RETAIL_EPUB_EBOOKkE"
    "Think_Stats_epub"
    "Alfred_2_8_2_MAC599"
    "Windows_10_Pro_v_1511_Enus_x64_Feb_2016_Incl_Activator_TEAM_OS_"
    "UsaBit_com__Moneyball_2011_BRRip_XviDFTW"
    "A_Walk_to_Remember_2002_1080p"
    "T_error_2015_Dksubs_480p_WEBDL_mp4Andreas94Dk"
    "Thinking_with_Data__How_to_Turn_Information_into_Insights"
    "Viscosity_1_5_10_dmg"
    "Wag_The_Dog_HDTV_m720p_Dual_AC3_EspEng_mkv"
    "Analysis_and_Modeling_of_Complex_Data_in_Behavioral_and_Social_Sciences_Dr_Soc_pdf"
    "Andrii_Sergiienko__WebRTC_Cookbook__2015"
    "Apress_The_Definitive_Guide_to_HTML5_WebSocket_2013_RETAiL_eBOOkrebOOk"
    "Better_Call_Saul_S02E04_HDTV_x264FUM_ettv"
    "CARROT_Weather_1_1_dmg"
    "Cartel_Land_2015_English_Movies_720p_HDRip_XviD_AAC_New_Source_with_sample_rDX"
    "CleanMyMac_3_2_1_PreActivated"
    "Data_Science_at_the_Command_Line_pdf"
    "Fantastical_v2_1_5"
)

# Normalize torrent titles
# ----------------------------------------------------------------------------
typeset -a test_normalized_filenames
test_normalize_filename() {
    echo "----------------------------------------"
    local filename="$1"
    echo $filename
    regexp-replace filename '[^a-zA-Z0-9\\s\"._]' '_'
    regexp-replace filename '[\[\]\(\)\\\s\=\-]' '_'
    regexp-replace filename '(\_\.\|\.\_\\|^\_)' ''
    regexp-replace filename '__' '_'
    regexp-replace filename '___' '_'
    regexp-replace filename '\_$' ''
    echo $filename
    return
    line="$1"
    line="${line/}"
    line="${line//[^a-zA-Z0-9\\s\"._]/_/g}"
    # line="${line/(_\"|\")/\"/}"
    # line="${line/__/_/}"
    # line="${line/__/_/}"

    echo "----------------------------------------------------------------------------"
    echo $1
    echo $line
    test_normalized_filenames=( $test_normalized_filenames $line )
}

for filename in $test_filenames; do
    test_normalize_filename $filename
done

return
test_categorized_files=(
# ----------------------------------------------------------------------------
# | CATEGORY   | FILEPATH
# ----------------------------------------------------------------------------
    "book"       "$Torrents/OREILLY.THINK.BAYES.BAYESIAN.STATISTICS.IN.PYTHON.2013.RETAIL.EPUB.EBOOK-kE"
# ----------------------------------------------------------------------------"
    "book"       "$Torrents/Think\ Stats.epub"
# ----------------------------------------------------------------------------"
    "software"   "$Torrents/Alfred\ 2.8.2_MAC599"
# ----------------------------------------------------------------------------
    "software"   "$Torrents/Windows\ 10\ Pro\ v.1511\ En-us\ x64\ Feb\ 2016\ Incl\ Activator-=TEAM\ OS=-"
# ----------------------------------------------------------------------------
    "movie"      "$Torrents/\[\ UsaBit.com\ \]\ -\ Moneyball\ 2011\ BRRip\ XviD-FTW"
# ----------------------------------------------------------------------------
    "movie"      "$Torrents/A\ Walk\ to\ Remember\ \(2002\)\ \[1080p\]"
# ----------------------------------------------------------------------------
    "movie"      "$Torrents/\(T\)error\ 2015\ Dk-subs\ 480p\ WEB-DL\ \ mp4-Andreas94Dk"
# ----------------------------------------------------------------------------
    "book"       "$Torrents/Thinking\ with\ Data\ -\ How\ to\ Turn\ Information\ into\ Insights"
# ----------------------------------------------------------------------------
    "software"   "$Torrents/Viscosity\ \(1.5.10\).dmg"
# ----------------------------------------------------------------------------
    "movie"      "$Torrents/Wag\ The\ Dog\ \[HDTV\ m-720p\ Dual\ AC3\ Esp-Eng\].mkv"
# ----------------------------------------------------------------------------
    "book"       "$Torrents/Analysis\ and\ Modeling\ of\ Complex\ Data\ in\ Behavioral\ and\ Social\ Sciences\ \[Dr.Soc\].pdf"
# ----------------------------------------------------------------------------
    "book"       "$Torrents/Andrii\ Sergiienko\ -\ WebRTC\ Cookbook\ -\ 2015"
# ----------------------------------------------------------------------------
    "book"       "$Torrents/Apress\ The\ Definitive\ Guide\ to\ HTML5\ WebSocket\ 2013\ RETAiL\ eBOOk-rebOOk"
# ----------------------------------------------------------------------------
    "movie"      "$Torrents/Better.Call.Saul.S02E04.HDTV.x264-FUM\[ettv\]"
# ----------------------------------------------------------------------------
    "software"   "$Torrents/CARROT\ Weather\ \(1.1\).dmg"
# ----------------------------------------------------------------------------
    "movie"      "$Torrents/Cartel\ Land\ 2015\ English\ Movies\ 720p\ HDRip\ XviD\ AAC\ New\ Source\ with\ sample\ \~\ ☻rDX☻"
# ----------------------------------------------------------------------------
    "software"   "$Torrents/CleanMyMac\ 3.2.1\ Pre-Activated"
# ----------------------------------------------------------------------------
    "book"       "$Torrents/Data\ Science\ at\ the\ Command\ Line.pdf"
# ----------------------------------------------------------------------------
    "software"   "$Torrents/Fantastical_v2.1.5"
# ----------------------------------------------------------------------------
    "movies"     "$Torrents/Luther.S01E01.1080p.BluRay.x265.HEVC.AC3.2.0.Condo.mkv"
# | CATEGORY   | FILEPATH
# ----------------------------------------------------------------------------
)

test_raw_torrent_files=(
    "$Torrents/Airmail\ 2.6.1_MAC599"
    "$Torrents/Alfred\ \(2.8.1\).dmg"
    "$Torrents/Alfred\ 2.8.2_MAC599"
    "$Torrents/Analysis\ and\ Modeling\ of\ Complex\ Data\ in\ Behavioral\ and\ Social\ Sciences\ \[Dr.Soc\].pdf"
    "$Torrents/Andrii\ Sergiienko\ -\ WebRTC\ Cookbook\ -\ 2015"
    "$Torrents/Apress\ The\ Definitive\ Guide\ to\ HTML5\ WebSocket\ 2013\ RETAiL\ eBOOk-rebOOk"
    "$Torrents/Better.Call.Saul.S02E04.HDTV.x264-FUM\[ettv\]"
    "$Torrents/CARROT\ Weather\ \(1.1\).dmg"
    "$Torrents/Cartel\ Land\ 2015\ English\ Movies\ 720p\ HDRip\ XviD\ AAC\ New\ Source\ with\ sample\ \~\ ☻rDX☻"
    "$Torrents/CleanMyMac\ 3.2.1\ Pre-Activated"
    "$Torrents/Data\ Science\ at\ the\ Command\ Line.pdf"
    "$Torrents/Fantastical_v2.1.5"
    "$Torrents/Forbrydelsen\ -\ Season\ 1\ -\ 720p\ x265\ HEVC\ -\ DAN-ITA\ \(ENG\ SUBS\)\ \[BRSHNKV\]"
    "$Torrents/Genius\ and\ Heroin\ -\ The\ Illustrated\ Catalogue\ of\ Creativity,\ Obsession,\ and\ Reckless\ Abandon\ Through\ the\ Ages.epub"
    "$Torrents/Gummo.1997.DVDRip.XviD-DiSSOLVE"
    "$Torrents/Humanizing.Big.Data.Marketing.at.the.Meeting.of.Data.Social.Science.and.Consumer.Insight.epub"
    "$Torrents/Introduction\ To\ Vaping\ \(6\)"
    "$Torrents/Introduction\ To\ Vaping.zip"
    "$Torrents/Joseph\ Conard\ -\ Heart\ of\ Darkness"
    "$Torrents/Karen\ Armstrong\ -\ Buddha\ \(Penguin\ Lives\)\ \(lit\)"
    "$Torrents/Luther\ Season\ 1-3\ S01-S03\ COMPLETE\ SERIES\ 720p\ BluRay\ x264-iNGOT\ \[RiCK\]"
    "$Torrents/Luther.S01E01.1080p.BluRay.x265.HEVC.AC3.2.0.Condo.mkv"
    "$Torrents/Microsoft\ Office\ 2016\ v15.13.1"
    "$Torrents/Moneyball.2011.iNTERNAL.1080p.BluRay.x264.anoXmous"
    "$Torrents/ONYX"
    "$Torrents/OREILLY.THINK.BAYES.BAYESIAN.STATISTICS.IN.PYTHON.2013.RETAIL.EBOOK-kE"
    "$Torrents/OREILLY.THINK.BAYES.BAYESIAN.STATISTICS.IN.PYTHON.2013.RETAIL.EPUB.EBOOK-kE"
    "$Torrents/Omnifocus\ Pro\ 2.4.2_MAC599"
    "$Torrents/Paragon\ ExtFS\ 9.6.26\ \[TR\]"
    "$Torrents/Paragon\ ExtFS\ 9.6.26\ \[TR\].zip"
    "$Torrents/Photoshop\ CC\ 2015\ 2.0"
    "$Torrents/Postbox\ 4.0.3\ Multilingual\ +\ Crack\ \[4realtorrentz\]"
    "$Torrents/Postbox\ 4.0.3\ Multilingual\ +\ Crack\ \[4realtorrentz\].zip"
    "$Torrents/RZA\ \&\ Howard\ Drossin\ -\ The\ Man\ With\ The\ Iron\ Fists\ 2\ \{\ OST\ -\ 2015\ \}\ -\ \[MAHIY\]"
    "$Torrents/RZA\ -\ The\ Man\ With\ Iron\ Fists\ \[OST\]\ 2012"
    "$Torrents/Real-Time\ Communication\ with\ WebRTC"
    "$Torrents/Sketch\ 3.6"
    "$Torrents/Slow.West.2015.BRRip.480p.x264.AAC-VYTO\ \[P2PDL.com\]"
    "$Torrents/SpamSieve.dmg"
    "$Torrents/Sublime\ Text\ 3\ \(Build\ 3095\).dmg"
    "$Torrents/The\ Politics\ of\ Heroin\ in\ Southeast\ Asia.pdf"
    "$Torrents/The\ Wolf\ Among\ Us\ Episode\ 1\ to\ 5\ MacOSX-ACTiVATED"
    "$Torrents/The.Danish.Girl.2015.DVDScr.XVID.AC3.HQ.Hive-CM8"
    "$Torrents/The.Stanford.Prison.Experiment.2015.DVDRip.XViD-EVO"
    "$Torrents/Think\ Stats.epub"
    "$Torrents/Think\ Stats.pdf"
    "$Torrents/Thinking\ with\ Data\ -\ How\ to\ Turn\ Information\ into\ Insights"
    "$Torrents/Viscosity\ \(1.5.10\).dmg"
    "$Torrents/Wag\ The\ Dog\ \[HDTV\ m-720p\ Dual\ AC3\ Esp-Eng\].mkv"
    "$Torrents/Wag\ the\ Dog\[1997\]HDRip\ XviD-ExtraTorrentRG"
    "$Torrents/\[\ www.UsaBit.com\ \]\ -\ Rising\ Sun\ 1993\ 720p\ BRRip\ x264-PLAYNOW.mp4"
    "$Torrents/\[www.Cpasbien.me\]\ The.Man.with.the.Iron.Fists.2012.UNRATED.FRENCH.BDRip.XviD-AYMO"
    "$Torrents/the_definitive_guide_to_html5_websocket.pdf"
    "$Torrents/torrents"
    "$Torrents/Строго\ на\ запад.720p.i.\ Ton.mkv"
)

typeset -A rank_1=("books" 0 "software" 0 "movies" 0 "music" 0\) \

test_id_files=(
# ----------------------------------------------------------------------------
# | ID          | FILEPATH
# ----------------------------------------------------------------------------
    1             "$Torrents/OREILLY.THINK.BAYES.BAYESIAN.STATISTICS.IN.PYTHON.2013.RETAIL.EPUB.EBOOK-kE"
    2             "$Torrents/Think\ Stats.epub"
    3             "$Torrents/Alfred\ 2.8.2_MAC599"
    4             "$Torrents/Windows\ 10\ Pro\ v.1511\ En-us\ x64\ Feb\ 2016\ Incl\ Activator-=TEAM\ OS=-"
    5             "$Torrents/\[\ UsaBit.com\ \]\ -\ Moneyball\ 2011\ BRRip\ XviD-FTW"
    6             "$Torrents/A\ Walk\ to\ Remember\ \(2002\)\ \[1080p\]"
    8             "$Torrents/\(T\)error\ 2015\ Dk-subs\ 480p\ WEB-DL\ \ mp4-Andreas94Dk"
    9             "$Torrents/Thinking\ with\ Data\ -\ How\ to\ Turn\ Information\ into\ Insights"
    10            "$Torrents/Viscosity\ \(1.5.10\).dmg"
    11            "$Torrents/Wag\ The\ Dog\ \[HDTV\ m-720p\ Dual\ AC3\ Esp-Eng\].mkv"
    12            "$Torrents/Analysis\ and\ Modeling\ of\ Complex\ Data\ in\ Behavioral\ and\ Social\ Sciences\ \[Dr.Soc\].pdf"
    13            "$Torrents/Andrii\ Sergiienko\ -\ WebRTC\ Cookbook\ -\ 2015"
    14            "$Torrents/Apress\ The\ Definitive\ Guide\ to\ HTML5\ WebSocket\ 2013\ RETAiL\ eBOOk-rebOOk"
    15            "$Torrents/Better.Call.Saul.S02E04.HDTV.x264-FUM\[ettv\]"
    16            "$Torrents/CARROT\ Weather\ \(1.1\).dmg"
    17            "$Torrents/Cartel\ Land\ 2015\ English\ Movies\ 720p\ HDRip\ XviD\ AAC\ New\ Source\ with\ sample\ \~\ ☻rDX☻"
    18            "$Torrents/CleanMyMac\ 3.2.1\ Pre-Activated"
    19            "$Torrents/Data\ Science\ at\ the\ Command\ Line.pdf"
    20            "$Torrents/Fantastical_v2.1.5"
)
