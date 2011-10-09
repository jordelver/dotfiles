# Set editor for external editing
Pry.config.editor = "mate -w"

# Prompt with ruby version
Pry.prompt = [
  proc do |obj, nest_level, _|
    "#{RUBY_VERSION} (#{obj}):#{nest_level} > "
  end,
  proc do |obj, nest_level, _|
    "#{RUBY_VERSION} (#{obj}):#{nest_level} * "
  end
]
