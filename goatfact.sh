#!/bin/bash
webhook="YOUR_WEBHOOK_URL"

lines="./goatfacts.txt"
line="$(shuf -n 1 $lines)"
line=${line//[$'\t\r\n']}

images="./goatimages.txt"
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
