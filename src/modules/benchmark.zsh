if [ $ZSH_BENCHMARK != false ]; then
    _end=$(date +%s.%N)
    (( cumul+= (_end-$ZSH_BENCHMARK) ))
    print $cumul
fi
