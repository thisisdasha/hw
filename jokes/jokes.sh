#!/bin/bash
ping -c 1 google.com &> /dev/null; c=$?
joke=`curl -s https://api.chucknorris.io/jokes/random | jq -r ".value"`

linenum=`cat jokes.txt | wc -l`

if [[ $c == 0 ]] && [[ $joke != 'null' ]]; then
    echo $joke
    echo $joke >> jokes.txt
elif [[ $linenum != 0 ]]; then

    cat jokes.txt | shuf -n1
else
    echo " Error: no connection"
fi
