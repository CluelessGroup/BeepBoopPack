#!/bin/bash

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install jq first."
    exit 1
fi

# Specify the path to your JSON file
json_file="modrinth.index.json"

# Check if the JSON file exists
if [ ! -f "$json_file" ]; then
    echo "JSON file not found: $json_file"
    exit 1
fi

# Loop over the objects in the JSON array and execute packwiz
jq -c '.files[]' "$json_file" | while IFS= read -r object; do
    # Extract the field from the object (replace "fieldname" with the actual field name)
    field_value=$(echo "$object" | jq -r '.downloads[0]')

    # Check if the field is not null
    if [ "$field_value" != "null" ]; then
        # Execute packwiz with the extracted field as a parameter
        cmd="packwiz.exe modrinth add -y \"$field_value\""
        echo "$cmd"
	eval "$cmd < /dev/null"
    else
        echo "Field is null. Skipping."
    fi
done

echo "Script completed."
