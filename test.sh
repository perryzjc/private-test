#!/bin/bash

cd /Users/jingchaozhong/Desktop/code/test/ffff/private-test

# Check if both baseline and new secrets files exist
if [ ! -f .secrets.baseline ]; then
    echo "Baseline secrets file does not exist."
    exit 1
fi
if [ ! -f .secrets.new ]; then
    echo "New secrets file does not exist."
    exit 1
fi

# Extract list of secret hashes from both files
list_secrets() { 
    jq -r '.results | keys[] as $key | "\($key),\(.[$key] | .[] | .hashed_secret)"' "$1" | sort;
}
baseline_secrets=$(list_secrets .secrets.baseline)
new_secrets=$(list_secrets .secrets.new)

# Compare the lists and output error message if there are any new secrets
if [ "$baseline_secrets" != "$new_secrets" ]; then
    echo "Detected new secrets in the repo"
    exit 1
else
    echo "No new secrets detected."
fi