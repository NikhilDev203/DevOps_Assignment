#!/bin/bash
# Function to get value from nested object
get_value_from_object() {
    local object="$1"
    local key="$2"

 

    local value=$(echo "$object" | jq -r "$key")

 

    if [ "$value" = "null" ]; then
        echo "null"
    else
        echo "$value"
    fi
}
path="a/b/c"
converted_path=$(echo ".$path" | tr '/' '.')
# Example usage
object='{"a":{"b":{"c":"d"}}}'
key=$converted_path

 

result=$(get_value_from_object "$object" "$key")
echo "Output: $result"