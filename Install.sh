#!/bin/bash

# Typing animation function
type_text() {
    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        printf "%s" "${text:$i:1}"
        sleep 0.03
    done
    printf "\n"
}

# Rainbow color cycle
rainbow() {
    local text="$1"
    local i=0
    local len=${#text}

    for ((i=0; i<len; i++)); do
        r=$(( (i * 30) % 255 ))
        g=$(( (i * 50) % 255 ))
        b=$(( (i * 70) % 255 ))
        printf "\e[38;2;%d;%d;%dm%s" "$r" "$g" "$b" "${text:$i:1}"
    done

    printf "\e[0m\n"
}

while true; do
    clear

    rainbow "▶ Creating file: Amwaz_playz.txt"
    type_text "Typing: Subscribe to Amwaz Playz..."
    echo "Subscribe to Amwaz Playz" > "Amwaz_playz.txt"
    sleep 0.3

    rainbow "✔ File created!"
    sleep 0.5

    rainbow "▶ Deleting file..."
    rm -f "Amwaz_playz.txt"
    sleep 0.5

    rainbow "✔ File deleted!"

    echo
    rainbow "===== GitHub Repeat ====="

    mkdir -p github_test
    cd github_test || exit

    rainbow "▶ Creating GitHub file..."
    type_text "Typing: Subscribe to Amwaz Playz..."
    echo "Subscribe to Amwaz Playz" > "Amwaz_playz.txt"
    sleep 0.5

    rainbow "✔ GitHub file created!"

    rainbow "▶ Deleting GitHub file..."
    rm -f "Amwaz_playz.txt"
    sleep 0.5

    rainbow "✔ GitHub file deleted!"

    cd ..

    sleep 1
done
