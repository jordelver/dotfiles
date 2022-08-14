" Wrap Markdown files to 80 characters
setlocal textwidth=80

" Turn spell check on for Markdown
setlocal spell

" Configure languages so we get syntax highlighting in Markdown files
" Any code inside Markdown files with fences (```) will be syntax highlighted.
lua << EOF
  vim.g.markdown_fenced_languages = {
    "bash",
    "elixir",
    "fish",
    "html",
    "javascript",
    "ruby",
    "rust",
    "typescript",
    "vim"
  }
EOF
