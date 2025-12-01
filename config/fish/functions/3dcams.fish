# Arrange windows one on top of the other
# 1280 wide, keep aspect ratio, position top right
# Keep on top of other windows
#
# Prerequisites: `brew install mpv`
#
function 3dcams -d "Show my 3D printer cameras in a vertically stacked window"
  mpv \
    --lavfi-complex='[vid1][vid2]vstack[vo]' \
    --geometry=1280x0-0+0 \
    --no-audio \
    --msg-level=all=error \
    --ontop \
    $3D_PRINTER_CAM1_URL \
    --external-file=$3D_PRINTER_CAM2_URL > /dev/null 2>&1 &
end
