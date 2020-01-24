function serve
  if set -q argv[1]
    set PORT $argv[1]
  else
    set PORT 8080
  end

  ruby -run -ehttpd . -p$PORT
end

