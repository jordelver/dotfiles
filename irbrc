# Copy data to your clipboard
# https://ruby.social/@scott/110663862458292098
def pbcopy(data)
  IO.popen("pbcopy", "w") { _1.write(data) }
end
