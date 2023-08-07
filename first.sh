#!/bin/sh

msisdn='66615650095'
URL="https://digitaltest.dtac.co.th/mobileapi/auth/v2.0.0/auth/requestlogin?subrNumb="$msisdn
# echo $URL
resp=$(curl -L -X POST $URL \
-H "channelId: 2100251115" \
)
# echo $resp

# Remove newlines from the JSON response for easier processing
json_response_no_newlines=$(echo "$resp" | tr -d '\n')

# Extract attributes and values using awk
while IFS=: read -r key value; do
    key=$(echo "$key" | tr -d '," ')
    value=$(echo "$value" | tr -d '," ')
    if [[ ! -z $key ]]; then
        eval "$key=\"$value\""
    fi
done <<< "$(echo "$json_response_no_newlines" | sed 's/,/,\n/g' | sed 's/{/{\n/g' | sed 's/}/}\n/g' | grep -o '"[^"]*":[^,}]*')"

# Print the extracted variables
# echo "Token: $token"
# echo "resCode: $resCode"
# echo "resType: $resType"
# echo "resDesc: $resDesc"
# echo "subrNumb: $subrNumb"

echo $json_response_no_newlines