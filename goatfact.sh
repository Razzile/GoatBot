#!/bin/bash
webhook="YOUR_WEBHOOK_URL"

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

echo $scriptpath

lines="$scriptpath/goatfacts.txt"
line="$(shuf -n 1 $lines)"
line=${line//[$'\t\r\n']}

images="$scriptpath/goatimages.txt"
image="$(shuf -n 1 $images)"
image=${image//[$'\t\r\n']}


generate_embed() 
{
    cat <<EMBED
{ 
  "embeds": [{ 
    "title": "$line", 
    "color": 65280, 
    "image": {
        "url": "$image"
    }
  }] 
}
EMBED
}

curl -H "Content-Type: application/json" -X POST $webhook --data "$(generate_embed)"
