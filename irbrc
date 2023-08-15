# Copy data to your clipboard
# https://ruby.social/@scott/110663862458292098
def pbcopy(data)
  IO.popen("pbcopy", "w") { _1.write(data) }
end

# Autocomplete is currently not very good
IRB.conf[:USE_AUTOCOMPLETE] = false

# Make irb prompt less noisy
IRB.conf[:PROMPT_MODE] = :SIMPLE
