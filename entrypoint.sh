#!/bin/bash -e

# while IFS= read -r FILE; do
#     lang=$(guesslang $FILE | cut -d " " -f 3)

#     if [ $lang = "Ruby" ]; then
#         printf "Formatting ${FILE}..."
#         rbprettier --loglevel debug --ignore-unknown --write $FILE
#     else
#         printf "${FILE} does not match \"Ruby\" found ${lang} instead."
#     fi
# done <<< "$(find /src -type f -not -path './vendor/*' -not -path './node_modules/*')"

format () {
    lang=$(guesslang $1 | cut -d " " -f 3)

    if [ $lang = "Ruby" ]; then
        printf "Formatting ${1}..."
        rbprettier --loglevel debug --ignore-unknown --write $1
    fi
}

export -f format

find . -type f -not -path './.git/*' -not -path './vendor/*' -not -path './node_modules/*' | parallel -j10 format {}
