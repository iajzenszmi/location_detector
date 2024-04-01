#!/bin/bash

# Get the current ESSID
ESSID=$(iwgetid -r)

if [ -z "$ESSID" ]; then
    echo "No Wi-Fi connection detected."
    exit 1
fi

echo "Current Wi-Fi ESSID: $ESSID"

# Perform a web search for the nearest place location of the ESSID
# Replace 'jewishcare' with your actual search term related to the ESSID if necessary
SEARCH_TERM="${ESSID} nearest address"

# Use surfraw and a text-based browser (like lynx) to fetch and display the search results
# This command searches Google for the nearest address and pipes the result into lynx to render the text
surfraw google -results=1 "$SEARCH_TERM" | lynx -stdin

