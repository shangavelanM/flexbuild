#!/bin/bash



# Find the card number for "sgtl5"
card_number=$(grep -i "audiosgtl5000" /proc/asound/cards | awk '{print $1}')

# Check if card_number was found
if [ -z "$card_number" ]; then
    echo "No 'sgtl5' sound card found."
    exit 1
fi

# Set amixer controls for the found card
amixer -c $card_number cset numid=11 on
amixer -c $card_number cset numid=1 160
amixer -c $card_number cset numid=10 31
amixer -c $card_number cset numid=9 0
amixer -c $card_number cset numid=3 on
amixer -c $card_number cset numid=24 0
amixer -c $card_number cset numid=25 0
amixer -c $card_number cset numid=6 100



