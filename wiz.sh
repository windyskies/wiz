#! /bin/sh

#backup the files { to avoid data loss in case of wrong user input}
backup() { 
    mkdir -p ".wiz" && cp $1 $2 $_ || exit # --> if files do not exist
    cp -i ".wiz/${1}" ".wiz/wiz.run.c"
}

#tokenize the debug file and evaluate test cases --> write the final *.c file
tokenize() {    
    FILENAME=$2 #"wiz.test.z"
    plainf=$(<${FILENAME})
    output=".wiz/wiz.run.c"

    echo 'wiz:start' $2

    #plainf= cat $FILENAME
    #plainf="$(<wiz.test.z)"

    set -o noglob         # start-special-chars
        IFS=$'\n' lines=($plainf)
    set +o noglob         # end-special-chars

        fline=${#lines[@]} #final-line
        i=0 #index for loop
    while [ $i -lt $fline ] #iterate every line
    do
        #echo $i : ${lines[$i]}

        _rprefix=${lines[$i]}
        _rsuffix=${_rprefix#*[}   # remove prefix ending in "_"
        LINE=${_rsuffix%]*}   # remove suffix starting with "_"

        IFS=$' ' read -ra arr <<<${lines[$i]}
        SPEC=${arr[1]}
        VAR=${arr[2]}

        ####ctx=${LINE}
        if [[ "$OSTYPE" == "darwin"* ]]; then
            gsed -i -e "${LINE}i \\\tprintf(\"${VAR}: %${SPEC}\\\n\", ${VAR});" $output
        else
            sed -i -e "${LINE}i \\\tprintf(\"${VAR}: %${SPEC}\\\n\", ${VAR});" $output
        fi
        
        i=$(($i + 1))
    done
}


## script starts here
if [[ $1 == *".c"* ]] && [[ $2 == *"wiz."*".z"* ]]; then
    backup $1 $2
    tokenize $1 $2
else
    echo ">>--usage--> wiz filename1.c wiz.filename2.z"
    exit
fi

cursh=`echo $SHELL`
pattern="/bin/"
cursh=${cursh/$pattern/}

shopt -s expand_aliases
source ~/.${cursh}rc &> /dev/null

alias xgci=gci
#run the debug file:
printf "\n"
xgci ".wiz/wiz.run.c" 0

echo ">> wizard:end <<"
