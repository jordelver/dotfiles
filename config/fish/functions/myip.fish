function myip -d  "Return my current IP address"
  curl --silent ipinfo.io | jq .ip
end
