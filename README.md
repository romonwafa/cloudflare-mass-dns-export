# CloudFlare Mass DNS Export
Export a large number of DNS records if you have many domains in your CloudFlare

This can come in handy if you want to back up the DNS records for each domain in the native export format by CloudFlare. This way, if you need to reimport DNS records for any reason you can just import the DNS records exported by this tool.

# Requirements

JQ is required to parse the JSON. Install with:

Ubuntu/Debian: ```sudo apt install jq```
CentOS/RHEL: ```sudo yum install jq```
Fedora: ```sudo dnf install jq```

You must have an API key with Zone Read and DNS Edit permissions for all your zones (or the ones you wish to target at least).

# Terms
I am not responsible for any damages that may arise from use of this tool. Always review the latest API documentation by CloudFlare: https://developers.cloudflare.com/api/
