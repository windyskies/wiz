#! /bin/sh

#find the current shell
cursh=`echo $SHELL`
pattern="/bin/"
cursh=${cursh/$pattern/}
#echo "cursh=${cursh}"

#var=$(cat ~/.${cursh}rc | grep -w "gci" | wc -l)
if cat ~/.${cursh}rc | grep -w "wiz"; then
    echo "already in ~/.${cursh}rc"
else
    echo "adding to ~/.${cursh}rc"
    #echo "wiz() {\n\t~${PWD}/wiz.sh '\$@'\n}\n"export -f wiz >> ~/.${cursh}rc
    echo alias wiz="${PWD}/wiz.sh" >> ~/.${cursh}rc
fi
