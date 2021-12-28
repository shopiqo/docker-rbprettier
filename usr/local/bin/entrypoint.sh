#!/bin/bash -e

while IFS= read -r FILE; do
    rbprettier --ignore-unknown --write $FILE
done <<< "$(find /src -type f -name '*.rb')"
