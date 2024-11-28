#!/bin/bash

# Cloudflare API token (ensure this token is valid and scoped appropriately)
API_TOKEN="YOUR_API_TOKEN_HERE"

# Cloudflare API endpoint to list zones
API_URL="https://api.cloudflare.com/client/v4/zones?per_page=500"

# Fetch the list of all zones
zones=$(curl -s -X GET "$API_URL" \
  -H "Authorization: Bearer $API_TOKEN" \
  -H "Content-Type: application/json" | jq -r '.result[].id')

# Loop through each zone and export DNS records
for zone_id in $zones; do
  # Get the domain name (e.g., domainname.tld) from the zone information
  domain_name=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_id" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" | jq -r '.result.name')

  # Fetch DNS records for the zone and save them to a file named domainname.tld.txt
  curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/export" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" > "${domain_name}.txt"
  
  echo "Saved DNS records for $domain_name to ${domain_name}.txt"
done
