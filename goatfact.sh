#!/bin/bash
webhook="https://discordapp.com/api/webhooks/412386643647922176/qMA-aUXGD4Vg65gOmAHoXm0OLLYQ6vOBOu38Ip-Uy9Z4Yqkiv4QH5Xu8nUSWLkWbmESQ"

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
