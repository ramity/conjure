#!/bin/bash

# Check if the URL argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL_OF_SHARED_CONVERSATION>"
    exit 1
fi

URL=$1

# Fetch the webpage content
content=$(curl -s "$URL")

echo "$content"

# Extract the specific DOM element using grep (change 'element_class' to your desired class or element)
extracted_content=$(echo "$content" | grep -o '<div[^>]*data-message-author-role="assistant"[^>]*>.*</div>' | sed -e 's/<[^>]*>//g')

# Print the extracted content
echo "$extracted_content"
