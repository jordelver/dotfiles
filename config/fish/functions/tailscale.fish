# As explained in the following kb article:
#
# > If you installed the macOS client through the App Store, the CLI is bundled
# > inside the Tailscale app
#
# https://tailscale.com/kb/1080/cli?tab=macos
function tailscale -d "Alias to the App Store installed Tailscale client"
  /Applications/Tailscale.app/Contents/MacOS/Tailscale $argv
end
