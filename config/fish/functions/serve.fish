function serve
  if set -q argv[1]
    set PORT $argv[1]
  else
    set PORT 8080
  end

  ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $PORT, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
end

